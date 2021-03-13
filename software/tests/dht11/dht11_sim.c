#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "simavr/sim_avr.h"
#include "simavr/sim_cycle_timers.h"
#include "dht11_sim.h"

const uint8_t LOW = 0;
const uint8_t HIGH = 1;
const uint8_t STARTSIGNAL_DURATION = 80 /* usec */;
const uint8_t DATASIGNAL_LOW_DURATION = 50 /* usec */;
const uint8_t DATASIGNAL_HIGH_DURATION_VALUE0 = 27 /* usec */;
const uint8_t DATASIGNAL_HIGH_DURATION_VALUE1 = 70 /* usec */;

const uint8_t dht11_data_size = 40;
const uint8_t dht11_data[] = {0, 0, 1, 0, 0, 1, 0, 1,
                              0, 0, 1, 0, 0, 1, 0, 1,
                              0, 0, 1, 0, 0, 1, 0, 1,
                              0, 0, 1, 0, 0, 1, 0, 1,
                              0, 0, 1, 0, 0, 1, 0, 1,
};

avr_cycle_count_t dht11_timer_handler_data(avr_t *avr, avr_cycle_count_t when, void *param){
  dht11_t *d = (dht11_t *)param;
  if (d->bit_idx == dht11_data_size){
    avr_raise_irq(d->irq + IRQ_DHT11_DATA, LOW);
    return 0;
  }

  if (d->process_state == DHT11_STATE_DATA_LOW){
    avr_raise_irq(d->irq + IRQ_DHT11_DATA, LOW);
    avr_cycle_timer_register_usec(d->avr, DATASIGNAL_LOW_DURATION, dht11_timer_handler_data, d);
    return 0;
  }else if(d->process_state == DHT11_STATE_DATA_HIGH){
    uint8_t length = dht11_data[d->bit_idx] == 0 ? DATASIGNAL_HIGH_DURATION_VALUE0 : DATASIGNAL_HIGH_DURATION_VALUE1;
    d->bit_idx++;
    avr_raise_irq(d->irq + IRQ_DHT11_DATA, HIGH);
    avr_cycle_timer_register_usec(d->avr, length, dht11_timer_handler_data, d);
    return 0;
  }
  return 0;
}

avr_cycle_count_t dht11_timer_handler(avr_t *avr, avr_cycle_count_t when, void *param){
  /*
   *
   */
   dht11_t *d = (dht11_t *)param;
   if (d->process_state == DHT11_STATE_RESPONSE_LOW) {
     avr_raise_irq(d->irq + IRQ_DHT11_DATA, LOW);
     d->process_state = DHT11_STATE_RESPONSE_HIGH;
     avr_cycle_timer_register_usec(d->avr, STARTSIGNAL_DURATION, dht11_timer_handler, d);
   }else if(d->process_state == DHT11_STATE_RESPONSE_HIGH){
     d->process_state = DHT11_STATE_DATA_LOW;
     d->bit_idx = 0;
     avr_cycle_timer_register_usec(d->avr, STARTSIGNAL_DURATION, dht11_timer_handler_data, d);
   }
   return 0;
}

void dht11_handler(struct avr_irq_t *irq, uint32_t value, void *param){
  /*
   * パブリックな (avr の入出力が関係する) 割り込みハンドラ。
   * avrからのstart signalを検知する。
   * avr からstart signal が来たら pull up による high を待つ。
   * pull up による high が来たら、 timer をセットしてtimerによる値の出力を開始。
   *
   * irq: 割り込みリクエスト。 どの割り込みが来たかを保持する。このハンドラはホストのスタートシグナルのみからしかhookされないので、チェックの必要はない。
   *  avr_connect_irq(↲
   *    avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 0),↲ // PORTC0がトリガするハンドラ
   *    dht11.irq + 0);↲  // d->irq[0] (この割り込みハンドラ) をhookする
   *
   * value: 割り込みリクエストがもつvalue。 (おそらく) PORTCの値が来る。
   * param: dht11_t が入ってる。
   */
  dht11_t *d = (dht11_t *)param;
  uint8_t new = value;
  d->pin_state = new;

  if (d->process_state == DHT11_STATE_START && !value){
    d->process_state = DHT11_STATE_PULLED_WAIT;
  }else if (d->process_state == DHT11_STATE_PULLED_WAIT && value){
    avr_cycle_timer_register_usec(d->avr, STARTSIGNAL_DURATION, dht11_timer_handler, d);
  }
}

void dht11_init(struct avr_t *avr, dht11_t *d, const char *name){
  memset(d, 0, sizeof(*d));

  // irq pool をアロケート
  d->irq = avr_alloc_irq(&avr->irq_pool, 0, IRQ_DHT11_COUNT, &name);

  // irq pool にハンドラを登録
  avr_irq_register_notify(d->irq, dht11_handler, d);

  d->avr = avr;
}

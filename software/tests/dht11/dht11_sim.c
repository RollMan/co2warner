#include <stdlib.h>
#include <stdio.h>
#include "simavr/sim_avr.h"
#include "simavr/sim_cycle_timers.h"
#include "dht11_sim.h"

avr_cycle_count_t dht11_timer_handler(avr_t *avr, avr_cycle_count_t when, void *param){
  /*
   *
   */
   dht11_t *d = (dht11_t *)param;
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
    d->process_state = DHT11_STATE_RESPONSE;
    avr_cycle_timer_register_usec(d->avr, 80, dht11_timer_handler, d);
  }
}

void dht11_init(struct avr_t *avr, dht11_t *d, const char *name){
  // irq pool をアロケート
  d->irq = avr_alloc_irq(&avr->irq_pool, 0, IRQ_DHT11_COUNT, &name);

  // irq pool にハンドラを登録
  avr_irq_register_notify(d->irq, dht11_handler, d);

  d->avr = avr;
}

void dht11_run(dht11_t *d, void* param){
  
}

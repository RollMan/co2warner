#ifndef __DHT11_SIM_H__
#define __DHT11_SIM_H__

#include "simavr/sim_irq.h"
enum {
  IRQ_DHT11_OUT = 0,
  IRQ_DHT11_COUNT
};

enum {
  DHT11_STATE_START = 0,
  DHT11_STATE_PULLED_WAIT,
  DHT11_STATE_RESPONSE,
};

typedef struct {
  avr_irq_t *irq;
  struct avr_t *avr;
  uint8_t pin_state;
  uint8_t process_state;
} dht11_t;

void dht11_init(struct avr_t *avr, dht11_t *d, const char *name);
void dht11_run(dht11_t *d, void *param);

#endif /* __DHT11_SIM_H__ */

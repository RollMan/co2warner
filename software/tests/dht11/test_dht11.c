#include <stdlib.h>
#include <stdio.h>
#include <libgen.h>
#include <pthread.h>

#include "simavr/sim_avr.h"
#include "simavr/sim_elf.h"
#include "simavr/sim_gdb.h"
#include "simavr/sim_vcd_file.h"
#include "simavr/avr_ioport.h"
#include "dht11_sim.h"

avr_t *avr = NULL;
avr_vcd_t vcd_file;

int main(int argc, char *argv[]){
  elf_firmware_t f;
  elf_read_firmware("test_dht11.elf", &f);

  avr = avr_make_mcu_by_name(f.mmcu);
  if(!avr){
    fprintf(stderr, "%s: AVR '%s' not known\n", argv[0], f.mmcu);
    exit(1);
  }
  avr_init(avr);
  avr_load_firmware(avr, &f);

  avr->gdb_port=1234;
  avr->state = cpu_Stopped;
  avr_gdb_init(avr);
  

  dht11_t dht11;
  dht11_init(avr, &dht11, "dht11");

  // Connect PORTC0 to DHT11 data and vice versa
  avr_irq_t *iavr = avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 0);
  avr_irq_t *idht = dht11.irq + IRQ_DHT11_DATA;
  avr_connect_irq(iavr, idht);
  avr_connect_irq(idht, iavr);

  // Waveform configuration
  avr_vcd_init(avr, "gtkwave_output.vcd", &vcd_file, 100000);
  avr_vcd_add_signal(&vcd_file, avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 0), 1 /* bits */, "PORTC0");
  avr_vcd_add_signal(&vcd_file, dht11.irq + IRQ_DHT11_DATA, 1, "DHT11_DATA");
  avr_vcd_start(&vcd_file);

  int state = cpu_Running;
  while ((state != cpu_Done) && (state != cpu_Crashed)){
    state = avr_run(avr);
  }
  return 0;
}

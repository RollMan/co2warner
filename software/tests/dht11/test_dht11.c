#include <stdlib.h>
#include <stdio.h>
#include <libgen.h>
#include <pthread.h>

#include "sim_avr.h"
#include "avr_elf.h"
#include "sim_elf.h"
#include "sim_gdb.h"
#include "sim_vcd_file.h"

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
  avr->state - cpu_Stopped;
  avr_gdb_init(avr);
  
  avr_vcd_init(avr, "gtkwave_output.vcd", &vcd_file, 100000);
}

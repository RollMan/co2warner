#include <avr/io.h>
#define SPL 0x3D
#define F_CPU 1000000UL
AVR_MCU(F_CPU, "atmega88p");

.text
.org 0x00
	rjmp reset

.org 0x14
reset:
	ldi r16, lo8(RAMEND)
	out SPL, r16

.global main
.func main
main:
	rjmp start_dhc11

#include <avr/io.h>

#define NWAKE (1<<PORTC1)
#define NINT (1<<PINC2)
#define NRST (1<<PORTC3)

.global init_ccs811
.func init_ccs811
	IN r18, DDRC
	ORI r18, NWAKE | NRST
	ANDI r18, ~NINT
	OUT DDRC, r18

	; Reset
	IN r18, PORTC
	ANDI r18, ~NRST					; Negate RESET (assert nRESET)
	OUT r18, PORTC

	LDI r18, 50
delay50n:
	DEC r18
	NOP
	BRNE delay50n						; Check if Z of status register is asserterd (r18 == 0)

	; Release reset
	IN r18, PORTC
	ORI r18, NRST
	OUT r18, PORTC
.endfunc

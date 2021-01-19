#include <avr/io.h>

#define DATA_PORT (1<<PORTC0)

.text
.global start_dhc11
.func start_dhc11
  SBI DDRC-__SFR_OFFSET, PORTC0  ; assert ddrc for pin to output
  SBI PORTC-__SFR_OFFSET, PORTC0 ; assert data pin

; wait more than 20ms
; 1/1000000 * x = 2/100
; x = 2 * 10000 = 20000
  LDI r18, 200
wait18m_1:
  LDI r19, 100
wait18m_2:
  DEC r19
  BRNE wait18m_2
  DEC r18
  BRNE wait18m_1

  CBI DDRC-__SFR_OFFSET, PORTC0  ; negate ddrc for pin to input

response:
  SBIC PORTC-__SFR_OFFSET, PORTC0      ; if receiving response signal (set), break.
  RJMP response

ready:
  SBIS PORTC-__SFR_OFFSET, PORTC0      ; if receiving ready signal (cleared), break.
  RJMP ready

; data

#define idx r19
#define delaycnt r20
#define rcvbyte r21
#define bytecnt r22
#define addrl r26
#define addrh r27

  LDI idx, 0

datum_byte:
  CLR rcvbyte
  LDI bytecnt, 8

datum_start:
  SBIC PORTC-__SFR_OFFSET, PORT0       ; if receiving bit start (cleared), break.
  RJMP datum_start

bit_start:
  SBIS PORTC-__SFR_OFFSET, PORTC0
  RJMP bit_start

; wait 40 us and check the bit. if 0, the value is 0, else the value is 1.
; 1/1000000 * x = 40/1000000
; x = 40
  LDI delaycnt, 10
fetch_data:
  DEC delaycnt           ; 1 clock cycle
  NOP                    ; 1 clock cycle
  BRNE fetch_data        ; 2 clock cycles when jumping

; fetch data
  LSL rcvbyte
  SBIC PORTC-__SFR_OFFSET, PORT0     ; if input is 0, skip assertion of the lsb.
  ORI rcvbyte, 1

; check if byte is filled.
  DEC bytecnt
  BRNE datum_start
; store current byte
  LDI addrh, hi8(buf)
  LDI addrl, lo8(buf)
  ADD addrl, idx
  ADC addrh, r1
  ST X, rcvbyte

; check if 40bit complete
  INC idx
  CPI idx, 8
  BRNE datum_byte
.endfunc

.section .bss
buf: .ds.d 5

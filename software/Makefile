PREFIX = /usr/local/avr
ARCH = m88p
ARCH_L = atmega88p
BINDIR = $(PREFIX)/bin

AR = $(BINDIR)/avr-ar
AS = $(BINDIR)/avr-as
CC = $(BINDIR)/avr-gcc
LD = $(BINDIR)/avr-ld
NM = $(BINDIR)/avr-nm
OBJCOPY = $(BINDIR)/avr-objcopy
OBJDUMP = $(BINDIR)/avr-objdump
RANLIB = $(BINDIR)/avr-ranlib
STRIP = $(BINDIR)/avr-strip

AVRWRITE = $(BINDIR)/avrdude

OBJS = main.o dht11/dht11.o

TARGET = main

CFLAGS = -Wall -nostdinc -nostdlib -fno-builtin -mmcu=$(ARCH_L)
# CFLAGS += -mint32
CFLAGS += -I. -I/usr/local/avr/avr/include
# CFLAGS += -g
# CFLAGS += -O -s

LDFLAGS = -static -L. -L/usr/local/avr/avr/lib

all:			$(TARGET)

$(TARGET):	$(OBJS)
				$(CC) $^ -o $@ $(CFLAGS) $(LDFLAGS)
				cp $(TARGET) $(TARGET).elf
				$(STRIP) $(TARGET)

%.o: %.c
				$(CC) -c -o $@ $(CFLAGS) $<

%.o: %.S
				$(CC) -c -o $@ $(CFLAGS) $<

$(TARGET).hex:	$(TARGET)
				$(OBJCOPY) -O ihex $^ $@

.PHONY: image
image:			$(TARGET).hex

.PHONY: write
write:			$(TARGET).hex
	$(AVRWRITE) -c avrisp2 -P usb -p $(ARCH) -U flash:w:$<:i

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET) $(TARGET).elf $(TARGET).hex

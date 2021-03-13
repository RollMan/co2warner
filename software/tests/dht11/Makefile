SRC := dht11_sim.c test_dht11.c
OBJ := $(SRC:%c=%o)

CC := gcc
CFLAGS := -Wall -g
LDFLAGS := -lsimavr -lsimavrparts -lelf

TARGET := main.out

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $^ -o $@ $(CFLAGS) $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $(CFLAGS) $<

test_dht11.elf:
	make -C ../../
	cp ../../main.elf ./$@

.PHONY: clean
clean:
	rm -rf $(OBJ) $(TARGET)

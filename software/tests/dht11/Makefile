SRC := dht11_sim.c test_dht11.c
OBJ := $(SRC:%c=%o)

CC := gcc
CFLAGS := -Wall -g
LDFLAGS :=

TARGET := main.out

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $^ -o $@ $(CFLAGS) $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $(CFLAGS) $<

.PHONY: clean
clean:
	rm -rf $(OBJ) $(TARGET)

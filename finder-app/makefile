# Default target

all: native aarch64

# Native build vars
CC = gcc
CFLAGS = -Wall -g
TARGET = writer

CROSS_CC = aarch64-none-linux-gnu-gcc
CROSS_CFLAGS = -Wall -g
CROSS_TARGET = cross_writer.elf


# source
SRC = writer.c

native: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^


# cross
aarch64: $(CROSS_TARGET)

$(CROSS_TARGET): $(SRC)
	$(CROSS_CC) $(CROSS_CFLAGS) -o $@ $^


clean:
	rm -f $(TARGET) $(CROSS_TARGET)


# Makefile hex2bin

INSTALL_DIR = /usr/local
MAN_DIR = $(INSTALL_DIR)/man/man1

all: hex2bin mot2bin hex2bin.1

hex2bin.1: hex2bin.pod
	pod2man hex2bin.pod > hex2bin.1

hex2bin: hex2bin.c
	gcc -O2 -Wall -o hex2bin hex2bin.c

mot2bin: mot2bin.c
	gcc -O2 -Wall -o mot2bin mot2bin.c

install:
	cp hex2bin mot2bin $(INSTALL_DIR)/bin
	cp hex2bin.1 $(MAN_DIR)

clean:
	rm core *.o hex2bin mot2bin

test:
	hex2bin nochecksum.hex
# Generates a checksum error, but 'make' will ignore this error ('-' before hex2bin)
	-hex2bin -c nochecksum.hex
	hex2bin -c linear.hex
	hex2bin -c segmented.hex
	-hex2bin -c example.hex
	mot2bin -c example2.s19

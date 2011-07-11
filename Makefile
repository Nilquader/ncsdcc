# nc-keyboard v2 makefile

# variables
# default OS X sdcc location:
#SDCC_PATH=/Developer/sdcc/bin
# use this when using homebrew (OS X):
SDCC_PATH=/usr/local/bin
AS=$(SDCC_PATH)/sdasz80
SDCC=$(SDCC_PATH)/sdcc
LINK=$(SDCC_PATH)/sdldz80
HEX2BIN=hex2bin/hex2bin
AR=/usr/bin/ar
ASR=/usr/local/bin/asranlib
SNAP=~/z80xdev/snaplinux/snap
EMU=~/z80xdev/nc100em-1.2/dnc100em -m

# targets
all: card.bin
snapshot: test.card
test: test.card
	cp test.card ~/nc100/nc100.card 
	$(EMU)

clean:
	rm -f *.ihx
	rm -f *.rel
	rm -f *.map
	rm -f *.lnk
	rm -f *.sym
	
test.card: card.bin nc100.card
	$(SNAP) test.card -h 512 -i nc100.card -l card.bin 0000

nc100.card:
	dd bs=1024 count=1024 if=/dev/zero of=nc100.card

card.bin: crt0.rel putchar.rel getchar.rel nc100.lib hello.rel
	$(SDCC) -mz80 -o card -l nc100.lib --code-loc 0xC300 --data-loc 0xF000 --no-std-crt0 ./crt0.rel ./putchar.rel getchar.rel hello.rel
	$(LINK) -f card.lnk
	$(HEX2BIN) -p 0x00 card.ihx

crt0.rel: crt0.s
	$(AS) -go crt0.rel crt0.s

putchar.rel: putchar.s
	$(AS) -o putchar.rel putchar.s

getchar.rel: getchar.s
	$(AS) -o getchar.rel getchar.s

nc100.rel: nc100.s
	$(AS) -o nc100.rel nc100.s
nc100.lib: nc100.rel
	$(AR) -Sq nc100.lib nc100.rel
	$(ASR) nc100.lib

hello.rel: hello.c
	$(SDCC) -mz80 -c hello.c
	 	
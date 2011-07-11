# sdcc nc100 libraries makefile

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

ASRC=$(wildcard *.s)
REL=$(ASRC:%.s=%.rel)

# targets
all: nc100.lib

.PHONY: clean
clean:
	rm -f *.rel
	rm -f *.lib
	rm -f *.lst
	rm -f *~
	
%.rel: %.s
	$(AS) -l -o $@ $<

nc100.lib: $(REL)
	$(AR) -Sq nc100.lib $^
	$(ASR) nc100.lib

debug:
	echo $(ASRC)

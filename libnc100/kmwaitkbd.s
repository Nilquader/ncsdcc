; unsigned int kmwaitkbd(void);
_kmwaitkbd::
	ld hl, #0x0000
	call 0xB80F ; kmwaitkbd
	ld h,b
	ld l,c
	ret

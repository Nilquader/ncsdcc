; unsigned int kmreadkbd(void);
_kmreadkbd::
	ld hl, #0x0000
	call 0xB806 ; kmreadkbd
	ret nc
	ld h,b
	ld l,c
	ret

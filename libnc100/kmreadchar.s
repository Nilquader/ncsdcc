; unsigned int kmreadchar(void);
_kmreadchar::
	ld hl, #0x0000
	call 0xB9B3 ; kmreadchar
	ret nc
	ld h,b
	ld l,c
	ret

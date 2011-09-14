; char padreadyserial(void);
_padreadyserial::
	call 0xb869 ; mcreadyprinter
	ld l, #0
	rl l ; rotate carry into l
	ret

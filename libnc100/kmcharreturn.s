; void kmcharreturn(unsigned int token);
_kmcharreturn::
	ld hl, #2
	add hl,sp
	ld c,(hl)
	inc hl
	ld b,(hl)

	jp 0xB803 ; kmcharreturn 

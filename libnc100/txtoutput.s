; void txtoutput(char character);
_txtoutput::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	jp 0xb833 ; txtoutput

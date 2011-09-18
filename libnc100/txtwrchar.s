; void txtwrchar(char character);
_txtwrchar::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	jp 0xb83c ; txtwrchar

; char padoutserial(char character);
_padoutserial::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	call 0xb863 ; padoutserial
	ld l, #0
	rl l ; rotate carry into l
	ret

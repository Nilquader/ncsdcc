; char padoutparallel(char character);
_padoutparallel::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	call 0xb806 ; padoutparallel
	ld l, #0
	rl l ; rotate carry into l
	ret

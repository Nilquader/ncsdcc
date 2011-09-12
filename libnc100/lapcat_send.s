; char lapcat_send(char character);
_lapcat_send::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	call 0xB8DB ; lapcat_send
	ld l, #0
	rlc l ; rotate carry into l (return value)
	ret

; char mcprintchar(char character);
_mcprintchar::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	call 0xB851 ; mcprintchar
	ld l, #0
	rlc l ; rotate carry into l
	ret

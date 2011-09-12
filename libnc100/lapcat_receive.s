; char lapcat_receive(char *character);
_lapcat_receive::
	call 0xb8d8 ; lapcat_receive
	pop hl ; just add 2 to SP
	pop hl
	ld (hl), a ; store received character in receive pointer

	ld l, #0 ; prepare return value
	rlc l ; rorate carry into l (return value)

	dec sp
	dec sp
	dec sp ; subtract 4 from stack pointer
	dec sp ; 24 clocks
	ret

; char padinserial(char *character);
_padinserial::
	call 0xb85d ; padinserial
	pop hl ; just add 2 to SP
	pop hl
	ld (hl), a ; store received character in receive pointer

	ld l, #0 ; prepare return value
	rl l ; rorate carry into l (return value)

	dec sp
	dec sp
	dec sp ; subtract 4 from stack pointer
	dec sp ; 24 clocks
	ret

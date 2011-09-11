; void txtgetcursor(char *column, char *row);
_txtgetcursor::
	call 0xb82d ; txtgetcursor
	ld d, h
	ld e, l ; save hl to de
	pop hl ; adds 2 to SP
	pop hl
	ld (hl), d ; store column in first pointer
	pop hl
	ld (hl), e ; store row in second pointer

	ld hl, #-6
	add hl, sp ; substracts 6 from stack pointer 
	ld sp, hl ; 10+11+6 = 27 clocks
	ret

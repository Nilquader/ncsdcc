; char txtgetwindow(char* left, char* top, char* right, char* bottom);
_txtgetwindow::
	call 0xb830 ; txtgetwindow
	rla 
	and #0xfe ; store carry to a (return value)	
	ld b, h ; save HL to BC
	ld c, l
	pop hl ; adds 2 to SP
	pop hl
	ld (hl), b ; store left column in first pointer
	pop hl
	ld (hl), c ; store top row in second pointer
	pop hl
	ld (hl), d ; store right column in third pointer
	pop hl
	ld (hl), e ; store bottom row in fourth pointer

	ld hl, #-10
	add hl, sp ; substracts 10 from stack pointer 
	ld sp, hl ; 10+11+6 = 27 clocks

	ld l, a ; return previously saved carry bit
	ret

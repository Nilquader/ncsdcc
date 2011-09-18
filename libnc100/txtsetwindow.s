; void txtsetwindow(char left, char top, char right, char bottom);
_txtsetwindow::
	ld hl,#2
	add hl,sp
	ld b,(hl) ; store left column to B register (will be copied to H)
	inc hl
	ld c,(hl) ; store top row to C register (will be copied to L)
	inc hl
	ld d,(hl) ; store right column to D register
	inc hl
	ld e,(hl) ; store bottom row to E register
	ld h,b
	ld l,c ; copy BC to HL
	jp 0xb839 ; txtsetwindow

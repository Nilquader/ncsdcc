; void txtsetcursor(char column, char row);
_txtsetcursor::
	ld hl,#2
	add hl,sp
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,e
	ld l,d
	jp 0xb836 ; txtsetcursor

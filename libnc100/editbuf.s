	.area _CODE
; char editbuf(char* inputbuf, unsigned char size, char flags);
; todo: optimize parameter fetching
.globl _editbuf
_editbuf::
	ld hl, #2
	add hl,sp
	ld e,(hl)

	inc hl
	ld d,(hl)

	inc hl
	ld b,(hl)

	inc hl
	ld a,(hl)

	ld h,d
	ld l,e
	call 0xb800 ; editbuf
	ld l,#1
	ret c
	ld l,#0
	ret
	
; 
;
;
	.area _CODE
; char editbuf(char* inputbuf, unsigned char size, char flags);
; todo: optimize parameter fetching
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

; void txtboldoff(void);
_txtboldoff::
	jp 0xb83f ; txtboldoff

; void txtboldon(void);
_txtboldon::
	jp 0xb842 ; txtboldon

; void txtinverseoff(void);
_txtinverseoff::
	jp 0xb845 ; txtinverseoff

; void txtinverseon(void);
_txtinverseon::
	jp 0xb848 ; txtinverseon

; void txtunderlineoff(void);
_txtunderlineoff::
	jp 0xb84b ; txtunderlineoff

; void txtunderlineon(void);
_txtunderlineon::
	jp 0xb84e ; txtunderlineon
	
; int padgetversion(void);
_padgetversion::
	jp 0xB8DE ; padgetversion


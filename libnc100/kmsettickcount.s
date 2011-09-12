; void kmsettickcount(unsigned int firstevent,unsigned int nextevent);
; todo: optimize parameter fetching
.globl _kmsettickcount
_kmsettickcount::
	ld hl, #2
	add hl,sp
	ld e,(hl)

	inc hl
	ld d,(hl)

	inc hl
	ld c,(hl)

	inc hl
	ld b,(hl)

	ld h,d
	ld l,e
	jp 0xb80C ; kmsettickcount
	
; void padgettime(struct padtime* rtctime);
_padgettime::
	ld hl,#2
	add hl,sp
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,d
	ld l,e

	call 0xb875 ; padgettime
	ret

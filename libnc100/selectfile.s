; char* selectfile(void);
_selectfile::
	push af
	push bc
	push de
	push ix
	call 0xB8C3 ; selectfile
	pop ix
	pop de
	pop bc
	pop af
	ret c
	ld hl, #0000
	ret

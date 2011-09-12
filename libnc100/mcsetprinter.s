; void mcsetprinter(char prntype);
_mcsetprinter::
	ld hl, #2
	add hl,sp
	ld a,(hl) ; get character from stack
	jp 0xB857 ; mcsetprinter

; char mcreadyprinter(void);
_mcreadyprinter::
	call 0xB854 ; mcreadyprinter
	ld l, #0
	rlc l ; rotate carry into l
	ret

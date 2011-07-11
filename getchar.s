	.area _CODE
_getchar::       
	call	0xB80F ;; kmwaitkbd
	ld		a, b
	or		a	;; set flags
	jr		nz, _getchar ;; B=0 for simple character
	ld		l, c ;; return character in l
	ret

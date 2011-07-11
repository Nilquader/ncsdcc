;; FILE: putchar.s
;; for NC100 - (c) 2009 by Nilquader of SPRING
;;
	.area _CODE
_putchar::       
_putchar_rr_s::
        ld      hl,#2
        add     hl,sp

        ld      a,(hl)
        call	0xB833
	cp	#10
	ret	nz
	ld	a,#13
	call	0xB833
        
        ret

_putchar_rr_dbs::
        ld      a,e
        call	0xB833

        ret

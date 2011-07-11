;; crt0.s for the Amstrad NC100 (Z80)
;; startup code for PCMCIA program cards 
        .module crt0
       	.globl	_main

	.area	_HEADER (ABS)
	;; Reset vector
	
	.org	0xC200
	.ascii	"NC100PRG"
	.org	0xC210
	jp		init
	.ascii	"SD BOOT"
	.db		0x00
	.org	0xC220
	
init:
	;; Stack at the top of memory.
	;;ld	sp,#0xffff

        ;; Initialise global variables
        call    gsinit
	call	_main
	jp	_exit

	;; Ordering of segments for the linker.
	.area	_HOME
	.area	_CODE
        .area   _GSINIT
        .area   _GSFINAL

	.area	_DATA
        .area   _BSS
        .area   _HEAP

        .area   _CODE
__clock::
	ld	a,#2
        rst     0x08
	ret

_exit::
	;; Exit - quit to main menu
	ret
	
        .area   _GSINIT
gsinit::

        .area   _GSFINAL
        ret
        

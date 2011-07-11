;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Jul 10 2011) (Mac OS X x86_64)
; This file was generated Mon Jul 11 21:42:49 2011
;--------------------------------------------------------
	.module editbuf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _editbuf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;editbuf.c:2: char editbuf(char* inputbuf, unsigned char size, char flags)
;	---------------------------------
; Function editbuf
; ---------------------------------
_editbuf_start::
_editbuf:
	push	ix
	ld	ix,#0
	add	ix,sp
;editbuf.c:25: __endasm;
	
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
		
	pop	ix
	ret
_editbuf_end::
	.area _CODE
	.area _CABS

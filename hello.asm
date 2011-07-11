;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Jul 10 2011) (Mac OS X x86_64)
; This file was generated Sun Jul 10 22:41:03 2011
;--------------------------------------------------------
	.module hello
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
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
;hello.c:7: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-20
	add	hl,sp
	ld	sp,hl
;hello.c:12: eingabe[0] = 0; 
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x00
;hello.c:13: firmver=padgetversion();
	push	bc
	call	_padgetversion
	push	hl
	ld	hl,#0x0100
	push	hl
	call	_txtsetcursor
	ld	hl,#0x0023
	ex	(sp),hl
	ld	hl,#__str_0
	push	hl
	call	_printf
	pop	af
	pop	af
	call	_txtboldon
	ld	hl,#__str_1
	push	hl
	call	_printf
	pop	af
	pop	af
	call	_txtboldoff
	ld	hl,#__str_2
	push	hl
	call	_printf
	pop	af
	pop	bc
;hello.c:21: if (editbuf(eingabe, 20, EDITBUF_DOTTY))
	push	bc
	ld	hl,#0x4014
	push	hl
	push	bc
	call	_editbuf
	pop	af
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	Z,00102$
;hello.c:23: printf("\nYour name is %s\n", eingabe);
	push	bc
	ld	hl,#__str_3
	push	hl
	call	_printf
	pop	af
	pop	af
	jr	00103$
00102$:
;hello.c:27: printf("\nOk, you're to shy!\n");
	ld	hl,#__str_4
	push	hl
	call	_printf
	pop	af
00103$:
;hello.c:30: printf("\nPress any key to quit");
	ld	hl,#__str_5
	push	hl
	call	_printf
	pop	af
;hello.c:31: getchar();
	call	_getchar
	ld	sp,ix
	pop	ix
	ret
_main_end::
__str_0:
	.ascii "C on the Amstrad Notepad, Build %i"
	.db 0x0A
	.db 0x00
__str_1:
	.ascii "Your firmware version is: %i"
	.db 0x0A
	.db 0x00
__str_2:
	.ascii "Please enter your name:"
	.db 0x00
__str_3:
	.db 0x0A
	.ascii "Your name is %s"
	.db 0x0A
	.db 0x00
__str_4:
	.db 0x0A
	.ascii "Ok, you're to shy!"
	.db 0x0A
	.db 0x00
__str_5:
	.db 0x0A
	.ascii "Press any key to quit"
	.db 0x00
	.area _CODE
	.area _CABS

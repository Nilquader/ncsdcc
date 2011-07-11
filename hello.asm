;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Jul 10 2011) (Mac OS X x86_64)
; This file was generated Mon Jul 11 23:53:28 2011
;--------------------------------------------------------
	.module hello
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _d_asciitime
	.globl _d_datebuf
	.globl _nmimagic
	.globl _savingcontext
	.globl _savecritsp
	.globl _savecritpc
	.globl _savemmu3
	.globl _savemmu2
	.globl _savemmu1
	.globl _savemmu0
	.globl _savehldash
	.globl _savededash
	.globl _savebcdash
	.globl _saveafdash
	.globl _savesp
	.globl _savepc
	.globl _saveiy
	.globl _saveix
	.globl _savehl
	.globl _savede
	.globl _savebc
	.globl _saveaf
	.globl ___savehl
	.globl ___saveaf
	.globl ___savepearlmmu
	.globl _gotcontext
	.globl _copyofmmu3
	.globl _copyofmmu2
	.globl _copyofmmu1
	.globl _copyofmmu0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_copyofmmu0	=	0xb000
_copyofmmu1	=	0xb001
_copyofmmu2	=	0xb002
_copyofmmu3	=	0xb003
_gotcontext	=	0xb004
___savepearlmmu	=	0xb005
___saveaf	=	0xb006
___savehl	=	0xb008
_saveaf	=	0xb00a
_savebc	=	0xb00c
_savede	=	0xb00e
_savehl	=	0xb010
_saveix	=	0xb012
_saveiy	=	0xb014
_savepc	=	0xb016
_savesp	=	0xb018
_saveafdash	=	0xb01a
_savebcdash	=	0xb01c
_savededash	=	0xb01e
_savehldash	=	0xb020
_savemmu0	=	0xb022
_savemmu1	=	0xb023
_savemmu2	=	0xb024
_savemmu3	=	0xb025
_savecritpc	=	0xb026
_savecritsp	=	0xb028
_savingcontext	=	0xb02a
_nmimagic	=	0xb02b
_d_datebuf	=	0xb150
_d_asciitime	=	0xb162
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
;hello.c:9: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-22
	add	hl,sp
	ld	sp,hl
;hello.c:14: eingabe[0] = 0; 
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x00
;hello.c:15: firmver=padgetversion();
	push	bc
	call	_padgetversion
	pop	bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;hello.c:17: printf("Current Time: %s\n", d_asciitime);
	push	bc
	ld	hl,#_d_asciitime
	push	hl
	ld	hl,#__str_0
	push	hl
	call	_printf
	pop	af
	ld	hl,#0x0101
	ex	(sp),hl
	call	_txtsetcursor
	ld	hl,#0x0025
	ex	(sp),hl
	ld	hl,#__str_1
	push	hl
	call	_printf
	pop	af
	pop	af
	call	_txtboldon
	pop	bc
;hello.c:21: printf("Your firmware version is: %i, mmu0 is %02X\n", firmver,copyofmmu0);
	ld	hl,#_copyofmmu0 + 0
	ld	e,(hl)
	ld	d,#0x00
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#__str_2
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	af
	call	_txtboldoff
	ld	hl,#__str_3
	push	hl
	call	_printf
	pop	af
	pop	bc
;hello.c:24: if (editbuf(eingabe, 20, EDITBUF_DOTTY))
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
;hello.c:26: printf("\nYour name is %s\n", eingabe);
	push	bc
	ld	hl,#__str_4
	push	hl
	call	_printf
	pop	af
	pop	af
	jr	00103$
00102$:
;hello.c:30: printf("\nOk, you're to shy!\n");
	ld	hl,#__str_5
	push	hl
	call	_printf
	pop	af
00103$:
;hello.c:33: printf("\nPress any key to quit");
	ld	hl,#__str_6
	push	hl
	call	_printf
	pop	af
;hello.c:34: getchar();
	call	_getchar
	ld	sp,ix
	pop	ix
	ret
_main_end::
__str_0:
	.ascii "Current Time: %s"
	.db 0x0A
	.db 0x00
__str_1:
	.ascii "C on the Amstrad Notepad, Build %i"
	.db 0x0A
	.db 0x00
__str_2:
	.ascii "Your firmware version is: %i, mmu0 is %02X"
	.db 0x0A
	.db 0x00
__str_3:
	.ascii "Please enter your name:"
	.db 0x00
__str_4:
	.db 0x0A
	.ascii "Your name is %s"
	.db 0x0A
	.db 0x00
__str_5:
	.db 0x0A
	.ascii "Ok, you're to shy!"
	.db 0x0A
	.db 0x00
__str_6:
	.db 0x0A
	.ascii "Press any key to quit"
	.db 0x00
	.area _CODE
	.area _CABS

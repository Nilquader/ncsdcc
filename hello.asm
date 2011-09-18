;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Jul 10 2011) (Mac OS X x86_64)
; This file was generated Sun Sep 18 23:36:38 2011
;--------------------------------------------------------
	.module hello
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _gpos
	.globl _ghoutfile
	.globl _goutstream
	.globl _dasciitime
	.globl _ddatebuf
	.globl _dworkspace
	.globl _sdumpname
	.globl _clockon
	.globl _lastsecond
	.globl _wasmenusel
	.globl _currentmenu
	.globl _currentprinter
	.globl _mainprog
	.globl _dontpreservecontext
	.globl _preservecontext
	.globl _eventhappened
	.globl _minutecounter
	.globl _minutesleft
	.globl _poweroffminutes
	.globl _soundrepptr
	.globl _soundrepcount
	.globl _soundptr
	.globl _soundcounter
	.globl _alarmhappenedgotmsg
	.globl _alarmhappened
	.globl _dalarmday
	.globl _rtcbuf
	.globl _rptkeystates
	.globl _keytorepeat
	.globl _rpttimer
	.globl _rptrate
	.globl _rptdelay
	.globl _ackirq
	.globl _disablexonxoff
	.globl _padserout_xoff
	.globl _padserin_xoff
	.globl _padserbufempty
	.globl _padsernextout
	.globl _padsernextin
	.globl _padserbuf
	.globl _justswitchedon
	.globl _savecaps
	.globl _capsstate
	.globl _thiskbdstate
	.globl _lastkbdstate
	.globl _padbufempty
	.globl _padnextout
	.globl _padnextin
	.globl _padkeybuf
	.globl _kbdstate2
	.globl _kbdstate1
	.globl _saveprinstat
	.globl _diagnostics
	.globl _initstack
	.globl _criticalsp
	.globl _criticalpc
	.globl _nmichksums
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
_MMU0	=	0x0010
_MMU1	=	0x0011
_MMU2	=	0x0012
_MMU3	=	0x0013
_MCWAIT	=	0x0020
_BRCTRL	=	0x0030
_PARPORT	=	0x0050
_SNDCHAL	=	0x0050
_SNDCHAH	=	0x0051
_IRQMASK	=	0x0060
_PWROFF	=	0x0070
_IRQSTA	=	0x0090
_MCSTAT	=	0x00a0
_KBDROW0	=	0x00b0
_KBDROW1	=	0x00b1
_KBDROW2	=	0x00b2
_KBDROW3	=	0x00b3
_KBDROW4	=	0x00b4
_KBDROW5	=	0x00b5
_KBDROW6	=	0x00b6
_KBDROW7	=	0x00b7
_KBDROW8	=	0x00b8
_KBDROW9	=	0x00b9
_UARTDR	=	0x00c0
_UARTSR	=	0x00c1
_RTC0	=	0x00d0
_RTC1	=	0x00d1
_RTC2	=	0x00d2
_RTC3	=	0x00d3
_RTC4	=	0x00d4
_RTC5	=	0x00d5
_RTC6	=	0x00d6
_RTC7	=	0x00d7
_RTC8	=	0x00d8
_RTC9	=	0x00d9
_RTCA	=	0x00da
_RTCB	=	0x00db
_RTCC	=	0x00dc
_RTCD	=	0x00dd
_RTCE	=	0x00de
_RTCF	=	0x00df
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
_nmichksums	=	0xb02f
_criticalpc	=	0xb037
_criticalsp	=	0xb039
_initstack	=	0xb03b
_diagnostics	=	0xb08b
_saveprinstat	=	0xb08c
_kbdstate1	=	0xb08d
_kbdstate2	=	0xb097
_padkeybuf	=	0xb0a1
_padnextin	=	0xb0e1
_padnextout	=	0xb0e1
_padbufempty	=	0xb0e3
_lastkbdstate	=	0xb0e4
_thiskbdstate	=	0xb0e6
_capsstate	=	0xb0e8
_savecaps	=	0xb0e9
_justswitchedon	=	0xb0ea
_padserbuf	=	0xb0eb
_padsernextin	=	0xb10b
_padsernextout	=	0xb10c
_padserbufempty	=	0xb10d
_padserin_xoff	=	0xb10e
_padserout_xoff	=	0xb10f
_disablexonxoff	=	0xb110
_ackirq	=	0xb111
_rptdelay	=	0xb112
_rptrate	=	0xb113
_rpttimer	=	0xb114
_keytorepeat	=	0xb115
_rptkeystates	=	0xb116
_rtcbuf	=	0xb117
_dalarmday	=	0xb124
_alarmhappened	=	0xb12a
_alarmhappenedgotmsg	=	0xb12b
_soundcounter	=	0xb12c
_soundptr	=	0xb12d
_soundrepcount	=	0xb12f
_soundrepptr	=	0xb130
_poweroffminutes	=	0xb132
_minutesleft	=	0xb133
_minutecounter	=	0xb134
_eventhappened	=	0xb136
_preservecontext	=	0xb137
_dontpreservecontext	=	0xb138
_mainprog	=	0xb139
_currentprinter	=	0xb13a
_currentmenu	=	0xb13b
_wasmenusel	=	0xb13d
_lastsecond	=	0xb13e
_clockon	=	0xb13f
_sdumpname	=	0xb140
_dworkspace	=	0xb148
_ddatebuf	=	0xb150
_dasciitime	=	0xb162
_goutstream	=	0xb1ba
_ghoutfile	=	0xb1bb
_gpos	=	0xb1bd
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
;hello.c:8: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-32
	add	hl,sp
	ld	sp,hl
;hello.c:15: eingabe[0] = 0; 
	ld	hl,#0x000A
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x00
;hello.c:16: firmver=padgetversion();
	push	bc
	call	_padgetversion
	pop	bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;hello.c:18: SNDCHAL = 50;
	ld	a,#0x32
	out	(_SNDCHAL),a
;hello.c:19: SNDCHAH = 30;
	ld	a,#0x1E
	out	(_SNDCHAH),a
;hello.c:23: if(txtgetwindow(&col, &row, &col2, &row2))
	ld	hl,#0x0007
	add	hl,sp
	ld	-28 (ix),l
	ld	-27 (ix),h
	ld	hl,#0x0006
	add	hl,sp
	ld	-30 (ix),l
	ld	-29 (ix),h
	ld	hl,#0x0009
	add	hl,sp
	ld	-32 (ix),l
	ld	-31 (ix),h
	ld	hl,#0x0008
	add	hl,sp
	ex	de,hl
	push	bc
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	push	hl
	push	de
	call	_txtgetwindow
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	Z,00102$
;hello.c:25: printf("The window coordinates are (%i,%i) - (%i,%i)\n", col, row, col2, row2);
	ld	a,-25 (ix)
	ld	-32 (ix),a
	ld	a,-25 (ix)
	rla	
	sbc	a,a
	ld	-31 (ix),a
	ld	a,-26 (ix)
	ld	-30 (ix),a
	ld	a,-26 (ix)
	rla	
	sbc	a,a
	ld	-29 (ix),a
	ld	a,-23 (ix)
	ld	-28 (ix),a
	ld	a,-23 (ix)
	rla	
	sbc	a,a
	ld	-27 (ix),a
	ld	e,-24 (ix)
	ld	a,-24 (ix)
	rla	
	sbc	a,a
	ld	d,a
	push	bc
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	hl
	push	de
	ld	hl,#__str_0
	push	hl
	call	_printf
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	bc
00102$:
;hello.c:29: txtoutput(65);
	push	bc
	ld	a,#0x41
	push	af
	inc	sp
	call	_txtoutput
	inc	sp
	ld	a,#0x42
	push	af
	inc	sp
	call	_txtwrchar
	inc	sp
	ld	hl,#_dasciitime
	push	hl
	ld	hl,#__str_1
	push	hl
	call	_printf
	pop	af
	ld	hl,#0x0101
	ex	(sp),hl
	call	_txtsetcursor
	ld	hl,#0x0029
	ex	(sp),hl
	ld	hl,#__str_2
	push	hl
	call	_printf
	pop	af
	pop	af
	call	_txtboldon
	pop	bc
;hello.c:36: printf("Your firmware version is: %i, mmu0 is %02X\n", firmver,copyofmmu0);
	ld	hl,#_copyofmmu0 + 0
	ld	e,(hl)
	ld	d,#0x00
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#__str_3
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	af
	call	_txtboldoff
	ld	hl,#__str_4
	push	hl
	call	_printf
	ld	hl,#0x0041
	ex	(sp),hl
	call	_kmcharreturn
	pop	af
	call	_txtcuroff
	pop	bc
;hello.c:41: if (editbuf(eingabe, 20, EDITBUF_DOTTY))
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
	jr	Z,00104$
;hello.c:43: txtgetcursor(&col, &row);
	ld	hl,#0x0009
	add	hl,sp
	ld	-32 (ix),l
	ld	-31 (ix),h
	ld	hl,#0x0008
	add	hl,sp
	ex	de,hl
	push	bc
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	push	hl
	push	de
	call	_txtgetcursor
	pop	af
	pop	af
	pop	bc
;hello.c:44: printf("\nYour name is %s and the cursor was at (%i, %i)\n", eingabe, col, row);
	ld	a,-23 (ix)
	ld	-32 (ix),a
	ld	a,-23 (ix)
	rla	
	sbc	a,a
	ld	-31 (ix),a
	ld	e,-24 (ix)
	ld	a,-24 (ix)
	rla	
	sbc	a,a
	ld	d,a
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	push	hl
	push	de
	push	bc
	ld	hl,#__str_5
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	af
	pop	af
	jr	00105$
00104$:
;hello.c:48: printf("\nOk, you're to shy!\n");
	ld	hl,#__str_6
	push	hl
	call	_printf
	pop	af
00105$:
;hello.c:50: txtcuron();
	call	_txtcuron
;hello.c:51: getchar();
	call	_getchar
;hello.c:53: txtclearwindow();
	call	_txtclearwindow
;hello.c:54: printf("\nPress any key to continue");
	ld	hl,#__str_7
	push	hl
	call	_printf
	pop	af
;hello.c:55: kmsettickcount(0,0);
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_kmsettickcount
	pop	af
	pop	af
;hello.c:56: kmwaitkbd();
	call	_kmwaitkbd
;hello.c:57: col1();
	call	_col1
;hello.c:58: printf("Press a key to quit!");
	ld	hl,#__str_8
	push	hl
	call	_printf
	pop	af
;hello.c:59: kmwaitkbd();
	call	_kmwaitkbd
;hello.c:60: file = selectfile();
	call	_selectfile
	ld	c,l
	ld	b,h
;hello.c:61: if (file == NULL) {
	ld	a,c
	or	a,b
	jr	NZ,00107$
;hello.c:62: printf("Don't you want to view a file?\n");
	ld	hl,#__str_9
	push	hl
	call	_printf
	pop	af
	jr	00108$
00107$:
;hello.c:64: printf("Your file was %s!\n", file);
	push	bc
	ld	hl,#__str_10
	push	hl
	call	_printf
	pop	af
	pop	af
00108$:
;hello.c:67: kmwaitkbd();
	call	_kmwaitkbd
;hello.c:70: return 0;
	ld	hl,#0x0000
	ld	sp,ix
	pop	ix
	ret
_main_end::
__str_0:
	.ascii "The window coordinates are (%i,%i) - (%i,%i)"
	.db 0x0A
	.db 0x00
__str_1:
	.ascii "Current Time: %s"
	.db 0x0A
	.db 0x00
__str_2:
	.ascii "C on the Amstrad Notepad, Build %i"
	.db 0x0A
	.db 0x00
__str_3:
	.ascii "Your firmware version is: %i, mmu0 is %02X"
	.db 0x0A
	.db 0x00
__str_4:
	.ascii "Please enter your name:"
	.db 0x00
__str_5:
	.db 0x0A
	.ascii "Your name is %s and the cursor was at (%i, %i)"
	.db 0x0A
	.db 0x00
__str_6:
	.db 0x0A
	.ascii "Ok, you're to shy!"
	.db 0x0A
	.db 0x00
__str_7:
	.db 0x0A
	.ascii "Press any key to continue"
	.db 0x00
__str_8:
	.ascii "Press a key to quit!"
	.db 0x00
__str_9:
	.ascii "Don't you want to view a file?"
	.db 0x0A
	.db 0x00
__str_10:
	.ascii "Your file was %s!"
	.db 0x0A
	.db 0x00
	.area _CODE
	.area _CABS

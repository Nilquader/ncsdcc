/*
 * Amstrad NC100 Firmware Libray for SDCC       
 * (c) 2011 by Nilquader of SPRING
 *
 * firmware.h - Version 0.1
 *
 */
 
/* todo: some missing firmware variables */
/* todo: lots of missing firmware routines */

#ifndef __FIRMWARE_H
#define __FIRMWARE_H

#define EDITBUF_TERMINATE 4
#define EDITBUF_NOECHO 8
#define EDITBUF_DELSPC 16
#define EDITBUF_FORCE 32
#define EDITBUF_DOTTY 64

// Firmware System Variables
volatile __at(0xb000) unsigned char copyofmmu0;
volatile __at(0xb001) unsigned char copyofmmu1;
volatile __at(0xb002) unsigned char copyofmmu2;
volatile __at(0xb003) unsigned char copyofmmu3;
volatile __at(0xb004) unsigned char gotcontext;
volatile __at(0xb005) unsigned char __savepearlmmu;
volatile __at(0xb006) unsigned int __saveaf;
volatile __at(0xb008) unsigned int __savehl;
volatile __at(0xb00a) unsigned int saveaf;
volatile __at(0xb00c) unsigned int savebc;
volatile __at(0xb00e) unsigned int savede;
volatile __at(0xb010) unsigned int savehl;
volatile __at(0xb012) unsigned int saveix;
volatile __at(0xb014) unsigned int saveiy;
volatile __at(0xb016) unsigned int savepc;
volatile __at(0xb018) unsigned int savesp;
volatile __at(0xb01A) unsigned int saveafdash;
volatile __at(0xb01c) unsigned int savebcdash;
volatile __at(0xb01e) unsigned int savededash;
volatile __at(0xb020) unsigned int savehldash;
volatile __at(0xb022) unsigned char savemmu0;
volatile __at(0xb023) unsigned char savemmu1;
volatile __at(0xb024) unsigned char savemmu2;
volatile __at(0xb025) unsigned char savemmu3;
volatile __at(0xb026) unsigned int savecritpc;
volatile __at(0xb028) unsigned int savecritsp;
volatile __at(0xb02a) unsigned char savingcontext;
volatile __at(0xb02b) unsigned char nmimagic[4];
volatile __at(0xb02f) unsigned char nmichksums[8];
volatile __at(0xb037) unsigned int criticalpc;
volatile __at(0xb039) unsigned int criticalsp;
volatile __at(0xb03b) unsigned char initstack[80];
volatile __at(0xb08b) unsigned char diagnostics;
volatile __at(0xb08c) unsigned char saveprinstat;
volatile __at(0xb08d) unsigned char kbdstate1[10];
volatile __at(0xb097) unsigned char kbdstate2[10];
volatile __at(0xb0a1) unsigned char padkeybuf[64];
volatile __at(0xb0e1) unsigned char padnextin;
volatile __at(0xb0e1) unsigned char padnextout;
volatile __at(0xb0e3) unsigned char padbufempty;
volatile __at(0xb0e4) unsigned int lastkbdstate;
volatile __at(0xb0e6) unsigned int thiskbdstate;
volatile __at(0xb0e8) unsigned char capsstate;
volatile __at(0xb0e9) unsigned char savecaps;
volatile __at(0xb0ea) unsigned char justswitchedon;
// variables above here are preserved after timeout

volatile __at(0xb0eb) unsigned char padserbuf[64];
volatile __at(0xb10b) unsigned char padsernextin;
volatile __at(0xb10c) unsigned char padsernextout;
volatile __at(0xb10d) unsigned char padserbufempty;
volatile __at(0xb10e) unsigned char padserin_xoff; // non-zero when XOFF has stopped inward transmission
volatile __at(0xb10f) unsigned char padserout_xoff; // non-zero when XOFF has stopped outward transmission
volatile __at(0xb110) unsigned char disablexonxoff; //  non-zero to disable software handshake
volatile __at(0xb111) unsigned char ackirq; // set non-zero when ACK interrupt occurs
volatile __at(0xb112) unsigned char rptdelay; // centisecs
volatile __at(0xb113) unsigned char rptrate;  //centisecs
volatile __at(0xb114) unsigned char rpttimer; // count down timer for key repeat
volatile __at(0xb115) unsigned char keytorepeat; // key number
volatile __at(0xb116) unsigned char rptkeystates; // shift states
volatile __at(0xb117) unsigned char rtcbuf[13];
volatile __at(0xb124) unsigned char dalarmday[6]; // alarm day,hour,min ready for rtc chip
volatile __at(0xb12a) unsigned char alarmhappened; // non zero when alarm has gone off, message pending
volatile __at(0xb12b) unsigned char alarmhappenedgotmsg; // non zero when alarm has gone off, got message & pending
volatile __at(0xb12c) unsigned char soundcounter; // non-zero if we're playing a tune
volatile __at(0xb12d) void* soundptr; // pointer to array of frequency,duration
volatile __at(0xb12f) unsigned char soundrepcount;
volatile __at(0xb130) void* soundrepptr;
volatile __at(0xb132) unsigned char poweroffminutes; // configured time to power off
volatile __at(0xb133) unsigned char minutesleft;
volatile __at(0xb134) unsigned int minutecounter;
volatile __at(0xb136) unsigned char eventhappened;
volatile __at(0xb137) unsigned char preservecontext; // 0=return to main screen at power on
volatile __at(0xb138) unsigned char dontpreservecontext; // 1=dont preserve (diag/batt)
volatile __at(0xb139) unsigned char mainprog; // 6=inbasic, 128=inexternal (foreground program id)
volatile __at(0xb13a) unsigned char currentprinter; // 0 for parallel, 1 for serial
volatile __at(0xb13b) void* currentmenu; // pointer to current menu
volatile __at(0xb13d) unsigned char wasmenusel;
volatile __at(0xb13e) unsigned char lastsecond; // checked to see whether to update the time
volatile __at(0xb13f) unsigned char clockon; // uses in Protext, non-zero when clock is enabled
volatile __at(0xb140) char sdumpname[4]; // for screen dump name
volatile __at(0xb148) unsigned char dworkspace[8]; // for massaged copy of symbol data (eg inverse/underline)
volatile __at(0xb150) char ddatebuf[18];
volatile __at(0xb162) char dasciitime[12];
/* what to do with currentcfg? */
volatile __at(0xb1ba) unsigned char goutstream; // bit 0 for screen, 1 for printer, 2 for file
volatile __at(0xb1bb) unsigned int ghoutfile; // file handle for charout if bit 2 set
volatile __at(0xb1bd) unsigned char gpos; // current column number (charout)
/* todo: some missing firmware variables */


/*
 * Firmware routines
 */

/* line editor with options. Returns FALSE if ESC pressed  */ 
char editbuf(char* inputbuf, unsigned char size, char flags);

/* returns a token to the keyboard buffer */
void kmcharreturn(unsigned int token);

/* Gets a key token if there is one, does not wait. Returns 0 if no key avaliable */
unsigned int kmreadkbd(void);

/* same as kmreadkbd, but macros are expanded */
unsigned int kmreadchar(void);

/* Enables the ticker event,  There are 100 ticks per second */
void kmsettickcount(unsigned int firstevent,unsigned int nextevent);

/* wait for a key token, uses kmreadkbd */
unsigned int kmwaitkbd(void);

/* move cursor to start of next line */
void col1(void);

/* clears current window and moves cursor to top left */
void txtclearwindow(void);

/* removes the cursor from the screen */
void txtcuroff(void);

/* displays the cursor on the screen */
void txtcuron(void);

/* moves the cursor */
void txtsetcursor(char column, char row);

/* enable or disable various display attributes */
void txtboldoff(void);
void txtboldon(void);
void txtinverseoff(void);
void txtinverseon(void);
void txtunderlineoff(void);
void txtunderlineon(void);

/* displays the file selector (clears the screen first) */
/* returns NULL if STOP pressed */
char* selectfile(void);

/* gets the firmware version number */
int padgetversion(void);

#endif /* __FIRMWARE_H */
   
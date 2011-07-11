/*
 * Amstrad NC100 Firmware Libray for SDCC       
 * (c) 2011 by Nilquader of SPRING
 *
 * nc100.h - Version 0.1
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
/* todo: some missing firmware variables */
volatile __at(0xb150) unsigned char d_datebuf[18];
volatile __at(0xb162) unsigned char d_asciitime[12];
/* todo: some missing firmware variables */


/* line editor with options. Returns FALSE if ESC pressed  */ 
char editbuf(char* inputbuf, unsigned char size, char flags);

/* moves the cursor */
void txtsetcursor(char column, char row);

/* enable or diable various display attributes */
void txtboldoff(void);
void txtboldon(void);
void txtinverseoff(void);
void txtinverseon(void);
void txtunderlineoff(void);
void txtunderlineon(void);

/* gets the firmware version number */
int padgetversion(void);

#endif /* __FIRMWARE_H */
   
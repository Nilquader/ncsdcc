/*
 * Amstrad NC100 Firmware Libray for SDCC       
 * (c) 2011 by Nilquader of SPRING
 *
 * nc100.h - Version 0.1
 *
 */

#ifndef __FIRMWARE_H
#define __FIRMWARE_H

#define EDITBUF_TERMINATE 4
#define EDITBUF_NOECHO 8
#define EDITBUF_DELSPC 16
#define EDITBUF_FORCE 32
#define EDITBUF_DOTTY 64

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
   
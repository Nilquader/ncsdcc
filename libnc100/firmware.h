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

// defines time/date structures for all firmware calls dealing with time
struct padtime{
  unsigned int year;
  unsigned char month;
  unsigned char date;
  unsigned char hour;
  unsigned char minute;
  unsigned char second;
};

struct padalarm{
  unsigned char date;
  unsigned char hour;
  unsigned char minute;
};

// defines file info structure for findfirst/findnext
struct fileinfo{
  char filename[12];
  char attribute;
  unsigned short size;
};

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

/* returns the cursor position */
void txtgetcursor(char *column, char *row);

/* returns the window coordinates */
/* returns 0 if window is whole screen, 1 if a smaller window */
char txtgetwindow(char* left, char* top, char* right, char* bottom);

/* displays a character or acts on control codes */
void txtoutput(char character);

/* moves the cursor */
void txtsetcursor(char column, char row);

/* defines a new window */
void txtsetwindow(char left, char top, char right, char bottom);

/* displays a character. All values displayed (PC char. set) */
void txtwrchar(char character);

/* enable or disable various display attributes */
void txtboldoff(void);
void txtboldon(void);
void txtinverseoff(void);
void txtinverseon(void);
void txtunderlineoff(void);
void txtunderlineon(void);

/* sends a character to the printer */
char mcprintchar(char character);

/* tests whether the printer is ready */
char mcreadyprinter(void);

/*  sets the printer type to be used by mcprintchar and mcreadyprinter */
void mcsetprinter(char prntype); // prntype: 0=parallel, 1=serial

/*  initialises the serial port using the global configured settings */
void padinitserial(void);

/* reads a character from the serial port */
char padinserial(char *character);

/* sends a character to the parallel port */
char padoutparallel(char character);

/* sends a character to the serial port */
char padoutserial(char character);

/* tests whether the parallel port is ready */
char padreadyparallel(void);

/*  tests whether the serial port is ready */
char padreadyserial(void); 

/* turns off the UART and 4711 */
void padresetserial(void);

/* tests whether there is a character waiting to be read from the serial port */
char padserialwaiting(void);

/* returns the address of a 4 byte 100Hz ticker */
long* padgetticker(void);

/* reads the time and date from the RTC */
void padgettime(struct padtime* rtctime);

/* sets the ALARM date and time (within next month) */
void padsetalarm(struct padalarm* alarm); // missing

/* sets the RTC date and time */
void padsettime(struct padtime* rtctime); // missing

/* obtains the address of a memory block for a given memory handle */
void* heapaddress(int handle); // missing

/* allocates a block of memory from the heap */
int heapalloc(unsigned short size); // missing

/* frees a block of memory */
void heapfree(int handle); // missing

/* locks or unlocks a memory block */
void heaplock(int handle, char lock); // missing

/* returns the largest block size that can be allocated */
unsigned short heapmaxfree(void); // missing

/* changes the size of an allocated memory block */
int heaprealloc(int handle, unsigned short newsize); // missing

/* closes a file */
char fclose(int handle); // missing

/* erases a file */
char ferase(char* filename); // missing

/* reads a block from a file */
unsigned short finblock(int handle, char *buffer, unsigned short size); // missing

/* reads a byte from a file */
char finchar(int handle, char *byte); // missing

/* finds first file. setdta must have been called first */
struct fileinfo* findfirst(void); // missing

/* finds next file. findfirst must have been called first */
struct fileinfo* findnext(void); // missing

/* opens a file for input */
int fopenin(char *filename); // missing

/* opens a file for output */
int fopenout(char *filename); // missing

/* opens a file for input and output */
int fopenup(char *filename); // missing

/* writes a block to a file */
unsigned short foutblock(int handle, char* buffer, unsigned short size); // missing

/* writes a byte to a file */
char foutchar(int handle, char byte); // missing

/* renames a file */
char frename(char *oldname, char* newname); // missing

/* moves the file pointer to a position within a file */
char fseek(int handle, unsigned short offset); // missing

/* finds size of file */
unsigned short fsize(char *filename); // missing

/* finds size of an open file */
unsigned short fsizehandle(int handle); // missing

/* returns the value of the file pointer */
unsigned short ftell(int handle); // missing

/* tests whether end of file has been reached */
char ftesteof(int handle); // missing

/* displays the file selector (clears the screen first) */
/* returns NULL if STOP pressed */
char* selectfile(void);

/* set memory block to be used by findfirst/findnext */
void setdta(void* buffer); // missing

/* sets file date/time to current date/time */
char fdatestamp(char* filename); // missing

/* sets the attribute byte for a file open for output */
char fsetattr(int handlem, char attribute); // missing

/* returns attribute byte of file */
char fgetattr(char *filename); // missing

/* ascertains whether a 'yellow event' is pending */
int kmgetyellow(void); // missing

/* sets up a yellow event. Specialised use only. */
void kmsetyellow(int eventtoken); // missing

/* reads a character from the parallel port using Lapcat protocol */
char lapcat_receive(char *character);

/* sends a character to the parallel port using Lapcat protocol */
char lapcat_send(char character);

/* gets the firmware version number */
int padgetversion(void);

#endif /* __FIRMWARE_H */

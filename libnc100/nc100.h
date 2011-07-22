/*
 * NC100 Hardware Registers 
 * (c) 2011 by Nilquader of SPRING
 *
 * nc100.h - Version 0.1
 *
 */
 
// Constants for Baud rate control register
#define BR_COMMONCR 0x80
#define BR_STROBE   0x40
#define BR_LINEDRV  0x10
#define BR_UART     0x08
#define BR_150      0x00
#define BR_300      0x01
#define BR_600      0x02
#define BR_1200     0x03
#define BR_2400     0x04
#define BR_4800     0x05
#define BR_9600     0x06
#define BR_19200    0x07

// SFR definitions
__sfr __at 0x10 MMU0; // MMU0 controls 0000-3FFF
__sfr __at 0x11 MMU1; // MMU1 controls 4000-7FFF
__sfr __at 0x12 MMU2; // MMU2 controls 8000-BFFF
__sfr __at 0x13 MMU3; // MMU3 controls C000-FFFF

__sfr __at 0x20 MCWAIT; // Memory card wait state control
__sfr __at 0x30 BRCTRL; // Baud rate control
__sfr __at 0x50 PARPORT; // Parallel interface data
__sfr __at 0x50 SNDCHAL; // Sound Channel A period low
__sfr __at 0x51 SNDCHAH; // Sound Channel A period high
__sfr __at 0x60 IRQMASK; // Interrupt request mask
__sfr __at 0x70 PWROFF; // Power off control
__sfr __at 0x90 IRQSTA; // Interrupt status register
__sfr __at 0xA0 MCSTAT; // Memory card/battery status

__sfr __at 0xB0 KBDROW0; // Keyboard matrix, row 0
__sfr __at 0xB1 KBDROW1; // Keyboard matrix, row 1
__sfr __at 0xB2 KBDROW2; // Keyboard matrix, row 2
__sfr __at 0xB3 KBDROW3; // Keyboard matrix, row 3
__sfr __at 0xB4 KBDROW4; // Keyboard matrix, row 4
__sfr __at 0xB5 KBDROW5; // Keyboard matrix, row 5
__sfr __at 0xB6 KBDROW6; // Keyboard matrix, row 6
__sfr __at 0xB7 KBDROW7; // Keyboard matrix, row 7
__sfr __at 0xB8 KBDROW8; // Keyboard matrix, row 8
__sfr __at 0xB9 KBDROW9; // Keyboard matrix, row 9

__sfr __at 0xC0 UARTDR; // UART Data Register
__sfr __at 0xC1 UARTSR; // UART Status Register

__sfr __at 0xD0 RTC0; // RTC Register 0
__sfr __at 0xD1 RTC1; // RTC Register 1
__sfr __at 0xD2 RTC2; // RTC Register 2
__sfr __at 0xD3 RTC3; // RTC Register 3
__sfr __at 0xD4 RTC4; // RTC Register 4
__sfr __at 0xD5 RTC5; // RTC Register 5
__sfr __at 0xD6 RTC6; // RTC Register 6
__sfr __at 0xD7 RTC7; // RTC Register 7
__sfr __at 0xD8 RTC8; // RTC Register 8
__sfr __at 0xD9 RTC9; // RTC Register 9
__sfr __at 0xDA RTCA; // RTC Register 10
__sfr __at 0xDB RTCB; // RTC Register 11
__sfr __at 0xDC RTCC; // RTC Register 12
__sfr __at 0xDD RTCD; // RTC Register 13
__sfr __at 0xDE RTCE; // RTC Register 14
__sfr __at 0xDF RTCF; // RTC Register 15




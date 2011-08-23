/* Amstrad NC 100 example code */
#include <stdio.h>
#include "libnc100/nc100.h"
#include "libnc100/firmware.h"

#define BUILD 40

int main(void)
{
   int firmver;
   char eingabe[20];

   eingabe[0] = 0; 
   firmver=padgetversion();

   SNDCHAL = 50;
   SNDCHAH = 30;

   printf("Current Time: %s\n", dasciitime);
   txtsetcursor(1,1);
   printf("C on the Amstrad Notepad, Build %i\n", BUILD);
   txtboldon();
   printf("Your firmware version is: %i, mmu0 is %02X\n", firmver,copyofmmu0);
   txtboldoff();
   printf("Please enter your name:");
   kmcharreturn(65);
   txtcuroff();
   if (editbuf(eingabe, 20, EDITBUF_DOTTY))
   {
    printf("\nYour name is %s\n", eingabe);
   }
   else
   {
    printf("\nOk, you're to shy!\n");
   }
   txtcuron();
   
   txtclearwindow();
   printf("\nPress any key to continue");
   kmsettickcount(0,0);
   kmwaitkbd();
   col1();
   printf("Press a key to quit!");
   kmwaitkbd();
   // getchar();
}

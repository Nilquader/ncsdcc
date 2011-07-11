/* Amstrad NC 100 example code */
#include <stdio.h>
#include "libnc100/firmware.h"

#define BUILD 37

//volatile __at(0xb000) unsigned char copyofmmu0;

int main(void)
{
   int firmver;
   char eingabe[20];

   eingabe[0] = 0; 
   firmver=padgetversion();

   printf("Current Time: %s\n", d_asciitime);
   txtsetcursor(1,1);
   printf("C on the Amstrad Notepad, Build %i\n", BUILD);
   txtboldon();
   printf("Your firmware version is: %i, mmu0 is %02X\n", firmver,copyofmmu0);
   txtboldoff();
   printf("Please enter your name:");
   if (editbuf(eingabe, 20, EDITBUF_DOTTY))
   {
    printf("\nYour name is %s\n", eingabe);
   }
   else
   {
    printf("\nOk, you're to shy!\n");
   }
   
   printf("\nPress any key to quit");
   getchar();
}

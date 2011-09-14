/* Amstrad NC 100 example code */
#include <stdio.h>
#include "libnc100/nc100.h"
#include "libnc100/firmware.h"

#define BUILD 40

int main(void)
{
   int firmver;
   char eingabe[20];
   char *file;
   char row, col;

   eingabe[0] = 0; 
   firmver=padgetversion();

   SNDCHAL = 50;
   SNDCHAH = 30;

   // test the printer
   if(mcreadyprinter()) {
     mcprintchar('A');
     mcprintchar('\n');
   }
   
   // padinitserial();
   if(padoutserial(row)) printf("Serial ready!\n");
   
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
    txtgetcursor(&col, &row);
    printf("\nYour name is %s and the cursor was at (%i, %i)\n", eingabe, col, row);
   }
   else
   {
    printf("\nOk, you're to shy!\n");
   }
   txtcuron();
   getchar();
   
   txtclearwindow();
   printf("\nPress any key to continue");
   kmsettickcount(0,0);
   kmwaitkbd();
   col1();
   printf("Press a key to quit!");
   kmwaitkbd();
   file = selectfile();
   if (file == NULL) {
    printf("Don't you want to view a file?\n");
   } else {
    printf("Your file was %s!\n", file);
   }
   
   kmwaitkbd();
   // getchar();
   
   return 0;
}

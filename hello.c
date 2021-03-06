/* Amstrad NC 100 example code */
#include <stdio.h>
#include "libnc100/nc100.h"
#include "libnc100/firmware.h"

#define BUILD 41

int main(void)
{
   int firmver;
   char eingabe[20];
   char *file;
   char row, col, row2, col2;
   long int *ticker;
   struct padtime mytime;
   char seribyte;

   eingabe[0] = 0; 
   firmver=padgetversion();

   SNDCHAL = 50;
   SNDCHAH = 30;

   ticker = padgetticker();
   printf("Ticker is: %li\n", *ticker);
   
   padgettime(&mytime);
   printf("Address is: %u\n", (unsigned int)mytime);
   printf("Date: %i.%i. Time is %i:%i:%i\n", mytime.month, mytime.date, mytime.hour, mytime.minute, mytime.second);

   while(1) 
   {
    while(!padserialwaiting());
    printf("Serial data waiting...\n");   
    padinserial(&seribyte);
    printf("Byte: %02x\n", seribyte);
    padoutserial(seribyte + 1);
   }

   getchar();

   // txtsetwindow(10,1,50,6);
   if(txtgetwindow(&col, &row, &col2, &row2))
   {
     printf("The window coordinates are (%i,%i) - (%i,%i)\n", col, row, col2, row2);
   }
   
   
   txtoutput(65);
   txtwrchar(66);
   
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

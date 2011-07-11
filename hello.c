/* Amstrad NC 100 example code */
#include <stdio.h>
#include "nc100.h"

#define BUILD 35

int main(void)
{
   int firmver;
   char eingabe[20];

   eingabe[0] = 0; 
   firmver=padgetversion();

   txtsetcursor(0,1);
   printf("C on the Amstrad Notepad, Build %i\n", BUILD);
   txtboldon();
   printf("Your firmware version is: %i\n", firmver);
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

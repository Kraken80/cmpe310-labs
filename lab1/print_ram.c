#include <stdio.h>

extern unsigned char ram[]; // ram[] from .globl in Task1.s
extern void fill_ram(void); // fill_ram from Task1.s

int main()
{
    fill_ram(); // Run assembly code
    printf("RAM contents from 50H to 58H:\n");
    for(int i = 0x50; i <= 0x58; i++) { 
        printf("%02X ", ram[i]);
    }
    printf("\n");
    return 0;
}

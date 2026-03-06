#include <stdio.h>

/*
gcc -O0 -S -m32 basic.c
*/

int a = 1;
char c = 'a';
float f = 1.23456;
char string[] = "the bear ate the grub";

int main()
{
    int i;
    for(i = 0; i < 10; i++) {
        a = a;
    }
}
#include <stdio.h>

extern int search(void);

int main()
{
    int result;

    result = search();

    printf("Maximum Number = %d\n", result);
}
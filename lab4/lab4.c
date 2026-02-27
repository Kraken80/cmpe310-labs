#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern int32_t sum(int32_t *location, int length);

int main()
{
    FILE *inf;
    int i;
    int data_len;

    int32_t pt;
    int32_t *data;
    int32_t result;

    inf = fopen("data.txt", "r");

    data_len = 0;
    fscanf(inf, "%d\n", &data_len);

    data = malloc(sizeof(int32_t)*data_len);

    for(i = 0; i < data_len; i++) {
        fscanf(inf, "%d\n", data+i);
    }

    fclose(inf);

    result = sum(data, data_len);

    printf("%d\n",result);
}
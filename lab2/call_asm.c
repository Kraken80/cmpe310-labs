#include <stdio.h>

extern int hamming_distance(char*, char*);

int test(int expected, char *test_name, char* a, char* b)
{
    int result;

    printf("Test %s...",test_name);

    result = hamming_distance(a, b);

    if(result == expected) {
        printf("test passed.\n");
    }
    else {
        printf("test failed!\n");
    }
    printf("Compared '%s' with '%s'\n", a, b);
    printf("Expected %d, Got %d\n", expected, result);
}

int main()
{
    test(38, "1", "this is a test", "of the emergency broadcast");
    test(8, "2", "foo", "bar");

    return 0;
}

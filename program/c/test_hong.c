/* @(#)test_hong.c
 */
#include <stdio.h>
#include <stdlib.h>
#define A 1

int main (int argc, char *args[]) {
#define B 2
  int a = A;
  int b = B;
  printf("a + b = %d", a + b);
  exit(EXIT_SUCCESS);
}

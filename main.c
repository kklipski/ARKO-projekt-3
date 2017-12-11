#include <stdio.h>

void func(char input[], char output[]);

int main(void) {
  char input[100], output[100];
  puts("Podaj ciag znakow");
  scanf("%99[^\n]", input);
  
  func(input, output);
  printf("%s\n", output);
  
  return 0;
}

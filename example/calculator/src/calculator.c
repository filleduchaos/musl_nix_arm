#include <stdio.h>

int main() {
  double operandA, operandB, result;
  char operator;

  printf("Basic Arithmetic Calculator\n\n");

  printf("Operation (+, -, *, /): ");
  scanf("%c", &operator);

  printf("First operand: ");
  scanf("%lf", &operandA);

  printf("Second operand: ");
  scanf("%lf", &operandB);

  switch (operator) {
    case '+':
      result = operandA + operandB;
      break;
    case '-':
      result = operandA - operandB;
      break;
    case '*':
      result = operandA * operandB;
      break;
    case '/':
      result = operandA / operandB;
      break;
    default:
      printf("Invalid operation!");
      return 1;
  }
  
  printf("%lf %c %lf = %lf", operandA, operator, operandB, result);

  return 0;
}

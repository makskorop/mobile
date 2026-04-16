import 'dart:io';

bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

bool isPerfect(int number) {
  if (number <= 1) return false;
  int sum = 0;
  for (int i = 1; i < number; i++) {
    if (number % i == 0) sum += i;
  }
  return sum == number;
}

void main() {
  print("Введіть число:");
  int? number = int.tryParse(stdin.readLineSync() ?? '0');
  
  if (number != null && number > 0) {
    bool prime = isPrime(number);
    bool perfect = isPerfect(number);

    if (prime) print("Число просте");
    if (perfect) print("Число досконале");
    
    if (!prime && !perfect) {
      print("Число не є простим чи досконалим");
    }

    if (100 % number == 0) {
      print("Число є дільником числа 100");
    }
  }
}
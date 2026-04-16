// Функція для суми
int calculateSum(int a, int b) {
  return a + b;
}

void main() {
  print("Сума: ${calculateSum(15, 25)}"); // Тестові значення

  // Анонімна функція
  var greet = (String name) {
    print("Привіт, $name!");
  };

  greet("Максим");
  greet("Анна");
}
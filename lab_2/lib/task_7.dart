class JobRequest {
  static int counter = 0; // Статичне поле

  void increment() {
    counter++;
  }

  static void displayCounter() { // Статичний метод
    print("Поточне значення лічильника: $counter");
  }
}

void main() {
  var req1 = JobRequest();
  var req2 = JobRequest();

  req1.increment();
  req2.increment();

  // Виведе 2, оскільки поле спільне для всіх екземплярів
  JobRequest.displayCounter(); 
}
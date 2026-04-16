void task1() {
  int studentsCount = 15; // змінна типу int
  String universityName = "ЧДТУ"; // змінна типу String
  List<int> grades = [4, 5, 3, 5, 4]; // змінна типу List<int>
  
  const int totalStudents = 30; // константа

  // Перевірка константи (розкоментування викличе помилку компіляції):
  // totalStudents = 35; 

  void checkAverage(List<int> gradesList) {
    if (gradesList.isEmpty) return;
    double average = gradesList.reduce((a, b) => a + b) / gradesList.length;
    
    if (average >= 4.5) {
      print("Відмінний результат");
    } else if (average >= 3.0) {
      print("Задовільний результат");
    } else {
      print("Незадовільний результат");
    }
  }

  checkAverage(grades);
}

void main() {
  task1();
}
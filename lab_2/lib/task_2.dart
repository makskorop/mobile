class Student {
  late String name;
  late int studyHours;

  void initStudent(String studentName, int hours) {
    name = studentName;
    studyHours = hours;
  }

  void printInfo() {
    print("Студент: $name, Години самостійної роботи: $studyHours");
  }
}

void main() {
  var student = Student();
  
  // Перевірка (розкоментування викличе LateInitializationError):
  // student.printInfo(); 

  student.initStudent("Анна", 12);
  student.printInfo();
}
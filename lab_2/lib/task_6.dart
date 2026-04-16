class Car {
  String make;
  String model;
  int year;

  Car(this.make, this.model, this.year);

  void displayInfo() {
    print("Автомобіль: $make $model, Рік випуску: $year");
  }
}

void main() {
  var myCar = Car("Subaru", "Legacy", 2008);
  myCar.displayInfo();
}
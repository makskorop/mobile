class Box<T> {
  T? _value;

  void save(T value) {
    _value = value;
  }

  T? get() {
    return _value;
  }
}

void main() {
  var stringBox = Box<String>();
  stringBox.save("Dart is awesome");
  print("String Box: ${stringBox.get()}");

  var intBox = Box<int>();
  intBox.save(42);
  print("Int Box: ${intBox.get()}");
}
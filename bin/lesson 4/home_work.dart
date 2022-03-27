// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

class Student {
  final String firstName;
  final String lastName;
  const Student({required this.firstName, required this.lastName});

  String get printStudent => ('Student: ' +
      firstName.replaceFirst(firstName[0], firstName[0].toUpperCase()) +
      ' ' +
      lastName.replaceFirst(lastName[0], lastName[0].toUpperCase()));

  @override
  String toString() {
    return '$firstName $lastName';
  }
}

void main(List<String> arguments) {
  var st1 = Student(firstName: 'степа', lastName: 'иванов');
  print(st1.printStudent);
  print(st1.toString());
}

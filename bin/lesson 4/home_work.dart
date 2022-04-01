// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }
  return string[0].toUpperCase() + string.substring(1);
}

class Student {
  final String firstName;
  final String lastName;

  const Student({required this.firstName, required this.lastName});

  String get fullName => '${capitalize(firstName)} ${capitalize(lastName)}';

  @override
  String toString() {
    return fullName;
  }
}

void main(List<String> arguments) {
  final student = Student(firstName: 'alex', lastName: 'ivanov');
  print(student);
}

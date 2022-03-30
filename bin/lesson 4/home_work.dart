// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса
class Student {
  final String firstName;
  final String lastName;

  const Student(this.firstName, this.lastName);

  Student.withName(this.firstName, this.lastName);

  String normolaized(String nameTrimed) {
    var result = '';
    if (nameTrimed.isNotEmpty) {
      result += nameTrimed[0].toUpperCase();
      if (nameTrimed.length > 1) {
        result += nameTrimed.toLowerCase().substring(1);
      }
    }
    return result;
  }

  String get fullName {
    if (firstName.isEmpty && lastName.isEmpty) {
      return '';
    }
    var result = normolaized(firstName.trim());

    if (result.isNotEmpty) {
      result += ' ';
    }
    result += normolaized(lastName.trim());

    return result;
  }

  @override
  String toString() {
    return fullName;
  }
}

void main(List<String> arguments) {
  var student = const Student('abkhazi', 'artyom');
  print(student);
  student = const Student('', ' ');
  print(student);
  student = const Student('abkhazi', '');
  print(student);
  student = Student.withName('aBkHazI', ' artyom');
  print(student);
}

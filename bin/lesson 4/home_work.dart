// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, !!инициализацию всех свойств!!.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

void main(List<String> arguments) {
  final s1 =const Student('tonyA', 'vOk');
  print(s1.firstName);
  final s2 = Student.named(firstName: 'Canya', lastName: 'Il');
  print(s2.lastName);
  print(s1.isValid());
  print(s1.beautifulFullName);
  print(s1.toString());
}

class Student {
  final String firstName;
  final String lastName;
  final String password;

  String isValid() {
    return password.length>10 ? 'пароль установлен' : 'необходимо переустановить пароль';
  }
  @override
  String toString(){
    return beautifulFullName;
  }
 
  const Student(this.firstName, this.lastName)
      : password = '1122$firstName$lastName';
  Student.named({required this.firstName, required this.lastName})
      : password = '1122$firstName$lastName';
  String get fullName => '$firstName $lastName';
  String get beautifulFullName {
    return '${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()} ${lastName[0].toUpperCase()}${lastName.substring(1).toLowerCase()}';
  }
}

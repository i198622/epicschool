import 'dart:math';
// 1. Объявление класса
// 2. Приватные свойства / методы
// 3. Конструкторы
// 4. Статические методы
// 5. Абстрактный класс
// 6. Callable classes
// 7. runtimeType

// void main(List<String> arguments) {
//   // var me = Profile();
//   // print(me.fullName());

//   // print('Тип: ${me.runtimeType}');
// }

// Объявление класса
// class Profile {  
//   String name = "John";
//   String lastName = "Doe";
   
//   String fullName() {
//     return '$name $lastName';
//   }
// }


// Приватные свойства / методы
// class Profile {  
//   String name = "John";
//   int _age = 0;

//   int _getAge() {
//     return _age;
//   }
// }


// Объявление класса c конструктором
// class Profile {  
//   String name;
//   String lastName;

//   Profile(this.name, this.lastName);
//   Profile.named({ required this.name, required this.lastName });
// }

// class Profile {  
//   late String name;

//   Profile({ required String firstName, required String lastName }) {
//     name = '$firstName $lastName';
//   }

//   // Profile({ required String firstName, required String lastName }): name = '$firstName $lastName';
// }

// class Profile {  
//   final String token;

//   const Profile({ required this.token });
// }


// Статические методы
// class Point {  
//   double x, y;
//   Point(this.x, this.y);

//   static double distanceBetween(Point a, Point b) {
//     var dx = a.x - b.x;
//     var dy = a.y - b.y;
//     return sqrt(dx * dx + dy * dy);
//   }
// }

// main() {
//   Point a = Point(2, 2);
//   Point b = Point(2, 2);
//   print(Point.distanceBetween(a, b));
// }

// DART data class extension
// class User {
//   final String name;
//   final String lastName;
// }

// Абстрактный класс
// abstract class BaseUser {
//   String fullName();
// }

// class User implements BaseUser {
//   User();

//   @override
//   String fullName() {
//     return "";
//   }
// }


// Callable classes
// class CallableClassFunction {
//   String call(String a) => 'Welcome to $a!';
// }
  
// // Main Function
// void main() {
//   var callClass = CallableClassFunction();
//   var output = callClass('Flutter');
//   print(output);
// }
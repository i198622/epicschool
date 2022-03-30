import 'package:meta/meta.dart';
// 1. Наследование
// 2. Factory

// void main(List<String> arguments) {
//   final me = User(firstName: 'John', lastName: 'Doe');
//   final admin = Admin(firstName: 'John', lastName: 'Doe');

//   print(me.name);
//   print(admin.name);
// }

// Наследование
// class User {
//   final String firstName;
//   final String lastName;

//   User({required this.firstName, required this.lastName});

//   String get name => '$firstName $lastName';
// }

// class Admin extends User {
//   final String _role;

//   Admin({
//     required String firstName,
//     required String lastName,
//   }) : _role = 'admin', super(firstName: firstName, lastName: lastName);

//   @override
//   String get name => '$_role: $firstName $lastName';
// }


// Factory
// class User {
//   final String firstName;

//   User({ required this.firstName });

//   factory User.fromJson(dynamic data) {
//     return User(firstName: data['firstName']);
//   }
// }

// class User {
//   String role;

//   User(this.role);

//   factory User.create({ bool isAdmin = false }) {
//     return isAdmin ? Admin('admin') : Anonym('anonym');
//   }
// }

// class Admin extends User {
//   final String adminField = '';

//   Admin(String role): super(role);
// }

// class Anonym extends User {
//   final String anonymField = '';

//   Anonym(String role): super(role);
// }

// void main(List<String> args) {
//   final admin = User.create(isAdmin: true) as Admin;
//   final guest = User.create(isAdmin: false);

//   print(admin.adminField);
//   print(guest);
// }


// Singelton
// class SingletonService {
//   final String name;

//   static SingletonService? _instance;

//   SingletonService._({ required this.name });

//   factory SingletonService({required String name}) => _instance ??= SingletonService._(name: name);
// }

// void main(List<String> args) {
//   final serv1 = SingletonService(name: "serv1");
//   final serv2 = SingletonService(name: "serv2");

//   print(serv1.name);
//   print(serv2.name);
// }

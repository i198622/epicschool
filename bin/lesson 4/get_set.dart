// 1. Getter, setter

void main(List<String> arguments) {
  Profile p = Profile(firstName: "Test name", lastName: "Test lastname", email: "");
  // print(p.email);
}

/// Геттеры и сеттеры
class Profile { 
  final String firstName;
  final String lastName;
  // String? _email;

  Profile({
    required this.firstName,
    required this.lastName,
    required String email,
  }) {
    // this.email = email;
  }

  String getFullName() => '$firstName $lastName';
  String get fullName => '$firstName $lastName';

  // set email(String value) {
  //   _email = value.contains('@') ? value : null;
  // }

  // String get email => _email ?? 'no email';
}  

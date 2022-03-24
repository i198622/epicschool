// 1. Equality
// 2. Immutable

void main(List<String> arguments) {
  final user1 = const User(firstName: "John", lastName: "Doe");
  final user2 = const User(firstName: "John", lastName: "Doe");

  print(user1 == user2);
}

class User {
  final String firstName;
  final String lastName;

  const User({required this.firstName, required this.lastName});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.firstName == firstName &&
      other.lastName == lastName;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode;
}

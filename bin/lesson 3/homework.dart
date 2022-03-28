/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

List<List> pyramid(int n) {
  final myList = <List>[];
  for (var i = 0; i < n; i++) {
    var newList = List<int>.filled(i, 1);
    myList.add(newList);
  }
  return myList;
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

int sumOfPositive(List<int> nums) {
  nums.removeWhere((element) => element < 0);
  return nums.reduce((value, element) => value + element);
}

void main(List<String> arguments) {
  pyramid(10).forEach((element) {
    print(element);
  });
  print(sumOfPositive([10, -2, 30, 2]));
}

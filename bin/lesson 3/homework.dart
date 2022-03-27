/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

List<List<int>> pyramid(int n) {
  final List<List<int>> result = [];
  for (var i = 1; i < n + 1; i++) {
    result.add(List.generate(i, (index) => 1));
  }
  return result;
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

int sumOfPositive(List<int> nums) {
  return nums.where((element) => !element.isNegative).reduce((value, element) => value + element);
}

void main(List<String> arguments) {
  print(pyramid(10));
  print(sumOfPositive([10, -2, 30, 2]));
}
/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

pyramid(int n) {
  List<List<int>> resultList = [];
  for (var i = 1; i <= n; i++) {
    final innerList = List<int>.filled(i, 1);
    resultList.add(innerList);
  }
  return resultList;
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

sumOfPositive(List<int> nums) {
  return nums.fold<int>(0, (accum, element) {
    if (element > 0) {
      return accum + element;
    }
    return accum;
  });
}

void main(List<String> arguments) {
  pyramid(10);
  sumOfPositive([10, -2, 30, 2]);
}
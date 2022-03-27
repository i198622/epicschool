/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

pyramid(int n) {
  var list = [];
  for (var i = 0; i <= n; i++) {
    var listin = List.filled(i, 1);
    list.add(listin);
  }
  return list;
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

sumOfPositive(List<int> nums) {
  var sum = 0;
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] > 0) sum = sum + nums[i];
  }
  return sum;
}

void main(List<String> arguments) {
  print(pyramid(10));
  print(sumOfPositive([10, -2, 30, 2]));
}

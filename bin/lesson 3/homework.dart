/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

List<List<String>> pyramid(int n, {String fill = '1'}) =>
    List.generate(n, (index) => List<String>.filled(index + 1, fill),
        growable: false);

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

int sumOfPositive(List<int> nums) => nums.fold(
    0,
    (previousValue, element) =>
        element > 0 ? previousValue + element : previousValue);

void main(List<String> arguments) {
  for (var i = 0; i != 4; i++) print(pyramid(i));
  pyramid(10, fill: '').forEach(print);

  print('The sum of all positive: ${sumOfPositive([10, -2, 0, 30, 2])}');
}

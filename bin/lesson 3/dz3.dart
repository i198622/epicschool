/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

pyramid(int n) {
  // ваш код
  final list = [];
  for (int i=1; i<=n; i++){list.add(List.filled(i, 1));}
  print(list);
}


// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

sumOfPositive(List<int> nums) {
  int s=0;
  for(int i=0; i < nums.length; i++){if (nums[i]>0) s+=nums[i];}
  print(s.toString());
}

void main(List<String> arguments) {
  pyramid(5);
  sumOfPositive([10, -2, 30, 2,101]);
}
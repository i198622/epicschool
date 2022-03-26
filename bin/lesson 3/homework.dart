/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

pyramid(int n) {
 List <List<int>>list=[];
  for (int i = 1; i <= n; i++){
    final List<int>listInner=List.filled(i,1);
    list.add(listInner);
}
  return list;
}


// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

sumOfPositive(List<int> nums) {
  var summa=0;
  nums.forEach((element){
    if (element>0){
      summa+=element;
    }
  });
  return summa;
}

void main(List<String> arguments) {
  print(pyramid(4));
  print(sumOfPositive([10, -2, 30, 2]));
}

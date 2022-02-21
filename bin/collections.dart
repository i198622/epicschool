/// Collections
// 1. Объявление List и Map
// 2. Трансформации map, where, filter, add, addAll, indexOf, reduce, remove, hashcode.
// 3. Доп. методы if, for, spread.
// 4. Краткий обзор пакетов dart:collection и collection

void main(List<String> arguments) {
  List<int> simpleList = [1,2,3];
  List<int> filledList = List.generate(20, (index) => 1 + index);

  print(filledList);

}


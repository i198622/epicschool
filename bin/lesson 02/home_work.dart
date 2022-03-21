//ник в discord: Alexandra_IL 
String numeral(int count, List<String> variants) {
  if (count < 0 || variants.length != 3) {
    return 'Указано неверное кол-во дней ($count) или неверные варианты склонений: $variants';
  } else {
    final lastDigit = count % 10;
    final twoLastDigits = count % 100;
    var i = 0;
    if (lastDigit == 1 && twoLastDigits != 11) {
      i = 0;
    } else if (lastDigit >= 2 &&
        lastDigit <= 4 &&
        !(twoLastDigits >= 12 && twoLastDigits <= 14)) {
      i = 1;
    } else {
      i = 2;
    }
    return "$count ${variants[i]}";
  }
}

String ago(DateTime date) {
  var result = '';
  const listOfTime = [
    ['минута', 'минуты', 'минут'],
    ['час', 'часа', 'часов'],
    ['день', 'дня', 'дней'],
    ['неделя', 'недели', 'недель'],
    ['месяц', 'месяца', 'месяцев']
  ];
  final now = DateTime.now();
  if (now.isBefore(date)) {
    return 'Это дата из будущего';
  } else {
    final duration = now.difference(date).inMinutes;
    if (duration < 60) {
      result = numeral(duration, listOfTime[0]);
    } else if (duration < 1440) {
      result = numeral(duration ~/ 60, listOfTime[1]);
    } else if (duration < 10080) {
      result = numeral(duration~/1440, listOfTime[2]);
    } else if (duration < 40320) {
      result = numeral(duration ~/10080, listOfTime[3]);
    } else {
      result = numeral(duration~/40320, listOfTime[4]);
    }
    return '$result назад';
  }
}

void main() {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));
  print(numeral(-9, ['день', 'дня', 'дней']));
  print(numeral(112, ['день', 'дня', 'дней']));
  print(numeral(122, ['день', 'дня', 'дней']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
  print(ago(DateTime.parse('2022-03-23 11:43:00')));
}

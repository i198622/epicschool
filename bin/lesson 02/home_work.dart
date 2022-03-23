/// Нобходимо написать реализацию двух функций
///
/// 1-я функция numeral, принимает два аргумента
/// - число count — количество сущностей
/// - List<String> варианты склонений (например: комментарий, комментария, комментариев)
///
/// нужно написать логику, которая будет возвращать строку с указанием числа и нужного склонения существительного
/// IN: 3, ['день', 'дня', 'дней']
/// OUT: '3 дня'

String numeral(int count, List<String> variants) {
  int res = count % 100;
  if (res >= 10 && res <= 20) {
    var postfix = variants[2];
    return '$count $postfix';
  }

  res = count % 10;
  //print(res);

  if (res == 0 || res > 4) {
    var postfix = variants[2];
    return '$count $postfix';
  } else if (res > 1) {
    var postfix = variants[1];
    return '$count $postfix';
  } else if (res == 1) {
    var postfix = variants[0];
    return '$count $postfix';
  }

  return '';
}

/// 2-я функция ago, принимает 1 аргумент
/// - DateTime date — метка даты и времени
///
/// нужно написать логику, которая будет возвращать строку с указанием сколько прошло
/// (минут, часов, дней (до 7), недель (до 4) или месяцев) с переданной даты
/// При этом не нужно выводить только самое большое измерение прошедшего времени
/// Если события было более месяца назад, то только месяцы (3 месяца назад)
/// Если событие совсем недавнее, то либо минуты, либо часы (5 минут назад или 6 часов назад)
/// IN: DateTime.parse('2016-02-27 13:27:00')
/// OUT: 'N месяцев назад'
///
/// IN: DateTime.now().subtract(Duration(minutes: 10)
/// OUT: '10 минут назад'

String ago(DateTime date) {
  var now = new DateTime.now();
  var diff = now.difference(date);
  //print(diff.inDays);
  var inWeeks = diff.inDays ~/ 7;
  var inMonth = inWeeks ~/ 4;
  if (inMonth > 0) {
    return numeral(inMonth, ['месяц', 'месяца', 'месяцев']) + ' назад';
  } else if (inWeeks > 0) {
    return numeral(inWeeks, ['неделя', 'недели', 'недель']) + ' назад';
  } else if (0 < diff.inDays && diff.inDays < 7) {
    return numeral(diff.inDays, ['день', 'дня', 'дней']) + ' назад';
  } else if (0 < diff.inHours) {
    return numeral(diff.inHours, ['час', 'часа', 'часов']) + ' назад';
  } else if (0 < diff.inMinutes) {
    return numeral(diff.inMinutes, ['минута', 'минуты', 'минут']) + ' назад';
  }
  return '';
}

void main(List<String> arguments) {
  var test = [1, 4, 11, 19, 40, 99, 100, 101, 104, 109, 202];
  test.forEach((element) => print(numeral(element, ['день', 'дня', 'дней'])));

  test = [1, 4, 5, 11, 19, 40, 99, 100, 101, 104, 109, 202];
  test.forEach(
      (element) => print(numeral(element, ['неделя', 'недели', 'недель'])));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-09 14:00:00')));
  print(ago(DateTime.parse('2022-03-02 14:00:00')));
  print(ago(DateTime.parse('2022-02-23 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
  print(ago(DateTime.parse('2022-03-23 15:43:00')));
  print(ago(DateTime.parse('2022-03-23 18:43:00')));
}

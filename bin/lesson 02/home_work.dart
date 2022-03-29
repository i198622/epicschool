/// Нобходимо написать реализацию двух функций
///
/// 1-я функция numeral, принимает два аргумента
/// - число count — количество сущностей
/// - List<String> варианты склонений (например: комментарий, комментария, комментариев)
///
/// нужно написать логику, которая будет возвращать строку с указанием числа и нужного склонения существительного
/// IN: 3, ['день', 'дня', 'дней']
/// OUT: '3 дня'

/*
 * Russian has 3 plural forms:
 * Form 0 for 1, 21, 31, 41, 51, 61...
 * Form 1 for 2, 3, 4, 22, 23, 24...
 * Form 2 for 0, 5, 6, 7, 8, 9...
 * https://translations.launchpad.net/+languages/ru
 * https://github.com/translate/l10n-guide/blob/master/docs/l10n/pluralforms.rst
 */
String numeral(int count, List<String> variants) {
  if (variants.length < 3) {
    throw Exception('Russian locale requires 3 variants');
  }
  if (count % 10 == 1 && count % 100 != 11) {
    return count.toString() + ' ' + variants[0];
  } else if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
    return count.toString() + ' ' + variants[1];
  } else {
    return count.toString() + ' ' + variants[2];
  }
}

/// 2-я функция ago, принимает 1 аргумент
/// - DateTime date — метка даты и времени
///
/// нужно написать логику, которая будет возвращать строку с указанием сколько прошло
/// (минут, часов, дней (до 7), недель (до 4) или месяцев) с переданной даты
/// При этом нужно выводить только самое большое измерение прошедшего времени
/// Если события было более месяца назад, то только месяцы (3 месяца назад)
/// Если событие совсем недавнее, то либо минуты, либо часы (5 минут назад или 6 часов назад)
/// IN: DateTime.parse('2016-02-27 13:27:00')
/// OUT: 'N месяцев назад'
///
/// IN: DateTime.now().subtract(Duration(minutes: 10)
/// OUT: '10 минут назад'

String formatter(String plural) {
  return plural + " назад";
}

String ago(DateTime date) {
  final currentDate = DateTime.now();
  final diff = currentDate.difference(date);
  if (diff.inDays > 30) {
    final monthsCount = diff.inDays ~/ 30;
    return formatter(numeral(monthsCount, ['месяц', 'месяца', 'месяцев']));
  } else if (diff.inDays > 7) {
    final weeksCount = diff.inDays ~/ 7;
    return formatter(numeral(weeksCount, ['неделя', 'недели', 'недель']));
  } else if (diff.inDays > 1) {
    return formatter(numeral(diff.inDays, ['день', 'дня', 'дней']));
  } else if (diff.inHours > 1) {
    return formatter(numeral(diff.inHours, ['час', 'часа', 'часов']));
  } else {
    return formatter(numeral(diff.inMinutes, ['минута', 'минуты', 'минут']));
  }
}

void main(List<String> arguments) {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
}

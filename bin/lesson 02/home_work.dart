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
  /// Первое склонение - это все числа, оканчивающиеся на 1, но не 11.
  /// Второе склонение - это все числа, оканчивающиеся на 2, 3 или 4, но не 12, 13 или 14
  /// Третье склонение - это все остальные числа

  if (count < 0 || variants.length != 3)
    throw 'Неверно заданы количество сущностей ($count) или варианты склонений ($variants)';

  final lastDigit = count % 10; // Вычисление последней цифры числа
  final twoLastDigits = count % 100; // Вычисление двух последних цифр числа

  final index = (lastDigit == 1 && twoLastDigits != 11)
      ? 0
      : (lastDigit >= 2 &&
              lastDigit <= 4 &&
              !(twoLastDigits >= 12 && twoLastDigits <= 14))
          ? 1
          : 2;

  return "$count ${variants[index]}";
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
  const pluralMin = <String>['минуту', 'минуты', 'минут'];
  const pluralHour = <String>['час', 'часа', 'часов'];
  const pluralDay = <String>['день', 'дня', 'дней'];
  const pluralWeek = <String>['неделя', 'недели', 'недель'];
  const pluralMonth = <String>['месяц', 'месяца', 'месяцев'];

  final nowDate = DateTime.now();

  if (nowDate.isBefore(date))
    return 'Переданная дата ($date) следует за текущей. Укажите любую предшествующую дату';

  final difference = nowDate.difference(date).inMinutes;

  if (difference < 60) {
    return "${numeral(difference, pluralMin)} назад";
  }
  if (difference < 1440) {
    return "${numeral(difference ~/ 60, pluralHour)} назад";
  }
  if (difference < 10080) {
    return "${numeral(difference ~/ 1440, pluralDay)} назад";
  }
  if (difference < 43800) {
    return "${numeral(difference ~/ 10080, pluralWeek)} назад";
  }
  return "${numeral(difference ~/ 43800, pluralMonth)} назад";
}

void main(List<String> arguments) {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
  print(ago(DateTime.now().subtract(Duration(minutes: 10))));
}

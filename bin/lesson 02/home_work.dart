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
  String s = count.toString() + ' ';
  if (count < 0) {
    return 'количественное значение не должно быть отрицательным!';
  }
  switch (count % 10) {
    case 1: // день 1
      return s + variants[0];
      break;
    case 2:
    case 3:
    case 4: // дня 2 3 4
      return s + variants[1];
      break;
    default: // дней 5 6 7 8 9 0
      return s + variants[2];
      break;
  }
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
  final date1 = DateTime.now();
  if (date1.isBefore(date))
    return 'дата не наступила!';
  else {
    int i = 0;
    i = date1.year - date.year;
    if (i > 0)
      return numeral(i, ['год', 'года', 'лет']) + ' назад';
    else {
      i = date1.month - date.month;
      if (i > 0)
        return numeral(i, ['месяц', 'месяца', 'месяцев']) + ' назад';
      else {
        i = date1.day - date.day;
        if (i > 0) {
          if (i < 8)
            return numeral(i, ['день', 'дня', 'дней']) + ' назад';
          else
            return numeral(i ~/ 7, ['нелеля', 'недели', 'недель']) + ' назад';
        } else {
          i = date1.hour - date.hour;
          if (i > 0)
            return numeral(i, ['час', 'часа', 'часов']) + ' назад';
          else {
            i = date1.minute - date.minute;
            if (i > 0)
              return numeral(i, ['минута', 'минуты', 'минут']) + ' назад';
          }
        }
      }
    }
  }
  return '';
}

void main(List<String> arguments) {
  print(numeral(1, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));

  print(ago(DateTime.parse('2022-03-05 14:00:00')));
}


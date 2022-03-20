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
  // ваш код
  if(count % 10 == 1 && count % 100 != 11)
    return ('$count ${variants[0]}');
  if(count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 > 20))
    return ('$count ${variants[1]}');;
  return ('$count ${variants[2]}');;
  //return "";
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
  // Ваш код
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  int hour = DateTime.now().hour;
  int minute = DateTime.now().minute;
  int second = DateTime.now().second;

  int datemonth = date.month;
  int dateday = date.day;
  int datehour = date.hour;
  int dateminute = date.minute;
  int datesecond = date.second;



  if ((month-datemonth)>=1)
    return ('${numeral((month-datemonth), ['месяц', 'месяца', 'месяцев'])} назад');
  if ((day-dateday)>=1)
    return ('${numeral((day-dateday), ['день', 'дня', 'дней'])} назад');
  if ((hour-datehour)>=1)
    return ('${numeral((hour-datehour), ['час', 'часа', 'часов'])} назад');
  if ((minute-dateminute)>=1)
    return ('${numeral((minute-dateminute), ['минута', 'минуты', 'минут'])} назад');
  if ((second-datesecond)>=1)
    return ('${numeral((second-datesecond), ['секунда', 'секунды', 'секунд'])} назад');
  return "";
}

void main(List<String> arguments) {
  print(numeral(1, ['день', 'дня', 'дней']));
  print(numeral(15, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 18:36:00')));


}

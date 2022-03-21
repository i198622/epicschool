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
 final last = count%10;
 final prev = (count/10).floor()%10;
  
  if (last==1 && prev!=1) {
    return "$count ${variants[0]}";
  } else if ((last>=2 && last<=4) && prev!=1) {
    return "$count ${variants[1]}";
  } else {
    return "$count ${variants[2]}";
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
  final DateTime now = DateTime.now();
  final duration=now.difference(date); 

   
  if (duration.inMinutes<0) 
    return "Online";
  else if (duration.inMinutes<60)
    return numeral(duration.inMinutes, ['минута', 'минуты', 'минут'])+" назад";
  else if (duration.inHours<24)
    return numeral(duration.inHours, ['час', 'часа', 'часов'])+" назад";
  else if (duration.inDays>=1 && duration.inDays<=7)
    return numeral(duration.inDays, ['день', 'дня', 'дней'])+" назад";
  else if(duration.inDays>7 && duration.inDays<=28)
    return numeral((duration.inDays/7).floor(), ['неделя', 'недели', 'недель'])+" назад";
  //месяцы
 else if(duration.inDays>28 && duration.inDays<=365)
  return numeral((duration.inDays/28).floor(), ['месяц', 'месяца', 'месяцев'])+" назад";
  //минуты и часы
  else return numeral(now.year-date.year, ['год', 'года', 'лет'])+" назад";
}

void main(List<String> arguments) {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
}

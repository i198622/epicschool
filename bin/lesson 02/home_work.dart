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
  // преобразуем count в String так как он нам много где понадобится
  String countToString = count.toString();
  // вытаскиваем последнюю цифру count
  var lastNum = int.tryParse(String.fromCharCode(countToString.runes.last));
  // вытаскиваем две последние цифры count(если число имеет 3 или более цифры)
  var twoNum = int.tryParse(
      countToString.substring(count > 99 ? countToString.runes.length - 2 : 0));


  if (lastNum == 0 || (twoNum! > 4 && twoNum < 20)) {
    return '$count ${variants.last}';
  }  else if (lastNum == 1) {
    return '$count ${variants.first}';
  } else if (lastNum! > 1 && lastNum < 5) {
    return '$count ${variants[1]}';
  } else {
    return '$count ${variants.last}';
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
  var time = DateTime.now().difference(date);
  String pastOrFuture = date.isAfter(DateTime.now()) ? ' до указаной даты' : ' назад';
  if(time.inMinutes < 60){
    return  numeral(time.inMinutes, ['минута', 'минуты', 'минут']) + pastOrFuture;
  } else if (time.inHours < 24) {
    return numeral(time.inHours, ['час', 'часа', 'часов']) + pastOrFuture;
  } else if (time.inDays < 7) {
    return numeral(time.inDays, ['день', 'дня', 'дней']) + pastOrFuture;
  } else if ((time.inDays ~/ 7) < 4 ) {
    return numeral(time.inDays ~/ 7, ['неделя', 'недели', 'недель']) + pastOrFuture;
  } else {
    return numeral(time.inDays ~/ 30, ['месяц', 'месяца', 'месяцев']) + pastOrFuture;
  }

}

void main(List<String> arguments) {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
}


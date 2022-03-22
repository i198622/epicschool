void main() {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(1, ['день', 'дня', 'дней']));
  print(numeral(100, ['день', 'дня', 'дней']));
  print(numeral(102, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));
  print(numeral(11, ['неделя', 'недели', 'недель']));
  print(numeral(11, ['минуту', 'минуты', 'минут']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-14 14:00:00')));
  print(ago(DateTime.parse('2022-03-21 15:25:28')));
}

String numeral(int count, List<String> variants, {showCount = true}) {
  double n = count % 100;
  if (n >= 11 && n <= 19) {
    return showCount ? '$count ${variants[2]}': variants[2];
  }
  switch (count % 10) {
    case 1:
      return showCount ? '$count ${variants[0]}': variants[0];
    case 2:
    case 3:
    case 4:
      return showCount ? '$count ${variants[1]}': variants[1];
    default:
      return showCount ? '$count ${variants[2]}': variants[2];
  }
}

String ago(DateTime date) {
  var minutesString = ['минуту', 'минуты', 'минут'];
  var hoursString = ['час', 'часа', 'часов'];
  var daysString = ['день', 'дня', 'дней'];
  var weeksString = ['неделю', 'недели', 'недель'];
  var monthString = ['месяц', 'месяца', 'месяцев'];
  var now = DateTime.now();
  var passMinutes = now.difference(date).inMinutes;
  var passHours = now.difference(date).inHours;
  var passDays = now.difference(date).inDays;
  if (passMinutes <= 0) {
    return 'Это время еще не настало ))';
  }
  if (passHours <= 0) {
    return '${numeral(passMinutes, minutesString)} назад';
  } else if (passDays <= 0) {
    return '${numeral(passHours, hoursString)} назад';
  } else if (passDays > 0 && passDays < 7) {
    return '${numeral(passDays, daysString, )} назад';
  } else if (passDays >=7  && passDays < 28) {
    return '${passDays ~/ 7} ${numeral(passDays ~/ 7, weeksString, showCount: false)} назад';
  }
  return '${passDays ~/ 28} ${numeral(passDays ~/ 28, monthString, showCount: false)} назад';
}

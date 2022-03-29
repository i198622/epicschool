  String numeral(int count, List<String> variants) {
  // смотрим две последние цифры
  int result = count % 100;
  // если окончание 11 - 20  
  if (result >=10 && result <= 20) return variants[2];
    
  // смотрим одну последнюю цифру
    result = count % 10;
    if (result == 0 || result > 4) return variants[2];
    if (result > 1) return variants[1];
    if (result == 1) return variants[0];
    return variants[0];
}

String ago(DateTime date) {
  final DateTime now = DateTime.now();
  int minut=now.difference(date).inMinutes;
  // Проверка на минутах что время не будущее
  if (minut<0) return "Нарушение условия, дата в будущем";
  // Дни
  int dd=now.difference(date).inDays;
  if (dd>=1 && dd<=6){return dd.toString()+" "
    +numeral(dd, ['день', 'дня', 'дней'])+" назад";}
  // Недели
  int ww=(dd+1)~/7;
  if(ww<=4&&dd>0){return ww.toString()+" "
    +numeral(ww, ['неделя', 'недели', 'недель'])+" назад";}
  //месяцы
  int mm=dd~/31;
  if(mm>0){
  return mm.toString()+" "
    +numeral(mm, ['месяц', 'месяца', 'месяцев'])+" назад";}
  //минуты и часы
  if (minut<60) {
    return minut.toString()+" "
    +numeral(minut, ['минута', 'минуты', 'минут'])+" назад";}
  else {
  return (minut~/60).toString()+" "
    +numeral(minut~/60, ['час', 'часа', 'часов'])+" назад";}
}


void main() {
 print(numeral(1, ['день', 'дня', 'дней'])); 
 print(numeral(19, ['день', 'дня', 'дней'])); 
 print(numeral(22, ['день', 'дня', 'дней'])); 
 print(numeral(100, ['день', 'дня', 'дней'])); 
  
  
 print(ago(DateTime.parse('2016-02-27 13:27:00')));
 print(ago(DateTime.parse('2022-03-16 14:00:00')));
 print(ago(DateTime.parse('2022-02-25 19:00:00')));
 print(ago(DateTime.parse('2022-03-18 13:00:00')));
 print(ago(DateTime.parse('2022-03-18 09:00:01')));
}
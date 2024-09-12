class DateUtils {
  static String dateTimeToString({required DateTime dateTime}) =>
      '${dateTime.year}-${padInteger(number: dateTime.month)}-${padInteger(number: dateTime.day)}-${padInteger(number: dateTime.hour)}:00';

  static String padInteger({required int number}) =>
      number.toString().padLeft(2, '0');
}

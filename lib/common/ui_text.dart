abstract class UItext {
  static const apptitle = 'CryptoTest';
  static const dropDownCategory = 'Выберите категорию';
  static const sellText = 'Продажа';
  static const buyText = 'Покупка';
  static const allText = 'Все';
  static const selectPeriod = 'ВЫБЕРИТЕ ПЕРИОД';
  static const selectBtn = 'ВЫБРАТЬ';
  static const beginPeriod = 'Начало периода';
  static const endPeriod = 'Конец периода';

  static const emptyCategory = 'Нет категорий';
  static const errorData = 'Ошибка получения данных.';
  static const noSearchData = 'Не найдены данные для отображения';

  static const List<String> _months = <String>[
    ' января ',
    ' февраля ',
    ' марта ',
    ' апреля ',
    ' мая ',
    ' июня ',
    ' июля ',
    ' августа ',
    ' сентября ',
    ' октября ',
    ' ноября ',
    ' декабря ',
  ];

  static const List<String> _shortMonths = <String>[
    ' янв. ',
    ' фев. ',
    ' марта ',
    ' апр. ',
    ' мая ',
    ' июня ',
    ' июля ',
    ' авг. ',
    ' сент. ',
    ' окт. ',
    ' нояб. ',
    ' дек. ',
  ];

  static const List<String> _weekDay = <String>[
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  static const List<String> thisWeek = <String>[
    'Сегодня',
    'Вчера',
    'Позавчера',
  ];

  static String datePickerMonth(int monthIndex) => _months[monthIndex - 1];
  static String datePickerShortMonth(int monthIndex) =>
      _shortMonths[monthIndex - 1];
  static String weekDay(int weekIndex) => _weekDay[weekIndex - 1];
}

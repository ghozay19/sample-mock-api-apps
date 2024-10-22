import 'package:intl/intl.dart';

class CommonUtils {
  static String dateTimeFormat(DateTime date, {bool iSShowOnlyDate = false}) {
    DateFormat? formatter;
    if (iSShowOnlyDate) {
      formatter = DateFormat('dd MMMM yyyy', 'id');
    } else {
      formatter = DateFormat('dd MMMM yyyy HH:mm', 'id');
    }

    String formatted = formatter.format(date);
    return formatted;
  }
}

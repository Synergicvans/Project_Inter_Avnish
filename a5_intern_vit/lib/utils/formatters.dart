import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    final DateTime date = DateTime.parse(dateString);
    return DateFormat.yMMMd().format(date);
  } catch (e) {
    return "Invalid Date";
  }
}

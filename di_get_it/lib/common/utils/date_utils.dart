import 'package:date_format/date_format.dart';

String currentDateToString() {
  final now = new DateTime.now();
  return formatDate(now, [yyyy, '-', mm, '-', dd]);
}
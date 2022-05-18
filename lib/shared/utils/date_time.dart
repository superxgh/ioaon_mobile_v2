import 'package:date_time_format/date_time_format.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

String getCurrentDateTxtTimeNow() {
  final dateTime = DateTime.now();
  return dateTime.format();  // 2019-10-15T19:42:05-08:00
}

DateTime getCurrentDateTimeNow() {
  return  DateTime.now();
}

DateTime strToDateTime(String str) {
  return DateTime.parse(str);
}

String getDateTxtYYYYMMDD(DateTime dt) {
  return dt.format('Y-m-d');  // 2019-10-15T19:42:05-08:00
}

String getDateTxtYYYYMM(DateTime? dt, var locale) {
  if (dt == null) return '';
  String strYear = dt.format('Y');
  if (locale.toString() == 'th_TH')   strYear = (int.parse(strYear) + 543).toString() ;
  return ( 'ปี พ.ศ. ' + strYear + ' เดือน ' + 'month_${dt.format('m')}'.tr);
}

String getDateTxtHHMM(DateTime dt) {
  return dt.format('H:s');  // 2019-10-15T19:42:05-08:00
}
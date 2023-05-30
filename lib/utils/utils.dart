// import 'package:intl/intl.dart';
//
// DateTime getCurrentDateTime() {
//   var now = DateTime.now();
//
//   var formatter = DateFormat('yyyy-MM-dd');
//   String formattedDate = formatter.format(now);
//   print(formattedDate); // 2016-01-25
//   return DateTime();
// }

DateTime getDateTimeFromDeltaDays(int deltaDays) {
  var now = DateTime.now();
  return now.add(Duration(days: deltaDays));
}

List<DateTime> getDateTimeRangeListFromDeltaDays(int startDeltaDays, int endDeltaDays) {
  final startDateTime = getDateTimeFromDeltaDays(startDeltaDays);
  final daysToGenerate = endDeltaDays - startDeltaDays + 1;
  return List.generate(
    daysToGenerate, (i) => DateTime(
      startDateTime.year,
      startDateTime.month,
      startDateTime.day + i
    )
  );
}
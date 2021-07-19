class TimeExt {
  static String minuteToHour(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2)} hours ${parts[1].padLeft(2)} minutes';
  }
}
String formatDate(String date) {
  DateTime d = DateTime.parse(date);
  return d.toUtc().toIso8601String().split('T')[0];
}

import 'messages.dart';

void validateBirthDate(String d) {
  try {
    DateTime date = DateTime.parse(d);

    if (date.isAfter(DateTime.now())) {
      throw Exception(messages['bad_birth_date']);
    }
  } catch (_) {
    throw Exception(messages['bad_birth_date']);
  }
}

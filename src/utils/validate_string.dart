import 'messages.dart';

void validateString(String s) {
  if (s.isEmpty) {
    throw Exception(messages['bad_string']);
  }
}

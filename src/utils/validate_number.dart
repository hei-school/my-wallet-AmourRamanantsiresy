import 'messages.dart';

void validateNumber(String n) {
  if (RegExp(r'[^0-9]').hasMatch(n)) {
    throw Exception(messages['bad_amount_value']);
  }
}

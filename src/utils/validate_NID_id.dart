import 'messages.dart';

void validateNIDId(String id) {
  if (id.length != 12 || RegExp(r'[^0-9]').hasMatch(id)) {
    throw ArgumentError(messages['bad_NID_id']);
  }
}

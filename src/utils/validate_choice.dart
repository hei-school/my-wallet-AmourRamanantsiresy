import 'messages.dart';

void validateChoice(String choice, int min, int last, [String? message]) {
  if (choice.isEmpty || RegExp(r'[^0-9]').hasMatch(choice)) {
    throw Exception(messages['bad_choice']);
  }

  int parsedChoice = int.tryParse(choice) ?? 0;

  if (parsedChoice > last || parsedChoice < min) {
    throw Exception(message ?? messages['choice_not_found']);
  }
}

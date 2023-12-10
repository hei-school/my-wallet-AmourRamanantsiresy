import 'dart:io';

Future<void> show(
    String? path, List<String>? toReplace, int? toReplaceLength) async {
  try {
    final file = File('./assets/$path');
    var contents = await file.readAsString();

    if (toReplace != null) {
      for (var element in toReplace) {
        contents = contents.replaceFirst('xxx', element);
      }

      contents = contents.replaceFirst(
        'xxx',
        '═' * (toReplaceLength ?? toReplace[0].length),
      );
    }
    print(contents);
  } catch (error) {
    print('Error: $error');
  }
}

import 'dart:io';

import '../utils/show.dart';
import '../utils/templates.dart';

Future<void> bannerHandler() async {
  if (Platform.isWindows) {
    await Process.run('cls', [], runInShell: true);
  } else {
    await Process.run('clear', [], runInShell: true);
  }

  await show(templates['banner'] ?? "", null, null);
}

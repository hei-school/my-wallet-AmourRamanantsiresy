import '../utils/messages.dart';
import '../utils/show.dart';

Future<void> errorHandler(Future<void> Function() callback,
    [void Function()? close]) async {
  try {
    await callback();
  } catch (error) {
    await show('error.txt', [error.toString()], null);
    if (error.toString() == messages['throw']) {
      close?.call();
    }
  }
}

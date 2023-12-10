import '../class/wallet.dart';
import '../utils/input.dart';
import '../utils/validate_string.dart';
import 'error_handler.dart';

Future<void> initHandler(void Function(Wallet) setWallet) async {
  await errorHandler(() async {
    final color = input('Color of the wallet => ');
    validateString(color);
    final mark = input('Mark of the wallet => ');
    validateString(mark);
    setWallet(Wallet(color, mark));
  });
}

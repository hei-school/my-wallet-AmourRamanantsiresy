import '../class/wallet.dart';
import '../utils/input.dart';
import '../utils/messages.dart';
import '../utils/show.dart';
import '../utils/templates.dart';
import '../utils/validate_choice.dart';
import 'error_handler.dart';

Future<void> firstChoicesHandler(Wallet wallet, void Function() stop) async {
  await errorHandler(() async {
    await show(templates['first_choices'], null, null);
    String choice = await input("=> ");
    validateChoice(choice, 1, 4);

    switch (int.parse(choice)) {
      case 1:
        wallet.open();
        await show(templates['result'],
            ['Wallet color', messages['wallet_opened'] ?? ""], null);
        break;
      case 2:
        await show(
            templates['result'], ['Wallet color', wallet.getColor()], null);
        break;
      case 3:
        await show(
            templates['result'], ['Wallet mark', wallet.getMark()], null);
        break;
      default:
        stop();
        await show(templates['result'], ['Quite', 'Goodbye !!!'], null);
        break;
    }
  });
}

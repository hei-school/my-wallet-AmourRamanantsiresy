import './class/money.dart';
import './handlers/banner_handler.dart';
import './handlers/first_choices_handler.dart';
import './handlers/init_handler.dart';
import './handlers/second_choices_handler.dart';
import './utils/input.dart';
import 'class/nid.dart';
import 'class/wallet.dart';

void main() async {
  List<NID> NIDs = [];
  Money money = Money();
  Wallet? wallet;

  await bannerHandler();

  while (wallet == null) {
    await initHandler((w) {
      wallet = w;
    });
  }

  bool run = true;

  void stop() {
    run = false;
  }

  while (run) {
    await bannerHandler();
    if (!wallet!.isOpen()) {
      await firstChoicesHandler(wallet!, stop);
    } else {
      await secondChoicesHandler(wallet!, NIDs, money, stop);
      await input('\n\nType enter to continue.');
    }
  }
}

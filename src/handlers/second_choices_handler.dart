import '../class/money.dart';
import '../class/nid.dart';
import '../class/wallet.dart';
import '../utils/format_date.dart';
import '../utils/input.dart';
import '../utils/messages.dart';
import '../utils/show.dart';
import '../utils/templates.dart';
import '../utils/validate_NID_id.dart';
import '../utils/validate_birth_date.dart';
import '../utils/validate_choice.dart';
import '../utils/validate_string.dart';
import 'error_handler.dart';

Future<void> secondChoicesHandler(
    Wallet wallet, List<NID> NIDs, Money money, void Function() stop) async {
  await errorHandler(() async {
    await show(templates['second_choices'], null, null);
    String choice = input('=> ');
    validateChoice(choice, 1, 10);
    int currentAmount = 0;

    switch (int.parse(choice)) {
      case 1:
        wallet.close();
        break;
      case 2:
        await show(
            templates['result'], ['Wallet color', wallet.getColor()], null);
        break;
      case 3:
        await show(
            templates['result'], ['Wallet mark', wallet.getMark()], null);
        break;
      case 4:
        await show(templates['title'], ['Throw away the wallet'], null);
        String throwAwayWallet =
            input('Do you really want to throw away your wallet ? [Y/N] : ');
        if (throwAwayWallet == 'Y') {
          stop();
          await show(templates['simple_result'], [messages['throw'] ?? ""],
              'Throw away the wallet'.length);
        }
        break;
      case 5:
        await show(
            templates['result'], ['Current balance', money.getBalance()], null);
        break;
      case 6:
        await show(templates['title'], ['Withdrawal'], null);
        currentAmount = int.parse(input(messages['to_withdrawal'] ?? ""));
        money.withdrawal(currentAmount);
        await show(templates['simple_result'],
            [messages['transaction_success'] ?? ""], 'Withdrawal'.length);
        break;
      case 7:
        await show(templates['title'], ['Deposit'], null);
        currentAmount = int.parse(input(messages['to_deposit'] ?? ""));
        money.deposit(currentAmount);
        await show(templates['simple_result'],
            [messages['transaction_success'] ?? ""], 'Deposit'.length);
        break;
      case 8:
        await show(templates['title'], ['Show NIDs list'], null);
        for (int a = 0; a < NIDs.length; a++) {
          await show(
              templates['NID'], [(a + 1).toString(), ...NIDs[a].get()], null);
        }
        await show(templates['simple_result'], [''], 'Show NIDs list'.length);
        break;
      case 9:
        await show(templates['title'], ['Show one NID'], null);
        String NID_ID = input('==> ');
        validateChoice(NID_ID, 1, NIDs.length, messages['NID_not_found']);
        await show(templates['NID'],
            [NID_ID, ...NIDs[int.parse(NID_ID) - 1].get()], null);
        break;
      default:
        String firstName = input('FirstName : ');
        validateString(firstName);
        String lastName = input('LastName : ');
        validateString(lastName);
        String id = input('Id : ');
        validateNIDId(id);
        String birthDate = input('BirthDate (yyyy-mm-dd) : ');
        validateBirthDate(birthDate);
        String birthPlace = input('BirthPlace : ');
        validateString(birthPlace);
        NID currentNID = NID(
          firstName,
          lastName,
          id,
          formatDate(birthDate),
          birthPlace,
        );
        NIDs.add(currentNID);
        await show(templates['result'],
            ['Put one NID', messages['put_NID_success'] ?? ""], null);
        break;
    }
  });
}

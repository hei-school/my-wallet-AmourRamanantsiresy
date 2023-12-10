import { NID } from "../class/NID.js";
import { formatDate } from "../utils/format-date.js";
import { input } from "../utils/input.js";
import { messages } from "../utils/messages.js";
import { show } from "../utils/show.js";
import { template } from "../utils/templates.js";
import { validateNIDId } from "../utils/validate-NID-id.js";
import { validateBirthDate } from "../utils/validate-birth-date.js";
import { validateChoice } from "../utils/validate-choice.js";
import { validateString } from "../utils/validate-string.js";
import { errorhandler } from "./error-handler.js";

export const secondChoicesHandler = async (wallet, NIDs, money, stop) =>
  await errorhandler(async () => {
    await show(template.second_choices);
    const choice = await input("=> ");
    validateChoice(choice, 1, 10);
    let current_amount = 0;

    switch (+choice) {
      case 1:
        wallet.close();
        break;
      case 2:
        await show(template.result, ["Wallet color", wallet.getColor()]);
        return;
      case 3:
        await show(template.result, ["Wallet mark", wallet.getMark()]);
        return;
      case 4:
        await show(template.title, ["Throw away the wallet"]);
        const throwAwayWallet = await input(
          "Do you really want to throw away your wallet ? [Y/N] : "
        );
        if (throwAwayWallet === "Y") {
          stop();
          await show(
            template.simple_result,
            [messages.throw],
            "Throw away the wallet".length
          );
        }
        return;
      case 5:
        await show(template.result, ["Current balance", money.getBalance()]);
        return;
      case 6:
        await show(template.title, ["Withdrawal"]);
        current_amount = await input(messages.to_withdrawal);
        money.withdrawal(current_amount);
        await show(
          template.simple_result,
          [messages.transaction_success],
          "Withdrawal".length
        );
        return;
      case 7:
        await show(template.title, ["Deposit"]);
        current_amount = await input(messages.to_deposit);
        money.deposit(current_amount);
        await show(
          template.simple_result,
          [messages.transaction_success],
          "Deposit".length
        );
        return;
      case 8:
        await show(template.title, [`Show NIDs list`]);
        for (let a = 0; a < NIDs.length; a++) {
          await show(template.NID, [a + 1, ...NIDs[a].get()]);
        }
        await show(template.simple_result, [""], "Show NIDs list".length);
        return;
      case 9:
        await show(template.title, [`Show one NID`]);
        const NID_ID = input("==> ");
        validateChoice(NID_ID, 1, NIDs.length, messages.NID_not_found);
        await show(template.NID, [NID_ID, ...NIDs[+NID_ID - 1].get()]);
        return;
      default:
        const firstName = await input("FirstName : ");
        validateString(firstName);
        const lastName = await input("LastName : ");
        validateString(lastName);
        const id = await input("Id : ");
        validateNIDId(id);
        const birthDate = await input("BirthDate (mm-dd-yyyy) : ");
        validateBirthDate(birthDate);
        const birthPlace = await input("BirthPlace : ");
        validateString(birthPlace);
        const currentNID = new NID(
          firstName,
          lastName,
          id,
          formatDate(birthDate),
          birthPlace
        );
        NIDs.push(currentNID);
        await show(template.result, ["Put one NID", messages.put_NID_success]);
        return;
    }
  });

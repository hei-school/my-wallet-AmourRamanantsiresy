import { input } from "../utils/input.js";
import { messages } from "../utils/messages.js";
import { show } from "../utils/show.js";
import { template } from "../utils/templates.js";
import { validateChoice } from "../utils/validate-choice.js";
import { errorhandler } from "./error-handler.js";

export const firstChoicesHandler = async (wallet, stop) =>
  await errorhandler(async () => {
    await show(template.first_choices);
    const choice = await input("=> ");
    validateChoice(choice, 1, 4);
    switch (+choice) {
      case 1:
        wallet.open();
        await show(template.result, ["Wallet color", messages.wallet_opened]);
        return;
      case 2:
        await show(template.result, ["Wallet color", wallet.getColor()]);
        return;
      case 3:
        await show(template.result, ["Wallet mark", wallet.getMark()]);
        return;
      default:
        stop();
        await show(template.result, ["Quite", "Goodbye !!!"]);
        return;
    }
  });

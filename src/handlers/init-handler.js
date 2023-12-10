import { Wallet } from "../class/Wallet.js";
import { input } from "../utils/input.js";
import { validateString } from "../utils/validate-string.js";
import { errorhandler } from "./error-handler.js";

export const initHandler = async (setWallet) =>
  await errorhandler(async () => {
    const color = await input("Color of the wallet => ");
    validateString(color);
    const mark = await input("Mark of the wallet => ");
    validateString(mark);
    setWallet(new Wallet(color, mark));
  });

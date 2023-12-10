import { Money } from "./class/Money.js";
import { bannerHandler } from "./handlers/banner-handler.js";
import { firstChoicesHandler } from "./handlers/first-choices-handler.js";
import { initHandler } from "./handlers/init-handler.js";
import { secondChoicesHandler } from "./handlers/second-choices-handler.js";
import { input } from "./utils/input.js";

const main = async () => {
  let NIDs = [];
  let money = new Money();
  let wallet;

  await bannerHandler();

  while (!wallet)
    await initHandler((w) => {
      wallet = w;
    });

  let run = true;
  const stop = () => (run = false);

  while (run) {
    await bannerHandler();
    if (!wallet.isOpen()) await firstChoicesHandler(wallet, stop);
    else {
      await secondChoicesHandler(wallet, NIDs, money, stop);
      await input("\n\nType enter to continue.");
    }
  }
};

main();

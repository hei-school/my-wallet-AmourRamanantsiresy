import { messages } from "../utils/messages.js";
import { show } from "../utils/show.js";

export const errorhandler = async (callback, close) => {
  try {
    await callback();
  } catch (err) {
    await show("error.txt", [err.message]);
    if (err.message === messages.throw) {
      close && close();
    }
  }
};

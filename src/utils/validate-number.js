import { messages } from "./messages.js";

export const validateNumber = (n) => {
  if (isNaN(n)) throw new Error(messages.bad_amount_value);
};

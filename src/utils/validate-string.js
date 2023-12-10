import { messages } from "./messages.js";

export const validateString = (s) => {
  if (!s || s.length === 0) {
    throw new Error(messages.bad_string);
  }
};

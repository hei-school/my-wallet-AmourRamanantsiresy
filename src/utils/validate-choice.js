import { messages } from "./messages.js";

export const validateChoice = (
  choice,
  min,
  last,
  message = messages.choice_not_found
) => {
  if (!choice || choice.length === 0 || /[^0-9]/.test(choice)) {
    throw new Error(messages.bad_choice);
  }
  if (+choice > last || +choice < min) {
    throw new Error(message);
  }
};

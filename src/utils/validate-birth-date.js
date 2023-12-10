import { messages } from "./messages.js";

export const validateBirthDate = (d) => {
  const date = new Date(d);
  if (/Invalid/.test(date.toString()) || new Date().getTime() < date.getTime())
    throw new Error(messages.bad_birth_date);
};

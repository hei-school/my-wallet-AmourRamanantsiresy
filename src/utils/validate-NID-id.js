import { messages } from "./messages.js";

export const validateNIDId = (id) => {
  if (!id || id.length !== 12 || /[^0-9]/.test(id))
    throw new Error(messages.bad_NID_id);
};

import { show } from "../utils/show.js";
import { template } from "../utils/templates.js";

export const bannerHandler = async () => {
  console.clear();
  await show(template.banner);
};

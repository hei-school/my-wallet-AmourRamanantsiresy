import { readFile } from "fs";

export const show = async (path, toReplace, toReplaceLength) => {
  let value = await new Promise((resolve) => {
    readFile(`./assets/${path}`, "utf-8", (_err, data) => {
      resolve(data);
    });
  });

  if (!!toReplace) {
    toReplace.forEach((element) => {
      value = value.replace("xxx", element);
    });
    value = value.replace(
      "xxx",
      "═".repeat(!!toReplaceLength ? toReplaceLength : toReplace[0].length || 0)
    );
  }

  console.log(value);
};

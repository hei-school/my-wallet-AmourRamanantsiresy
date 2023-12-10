def show(path, to_replace=None, to_replace_length=None):
    with open(f"./assets/{path}", "r", encoding="utf-8") as file:
        value = file.read()

    if to_replace:
        for element in to_replace:
            value = value.replace("xxx", element, 1)

        value = value.replace(
            "xxx",
            "═" * (to_replace_length or len(to_replace[0]) if to_replace else 0),
            1,
        )

    print(value)

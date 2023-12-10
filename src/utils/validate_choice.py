from messages import messages


def validate_choice(
    choice, min_value, last_value, message=messages["choice_not_found"]
):
    if not choice or len(choice) == 0 or not choice.isdigit():
        raise ValueError(messages["bad_choice"])

    if not min_value <= int(choice) <= last_value:
        raise ValueError(message)

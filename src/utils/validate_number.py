from messages import messages


def validate_number(n):
    if not (n and n.isdigit()):
        raise ValueError(messages["bad_amount_value"])

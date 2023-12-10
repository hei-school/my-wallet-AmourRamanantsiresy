from messages import messages


def validate_string(s):
    if not s or len(s) == 0:
        raise ValueError(messages["bad_string"])

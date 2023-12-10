from datetime import datetime
from messages import messages


def validate_birth_date(d):
    try:
        birth_date = datetime.fromisoformat(d)
        current_date = datetime.now()

        if birth_date > current_date:
            raise ValueError(messages["bad_birth_date"])

    except ValueError:
        raise ValueError(messages["bad_birth_date"])

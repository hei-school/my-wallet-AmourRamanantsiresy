from datetime import datetime


def format_date(d):
    formatted_date = datetime.fromisoformat(str(d)).strftime("%Y-%m-%d")
    return formatted_date

import sys

sys.path.append(sys.path[0][: -len("handlers")] + "utils")
from messages import messages
from show import show


def error_handler(callback, close=None):
    try:
        callback()
    except Exception as err:
        show("error.txt", [str(err)])
        if str(err) == messages["throw"]:
            if close:
                close()

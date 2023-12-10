import sys

sys.path.append(sys.path[0][: -len("handlers")] + "utils")
from messages import messages
from templates import templates
from show import show


def banner_handler():
    print("\033c")
    show(templates["banner"])

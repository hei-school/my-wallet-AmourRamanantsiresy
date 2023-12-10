import sys

sys.path.append(sys.path[0][: -len("handlers")] + "utils")
sys.path.append(sys.path[0][: -len("handlers")] + "class")

from wallet import Wallet
from validate_string import validate_string
from error_handler import error_handler


def init_handler(set_wallet):
    def main():
        color = input("Color of the wallet => ")
        validate_string(color)
        mark = input("Mark of the wallet => ")
        validate_string(mark)
        set_wallet(Wallet(color, mark))

    error_handler(main)

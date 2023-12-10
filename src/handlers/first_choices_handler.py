import sys

sys.path.append(sys.path[0][: -len("handlers")] + "utils")
sys.path.append(sys.path[0][: -len("handlers")] + "class")
from messages import messages
from show import show
from templates import templates
from validate_choice import validate_choice
from error_handler import error_handler


def first_choices_handler(wallet, stop):
    def main():
        show(templates["first_choices"])
        choice = input("=> ")
        validate_choice(choice, 1, 4)

        if int(choice) == 1:
            wallet.open()
            show(templates["result"], ["Wallet", messages["wallet_opened"]])
        elif int(choice) == 2:
            show(templates["result"], ["Wallet color", wallet.get_color()])
        elif int(choice) == 3:
            show(templates["result"], ["Wallet mark", wallet.get_mark()])
        else:
            stop()
            show(templates["result"], ["Quit", "Goodbye !!!"])

    error_handler(main)

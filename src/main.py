import sys

sys.path.append(sys.path[0] + "/utils")
sys.path.append(sys.path[0] + "/class")
sys.path.append(sys.path[0] + "/handlers")

from money import Money
from banner_handler import banner_handler
from first_choices_handler import first_choices_handler
from init_handler import init_handler
from second_choices_handler import second_choices_handler

wallet = None
run = True


def main():
    NIDs = []
    money = Money()

    banner_handler()

    def set_wallet(w):
        global wallet
        print(wallet)
        print(w)
        wallet = w

    while not wallet:
        init_handler(set_wallet)
        print(wallet)

    def stop():
        global run
        run = False

    while run:
        banner_handler()
        if not wallet.is_open():
            first_choices_handler(wallet, stop)
        else:
            second_choices_handler(wallet, NIDs, money, stop)
        input("\n\nType enter to continue.")


main()

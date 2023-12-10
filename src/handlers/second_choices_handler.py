import sys

sys.path.append(sys.path[0][: -len("handlers")] + "utils")
sys.path.append(sys.path[0][: -len("handlers")] + "class")
from nid import NID
from format_date import format_date
from messages import messages
from show import show
from templates import templates
from validate_nid_id import validate_nid_id
from validate_birth_date import validate_birth_date
from validate_choice import validate_choice
from validate_string import validate_string
from validate_number import validate_number
from error_handler import error_handler


def second_choices_handler(wallet, NIDs, money, stop):
    def main():
        show(templates["second_choices"])
        choice = input("=> ")
        validate_choice(choice, 1, 10)
        choice = int(choice)

        if choice == 1:
            wallet.close()
        elif choice == 2:
            show(templates["result"], ["Wallet color", wallet.get_color()])
        elif choice == 3:
            show(templates["result"], ["Wallet mark", wallet.get_mark()])
        elif choice == 4:
            show(templates["title"], ["Throw away the wallet"])
            throwAwayWallet = input(
                "Do you really want to throw away your wallet ? [Y/N] : "
            )
            if throwAwayWallet == "Y":
                stop()
                show(
                    templates["simple_result"],
                    [messages["throw"]],
                    len("Throw away the wallet"),
                )
        elif choice == 5:
            show(templates["result"], ["Current balance", money.get_balance()])
        elif choice == 6:
            show(templates["title"], ["Withdrawal"])
            current_amount = input(messages["to_withdrawal"])
            validate_number(current_amount)
            money.withdrawal(int(current_amount))
            show(
                templates["simple_result"],
                [messages["transaction_success"]],
                len("Withdrawal"),
            )
        elif choice == 7:
            show(templates["title"], ["Deposit"])
            current_amount = input(messages["to_deposit"])
            validate_number(current_amount)
            money.deposit(int(current_amount))
            show(
                templates["simple_result"],
                [messages["transaction_success"]],
                len("Deposit"),
            )
        elif choice == 8:
            show(templates["title"], ["Show NIDs list"])
            for a, nid in enumerate(NIDs, 1):
                show(templates["NID"], [str(a), *nid.get()])
            show(templates["simple_result"], [""], len("Show NIDs list"))
        elif choice == 9:
            show(templates["title"], ["Show one NID"])
            nid_id = input("==> ")
            validate_choice(nid_id, 1, len(NIDs), messages["NID_not_found"])
            show(templates["NID"], [nid_id, *NIDs[int(nid_id) - 1].get()])
        else:
            first_name = input("FirstName : ")
            validate_string(first_name)
            last_name = input("LastName : ")
            validate_string(last_name)
            nid_id = input("Id : ")
            validate_nid_id(nid_id)
            birth_date = input("BirthDate (yyyy-mm-dd) : ")
            validate_birth_date(birth_date)
            birth_place = input("BirthPlace : ")
            validate_string(birth_place)

            current_NID = NID(
                first_name, last_name, nid_id, format_date(birth_date), birth_place
            )
            NIDs.append(current_NID)

            show(templates["result"], ["Put one NID", messages["put_NID_success"]])

    error_handler(main)

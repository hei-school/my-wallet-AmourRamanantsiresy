import sys

sys.path.append(sys.path[0][:-5] + "utils")
from messages import messages
from validate_number import validate_number


class Money:
    def __init__(self):
        self.balance = 0

    def validate_amount(self, amount):
        if not (amount > 0 and amount % 100 == 0):
            raise ValueError(messages["bad_amount_value"])

    def validate_amount_to_withdrawal(self, amount):
        self.validate_amount(amount)
        if amount > self.balance:
            raise ValueError(messages["insufficient_balance"])

    def get_balance(self):
        return f"{self.balance} Ar"

    def deposit(self, amount):
        self.validate_amount(amount)
        self.balance += amount

    def withdrawal(self, amount):
        self.validate_amount_to_withdrawal(amount)
        self.balance -= amount

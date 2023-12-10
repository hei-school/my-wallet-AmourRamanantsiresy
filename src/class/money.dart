import '../utils/messages.dart';

class Money {
  int balance = 0;

  void validateAmount(int amount) {
    if (amount.isNaN || amount <= 0 || amount % 100 != 0) {
      throw Exception(messages['bad_amount_value']);
    }
  }

  void validateAmountToWithdrawal(int amount) {
    validateAmount(amount);
    if (amount > balance) {
      throw Exception(messages['insufficient_balance']);
    }
  }

  String getBalance() => '$balance Ar';

  void deposit(int amount) {
    validateAmount(amount);
    balance += amount;
  }

  void withdrawal(int amount) {
    validateAmountToWithdrawal(amount);
    balance -= amount;
  }
}

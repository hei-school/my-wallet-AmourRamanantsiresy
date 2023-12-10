import { messages } from "../utils/messages.js";

export class Money {
  balance = 0;

  constructor() {}

  validateAmount(amount) {
    if (isNaN(amount) || amount <= 0 || amount % 100 !== 0)
      throw new Error(messages.bad_amount_value);
  }

  validateAmountToWithdrawal(amount) {
    this.validateAmount(amount);
    if (amount > this.balance) throw new Error(messages.insufficient_balance);
  }

  getBalance = () => `${this.balance} Ar`;

  deposit(amount) {
    this.validateAmount(+amount);
    this.balance += +amount;
  }

  withdrawal(amount) {
    this.validateAmountToWithdrawal(+amount);
    this.balance -= +amount;
  }
}

export class Wallet {
  constructor(color, mark) {
    this.color = color;
    this.mark = mark;
    this.openStatus = false;
  }

  getColor = () => this.color;

  getMark = () => this.mark;

  isOpen = () => this.openStatus;

  open = () => {
    this.openStatus = true;
  };

  close = () => {
    this.openStatus = false;
  };
}

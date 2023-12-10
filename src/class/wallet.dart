class Wallet {
  String color;
  String mark;
  bool openStatus = false;

  Wallet(this.color, this.mark);

  String getColor() => color;

  String getMark() => mark;

  bool isOpen() => openStatus;

  void open() {
    openStatus = true;
  }

  void close() {
    openStatus = false;
  }
}

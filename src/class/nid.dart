class NID {
  String firstName = 'xxx';
  String lastName = 'xxx';
  String id = 'xxx';
  String birthDate = 'xxx';
  String birthPlace = 'xxx';

  NID(String firstName, String lastName, String id, String birthDate,
      String birthPlace) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.birthDate = birthDate;
    this.birthPlace = birthPlace;
  }

  List<String> get() {
    return [firstName, lastName, id, birthDate, birthPlace];
  }
}

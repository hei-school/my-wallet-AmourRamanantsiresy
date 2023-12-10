export class NID {
  firstName = "xxx";
  lastName = "xxx";
  id = "xxx";
  birthDate = "xxx";
  birthPlace = "xxx";

  constructor(firstName, lastName, id, birthDate, birthPlace) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.birthDate = birthDate;
    this.birthPlace = birthPlace;
  }

  get = () => [
    this.firstName,
    this.lastName,
    this.id,
    this.birthDate,
    this.birthPlace,
  ];
}

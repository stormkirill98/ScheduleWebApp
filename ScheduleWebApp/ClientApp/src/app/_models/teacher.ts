export class Teacher {
  id: number;
  firstName: number;
  patronymic: number;
  lastName: number;
  cathedra: number;

  constructor(id, firstName, patronymic, lastName, cathedra) {
    this.id = id;
    this.firstName = firstName;
    this.patronymic = patronymic;
    this.lastName = lastName;
    this.cathedra = cathedra;
  }

  getFullName(): string {
    return `${this.lastName} ${this.firstName} ${this.patronymic}`;
  }
}

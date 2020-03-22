export class Teacher {
  key: number;
  firstName: number;
  patronymic: number;
  lastName: number;
  cathedra: number;
  fullName: string;

  constructor(key, firstName, patronymic, lastName, cathedra) {
    this.key = key;
    this.firstName = firstName;
    this.patronymic = patronymic;
    this.lastName = lastName;
    this.cathedra = cathedra;
  }

  getFullName(): string {
    return `${this.lastName} ${this.firstName} ${this.patronymic}`;
  }
}

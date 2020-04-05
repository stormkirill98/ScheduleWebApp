export class User {
    id: number;
    username: string;
    password: string;
    firstName: string;
    lastName: string;
    role: string;

    get fullName() {
      return this.lastName + ' ' + this.firstName;
    }
}

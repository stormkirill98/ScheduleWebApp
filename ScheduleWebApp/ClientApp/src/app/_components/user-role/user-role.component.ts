import { Component, OnInit } from '@angular/core';
import { UserService } from '../../_services';
import { User } from '../../_models';
import { MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';

@Component({
  selector: 'app-user-role',
  templateUrl: './user-role.component.html',
  styleUrls: ['./user-role.component.css']
})
export class UserRoleComponent implements OnInit {
  users: User[] = [];
  roles: string[] = ['Директор', 'Учитель', 'Студент'];
  selectedUser: User = new User();

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.fetchUsers();
  }

  private fetchUsers() {
    this.userService.getAll().subscribe((users) => {
      this.users = users;
    });
  }

  onSelectUser(event: MatAutocompleteSelectedEvent) {
    const username = event.option.value;
    const selectedUser = this.users.find((user) => user.username === username);
    this.selectedUser = selectedUser ? selectedUser : new User();
  }

  change() {
    this.userService.update(this.selectedUser).subscribe(() => {
      this.fetchUsers();
    });
  }
}

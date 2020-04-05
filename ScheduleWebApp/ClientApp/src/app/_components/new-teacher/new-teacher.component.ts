import { Component } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Teacher } from '../../_models';

@Component({
  selector: 'app-new-teacher',
  templateUrl: './new-teacher.component.html',
  styleUrls: ['./new-teacher.component.css']
})
export class NewTeacherComponent {
  private firstName: FormControl;
  private patronymic: FormControl;
  private lastName: FormControl;
  private cathedra: FormControl;

  constructor(public dialogRef: MatDialogRef<NewTeacherComponent>) {
    this.firstName = new FormControl();
    this.patronymic = new FormControl();
    this.lastName = new FormControl();
    this.cathedra = new FormControl();
  }

  onCancel() {
    this.dialogRef.close();
  }

  onCreate() {
    if (!this.firstName.valid) {
      return;
    }

    this.dialogRef.close({
      teacher: new Teacher(
        null,
        this.firstName.value,
        this.patronymic.value,
        this.lastName.value,
        this.cathedra.value
      )
    });
  }
}

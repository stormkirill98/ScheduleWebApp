import { Component } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Discipline } from '../../_models';

@Component({
  selector: 'app-new-discipline',
  templateUrl: './new-discipline.component.html',
  styleUrls: ['./new-discipline.component.css']
})
export class NewDisciplineComponent {
  private name: FormControl;

  constructor(public dialogRef: MatDialogRef<NewDisciplineComponent>) {
    this.name = new FormControl();
  }

  onCancel() {
    this.dialogRef.close();
  }

  onCreate() {
    if (!this.name.valid) {
      return;
    }

    this.dialogRef.close({
      discipline: new Discipline(null, this.name.value)
    });
  }
}

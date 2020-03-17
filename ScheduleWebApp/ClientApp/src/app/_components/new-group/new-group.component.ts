import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { FormControl } from '@angular/forms';
import { Group } from '../../_models';

@Component({
  selector: 'app-new-group',
  templateUrl: './new-group.component.html',
  styleUrls: ['./new-group.component.css']
})
export class NewGroupComponent implements OnInit {
  private nameInput: FormControl;

  constructor(
    public dialogRef: MatDialogRef<NewGroupComponent>
  ) {
    this.nameInput = new FormControl();
  }

  ngOnInit() {
  }

  onCancel() {
    this.dialogRef.close();
  }

  onCreate() {
    if (!this.nameInput.valid) { return; }

    this.dialogRef.close({
      group: new Group(null, this.nameInput.value)
    });
  }
}

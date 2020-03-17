import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Group } from '../../_models';

@Component({
  selector: 'app-new-group',
  templateUrl: './new-group.component.html',
  styleUrls: ['./new-group.component.css']
})
export class NewGroupComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<NewGroupComponent>,
    @Inject(MAT_DIALOG_DATA) public group: Group
  ) {}

  ngOnInit() {
  }

  onCancel() {
    this.dialogRef.close();
  }

  onCreate() {

  }
}

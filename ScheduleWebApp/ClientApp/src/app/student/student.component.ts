import { Component, OnInit } from '@angular/core';
import { Group, Week } from '../_models';
import { Observable } from 'rxjs';
import { MatCheckboxChange } from '@angular/material/checkbox';
import { ListsService } from '../_services';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  private week = new Week();
  private isParity = false;
  private groups: Observable<Array<Group>>;
  private selectedId = 1;

  constructor(private listsService: ListsService) {
    this.groups = listsService.getGroups();
  }

  ngOnInit(): void {
    // TODO load week
  }

  onChangeParity(event: MatCheckboxChange) {
    // TODO update week
  }

  onChangeGroup(event: Event) {
    // TODO update week
  }
}

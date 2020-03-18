import { Component, OnInit } from '@angular/core';
import { Group, Week } from '../_models';
import { Observable } from 'rxjs';
import { MatCheckboxChange } from '@angular/material/checkbox';
import { ListsService } from '../_services';
import { DataService } from '../_services/data.service';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  private week: Observable<Week>;
  private isParity = false;
  private groups: Observable<Array<Group>>;
  private selectedId = 1;

  constructor(
    private listsService: ListsService,
    private dataService: DataService
  ) {
    this.groups = listsService.getGroups();
    this.week = dataService.getWeek();
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

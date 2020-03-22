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
  private groups: Observable<Array<Group>>;
  private isParity = false;
  private selectedId = 1;

  constructor(
    private listsService: ListsService,
    private dataService: DataService
  ) {
    this.groups = listsService.getGroups();
    this.week = dataService.getWeek();

    this.groups.subscribe(() => this.selectedId = 1);
  }

  ngOnInit(): void {
    this.listsService.fetchGroups();
  }

  onChangeParity(event: MatCheckboxChange) {
    // TODO update week
  }

  onChangeGroup(event: Event) {
    // TODO update week
  }
}

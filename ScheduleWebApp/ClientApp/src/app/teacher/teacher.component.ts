import { Component, OnInit } from '@angular/core';
import { Teacher, Week } from '../_models';
import { Observable } from 'rxjs';
import { ListsService } from '../_services';
import { MatCheckboxChange } from '@angular/material/checkbox';
import { DataService } from '../_services/data.service';

@Component({
  selector: 'app-teacher',
  templateUrl: './teacher.component.html',
  styleUrls: ['./teacher.component.css']
})
export class TeacherComponent implements OnInit {
  private week: Observable<Week>;
  private isParity = false;
  private teachers: Observable<Array<Teacher>>;
  private selectedId = 1;

  constructor(
    private listsService: ListsService,
    private dataService: DataService
  ) {
    this.teachers = listsService.getTeachers();
    this.week = dataService.getWeek();
  }

  ngOnInit(): void {
    this.listsService.fetchTeachers();
  }

  onChangeParity(event: MatCheckboxChange) {
    // TODO update week
  }

  onChangeTeacher(event: Event) {
    // TODO update week
  }
}

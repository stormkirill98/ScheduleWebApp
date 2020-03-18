import { Component, OnInit } from '@angular/core';
import { Teacher, Week } from '../_models';
import { Observable } from 'rxjs';
import { ListsService } from '../_services';
import { MatCheckboxChange } from '@angular/material/checkbox';

@Component({
  selector: 'app-teacher',
  templateUrl: './teacher.component.html',
  styleUrls: ['./teacher.component.css']
})
export class TeacherComponent implements OnInit {
  private week = new Week();
  private isParity = false;
  private teachers: Observable<Array<Teacher>>;
  private selectedId = 1;

  constructor(private listsService: ListsService) {
    this.teachers = listsService.getTeachers();
  }

  ngOnInit(): void {
  }

  onChangeParity(event: MatCheckboxChange) {
    // TODO update week
  }

  onChangeTeacher(event: Event) {
    // TODO update week
  }
}

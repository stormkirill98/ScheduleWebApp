import { Component, Input } from '@angular/core';

import { ListsService } from '../../_services';
import { Observable } from 'rxjs';

import { Cabinet, Discipline, DisciplineType, Lesson, Teacher } from '../../_models';

@Component({
  selector: 'app-edit-lesson',
  templateUrl: './edit-lesson.component.html',
  styleUrls: ['./edit-lesson.component.css']
})
export class EditLessonComponent {
  @Input() private number: number;
  @Input() private lesson: Lesson;

  private disciplines: Observable<Array<Discipline>>;
  private disciplineTypes: Observable<Array<DisciplineType>>;
  private cabinets: Observable<Array<Cabinet>>;
  private teachers: Observable<Array<Teacher>>;

  constructor(private listsService: ListsService) {
    this.disciplines = listsService.getDisciplines();
    this.disciplineTypes = listsService.getDisciplineTypes();
    this.cabinets = listsService.getCabinets();
    this.teachers = listsService.getTeachers();
  }
}

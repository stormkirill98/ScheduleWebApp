import { Component, Input, OnInit } from '@angular/core';

import { LessonListsService } from '../../_services/lesson-lists.service';
import { Observable } from 'rxjs';

import { Cabinet, Discipline, DisciplineType, Teacher } from '../../_models';
import { Lesson } from '../../_models/lesson';

@Component({
  selector: 'app-edit-lesson',
  templateUrl: './edit-lesson.component.html',
  styleUrls: ['./edit-lesson.component.css']
})
export class EditLessonComponent implements OnInit{
  @Input() number: number;
  @Input() lesson: Lesson;

  private isShow: boolean;
  private disciplines: Observable<Array<Discipline>>;
  private disciplineTypes: Observable<Array<DisciplineType>>;
  private cabinets: Observable<Array<Cabinet>>;
  private teachers: Observable<Array<Teacher>>;

  constructor(private lessonListsService: LessonListsService) {
    this.disciplines = lessonListsService.getDisciplines;
    this.disciplineTypes = lessonListsService.getDisciplineTypes;
    this.cabinets = lessonListsService.getCabinets;
    this.teachers = lessonListsService.getTeachers;
  }

  ngOnInit(): void {
    this.isShow = !!this.lesson;
    if (!this.lesson) {
      this.lesson = new Lesson();
    }
  }

  clickCheckbox() {
    this.isShow = !this.isShow;
  }
}

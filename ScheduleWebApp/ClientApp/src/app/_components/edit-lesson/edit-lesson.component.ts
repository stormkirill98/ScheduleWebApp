import {Component, OnInit} from '@angular/core';
import {Cabinet, Discipline, DisciplineType, Teacher} from '../../_models';

@Component({
  selector: 'app-edit-lesson',
  templateUrl: './edit-lesson.component.html',
  styleUrls: ['./edit-lesson.component.css']
})
export class EditLessonComponent implements OnInit {
  private readonly number: number;
  private isShow: boolean;
  private disciplines: Array<Discipline>;
  private disciplineTypes: Array<DisciplineType>;
  private cabinets: Array<Cabinet>;
  private teachers: Array<Teacher>;

  constructor() {
    this.number = 2;
    this.disciplines = [new Discipline(1, 'Программирование'), new Discipline(2, 'Матан')];
    this.disciplineTypes = [new DisciplineType(1, 'Лекция'), new DisciplineType(2, 'Семинар')];
    this.cabinets = [new Cabinet(1, 215), new Cabinet(2, 220)];
    this.teachers = [
      new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики'),
      new Teacher(1, 'Галина', 'Владимировна', 'Шабаршина', 'Дискретной математики')
    ];
  }

  ngOnInit() {
  }

  clickCheckbox() {
    this.isShow = !this.isShow;
  }
}

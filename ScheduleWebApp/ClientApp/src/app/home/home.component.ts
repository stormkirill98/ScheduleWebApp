import { Component } from '@angular/core';
import { Lesson } from '../_models/lesson';
import { Cabinet, Discipline, DisciplineType, Teacher } from '../_models';
import { Group } from '../_models/group';
import { Day } from '../_models/day';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  day = new Day(1);

  constructor() {
    this.day.setLesson(2,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
        // new Group(1, 'ИВТ-41БО')
      )
    );
    this.day.setLesson(3,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        // new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
        null,
        new Group(1, 'ИВТ-41БО')
      )
    );
  }
}

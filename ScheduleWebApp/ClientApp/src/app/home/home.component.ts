import { Component } from '@angular/core';
import { Lesson } from '../_models/lesson';
import { Cabinet, Discipline, DisciplineType, Teacher } from '../_models';
import { Group } from '../_models/group';
import { Day } from '../_models/day';
import { Week } from '../_models/week';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  week = new Week();

  constructor() {
    const day = new Day(1);

    day.setLesson(2,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
        // new Group(1, 'ИВТ-41БО')
      )
    );
    day.setLesson(3,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
        // new Group(1, 'ИВТ-41БО')
      )
    );

    this.week.setDay(1, day);
  }
}

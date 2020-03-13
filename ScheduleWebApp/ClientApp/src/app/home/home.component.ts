import { Component } from '@angular/core';
import { Lesson } from '../_models/lesson';
import { Cabinet, Discipline, DisciplineType, Teacher } from '../_models';
import { Group } from '../_models/group';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  day = new Lesson(
    new Discipline(1, 'Программирование'),
    new DisciplineType(1, 'Лекция'),
    new Cabinet(1, 215),
    // new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
    null,
    new Group(1, 'ИВТ-41БО')
  );
}

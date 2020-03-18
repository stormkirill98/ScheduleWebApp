import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Cabinet, Day, Discipline, DisciplineType, Group, Lesson, Teacher, Week } from '../_models';

type Target = 'student' | 'teacher';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private week: BehaviorSubject<Week> = new BehaviorSubject<Week>(new Week());
  private targetWeek: BehaviorSubject<Target> = new BehaviorSubject<Target>('teacher'); // TODO govnokod

  constructor() {
    const week = new Week();

    const day = new Day(1);

    day.setLesson(2,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики'),
        new Group(1, 'ИВТ-41БО')
      )
    );
    day.setLesson(3,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики'),
        new Group(1, 'ИВТ-41БО')
      )
    );

    week.setDay(1, day);

    this.week.next(week);
  }

  getWeek(): Observable<Week> {
    return this.week.asObservable();
  }

  getTargetWeek(): string {
    return this.targetWeek.value;
  }
}

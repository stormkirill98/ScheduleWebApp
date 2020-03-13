import { Injectable } from '@angular/core';
import { Cabinet, Discipline, DisciplineType, Teacher } from '../_models';
import {BehaviorSubject} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LessonListsService {
  private disciplines: BehaviorSubject<Array<Discipline>> = new BehaviorSubject<Array<Discipline>>(new Array<Discipline>());
  private disciplineTypes: BehaviorSubject<Array<DisciplineType>> = new BehaviorSubject<Array<DisciplineType>>(new Array<DisciplineType>());
  private cabinets: BehaviorSubject<Array<Cabinet>> = new BehaviorSubject<Array<Cabinet>>(new Array<Cabinet>());
  private teachers: BehaviorSubject<Array<Teacher>> = new BehaviorSubject<Array<Teacher>>(new Array<Teacher>());

  get getDisciplines() {
    return this.disciplines.asObservable();
  }
  get getDisciplineTypes() {
    return this.disciplineTypes.asObservable();
  }
  get getCabinets() {
    return this.cabinets.asObservable();
  }
  get getTeachers() {
    return this.teachers.asObservable();
  }

  constructor() {
    this.disciplines.next( [
      new Discipline(1, 'Программирование'),
      new Discipline(2, 'Анализ данных'),
      new Discipline(3, 'Дискретная математика'),
      new Discipline(4, 'Математический анализ')
    ]);

    this.disciplineTypes.next( [
      new DisciplineType(1, 'Лекция'),
      new DisciplineType(2, 'Семинар')
    ]);

    this.cabinets.next([
      new Cabinet(1, 215),
      new Cabinet(2, 312),
      new Cabinet(3, 219),
      new Cabinet(4, 220)
    ]);

    this.teachers.next( [
      new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики'),
      new Teacher(2, 'Горбунов', 'Андрей', 'Валерьевич', 'Дискретной математики'),
      new Teacher(3, 'Короткин', 'Алексей', 'Алексеевич', 'Дискретной математики'),
      new Teacher(4, 'Галина', 'Владимировна', 'Шабаршина', 'Дискретной математики')
    ]);
  }

  private fetchData() {
    // TODO realize getting from server when open director page
  }

  updateData() {
    this.fetchData();
  }
}

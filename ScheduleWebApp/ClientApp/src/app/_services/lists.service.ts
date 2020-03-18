import { Injectable } from '@angular/core';
import { Cabinet, Discipline, DisciplineType, Group, Teacher } from '../_models';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ListsService {
  private disciplines: BehaviorSubject<Array<Discipline>> = new BehaviorSubject<Array<Discipline>>(new Array<Discipline>());
  private disciplineTypes: BehaviorSubject<Array<DisciplineType>> = new BehaviorSubject<Array<DisciplineType>>(new Array<DisciplineType>());
  private cabinets: BehaviorSubject<Array<Cabinet>> = new BehaviorSubject<Array<Cabinet>>(new Array<Cabinet>());
  private teachers: BehaviorSubject<Array<Teacher>> = new BehaviorSubject<Array<Teacher>>(new Array<Teacher>());
  private groups: BehaviorSubject<Array<Group>> = new BehaviorSubject<Array<Group>>(new Array<Group>());

  getDisciplines() {
    return this.disciplines.asObservable();
  }

  getDisciplineTypes() {
    return this.disciplineTypes.asObservable();
  }

  getCabinets() {
    return this.cabinets.asObservable();
  }

  getTeachers() {
    return this.teachers.asObservable();
  }

  getGroups() {
    return this.groups.asObservable();
  }

  constructor() {
    this.disciplines.next([
      new Discipline(1, 'Программирование'),
      new Discipline(2, 'Анализ данных'),
      new Discipline(3, 'Дискретная математика'),
      new Discipline(4, 'Математический анализ')
    ]);

    this.disciplineTypes.next([
      new DisciplineType(1, 'Лекция'),
      new DisciplineType(2, 'Семинар')
    ]);

    this.cabinets.next([
      new Cabinet(1, 215),
      new Cabinet(2, 312),
      new Cabinet(3, 219),
      new Cabinet(4, 220)
    ]);

    this.teachers.next([
      new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики'),
      new Teacher(2, 'Горбунов', 'Андрей', 'Валерьевич', 'Дискретной математики'),
      new Teacher(3, 'Короткин', 'Алексей', 'Алексеевич', 'Дискретной математики'),
      new Teacher(4, 'Галина', 'Владимировна', 'Шабаршина', 'Дискретной математики')
    ]);

    this.groups.next([
      new Group(1, 'ИВТ-41БО'),
      new Group(2, 'ИВТ-42БО'),
      new Group(3, 'ИВТ-11БО'),
      new Group(4, 'ИВТ-21БО'),
      new Group(5, 'ИВТ-31БО')
    ]);
  }

  addGroup(group: Group) {
    // TODO save group on server, get it and add to list
    const oldList = this.groups.value;
    oldList.push(group);
    this.groups.next(oldList);
  }

  addTeacher(teacher: Teacher) {
    // TODO save teacher on server, get it and add to list
    const oldList = this.teachers.value;
    oldList.push(teacher);
    this.teachers.next(oldList);
  }

  addDiscipline(discipline: Discipline) {
    // TODO save discipline on server, get it and add to list
    const oldList = this.disciplines.value;
    oldList.push(discipline);
    this.disciplines.next(oldList);
  }

  private fetchData() {
    // TODO realize getting from server when open director page
  }

  updateData() {
    this.fetchData();
  }
}

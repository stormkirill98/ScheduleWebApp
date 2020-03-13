import { Discipline } from './discipline';
import { DisciplineType } from './discipline-type';
import { Teacher } from './teacher';
import { Cabinet } from './cabinet';
import { Group } from './group';

export class Lesson {
  discipline: Discipline;
  disciplineType: DisciplineType;
  cabinet: Cabinet;
  teacher: Teacher;
  group: Group;

  constructor(discipline, disciplineType, cabinet, teacher?, group?) {
    this.discipline = discipline;
    this.disciplineType = disciplineType;
    this.cabinet = cabinet;
    this.teacher = teacher;
    this.group = group;
  }
}

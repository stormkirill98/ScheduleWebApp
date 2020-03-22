import { Discipline } from './discipline';
import { DisciplineType } from './discipline-type';
import { Teacher } from './teacher';
import { Cabinet } from './cabinet';
import { Group } from './group';

export class Lesson {
  isExists: boolean;
  discipline: Discipline;
  disciplineType: DisciplineType;
  cabinet: Cabinet;
  teacher: Teacher;
  group: Group;

  constructor() {
    this.isExists = false;
    this.discipline = new Discipline(null, null);
    this.disciplineType = new DisciplineType(null, null);
    this.cabinet = new Cabinet(null, null);
    this.teacher = new Teacher(null, null, null, null, null);
    this.group = new Group(null, null);
  }
}

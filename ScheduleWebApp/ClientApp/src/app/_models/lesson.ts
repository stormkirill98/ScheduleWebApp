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

  constructor(discipline?, disciplineType?, cabinet?, teacher?, group?) {
    this.discipline = discipline || new Discipline(null, null);
    this.disciplineType = disciplineType || new DisciplineType(null, null);
    this.cabinet = cabinet || new Cabinet(null, null);
    this.teacher = teacher || new Teacher(null, null, null, null, null);
    this.group = group || new Group(null, null);
  }
}

import { Discipline } from './discipline';
import { DisciplineType } from './discipline-type';
import { Cabinet } from './cabinet';
import { Teacher } from './teacher';
import { Group } from './group';

export class Lists {
  disciplines: Array<Discipline>;
  disciplineTypes: Array<DisciplineType>;
  cabinets: Array<Cabinet>;
  teachers: Array<Teacher>;
  groups: Array<Group>;
}

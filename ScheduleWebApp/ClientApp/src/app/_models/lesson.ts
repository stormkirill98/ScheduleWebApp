import { Discipline } from './discipline';
import { DisciplineType } from './discipline-type';
import { Teacher } from './teacher';
import { Cabinet } from './cabinet';
import { Group } from './group';

interface ILesson {
  isExists: boolean;
  discipline: Discipline;
  disciplineType: DisciplineType;
  cabinet: Cabinet;
  teacher: Teacher;
  group: Group;
}

export class Lesson implements ILesson {
  isExists: boolean;
  discipline: Discipline;
  disciplineType: DisciplineType;
  cabinet: Cabinet;
  teacher: Teacher;
  group: Group;

  constructor(lesson?: ILesson) {
    this.isExists = false;
    this.discipline =  new Discipline(null, null);
    this.disciplineType = new DisciplineType(null, null);
    this.cabinet = new Cabinet(null, null);
    this.teacher = new Teacher(null, null, null, null, null);
    this.group = new Group(null, null);

    if (lesson && lesson.discipline) {
      this.isExists = lesson.isExists;

      this.discipline.key = lesson.discipline.key;
      this.discipline.name = lesson.discipline.name;

      this.disciplineType.key = lesson.disciplineType.key;
      this.disciplineType.type = lesson.disciplineType.type;

      this.cabinet.key = lesson.cabinet.key;
      this.cabinet.number = lesson.cabinet.number;

      this.group.key = lesson.group.key;
      this.group.name = lesson.group.name;

      this.teacher.key = lesson.teacher.key;
      this.teacher.firstName = lesson.teacher.firstName;
      this.teacher.patronymic = lesson.teacher.patronymic;
      this.teacher.lastName = lesson.teacher.lastName;
      this.teacher.fullName = lesson.teacher.fullName;
      this.teacher.cathedra = lesson.teacher.cathedra;
    }
  }
}

import { Lesson } from './lesson';

const COUNT_LESSONS = 5;

export class Day {
  private readonly number;
  private readonly lessons: Array<Lesson> = [new Lesson(), new Lesson(), new Lesson(), new Lesson(), new Lesson()];

  constructor(number: number) {
    this.number = number;
  }

  setLesson(number: number, lesson: Lesson): boolean {
    if (number >= COUNT_LESSONS || number < 0) {
      return false;
    }

    this.lessons[number] = lesson;
    return true;
  }

  getLesson(number: number): Lesson {
    return this.lessons[number];
  }

  getLessons(): Array<Lesson> {
    return this.lessons;
  }

  getName(): string {
    switch (this.number) {
      case 0: return 'Понедельник';
      case 1: return 'Вторник';
      case 2: return 'Среда';
      case 3: return 'Четверг';
      case 4: return 'Пятница';
      case 5: return 'Суббота';
      case 6: return 'Воскресенье';
    }
  }
}

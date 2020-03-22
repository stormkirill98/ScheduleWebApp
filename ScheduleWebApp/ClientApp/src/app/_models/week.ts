import { Day } from './day';

const COUNT_DAYS = 6;

export class Week {
  private days: Array<Day> = new Array<Day>(COUNT_DAYS);

  constructor() {
    for (let i = 0; i < COUNT_DAYS; i++) {
      this.days[i] = new Day(i);
    }
  }

  getDays() {
    return this.days;
  }
}

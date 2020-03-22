import { Day, IDay } from './day';

const COUNT_DAYS = 6;

export interface IWeek {
  days: Array<IDay>;
}

export class Week {
  private days: Array<Day> = new Array<Day>(COUNT_DAYS);

  constructor(week?: IWeek) {
    for (let i = 0; i < COUNT_DAYS; i++) {
      this.days[i] = !!week ? new Day(i, week.days[i]) : new Day(i);
    }
  }

  getDays() {
    return this.days;
  }
}

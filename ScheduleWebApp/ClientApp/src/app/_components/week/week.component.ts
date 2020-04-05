import { Component, Input } from '@angular/core';
import { Week } from '../../_models';

@Component({
  selector: 'app-week',
  templateUrl: './week.component.html',
  styleUrls: ['./week.component.css']
})
export class WeekComponent {
  @Input() isRead: boolean;
  @Input() week: Week;

  getWeek(): Week {
    return this.week;
  }
}

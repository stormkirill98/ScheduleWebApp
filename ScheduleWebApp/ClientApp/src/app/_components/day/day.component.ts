import { Component, Input } from '@angular/core';
import { Day } from '../../_models';

@Component({
  selector: 'app-day',
  templateUrl: './day.component.html',
  styleUrls: ['./day.component.css']
})
export class DayComponent {
  @Input() day: Day;
  @Input() isRead: boolean;
}

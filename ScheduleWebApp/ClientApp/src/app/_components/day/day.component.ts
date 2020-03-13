import { Component, Input, OnInit } from '@angular/core';
import { Day } from '../../_models/day';

@Component({
  selector: 'app-day',
  templateUrl: './day.component.html',
  styleUrls: ['./day.component.css']
})
export class DayComponent implements OnInit {
  @Input()
  day: Day;
  @Input()
  isRead: boolean;

  constructor() {
  }

  ngOnInit() {
  }

}

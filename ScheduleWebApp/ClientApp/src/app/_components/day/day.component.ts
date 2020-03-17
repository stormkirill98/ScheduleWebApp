import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { Day } from '../../_models';

@Component({
  selector: 'app-day',
  templateUrl: './day.component.html',
  styleUrls: ['./day.component.css']
})
export class DayComponent implements OnInit, OnChanges {
  @Input() day: Day;
  @Input() isRead: boolean;

  constructor() {
  }

  ngOnInit() {
  }

  ngOnChanges(changes: SimpleChanges): void {
  }
}

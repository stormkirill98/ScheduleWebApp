import { Component, OnInit } from '@angular/core';
import { Input } from '@angular/core';
import { Week } from '../../_models';

@Component({
  selector: 'app-week',
  templateUrl: './week.component.html',
  styleUrls: ['./week.component.css']
})
export class WeekComponent implements OnInit {
  @Input() isRead: boolean;
  @Input() week: Week;

  constructor() { }

  ngOnInit() {
  }
}

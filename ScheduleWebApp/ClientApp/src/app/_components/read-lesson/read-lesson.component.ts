import { Component, Input } from '@angular/core';
import { Lesson } from '../../_models';
import { DataService, Target } from '../../_services/data.service';
import { Observable } from 'rxjs';

@Component({
  selector: ' app-read-lesson',
  templateUrl: './read-lesson.component.html',
  styleUrls: ['./read-lesson.component.css']
})
export class ReadLessonComponent {
  @Input() number: number;
  @Input() lesson: Lesson;

  private typeObservable: Observable<Target>;
  private type: Target;

  constructor(private dataService: DataService) {
    this.typeObservable = dataService.getTargetWeek();
    this.typeObservable.subscribe(value => this.type = value);
  }
}

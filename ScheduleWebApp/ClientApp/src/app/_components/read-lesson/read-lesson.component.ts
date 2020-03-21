import { Component, Input } from '@angular/core';
import { Lesson } from '../../_models';
import { DataService } from '../../_services/data.service';

type Type = 'student' | 'teacher'; // TODO duplicate of govnokod

@Component({
  selector: ' app-read-lesson',
  templateUrl: './read-lesson.component.html',
  styleUrls: ['./read-lesson.component.css']
})
export class ReadLessonComponent {
  @Input() number: Type;
  @Input() lesson: Lesson;

  private type: string;

  constructor(private dataService: DataService) {
    this.type = dataService.getTargetWeek();
  }
}

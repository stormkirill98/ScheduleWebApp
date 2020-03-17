import { Component, Input } from '@angular/core';
import { Lesson } from '../../_models';

@Component({
  selector: ' app-read-lesson',
  templateUrl: './read-lesson.component.html',
  styleUrls: ['./read-lesson.component.css']
})
export class ReadLessonComponent {
  @Input() number: number;
  @Input() lesson: Lesson;
}

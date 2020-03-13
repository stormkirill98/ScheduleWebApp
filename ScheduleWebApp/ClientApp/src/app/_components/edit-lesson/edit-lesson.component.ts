import { Component } from '@angular/core';
import { Cabinet, Discipline, DisciplineType, Teacher } from '../../_models';
import { Input } from '@angular/core';
import { Lesson } from '../../_models/lesson';

@Component({
  selector: 'app-edit-lesson',
  templateUrl: './edit-lesson.component.html',
  styleUrls: ['./edit-lesson.component.css']
})
export class EditLessonComponent {
  @Input()
  private number: number;
  @Input()
  private isShow: boolean;
  @Input()
  private disciplines: Array<Discipline>;
  @Input()
  private disciplineTypes: Array<DisciplineType>;
  @Input()
  private cabinets: Array<Cabinet>;
  @Input()
  private teachers: Array<Teacher>;
  @Input()
  private day: Lesson; // TODO: дописать

  clickCheckbox() {
    this.isShow = !this.isShow;
  }
}

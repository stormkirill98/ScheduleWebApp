import { Component, OnInit } from '@angular/core';
import { Cabinet, Day, Discipline, DisciplineType, Group, Lesson, Teacher, Week } from '../_models';
import { NewDisciplineComponent, NewGroupComponent, NewTeacherComponent } from '../_components';
import { MatDialog } from '@angular/material/dialog';
import { ListsService } from '../_services';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-director',
  templateUrl: './director.component.html',
  styleUrls: ['./director.component.css']
})
export class DirectorComponent implements OnInit {
  private week = new Week();
  private isParity = false;
  private groups: Observable<Array<Group>>;
  private selectedId = 1;

  constructor(public dialog: MatDialog, private listsService: ListsService) {
    const day = new Day(1);

    day.setLesson(2,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
        // new Group(1, 'ИВТ-41БО')
      )
    );
    day.setLesson(3,
      new Lesson(
        new Discipline(1, 'Программирование'),
        new DisciplineType(1, 'Лекция'),
        new Cabinet(1, 215),
        new Teacher(1, 'Владимир', 'Васильевич', 'Васильев', 'Дискретной математики')
        // new Group(1, 'ИВТ-41БО')
      )
    );

    this.week.setDay(1, day);

    this.groups = listsService.getGroups();
  }

  ngOnInit() {
    // TODO make fetch data for inputs
  }

  openGroupCreating() {
    const dialogRef = this.dialog.open(NewGroupComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.group) { return; }

      this.listsService.addGroup(result.group);
    });
  }

  openTeacherCreating() {
    const dialogRef = this.dialog.open(NewTeacherComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.teacher) { return; }

      this.listsService.addTeacher(result.teacher);
    });
  }

  openDisciplineCreating() {
    const dialogRef = this.dialog.open(NewDisciplineComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.discipline) { return; }

      this.listsService.addDiscipline(result.discipline);
    });
  }

  onChangeParity(event: Event) {
    // TODO update week
  }

  onChangeGroup(event: Event) {
    // TODO update week
  }
}

import { Component, OnInit } from '@angular/core';
import { Cabinet, Day, Discipline, DisciplineType, Lesson, Teacher, Week } from '../_models';
import { NewGroupComponent } from '../_components';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-director',
  templateUrl: './director.component.html',
  styleUrls: ['./director.component.css']
})
export class DirectorComponent implements OnInit {
  private week = new Week();
  private isParity = false;

  constructor(public dialog: MatDialog) {
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
  }

  ngOnInit() {
    // TODO make fetch data for inputs
  }

  openGroupCreating() {
    const dialogRef = this.dialog.open(NewGroupComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.group) { return; }

      console.log('Group name: ' + result.group.name);
      // TODO send group to server, add to list
    });
  }

  openTeacherCreating() {

  }

  openDisciplineCreating() {

  }
}

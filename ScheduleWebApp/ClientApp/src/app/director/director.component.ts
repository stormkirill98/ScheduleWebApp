import { Component, OnInit } from '@angular/core';
import { Group, Week } from '../_models';
import { NewDisciplineComponent, NewGroupComponent, NewTeacherComponent } from '../_components';
import { MatDialog } from '@angular/material/dialog';
import { ListsService } from '../_services';
import { Observable } from 'rxjs';
import { DataService } from '../_services/data.service';

@Component({
  selector: 'app-director',
  templateUrl: './director.component.html',
  styleUrls: ['./director.component.css']
})
export class DirectorComponent implements OnInit {
  private week: Observable<Week>;
  private isParity = false;
  private groups: Observable<Array<Group>>;
  private selectedId = 1;

  constructor(
    public dialog: MatDialog,
    private listsService: ListsService,
    private dataService: DataService
  ) {
    this.groups = listsService.getGroups();
    this.week = dataService.getWeek();
  }

  ngOnInit() {
    // TODO make fetch data for inputs
  }

  openGroupCreating() {
    const dialogRef = this.dialog.open(NewGroupComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.group) {
        return;
      }

      this.listsService.addGroup(result.group);
    });
  }

  openTeacherCreating() {
    const dialogRef = this.dialog.open(NewTeacherComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.teacher) {
        return;
      }

      this.listsService.addTeacher(result.teacher);
    });
  }

  openDisciplineCreating() {
    const dialogRef = this.dialog.open(NewDisciplineComponent);

    dialogRef.afterClosed().subscribe(result => {
      if (!result || !result.discipline) {
        return;
      }

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

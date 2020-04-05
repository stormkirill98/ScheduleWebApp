import { Component, OnInit, ViewChild } from '@angular/core';
import { Group, Week } from '../_models';
import { NewDisciplineComponent, NewGroupComponent, NewTeacherComponent, WeekComponent } from '../_components';
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
  @ViewChild(WeekComponent) weekComponent: WeekComponent;
  private readonly week: Observable<Week>;
  private isParity = false;
  private groups: Observable<Array<Group>>;
  private selectedGroup: Group;

  constructor(
    public dialog: MatDialog,
    private listsService: ListsService,
    private dataService: DataService
  ) {
    this.groups = listsService.getGroups();
    this.week = dataService.getWeek();
  }

  ngOnInit() {
    this.listsService.fetchForDirectorPage();
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
    this.dataService.fetchWeekForGroup(this.selectedGroup.key, this.isParity);
  }

  onChangeGroup(event: Event) {
    this.dataService.fetchWeekForGroup(this.selectedGroup.key, this.isParity);
  }

  saveSchedule() {
    const week = this.weekComponent.getWeek();
    this.dataService.saveWeek(week, this.selectedGroup.key, this.isParity);
  }
}

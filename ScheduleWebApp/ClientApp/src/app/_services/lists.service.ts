import { Injectable } from '@angular/core';
import { Cabinet, Discipline, DisciplineType, Group, Teacher } from '../_models';
import { BehaviorSubject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { map } from 'rxjs/operators';
import { Lists } from '../_models/lists';

@Injectable({
  providedIn: 'root'
})
export class ListsService {
  private disciplines: BehaviorSubject<Array<Discipline>> = new BehaviorSubject<Array<Discipline>>(new Array<Discipline>());
  private disciplineTypes: BehaviorSubject<Array<DisciplineType>> = new BehaviorSubject<Array<DisciplineType>>(new Array<DisciplineType>());
  private cabinets: BehaviorSubject<Array<Cabinet>> = new BehaviorSubject<Array<Cabinet>>(new Array<Cabinet>());
  private teachers: BehaviorSubject<Array<Teacher>> = new BehaviorSubject<Array<Teacher>>(new Array<Teacher>());
  private groups: BehaviorSubject<Array<Group>> = new BehaviorSubject<Array<Group>>(new Array<Group>());

  getDisciplines(): Observable<Array<Discipline>> {
    return this.disciplines.asObservable();
  }

  getDisciplineTypes(): Observable<Array<DisciplineType>> {
    return this.disciplineTypes.asObservable();
  }

  getCabinets(): Observable<Array<Cabinet>> {
    return this.cabinets.asObservable();
  }

  getTeachers(): Observable<Array<Teacher>> {
    return this.teachers.asObservable();
  }

  getGroups(): Observable<Array<Group>> {
    return this.groups.asObservable();
  }

  constructor(private http: HttpClient) {
  }

  addGroup(group: Group) {
    this.http.post<Group>(`${environment.apiUrl}/lists/group`, group).subscribe(
      savedGroup => {
        const oldList = this.groups.value;
        oldList.push(savedGroup);
        this.groups.next(oldList);
      }
    );
  }

  addTeacher(teacher: Teacher) {
    this.http.post<Teacher>(`${environment.apiUrl}/lists/teacher`, teacher).subscribe(
      savedTeacher => {
        const oldList = this.teachers.value;
        oldList.push(savedTeacher);
        this.teachers.next(oldList);
      }
    );
  }

  addDiscipline(discipline: Discipline) {
    this.http.post<Discipline>(`${environment.apiUrl}/lists/discipline`, discipline).subscribe(
      savedDiscipline => {
        const oldList = this.disciplines.value;
        oldList.push(savedDiscipline);
        this.disciplines.next(oldList);
      }
    );
  }

  fetchForDirectorPage() {
    this.http.get<Lists>(`${environment.apiUrl}/lists`).subscribe(
      lists => {
        this.disciplines.next(lists.disciplines);
        this.disciplineTypes.next(lists.disciplineTypes);
        this.cabinets.next(lists.cabinets);
        this.teachers.next(lists.teachers);
        this.groups.next(lists.groups);
      }
    );
  }

  fetchGroups() {
    this.http.get<Array<Group>>(`${environment.apiUrl}/lists/groups`).subscribe(
      groups => {
        this.groups.next(groups);
      }
    );
  }

  fetchTeachers() {
    this.http.get<Array<Teacher>>(`${environment.apiUrl}/lists/teachers`).subscribe(
      teachers => {
        this.teachers.next(teachers);
      }
    );
  }
}

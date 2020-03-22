import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Week } from '../_models';
import { IWeek } from '../_models/week';

export type Target = 'student' | 'teacher'; // TODO govnokod

interface Schedule {
  DayOfWeekID: number;
  ParityID: number;
  LessonID: number;
  StudyGroupID: number;
  DisciplineID: number;
  DisciplineTypeID: number;
  CabinetID: number;
  TeacherId: number;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private week: BehaviorSubject<Week> = new BehaviorSubject<Week>(new Week());
  private targetWeek: BehaviorSubject<Target> = new BehaviorSubject<Target>('teacher'); // TODO govnokod

  constructor(private http: HttpClient) {
  }

  getWeek(): Observable<Week> {
    return this.week.asObservable();
  }

  getTargetWeek(): Observable<Target> {
    return this.targetWeek.asObservable();
  }

  saveWeek(week: Week, groupId: number, isParity: boolean): void {
    const schedule = Array<Schedule>();

    week.getDays().forEach((day, dayId) => {
      day.getLessons().forEach((lesson, lessonId) => {
        if (lesson.isExists) {
          const obj: Schedule = {
            DayOfWeekID: dayId + 1,
            ParityID: isParity ? 1 : 2,
            LessonID: lessonId + 1,
            StudyGroupID: groupId,
            DisciplineID: lesson.discipline.key,
            DisciplineTypeID: lesson.disciplineType.key,
            CabinetID: lesson.cabinet.key,
            TeacherId: lesson.teacher.key
          };

          schedule.push(obj);
        }
      });
    });

    this.http.post<Array<Schedule>>(`${environment.apiUrl}/data/schedule`, schedule).subscribe(
      () => alert('Текущая неделя сохранена')
    );
  }

  fetchWeekForGroup(groupId: number, isParity: boolean) {
    this.http.get<IWeek>(`${environment.apiUrl}/data/group_schedule/${groupId}/${isParity}`).subscribe(
      week => this.week.next(new Week(week))
    );
    this.targetWeek.next('student');
  }

  fetchWeekForTeacher(teacherId: number, isParity: boolean) {
    this.http.get<IWeek>(`${environment.apiUrl}/data/teacher_schedule/${teacherId}/${isParity}`).subscribe(
      week => this.week.next(new Week(week))
    );
    this.targetWeek.next('teacher');
  }
}

import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Week } from '../_models';

type Target = 'student' | 'teacher'; // TODO govnokod

interface Obj {
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

  getTargetWeek(): string {
    return this.targetWeek.value;
  }

  saveWeek(week: Week, groupId: number, isParity: boolean): void {
    const schedule = Array<Obj>();

    week.getDays().forEach((day, dayId) => {
      day.getLessons().forEach((lesson, lessonId) => {
        if (lesson.isExists) {
          const obj: Obj = {
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

    this.http.post<Array<Obj>>(`${environment.apiUrl}/data/schedule`, schedule).subscribe(
      savedWeek => alert('Текущая неделя сохранена')
    );
  }
}

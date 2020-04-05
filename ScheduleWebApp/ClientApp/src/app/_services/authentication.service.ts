import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { environment } from '../../environments/environment';
import { User } from '../_models';

@Injectable()
export class AuthenticationService {
  constructor(private http: HttpClient) {
  }

  login(username: string, password: string) {
    return this.http.post<any>(`${environment.apiUrl}/users/authenticate`, {username: username, password: password})
      .pipe(map(user => {
        // login successful if there's a jwt token in the response
        if (user && user.token) {
          // store user details and jwt token in local storage to keep user logged in between page refreshes
          localStorage.setItem('currentUser', JSON.stringify(user));
        }

        return user;
      }));
  }

  logout() {
    // remove user from local storage to log user out
    localStorage.removeItem('currentUser');
  }

  isDirector(): boolean {
    return this.getCurrentUser().role === 'Директор';
  }

  isTeacher(): boolean {
    return this.getCurrentUser().role === 'Учитель';
  }

  isStudent(): boolean {
    return this.getCurrentUser().role === 'Студент';
  }

  getCurrentUser(): User {
    return JSON.parse(localStorage.getItem('currentUser'));
  }
}

import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {map} from 'rxjs/operators';
import {BehaviorSubject} from 'rxjs';
import {environment} from '../../environments/environment';

@Injectable()
export class AuthenticationService {
  private loggedIn: BehaviorSubject<boolean>;
  userRole: string;

  get isLoggedIn() {
    return this.loggedIn.asObservable();
  }

  constructor(private http: HttpClient) {
    this.loggedIn = new BehaviorSubject<boolean>(!!localStorage.getItem('currentUser'));
  }

  login(username: string, password: string) {
    return this.http.post<any>(`${environment.apiUrl}/users/authenticate`, {username: username, password: password})
      .pipe(map(user => {
        // login successful if there's a jwt token in the response
        if (user && user.token) {
          // store user details and jwt token in local storage to keep user logged in between page refreshes
          localStorage.setItem('currentUser', JSON.stringify(user));
          this.loggedIn.next(true);
          this.userRole = user.role;
        }

        return user;
      }));
  }

  logout() {
    // remove user from local storage to log user out
    localStorage.removeItem('currentUser');
    this.loggedIn.next(false);
  }

  isDirector(): boolean {
    return this.userRole === 'Директор';
  }

  isTeacher(): boolean {
    return this.userRole === 'Учитель';
  }

  isStudent(): boolean {
    return this.userRole === 'Студент';
  }
}

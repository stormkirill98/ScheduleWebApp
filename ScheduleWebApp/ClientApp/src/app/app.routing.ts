import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home';
import { LoginComponent } from './login';
import { RegisterComponent } from './register';
import { AuthGuard } from './_guards';
import { DirectorComponent } from './director/director.component';
import { TeacherComponent } from './teacher/teacher.component';
import { StudentComponent } from './student/student.component';

const appRoutes: Routes = [
  { path: '', component: HomeComponent, canActivate: [AuthGuard] },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'director', component: DirectorComponent },
  { path: 'teacher', component: TeacherComponent },
  { path: 'student', component: StudentComponent },

  // otherwise redirect to home
  { path: '**', redirectTo: '' }
];

export const routing = RouterModule.forRoot(appRoutes);

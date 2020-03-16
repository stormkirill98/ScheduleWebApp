import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { routing } from './app.routing';

import { JwtInterceptor, ErrorInterceptor } from './_helpers';
import { AlertService, AuthenticationService, UserService } from './_services';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home';
import { AlertComponent } from './_directives';
import { AuthGuard } from './_guards';
import { LoginComponent } from './login';
import { RegisterComponent } from './register';
import { EditLessonComponent } from './_components/edit-lesson/edit-lesson.component';
import { ReadLessonComponent } from './_components/read-lesson/read-lesson.component';
import { DayComponent } from './_components/day/day.component';
import { WeekComponent } from './_components/week/week.component';
import { LessonListsService } from './_services/lesson-lists.service';

@NgModule({
  imports: [
    BrowserModule.withServerTransition({appId: 'ng-cli-universal'}),
    ReactiveFormsModule,
    HttpClientModule,
    routing,
    FormsModule
  ],
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    AlertComponent,
    LoginComponent,
    RegisterComponent,
    EditLessonComponent,
    ReadLessonComponent,
    DayComponent,
    WeekComponent
  ],
  providers: [
    AuthGuard,
    AlertService,
    AuthenticationService,
    UserService,
    LessonListsService,
    {provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true},
    {provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true},
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}

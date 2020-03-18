import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

// services
import { JwtInterceptor, ErrorInterceptor } from './_helpers';
import { AuthGuard } from './_guards';
import { AlertService, AuthenticationService, UserService } from './_services';
import { ListsService } from './_services';
import { routing } from './app.routing';

// components
import { EditLessonComponent } from './_components';
import { ReadLessonComponent } from './_components';
import { DayComponent } from './_components';
import { WeekComponent } from './_components';
import { NewGroupComponent } from './_components';
import { NewTeacherComponent } from './_components';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';

// pages
import { HomeComponent } from './home';
import { AlertComponent } from './_directives';
import { LoginComponent } from './login';
import { RegisterComponent } from './register';
import { DirectorComponent } from './director/director.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';

@NgModule({
  imports: [
    BrowserModule.withServerTransition({appId: 'ng-cli-universal'}),
    ReactiveFormsModule,
    HttpClientModule,
    routing,
    FormsModule,
    BrowserAnimationsModule,
    MatDialogModule,
    MatButtonModule,
    MatInputModule
  ],
  declarations: [
    AppComponent,
    NavMenuComponent,
    // pages
    HomeComponent,
    AlertComponent,
    LoginComponent,
    RegisterComponent,
    DirectorComponent,
    // components
    EditLessonComponent,
    ReadLessonComponent,
    DayComponent,
    WeekComponent,
    NewGroupComponent,
    NewTeacherComponent
  ],
  providers: [
    AuthGuard,
    AlertService,
    AuthenticationService,
    UserService,
    ListsService,
    {provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true},
    {provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true},
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}

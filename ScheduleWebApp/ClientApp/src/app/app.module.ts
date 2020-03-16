import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { routing } from './app.routing';

// services
import { JwtInterceptor, ErrorInterceptor } from './_helpers';
import { AuthGuard } from './_guards';
import { AlertService, AuthenticationService, UserService } from './_services';
import { LessonListsService } from './_services';

// components
import { EditLessonComponent } from './_components';
import { ReadLessonComponent } from './_components';
import { DayComponent } from './_components';
import { WeekComponent } from './_components';

// pages
import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home';
import { AlertComponent } from './_directives';
import { LoginComponent } from './login';
import { RegisterComponent } from './register';
import { DirectorComponent } from './director/director.component';

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
    DirectorComponent,
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

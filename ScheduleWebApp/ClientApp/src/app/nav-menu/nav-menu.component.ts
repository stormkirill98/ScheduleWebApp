import {Component, OnInit} from '@angular/core';
import { Observable } from 'rxjs';
import {AuthenticationService} from '../_services';

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent implements OnInit {
  isExpanded = false;
  isLogged: Observable<boolean>;

  constructor(private authService: AuthenticationService) {  }

  ngOnInit() {
    this.isLogged = this.authService.isLoggedIn;
  }

  collapse() {
    this.isExpanded = false;
  }

  toggle() {
    this.isExpanded = !this.isExpanded;
  }
}

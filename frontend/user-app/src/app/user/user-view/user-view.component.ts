import { User } from './../User';
import { Router, ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { UserService } from './../user.service';
import { Component, OnInit } from '@angular/core';
import { forEach } from '@angular/router/src/utils/collection';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-user-view',
  templateUrl: './user-view.component.html',
  styleUrls: ['./user-view.component.css'],
  providers: [UserService, ToastrService]
})
export class UserViewComponent implements OnInit {

  id: number;
  private sub: any;
  imgAvatar: any;

  public user: User;
  public users: User[];
  public displayCompetencias: string;

  constructor(private router: Router,
              private route: ActivatedRoute,
              private userService: UserService,
              private toastrService: ToastrService,
              public domSanitizer: DomSanitizer) { }

  ngOnInit() {
      this.sub = this.route.params.subscribe(params => {
        this.id = params['id'];
        this.getUser(this.id);
      });
  }

  getAllUsers() {
    this.userService.findAll().subscribe(
      users => {
        this.users = users;
      },
      err => {
        console.log(err);
      }
    );
  }

  getUser(identificador) {
    this.userService.findUser(identificador).subscribe(
      user => {
        this.user = user;
        this.imgAvatar = this.user.avatarColaborador;
        for (let i = 0; i < user.competencias.length; i++) {
          this.displayCompetencias += user.competencias[i].nomeCompetencia + ',';
        }
        console.log('user', user);
      },
      err => {
        console.log(err);
      }
    );
  }

  redirectUserPage() {
    this.router.navigate(['/user/']);
  }

  editUserPage(user: User) {
    if (user) {
      this.router.navigate(['/user/edit/', user.id]);
    }
  }

  deleteUser(user: User) {
    if (user) {
      this.userService.deleteUserById(user.id).subscribe(
        res => {
          this.getAllUsers();
          this.router.navigate(['/user']);
          this.toastrService.warning('Excluído');
        }
      );
    }
  }


}

import { ToastrService } from 'ngx-toastr';
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { User } from '../User';
import { UserService } from '../user.service';
import { NgxPaginationModule } from 'ngx-pagination';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css'],
  providers: [UserService, ToastrService]
})
export class UserListComponent implements OnInit {

  id: number;
  private sub: any;

  public users: User[];
  public users2: any;
  public user: User;
  public filtro: string;

  // Faz duas listas de user para colocar uma de cada lado
  public usersImpares: User[];
  public usersPares: User[];

  constructor(private router: Router,
              private route: ActivatedRoute,
              private userService: UserService,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
      this.id = params['id'];
      this.getUser(this.id);
    });
    this.getAllUsers();
    this.filtro = '';
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
        console.log(user);
      },
      err => {
        console.log(err);
      }
    );
  }

  redirectNewUserPage() {
    this.router.navigate(['/user/create']);
  }

  editUserPage(user: User) {
    if (user) {
      this.router.navigate(['/user/edit/', user.id]);
    }
  }

  viewUserPage(user: User) {
    if (user) {
      this.router.navigate(['user/view/', user.id]);
    }
  }

  deleteUser(user: User) {
    if (user) {
      this.userService.deleteUserById(user.id).subscribe(
        res => {
          this.getAllUsers();
          this.router.navigate(['/user']);
          console.log('usuário exlcuido!');
          this.toastrService.warning('Excluído');
        }
      );
    }
  }

  pesquisar() {
    console.log('texto', this.filtro);
    console.log('this', this);

    this.userService.findByNome(this.filtro).subscribe(
      users => {
        this.users2 = users;
      },
      err => {
        console.log(err);
      }
    );
  }

}

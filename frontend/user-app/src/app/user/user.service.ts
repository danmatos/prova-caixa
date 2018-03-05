import { Injectable } from '@angular/core';
import { Http, Response, URLSearchParams, Headers, RequestOptions } from '@angular/http';
import { HttpParams } from '@angular/common/http';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import { Observable } from 'rxjs/Observable';
import { User } from './user';

@Injectable()
export class UserService {

  private apiUrl = 'http://localhost:8080/colaboradores/';

  constructor(private http: Http) {
  }

  findAll(): Observable<User[]> {
    return this.http.get(this.apiUrl + 'listar')
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  findUser(id: number): Observable<User> {
    return this.http.get(this.apiUrl + 'detalhar/' + id)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.Json().error || 'Error'));
  }

  saveUser(user: User): Observable<User> {
    return this.http.post(this.apiUrl + 'adicionar/', user)
    .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

  updateUser(user: User): Observable<User> {
    return this.http.put(this.apiUrl + 'editar/', user)
    .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

  deleteUserById(id: number): Observable<User> {
    return this.http.delete(this.apiUrl + 'excluir/' + id)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Server Erro'));
  }

  findByNome(nome: string): Observable<User> {
    return this.http.get(this.apiUrl + 'listar/nome', nome)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Error'));
  }

}

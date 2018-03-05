import { Http, Response } from '@angular/http';
import { Injectable } from '@angular/core';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';

import { Observable } from 'rxjs/Observable';
import { Titulo } from './titulo';

@Injectable()
export class TituloService {

  private apiUrl = 'http://localhost:8080/titulos/';

  constructor(private http: Http) {
  }

  findAll(): Observable<Titulo[]> {
    return this.http.get(this.apiUrl + 'listar')
      .map((res: Response) => res.json())
      .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

  saveTitulo(titulo: Titulo): Observable<Titulo> {
    return this.http.post(this.apiUrl + 'adicionar', titulo)
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  deleteTituloById(id: number): Observable<Titulo> {
    return this.http.delete(this.apiUrl + 'excluir/' + id)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Server Erro'));
  }

}

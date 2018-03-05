import { Contato } from './Contato';
import { Observable } from 'rxjs/Observable';
import { Http, Response } from '@angular/http';
import { Injectable } from '@angular/core';

@Injectable()
export class ContatoService {

  private apiUrl = 'http://localhost:8080/contatos/';

  constructor(private http: Http) {
  }

  findAll(): Observable<Contato[]> {
    return this.http.get(this.apiUrl + 'listar')
      .map((res: Response) => res.json())
      .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

  saveContato(contato: Contato): Observable<Contato> {
    return this.http.post(this.apiUrl + 'adicionar', contato)
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  deleteContatoById(id: number): Observable<Contato> {
    return this.http.delete(this.apiUrl + 'excluir/' + id)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Server Erro'));
  }

}

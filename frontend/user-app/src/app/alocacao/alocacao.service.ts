import { Observable } from 'rxjs/Observable';
import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';

import { Alocacao } from './Alocacao';

@Injectable()
export class AlocacaoService {

  private apiUrl = 'http://localhost:8080/alocacoes/';

  constructor(private http: Http) {
  }

  findAll (): Observable<Alocacao[]> {
    return this.http.get(this.apiUrl + 'listar')
      .map((res: Response) => res.json())
      .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

  findById(id: number): Observable<Alocacao> {
    return null;
  }

  saveAlocacao(alocacao: Alocacao): Observable<Alocacao> {
    return this.http.post(this.apiUrl + 'adicionar', alocacao)
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  deleteAlocacao(id: number): Observable<Alocacao> {
    return this.http.delete(this.apiUrl + 'excluir/' + id)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Server Erro'));
  }

}

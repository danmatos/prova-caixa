import { Observable } from 'rxjs/Observable';
import { Competencia } from './competencia';
import { Http, Response } from '@angular/http';
import { Injectable } from '@angular/core';

@Injectable()
export class CompetenciaService {

  private apiUrl = 'http://localhost:8080/competencias/';

  constructor(private http: Http) {
  }

  findAll(): Observable<Competencia[]> {
    return this.http.get(this.apiUrl + 'listar')
      .map((res: Response) => res.json())
      .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

  saveCompetencia(competencia: Competencia): Observable<Competencia> {
    return this.http.post(this.apiUrl + 'adicionar', competencia)
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  deleteCompetencia(id: number): Observable<Competencia> {
    return this.http.delete(this.apiUrl + 'excluir/' + id)
    .map((res: Response) => res.json())
    .catch((error: any) => Observable.throw(error.json().error || 'Server Erro'));
  }

}

import { TipoContato } from './TipoContato';
import { Observable } from 'rxjs/Observable';
import { Http, Response } from '@angular/http';
import { Injectable } from '@angular/core';

@Injectable()
export class TipoContatoService {

  private apiUrl = 'http://localhost:8080/tipo-contato/';

  constructor(private http: Http) {
  }

  findAll(): Observable<TipoContato[]> {
    return this.http.get(this.apiUrl + 'listar')
      .map((res: Response) => res.json())
      .catch((error: any) => Observable.throw(error.json().error || 'Server Error'));
  }

}

import {TipoContato} from './TipoContato';

export class Contato {

  id: number;
  numeroContato: string;
  tipoContato: TipoContato;

  constructor(id: number, numeroContato: string, tipoContato: TipoContato) {
    this.id = id;
    this.numeroContato = numeroContato;
    this.tipoContato = tipoContato;
  }

}

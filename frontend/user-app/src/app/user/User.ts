import { Competencia } from './../competencia/Competencia';
import { Alocacao } from './../alocacao/Alocacao';
import { Titulo } from './../titulo/Titulo';
import { Contato } from './../contato/Contato';

export class User {

  id: number;
  nomeColaborador: string;
  descricaoColaborador: string;
  enderecoColaborador: string;
  alocacao: Alocacao;
  titulo: Titulo;
  competencias: Competencia[];
  avatarColaborador: string;
  contatos: Contato[];

  constructor(id: number, nomeColaborador: string,
              descricaoColaborador: string, enderecoColaborador: string,
              alocacao: Alocacao, titulo: Titulo, competencias: Competencia[],
              avatarColaborador: string, contatos: Contato[])  {

    this.id = id;
    this.nomeColaborador = nomeColaborador;
    this.descricaoColaborador = descricaoColaborador;
    this.enderecoColaborador = enderecoColaborador;
    this.alocacao = alocacao;
    this.titulo = titulo;
    this.competencias = competencias;
    this.avatarColaborador = avatarColaborador;
    this.contatos = contatos;

  }

}

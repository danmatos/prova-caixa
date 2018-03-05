import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

import { Alocacao } from '../Alocacao';
import { AlocacaoService } from './../alocacao.service';

@Component({
  selector: 'app-alocacao-list',
  templateUrl: './alocacao-list.component.html',
  styleUrls: ['./alocacao-list.component.css'],
  providers: [AlocacaoService, ToastrService]
})
export class AlocacaoListComponent implements OnInit {

  public alocacoes: Alocacao[];

  constructor(private alocacaoService: AlocacaoService,
              private router: Router,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.getAlocacoes();
  }

  getAlocacoes() {
    this.alocacaoService.findAll().subscribe(
      alocacoes => {
        this.alocacoes = alocacoes;
      },
      err => {
        console.log(err);
      }
    );
  }

  redirectNovaAlocacao() {
    this.router.navigate(['/alocacao/adicionar']);
  }

  deleteAlocacao(alocacao: Alocacao) {
    if (alocacao) {
      this.alocacaoService.deleteAlocacao(alocacao.id).subscribe(
        res => {
          this.getAlocacoes();
          this.router.navigate(['/alocacoes']);
          console.log('Alocação exlcuido!');
          this.toastrService.warning('Excluído !');
        }
      );
    }
  }

}

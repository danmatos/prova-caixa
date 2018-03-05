import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import { AlocacaoService } from './../alocacao.service';
import { Alocacao } from '../Alocacao';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-alocacao-create',
  templateUrl: './alocacao-create.component.html',
  styleUrls: ['./alocacao-create.component.css'],
  providers: [AlocacaoService, ToastrService]
})
export class AlocacaoCreateComponent implements OnInit {

  id: number;
  alocacao: Alocacao;

  alocacaoForm: FormGroup;

  constructor(private route: ActivatedRoute,
              private router: Router,
              private alocacaoService: AlocacaoService,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.alocacaoForm = new FormGroup({
      nomeAlocacao: new FormControl('', Validators.required)
    });
  }

  onSubmit() {
    if (this.alocacaoForm.valid) {
      const alocacao: Alocacao = new Alocacao(null,
      this.alocacaoForm.controls['nomeAlocacao'].value);
      this.alocacaoService.saveAlocacao(alocacao).subscribe();
      this.toastrService.success('Incluído !');
    } else {
      this.toastrService.warning('Formulário inválido');
    }
    this.alocacaoForm.reset();
    this.router.navigate(['/alocacoes']);
  }

  redirectAlocacaoPage() {
    this.router.navigate(['/alocacoes']);
  }

}

import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Component, OnInit, OnDestroy } from '@angular/core';

import { TituloService } from './../titulo.service';
import { Titulo } from './../titulo';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-titulo-create',
  templateUrl: './titulo-create.component.html',
  styleUrls: ['./titulo-create.component.css'],
  providers: [TituloService, ToastrService]
})
export class TituloCreateComponent implements OnInit {

  id: number;
  titulo: Titulo;

  tituloForm: FormGroup;

  constructor(private route: ActivatedRoute,
              private router: Router,
              private tituloService: TituloService,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.tituloForm = new FormGroup({
      nomeTitulo: new FormControl('', Validators.required)
    });
  }

  onSubmit() {
    if (this.tituloForm.valid) {
      const titulo: Titulo = new Titulo(null,
      this.tituloForm.controls['nomeTitulo'].value);
      this.tituloService.saveTitulo(titulo).subscribe();
      this.toastrService.success('Incluído');
    } else {
      this.toastrService.warning('Formulário Inválido');
    }
    this.tituloForm.reset();
    this.router.navigate(['/titulos']);
  }

  redirectTitulosPage() {
    this.router.navigate(['/titulos']);
  }

}

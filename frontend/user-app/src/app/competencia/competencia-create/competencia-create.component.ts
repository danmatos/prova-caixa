import { CompetenciaService } from './../competencia.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import { Competencia } from './../competencia';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-competencia-create',
  templateUrl: './competencia-create.component.html',
  styleUrls: ['./competencia-create.component.css'],
  providers: [CompetenciaService,
              ToastrService]
})
export class CompetenciaCreateComponent implements OnInit {

  id: number;
  competencia: Competencia;

  competenciaForm: FormGroup;

  constructor(private route: ActivatedRoute,
              private router: Router,
              private competenciaService: CompetenciaService,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.competenciaForm = new FormGroup({
      nomeCompetencia: new FormControl('', Validators.required)
    });
  }

  onSubmit() {
    if (this.competenciaForm.valid) {
      const competencia: Competencia = new Competencia(null,
      this.competenciaForm.controls['nomeCompetencia'].value);
      this.competenciaService.saveCompetencia(competencia).subscribe();
      this.toastrService.success('Incluída');
    } else {
      this.toastrService.warning('Formulário inválido');
    }
    this.competenciaForm.reset();
    this.router.navigate(['/competencias']);
  }

  redirectCompetenciasPage() {
    this.router.navigate(['/competencias']);
  }

}

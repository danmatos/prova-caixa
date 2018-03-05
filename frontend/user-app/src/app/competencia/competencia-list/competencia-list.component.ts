import { ToastrService } from 'ngx-toastr';
import { CompetenciaService } from './../competencia.service';
import { Competencia } from '../competencia';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-competencia-list',
  templateUrl: './competencia-list.component.html',
  styleUrls: ['./competencia-list.component.css'],
  providers: [CompetenciaService, ToastrService]
})
export class CompetenciaListComponent implements OnInit {

  public competencias: Competencia[];

  constructor(private competenciaService: CompetenciaService,
              private router: Router,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.getCompetencias();
  }

  getCompetencias() {
    this.competenciaService.findAll().subscribe(
      competencias => {
        this.competencias = competencias;
      },
      err => {
        console.log(err);
      }
    );
  }

  redirectNovaCompetencia() {
    this.router.navigate(['competencia/novo']);
  }

  deleteCompetencia(competencia: Competencia) {
    if (competencia) {
      this.competenciaService.deleteCompetencia(competencia.id).subscribe(
        res => {
          this.getCompetencias();
          this.router.navigate(['/competencias']);
          console.log('Compêtencia exlcuida!');
          this.toastrService.warning('Excluída !');
        }
      );
    }
  }

}

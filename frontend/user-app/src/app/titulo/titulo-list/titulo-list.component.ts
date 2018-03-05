import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

import { Titulo } from './../titulo';
import { TituloService } from './../titulo.service';

@Component({
  selector: 'app-titulo-list',
  templateUrl: './titulo-list.component.html',
  styleUrls: ['./titulo-list.component.css'],
  providers: [TituloService, ToastrService]
})
export class TituloListComponent implements OnInit {

  public titulos: Titulo[];

  constructor(private tituloService: TituloService,
              private router: Router,
              private toastrService: ToastrService) { }

  ngOnInit() {
    this.getAllTitulos();
  }

  getAllTitulos() {
    this.tituloService.findAll().subscribe(
      titulos => {
        this.titulos = titulos;
      },
      err => {
        console.log(err);
      }
    );
  }

  redirectNovoTitulo() {
    this.router.navigate(['/titulo/novo']);
  }

  deleteTitulo(titulo: Titulo) {
    if (titulo) {
      this.tituloService.deleteTituloById(titulo.id).subscribe(
        res => {
          this.getAllTitulos();
          this.router.navigate(['/titulos']);
          console.log('Título exlcuido!');
          this.toastrService.warning('Excluído');
        }
      );
    }
  }

}

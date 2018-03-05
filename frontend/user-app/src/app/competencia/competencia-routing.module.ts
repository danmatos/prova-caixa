import { CompetenciaListComponent } from './competencia-list/competencia-list.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CompetenciaCreateComponent } from './competencia-create/competencia-create.component';

const routes: Routes = [
  {path: 'competencias', component: CompetenciaListComponent},
  {path: 'competencia/novo', component: CompetenciaCreateComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CompetenciaRoutingModule { }

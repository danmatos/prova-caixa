import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TituloListComponent } from './titulo-list/titulo-list.component';
import { TituloCreateComponent } from './titulo-create/titulo-create.component';

const routes: Routes = [
  {path: 'titulos', component: TituloListComponent},
  {path: 'titulo/novo', component: TituloCreateComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TituloRoutingModule { }

import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AlocacaoListComponent } from './alocacao-list/alocacao-list.component';
import { AlocacaoCreateComponent } from './alocacao-create/alocacao-create.component';

const routes: Routes = [
  {path: 'alocacoes', component: AlocacaoListComponent},
  {path: 'alocacao/adicionar', component: AlocacaoCreateComponent},
  {path: 'alocacao/editar/:id', component: AlocacaoCreateComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AlocacaoRoutingModule { }

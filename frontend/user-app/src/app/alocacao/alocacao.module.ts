import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AlocacaoRoutingModule } from './alocacao-routing.module';
import { AlocacaoListComponent } from './alocacao-list/alocacao-list.component';
import { AlocacaoCreateComponent } from './alocacao-create/alocacao-create.component';


@NgModule({
  imports: [
    CommonModule,
    AlocacaoRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  declarations: [AlocacaoListComponent,
                 AlocacaoCreateComponent]
})
export class AlocacaoModule { }

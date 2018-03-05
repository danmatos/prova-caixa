import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CompetenciaRoutingModule } from './competencia-routing.module';
import { CompetenciaListComponent } from './competencia-list/competencia-list.component';
import { CompetenciaCreateComponent } from './competencia-create/competencia-create.component';

@NgModule({
  imports: [
    CommonModule,
    CompetenciaRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  declarations: [CompetenciaListComponent, CompetenciaCreateComponent]
})
export class CompetenciaModule { }

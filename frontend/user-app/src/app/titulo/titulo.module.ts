import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TituloRoutingModule } from './titulo-routing.module';
import { TituloListComponent } from './titulo-list/titulo-list.component';
import { TituloCreateComponent } from './titulo-create/titulo-create.component';

@NgModule({
  imports: [
    CommonModule,
    TituloRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  declarations: [TituloListComponent, TituloCreateComponent]
})
export class TituloModule { }

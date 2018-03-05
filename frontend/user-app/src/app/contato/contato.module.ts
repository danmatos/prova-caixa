import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ContatoRoutingModule } from './contato-routing.module';
import { ContatoListComponent } from './contato-list/contato-list.component';
import { ContatoCreateComponent } from './contato-create/contato-create.component';

@NgModule({
  imports: [
    CommonModule,
    ContatoRoutingModule
  ],
  declarations: [ContatoListComponent, ContatoCreateComponent]
})
export class ContatoModule { }

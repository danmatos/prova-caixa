import { CompetenciaModule } from './competencia/competencia.module';
import { AngularFontAwesomeModule } from 'angular-font-awesome';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UserModule } from './user/user.module';
import { AlocacaoModule } from './alocacao/alocacao.module';
import { TituloModule } from './titulo/titulo.module';
import { NgxPaginationModule } from 'ngx-pagination';
import { ToastrModule } from 'ngx-toastr';


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    UserModule,
    AlocacaoModule,
    TituloModule,
    CompetenciaModule,
    HttpModule,
    AngularFontAwesomeModule,
    NgxPaginationModule,
    ToastrModule.forRoot()],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

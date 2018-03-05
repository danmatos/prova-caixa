import { TipoContato } from './../../contato/TipoContato';
import { TipoContatoService } from './../../contato/tipocontato.service';
import { ContatoService } from './../../contato/contato.service';
import { Competencia } from './../../competencia/competencia';
import { Component, OnDestroy, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormControl, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { User } from '../User';
import { UserService } from '../user.service';
import { Alocacao } from './../../alocacao/Alocacao';
import { AlocacaoService } from './../../alocacao/alocacao.service';
import { Titulo } from '../../titulo/titulo';
import { TituloService } from './../../titulo/titulo.service';
import { CompetenciaService } from '../../competencia/competencia.service';
import { ToastrService } from 'ngx-toastr';
import { Contato } from '../../contato/contato';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-user-create',
  templateUrl: './user-create.component.html',
  styleUrls: ['./user-create.component.css'],
  providers: [UserService,
              AlocacaoService,
              TituloService,
              CompetenciaService,
              ContatoService,
              TipoContatoService,
              ToastrService]
})
export class UserCreateComponent implements OnInit, OnDestroy {

  id: number;
  user: User;
  form: any;
  loading: Boolean = false;
  imgAvatar: any;
  selectedOrgMod: any;

  @ViewChild('fileInput') fileInput: ElementRef;

  public alocacoes: Alocacao[];
  public titulos: Titulo[];
  public competencias: Competencia[];
  public contatos: Contato[];
  public tiposContato: TipoContato[];

  listaContatos: any;

  userForm: FormGroup;
  private sub: any;
  base64File: string;
  constructor(private route: ActivatedRoute,
              private router: Router,
              private userService: UserService,
              private alocacaoService: AlocacaoService,
              private tituloService: TituloService,
              private competenciaService: CompetenciaService,
              private contatoService: ContatoService,
              private tipoContatoService: TipoContatoService,
              private toastrService: ToastrService,
              public domSanitizer: DomSanitizer) {

    this.contatos = [];
    this.listaContatos = [];
  }

  ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
      this.id = params['id'];
      this.alocacaoService.findAll().subscribe(
        alocacoes => {
          this.alocacoes = alocacoes;
        },
        err => {
          console.log(err);
        }
      );

    this.tituloService.findAll().subscribe(
      titulos => {
        this.titulos = titulos;
      },
      err => {
        console.log(err);
      }
    );

    this.competenciaService.findAll().subscribe(
      competencias => {
        this.competencias = competencias;
      },
      err => {
        console.log(err);
      }
    );

    this.tipoContatoService.findAll().subscribe(
      tiposContato => {
        this.tiposContato = tiposContato;
      },
      err => {
        console.log(err);
      }
    );

    });

    this.imgAvatar = '';

    this.userForm = new FormGroup ({
      nomeColaborador: new FormControl('', Validators.required),
      descricaoColaborador: new FormControl('', Validators.required),
      enderecoColaborador: new FormControl('', Validators.required),
      alocacao: new FormControl('', Validators.required),
      titulo: new FormControl('', Validators.required),
      competencias: new FormControl('', Validators.required),
      contatos: new FormControl(''),
      avatarColaborador: new FormControl('')
    });

    if (this.id != null) {
      this.userService.findUser(this.id).subscribe(
        user => {
          this.id = user.id;
          this.userForm.patchValue({
            nomeColaborador: user.nomeColaborador,
            descricaoColaborador: user.descricaoColaborador,
            enderecoColaborador: user.enderecoColaborador,
            alocacao: user.alocacao,
            titulo: user.titulo,
            competencias: user.competencias,
            avatarColaborador: user.avatarColaborador,
            contatos: user.contatos,
          });

          this.imgAvatar = this.domSanitizer.bypassSecurityTrustUrl(user.avatarColaborador);

        }, error => {
          console.log(error);
        }
      );
    }

  }

  ngOnDestroy(): void {
  }

  onFileChange(event) {

    const reader = new FileReader();

    if (event.target.files && event.target.files.length > 0) {
      console.log('event', event);
      const file = event.target.files[0];
      console.log('FILE', file);
      const imgSrcData = window.btoa(event.target.result);
      reader.readAsDataURL(file);
      const that = this;
      reader.onload = function () {
        that.base64File = reader.result;
      };
    }
  }

  clearFile() {
    this.form.get('avatar').setValue(null);
    this.fileInput.nativeElement.value = '';
  }

  onSubmit() {
    if (this.userForm.valid) {
      if (typeof this.id !== 'undefined' && this.id !== null) {
        const user: User = new User(this.id,
          this.userForm.controls['nomeColaborador'].value,
          this.userForm.controls['descricaoColaborador'].value,
          this.userForm.controls['enderecoColaborador'].value,
          this.userForm.controls['alocacao'].value,
          this.userForm.controls['titulo'].value,
          this.userForm.controls['competencias'].value,
          this.userForm.controls['avatarColaborador'].value,
          this.userForm.controls['contatos'].value);
          this.userService.updateUser(user).subscribe();
          this.toastrService.success('Sucesso');

      } else {

        for (let j = 0; j < this.listaContatos.length; j++) {

              this.contatos.push({id: null,
                'numeroContato': this.listaContatos[j].numeroContato,
                'tipoContato': this.tiposContato[1]});
        }

        const user: User = new User(null,
          this.userForm.controls['nomeColaborador'].value,
          this.userForm.controls['descricaoColaborador'].value,
          this.userForm.controls['enderecoColaborador'].value,
          this.userForm.controls['alocacao'].value,
          this.userForm.controls['titulo'].value,
          this.userForm.controls['competencias'].value,
          this.base64File,
          (this.contatos.length > 0) ? this.contatos : null);
          this.userService.saveUser(user).subscribe();
          this.toastrService.success('Sucesso');
      }
      this.userForm.reset();
      this.router.navigate(['/user']);
    }
  }
  redirectUserPage() {
    this.router.navigate(['/user']);
  }

  adicionarContato() {
    let c: any;
    c = {
      'icone': 'fa-edit',
      'tipoContato': '',
      'numeroContato': '1234'
    };
    this.listaContatos.push(c);

  }

  excluirContato(index: number) {
    this.listaContatos.splice(index, 1);
  }


}

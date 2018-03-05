import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlocacaoCreateComponent } from './alocacao-create.component';

describe('AlocacaoCreateComponent', () => {
  let component: AlocacaoCreateComponent;
  let fixture: ComponentFixture<AlocacaoCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlocacaoCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlocacaoCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

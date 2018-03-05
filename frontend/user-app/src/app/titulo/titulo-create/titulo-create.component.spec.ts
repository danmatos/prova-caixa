import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TituloCreateComponent } from './titulo-create.component';

describe('TituloCreateComponent', () => {
  let component: TituloCreateComponent;
  let fixture: ComponentFixture<TituloCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TituloCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TituloCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

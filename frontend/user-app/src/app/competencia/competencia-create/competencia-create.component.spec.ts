import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CompetenciaCreateComponent } from './competencia-create.component';

describe('CompetenciaCreateComponent', () => {
  let component: CompetenciaCreateComponent;
  let fixture: ComponentFixture<CompetenciaCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CompetenciaCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CompetenciaCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

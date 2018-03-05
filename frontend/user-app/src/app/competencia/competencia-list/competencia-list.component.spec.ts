import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CompetenciaListComponent } from './competencia-list.component';

describe('CompetenciaListComponent', () => {
  let component: CompetenciaListComponent;
  let fixture: ComponentFixture<CompetenciaListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CompetenciaListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CompetenciaListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

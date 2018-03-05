import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TituloListComponent } from './titulo-list.component';

describe('TituloListComponent', () => {
  let component: TituloListComponent;
  let fixture: ComponentFixture<TituloListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TituloListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TituloListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlocacaoListComponent } from './alocacao-list.component';

describe('AlocacaoListComponent', () => {
  let component: AlocacaoListComponent;
  let fixture: ComponentFixture<AlocacaoListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlocacaoListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlocacaoListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

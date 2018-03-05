import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ContatoCreateComponent } from './contato-create.component';

describe('ContatoCreateComponent', () => {
  let component: ContatoCreateComponent;
  let fixture: ComponentFixture<ContatoCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ContatoCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ContatoCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

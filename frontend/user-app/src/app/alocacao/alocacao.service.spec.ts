import { TestBed, inject } from '@angular/core/testing';

import { AlocacaoService } from './alocacao.service';

describe('AlocacaoService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AlocacaoService]
    });
  });

  it('should be created', inject([AlocacaoService], (service: AlocacaoService) => {
    expect(service).toBeTruthy();
  }));
});

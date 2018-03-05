package info.danielmatos.colaboradores.controller;

import info.danielmatos.colaboradores.model.Alocacao;
import info.danielmatos.colaboradores.repository.AlocacaoRepository;
import info.danielmatos.colaboradores.service.AlocacaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/alocacoes")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class AlocacaoController {

    @Autowired
    AlocacaoService alocacaoService;
    @Autowired
    AlocacaoRepository alocacaoRepository;

    @GetMapping("/listar")
    public List<Alocacao> listarAlocacoes() {
        return alocacaoService.listaAlocacoes();
    }

    @PostMapping("/adicionar")
    public Alocacao adicionarAlocacao(@Valid @RequestBody Alocacao alocacao) {
        alocacaoService.adicionaAlocacao(alocacao);
        return alocacao;
    }

    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Alocacao> excluirAlocacao(@PathVariable(value = "id") Long alocacaoId) {
        Alocacao alocacao = alocacaoRepository.findOne(alocacaoId);
        alocacaoService.excluiAlocacao(alocacaoId);
        return ResponseEntity.ok().body(alocacao);
    }

}

package info.danielmatos.colaboradores.controller;

import info.danielmatos.colaboradores.model.Competencia;
import info.danielmatos.colaboradores.repository.CompetenciaRepository;
import info.danielmatos.colaboradores.service.CompetenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/competencias")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class CompetenciaController {

    @Autowired
    CompetenciaService competenciaService;
    @Autowired
    CompetenciaRepository competenciaRepository;

    @GetMapping("/listar")
    public List<Competencia> listarCompetencias() {
        return competenciaService.listaCompetencias();
    }

    @PostMapping("/adicionar")
    public Competencia novaCompetencia(@Valid @RequestBody Competencia competencia) {
        competenciaService.salvaCompetencia(competencia);
        return competencia;
    }

    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Competencia> excluirCompetencia(@PathVariable(value = "id") Long competenciaId) {
        Competencia competencia = competenciaRepository.findById(competenciaId);
        competenciaService.excluiCompetencia(competenciaId);
        return ResponseEntity.ok().body(competencia);
    }

}

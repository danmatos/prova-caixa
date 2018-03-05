package info.danielmatos.colaboradores.controller;

import info.danielmatos.colaboradores.model.Titulo;
import info.danielmatos.colaboradores.repository.TituloRepository;
import info.danielmatos.colaboradores.service.TituloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/titulos")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class TituloController {

    @Autowired
    TituloService tituloService;
    @Autowired
    TituloRepository tituloRepository;

    @GetMapping("/listar")
    public List<Titulo> listarTitulos() {
        return tituloService.listaTitulos();
    }

    @PostMapping("/adicionar")
    public Titulo adicionarTitulo(@Valid @RequestBody Titulo titulo) {
        tituloService.adicionaTitulo(titulo);
        return titulo;
    }

    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Titulo> excluirTitulo(@PathVariable(value = "id") Long tituloId) {
        Titulo titulo = tituloRepository.findOne(tituloId);
        tituloService.excluiTitulo(tituloId);
        return ResponseEntity.ok().body(titulo);
    }

}

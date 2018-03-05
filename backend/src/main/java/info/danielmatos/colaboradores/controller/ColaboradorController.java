package info.danielmatos.colaboradores.controller;

import info.danielmatos.colaboradores.model.Colaborador;
import info.danielmatos.colaboradores.repository.ColaboradorRepository;
import info.danielmatos.colaboradores.service.ColaboradorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/colaboradores")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class ColaboradorController {

    @Autowired
    ColaboradorService colaboradorService;
    @Autowired
    ColaboradorRepository colaboradorRepository;

    //Listar colaboradores
    @GetMapping("/listar")
    public List<Colaborador> listarColaboradores() {
        return colaboradorService.listaColaboradores();
    }

    //Adicionar novo colaborador
    @PostMapping("/adicionar")
    public Colaborador adicionarColaborador(@Valid @RequestBody Colaborador colaborador) {
        colaboradorService.salvarColaborador(colaborador);
        return colaborador;
    }

    //Detalhar colaborador
    @GetMapping("/detalhar/{id}")
    public ResponseEntity<Colaborador> detalharColaborador(@PathVariable(value = "id") Long colaboradorId) {
        Colaborador colaborador = colaboradorRepository.findOne(colaboradorId);
        colaboradorService.detalhaColaborador(colaboradorId);
        return ResponseEntity.ok().body(colaborador);
    }

    //Editar colaborador
    @PutMapping("/editar/")
    public void editarColaborador(@RequestBody Colaborador colaborador) {
        colaboradorService.editaColaborador(colaborador);
    }

    //Excluir colaborador
    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Colaborador> excluirColaborador(@PathVariable(value = "id") Long colaboradorId) {
        Colaborador colaborador = colaboradorRepository.findOne(colaboradorId);
        colaboradorService.excluiColaborador(colaboradorId);
        return ResponseEntity.ok().body(colaborador);
    }

    @GetMapping("/listar/nome")
    public List<Colaborador> filtrarPorNome(@RequestParam("nomeColaborador") String nomeColaborador) {
        return colaboradorService.filtraPorNome(nomeColaborador);
    }

}

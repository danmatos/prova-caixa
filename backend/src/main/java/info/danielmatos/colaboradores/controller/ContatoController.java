package info.danielmatos.colaboradores.controller;

import info.danielmatos.colaboradores.model.Colaborador;
import info.danielmatos.colaboradores.model.Contato;
import info.danielmatos.colaboradores.repository.ContatoRepository;
import info.danielmatos.colaboradores.service.ContatoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/cotatos")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class ContatoController {

    @Autowired
    ContatoService contatoService;
    @Autowired
    ContatoRepository contatoRepository;

    @GetMapping("/listar")
    public List<Contato> listarContatos() {
        return contatoService.listaContatos();
    }

    @PostMapping("/adicionar")
    public Contato adicionarContato(@Valid @RequestBody Contato contato) {
        contatoService.salvaContato(contato);
        return contato;
    }

    @GetMapping("/detalhar/{id}")
    public ResponseEntity<Contato> detalharContato(@PathVariable(value = "id") Long contatoId) {
        Contato contato = contatoRepository.findOne(contatoId);
        contatoService.detalhaContato(contatoId);
        return ResponseEntity.ok().body(contato);
    }

    @PutMapping("/editar/")
    public void editarContato(@RequestBody Contato contato) {
        contatoService.editaContato(contato);
    }

    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Contato> excluirContato(@PathVariable(value = "id") Long contatoId) {
        Contato contato = contatoRepository.findOne(contatoId);
        contatoService.excluiContato(contatoId);
        return ResponseEntity.ok().body(contato);
    }

}

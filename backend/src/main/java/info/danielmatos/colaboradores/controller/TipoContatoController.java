package info.danielmatos.colaboradores.controller;

import info.danielmatos.colaboradores.model.TipoContato;
import info.danielmatos.colaboradores.repository.TipoContatoRepository;
import info.danielmatos.colaboradores.service.TipoContatoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/tipo-contato")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class TipoContatoController {

    @Autowired
    TipoContatoService tipoContatoService;
    @Autowired
    TipoContatoRepository tipoContatoRepository;

    @GetMapping("/listar")
    public List<TipoContato> listarTiposContato() {
        return tipoContatoService.listaTiposContato();
    }

    @PostMapping("/adicionar")
    public TipoContato adicionarTipoContato(@Valid @RequestBody TipoContato tipoContato) {
        tipoContatoService.adicionaTipoContato(tipoContato);
        return tipoContato;
    }

    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<TipoContato> excluirTipoContato(@PathVariable(value = "id") Long tipoContatoId) {
        TipoContato tipoContato = tipoContatoRepository.findOne(tipoContatoId);
        tipoContatoService.excluiTipoContato(tipoContatoId);
        return ResponseEntity.ok().body(tipoContato);
    }

}

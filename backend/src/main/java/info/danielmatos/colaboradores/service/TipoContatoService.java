package info.danielmatos.colaboradores.service;

import info.danielmatos.colaboradores.model.TipoContato;
import info.danielmatos.colaboradores.repository.TipoContatoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class TipoContatoService {

    @Autowired
    TipoContatoRepository tipoContatoRepository;

    @Transactional
    public List<TipoContato> listaTiposContato() {
        return tipoContatoRepository.findAll();
    }

    @Transactional
    public TipoContato adicionaTipoContato(TipoContato tipoContato) {
        tipoContatoRepository.save(tipoContato);
        return tipoContato;
    }

    @Transactional
    public void editaTipoContato(TipoContato tipoContato) {
        tipoContatoRepository.save(tipoContato);
    }

    @Transactional
    public ResponseEntity<TipoContato> excluiTipoContato(Long tipoContatoId) {
        TipoContato tipoContato = tipoContatoRepository.findOne(tipoContatoId);
        if (tipoContato == null) {
            return ResponseEntity.notFound().build();
        }
        tipoContatoRepository.delete(tipoContato);

        return ResponseEntity.ok().build();
    }
}

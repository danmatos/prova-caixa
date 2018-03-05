package info.danielmatos.colaboradores.service;

import info.danielmatos.colaboradores.model.Contato;
import info.danielmatos.colaboradores.repository.ContatoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ContatoService {

    @Autowired
    ContatoRepository contatoRepository;

    @Transactional
    public List<Contato> listaContatos() {
        return contatoRepository.findAll();
    }

    @Transactional
    public Contato salvaContato(Contato contato) {
        contatoRepository.save(contato);
        return contato;
    }

    @Transactional
    public ResponseEntity<Contato> detalhaContato(Long contatoId) {
        Contato contato = contatoRepository.findOne(contatoId);
        if (contato == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(contato);
    }

    @Transactional
    public void editaContato(Contato contato) {
        contatoRepository.save(contato);
    }

    @Transactional
    public ResponseEntity<Contato> excluiContato(Long contatoId) {
        Contato contato = contatoRepository.findOne(contatoId);
        if (contato == null) {
            return ResponseEntity.notFound().build();
        }
        contatoRepository.delete(contato);
        return ResponseEntity.ok().build();
    }

}

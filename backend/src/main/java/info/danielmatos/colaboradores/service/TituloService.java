package info.danielmatos.colaboradores.service;

import info.danielmatos.colaboradores.model.Titulo;
import info.danielmatos.colaboradores.repository.TituloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class TituloService {

    @Autowired
    TituloRepository tituloRepository;

    @Transactional
    public List<Titulo> listaTitulos() {
        return tituloRepository.findAll();
    }

    @Transactional
    public Titulo adicionaTitulo(Titulo titulo) {
        tituloRepository.save(titulo);
        return titulo;
    }

    @Transactional
    public void editaTitulo(Titulo titulo) {
        tituloRepository.save(titulo);
    }

    @Transactional
    public ResponseEntity<Titulo> excluiTitulo(Long tituloId) {
        Titulo titulo = tituloRepository.findOne(tituloId);
        if (titulo == null) {
            return ResponseEntity.notFound().build();
        }
        tituloRepository.delete(titulo);

        return ResponseEntity.ok().build();
    }
}

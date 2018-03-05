package info.danielmatos.colaboradores.service;

import info.danielmatos.colaboradores.model.Competencia;
import info.danielmatos.colaboradores.repository.CompetenciaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class CompetenciaService {

    @Autowired
    CompetenciaRepository competenciaRepository;

    @Transactional
    public List<Competencia> listaCompetencias() {
        return competenciaRepository.findAll();
    }

    @Transactional
    public Competencia salvaCompetencia(Competencia competencia) {
        competenciaRepository.save(competencia);
        return competencia;
    }

    @Transactional
    public void editaCompetencia(Competencia competencia) {
        competenciaRepository.save(competencia);
    }

    @Transactional
    public ResponseEntity<Competencia> excluiCompetencia(Long competenciaId) {
        Competencia competencia = competenciaRepository.findById(competenciaId);
        if (competencia == null) {
            return ResponseEntity.notFound().build();
        }
        competenciaRepository.delete(competencia);

        return ResponseEntity.ok().build();
    }
}

package info.danielmatos.colaboradores.service;

import info.danielmatos.colaboradores.model.Colaborador;
import info.danielmatos.colaboradores.model.Contato;
import info.danielmatos.colaboradores.repository.ColaboradorRepository;
import info.danielmatos.colaboradores.repository.ContatoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ColaboradorService {

    @Autowired
    ColaboradorRepository colaboradorRepository;

    @Autowired
    ContatoRepository contatoRepository;

    @Transactional
    public List<Colaborador> listaColaboradores() {
        return colaboradorRepository.findAll();
    }

    @Transactional
    public Colaborador salvarColaborador(Colaborador colaborador) {

        colaboradorRepository.save(colaborador);

        for(Contato c : colaborador.getContatos()){
            colaborador.setContatos(null);
            colaborador.setCompetencias(null);
            c.setColaborador(colaborador);
            contatoRepository.save(c);
        }

        return colaborador;
    }

    @Transactional
    public ResponseEntity<Colaborador> detalhaColaborador(Long colaboradorId) {
        Colaborador colaborador = colaboradorRepository.findOne(colaboradorId);
        if (colaborador == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(colaborador);
    }

    @Transactional
    public void editaColaborador(Colaborador colaborador) {
        colaboradorRepository.save(colaborador);
    }

    @Transactional
    public ResponseEntity<Colaborador> excluiColaborador(Long colaboradorId) {
        Colaborador colaborador = colaboradorRepository.findOne(colaboradorId);
        if (colaborador == null) {
            return ResponseEntity.notFound().build();
        }
        colaboradorRepository.delete(colaborador);
        return ResponseEntity.ok().build();
    }

    @Transactional
    public List<Colaborador> filtraPorNome(String nome) {
        return colaboradorRepository.buscarPorNome(nome);
    }
}

package info.danielmatos.colaboradores.service;

import info.danielmatos.colaboradores.model.Alocacao;
import info.danielmatos.colaboradores.repository.AlocacaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class AlocacaoService {

    @Autowired
    AlocacaoRepository alocacaoRepository;

    @Transactional
    public List<Alocacao> listaAlocacoes() {
        return alocacaoRepository.findAll();
    }

    @Transactional
    public Alocacao adicionaAlocacao(Alocacao alocacao) {
        alocacaoRepository.save(alocacao);
        return alocacao;
    }

    @Transactional
    public void editaAlocacao(Alocacao alocacao) {
        alocacaoRepository.save(alocacao);
    }

    @Transactional
    public ResponseEntity<Alocacao> excluiAlocacao(Long alocacaoId) {
        Alocacao alocacao = alocacaoRepository.findOne(alocacaoId);
        if (alocacao == null) {
            return ResponseEntity.notFound().build();
        }
        alocacaoRepository.delete(alocacao);

        return ResponseEntity.ok().build();
    }
}

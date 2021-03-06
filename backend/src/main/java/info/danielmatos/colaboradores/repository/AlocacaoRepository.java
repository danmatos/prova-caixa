package info.danielmatos.colaboradores.repository;

import info.danielmatos.colaboradores.model.Alocacao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlocacaoRepository extends JpaRepository<Alocacao, Long> {

}

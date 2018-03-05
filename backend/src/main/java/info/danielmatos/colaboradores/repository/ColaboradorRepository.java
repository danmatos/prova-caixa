package info.danielmatos.colaboradores.repository;

import info.danielmatos.colaboradores.model.Colaborador;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ColaboradorRepository extends JpaRepository<Colaborador, Long> {

    @Query("SELECT c FROM Colaborador c WHERE c.nomeColaborador LIKE '%:nome%'")
    List<Colaborador> buscarPorNome(@Param("nome") String nome);
}

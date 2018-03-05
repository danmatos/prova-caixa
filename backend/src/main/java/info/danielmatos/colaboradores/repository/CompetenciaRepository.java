package info.danielmatos.colaboradores.repository;

import info.danielmatos.colaboradores.model.Competencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CompetenciaRepository extends JpaRepository<Competencia, Long> {

    @Query("select cpt from Competencia cpt where cpt.id = :competenciaId")
    Competencia findById(@Param("competenciaId") Long competenciaId);

}




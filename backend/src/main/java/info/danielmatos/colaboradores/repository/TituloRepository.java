package info.danielmatos.colaboradores.repository;

import info.danielmatos.colaboradores.model.Titulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TituloRepository extends JpaRepository<Titulo, Long> {

}

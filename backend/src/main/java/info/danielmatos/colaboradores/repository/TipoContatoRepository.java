package info.danielmatos.colaboradores.repository;

import info.danielmatos.colaboradores.model.TipoContato;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoContatoRepository extends JpaRepository<TipoContato, Long> {

}

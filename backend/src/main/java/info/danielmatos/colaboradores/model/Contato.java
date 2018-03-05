package info.danielmatos.colaboradores.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "CON_CONTATO")
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"createdAt", "updatedAt"},
        allowGetters = true)
public class Contato implements Serializable {

    @Id
    @Column(name = "CON_ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "CON_CD_NUMERO")
    private String numeroContato;

    @ManyToOne
    @JoinColumn(name = "COL_ID")
    private Colaborador colaborador;

    @ManyToOne
    @JoinColumn(name = "TCO_ID")
    private TipoContato tipoContato;

    @Column(nullable = false, updatable = false, name = "CON_DT_CRIACAO")
    @Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private Date createdAt;

    @Column(nullable = false, name = "CON_DT_ATUALIZACAO")
    @Temporal(TemporalType.TIMESTAMP)
    @LastModifiedDate
    private Date updatedAt;
}

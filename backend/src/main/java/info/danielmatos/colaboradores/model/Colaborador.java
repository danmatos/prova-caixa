package info.danielmatos.colaboradores.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "COL_COLABORADOR")
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"createdAt", "updatedAt"},
        allowGetters = true)
public class Colaborador implements Serializable {

    @Id
    @Column(name = "COL_ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "COL_NM_NOME")
    private String nomeColaborador;

    @Column(name = "COL_DS_DESCRICAO")
    private String descricaoColaborador;

    @Column(name = "COL_PH_AVATAR")
    private String avatarColaborador;

    @Column(name = "COL_AD_ENDERECO")
    private String enderecoColaborador;

    @OneToMany(cascade = CascadeType.MERGE,fetch= FetchType.LAZY, mappedBy = "colaborador")
    private List<Contato> contatos = new ArrayList<>();

    @ManyToMany
    @JoinTable(name="colaborador_competencia", joinColumns=
            {@JoinColumn(name="COL_ID")}, inverseJoinColumns=
            {@JoinColumn(name="CPT_ID")})
    private List<Competencia> competencias;

    @ManyToOne
    @JoinColumn(name = "ALC_ID")
    private Alocacao alocacao;

    @ManyToOne
    @JoinColumn(name = "TIT_ID")
    private Titulo titulo;

    @Column(nullable = false, updatable = false, name = "COL_DT_CRIACAO")
    @Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private Date createdAt;

    @Column(nullable = false, name = "COL_DT_ATUALIZACAO")
    @Temporal(TemporalType.TIMESTAMP)
    @LastModifiedDate
    private Date updatedAt;

}

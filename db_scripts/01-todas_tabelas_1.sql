drop schema colaboradores;

create schema colaboradores;

use colaboradores;

create table COLABORADORES.ALC_ALOCACAO
(
   ALC_ID                     BIGINT AUTO_INCREMENT   not null,
   ALC_NM_NOME                VARCHAR(150),
   ALC_DT_CRIACAO             DATE                    not null,
   ALC_DT_ATUALIZACAO         DATE                    not null,
   constraint PK_ALC primary key (ALC_ID)
);

create table COLABORADORES.COL_COLABORADOR
(
   COL_ID                     BIGINT AUTO_INCREMENT   not null,
   ALC_ID                     BIGINT,  
   CON_ID                     BIGINT,
   CPT_ID                     BIGINT,  
   TIT_ID                     BIGINT,
   COL_NM_NOME                VARCHAR(150),
   COL_DS_DESCRICAO           VARCHAR(500),
   COL_PH_AVATAR              VARCHAR(250),
   COL_AD_ALOCACAO            VARCHAR(250),
   COL_DT_CRIACAO             DATE                    not null,
   COL_DT_ATUALIZACAO         DATE                    not null,
   constraint PK_COL primary key (COL_ID)
);

create table COLABORADORES.CPT_COMPETENCIA
(
   CPT_ID                     BIGINT AUTO_INCREMENT   not null,
   CPT_NM_NOME                VARCHAR(150),
   CPT_DT_CRIACAO             DATE                    not null,
   CPT_DT_ATUALIZACAO         DATE                    not null,
   constraint PK_CPT primary key (CPT_ID)
);

create table COLABORADORES.CON_CONTATO
(
   CON_ID                     BIGINT AUTO_INCREMENT   not null,
   COL_ID                     BIGINT,  
   TCO_ID                     BIGINT,   
   CON_CD_NUMERO              VARCHAR(150),
   CON_DS_TIPO                VARCHAR(250),
   CON_DT_CRIACAO             DATE                    not null,
   CON_DT_ATUALIZACAO         DATE                    not null,
   constraint PK_CON primary key (CON_ID)
);

create table COLABORADORES.TCO_TIPO_CONTATO
(
   TCO_ID                     BIGINT AUTO_INCREMENT   not null,
   CON_ID                     BIGINT,
   TCO_NM_NOME                VARCHAR(150),
   TCO_DT_CRIACAO             DATE                    not null,
   TCO_DT_ATUALIZACAO         DATE                    not null,
   constraint PK_TCO primary key (TCO_ID)
)

create table COLABORADORES.TIT_TITULO
(
   TIT_ID                  BIGINT AUTO_INCREMENT      not null,
   TIT_NM_NOME             VARCHAR(150),
   TIT_DT_CRIACAO          DATE                       not null,
   TIT_DT_ATUALIZACAO         DATE                    not null,
      constraint PK_TIT primary key (TIT_ID)
);


alter table COLABORADORES.COL_COLABORADOR
   add constraint IRCOLALC foreign key (ALC_ID)
      references COLABORADORES.ALC_ALOCACAO (ALC_ID)
      on delete restrict on update restrict;
        
alter table COLABORADORES.COL_COLABORADOR
   add constraint IRCOLCPT foreign key (CPT_ID)
      references COLABORADORES.CPT_COMPETENCIA (CPT_ID)
      on delete restrict on update restrict;

alter table COLABORADORES.COL_COLABORADOR
   add constraint IRCOLCON foreign key (CON_ID)
      references COLABORADORES.CON_CONTATO (CON_ID)
      on delete restrict on update restrict;

alter table COLABORADORES.COL_COLABORADOR
   add constraint IRCOLTIT foreign key (COL_ID)
      references COLABORADORES.TIT_TITULO (TIT_ID)
      on delete restrict on update restrict; 
        
alter table COLABORADORES.CON_CONTATO
   add constraint IRCOLCON foreign key (COL_ID)
      references COLABORADORES.COL_COLABORADOR (COL_ID)
      on delete restrict on update restrict; 

alter table COLABORADORES.CON_CONTATO
   add constraint IRTCOCON foreign key (TCO_ID)
      references COLABORADORES.TCO_TIPO_CONTATO (TCO_ID)
      on delete restrict on update restrict; 

alter table COLABORADORES.TCO_TIPO_CONTATO
   add constraint IRCONTCO foreign key (CON_ID)
      references COLABORADORES.CON_CONTATO (CON_ID)
      on delete restrict on update restrict; 
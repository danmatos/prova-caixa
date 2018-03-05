-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema colaboradores
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema colaboradores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `colaboradores` DEFAULT CHARACTER SET utf8 ;
USE `colaboradores` ;

-- -----------------------------------------------------
-- Table `colaboradores`.`alc_alocacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`alc_alocacao` (
  `ALC_ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `ALC_NM_NOME` VARCHAR(150) NULL DEFAULT NULL,
  `ALC_DT_CRIACAO` DATE NOT NULL,
  `ALC_DT_ATUALIZACAO` DATE NOT NULL,
  PRIMARY KEY (`ALC_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`tco_tipo_contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`tco_tipo_contato` (
  `TCO_ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `CON_ID` BIGINT(20) NULL DEFAULT NULL,
  `TCO_NM_NOME` VARCHAR(150) NULL DEFAULT NULL,
  `TCO_DT_CRIACAO` DATE NOT NULL,
  `TCO_DT_ATUALIZACAO` DATE NOT NULL,
  PRIMARY KEY (`TCO_ID`),
  INDEX `IRCONTCO` (`CON_ID` ASC),
  CONSTRAINT `IRCONTCO`
    FOREIGN KEY (`CON_ID`)
    REFERENCES `colaboradores`.`con_contato` (`CON_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`con_contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`con_contato` (
  `CON_ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `COL_ID` BIGINT(20) NULL DEFAULT NULL,
  `CON_CD_NUMERO` VARCHAR(150) NULL DEFAULT NULL,
  `CON_DS_TIPO` VARCHAR(250) NULL DEFAULT NULL,
  `CON_DT_CRIACAO` DATE NOT NULL,
  `CON_DT_ATUALIZACAO` DATE NOT NULL,
  `TCO_ID` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`CON_ID`),
  INDEX `FKr8n0ghqgel908b3u55tjadh5d` (`COL_ID` ASC),
  INDEX `FK2gj0wwtn131b426x197l7cwgy` (`TCO_ID` ASC),
  CONSTRAINT `FK2gj0wwtn131b426x197l7cwgy`
    FOREIGN KEY (`TCO_ID`)
    REFERENCES `colaboradores`.`tco_tipo_contato` (`TCO_ID`),
  CONSTRAINT `FKr8n0ghqgel908b3u55tjadh5d`
    FOREIGN KEY (`COL_ID`)
    REFERENCES `colaboradores`.`col_colaborador` (`COL_ID`),
  CONSTRAINT `IRCOLCON`
    FOREIGN KEY (`COL_ID`)
    REFERENCES `colaboradores`.`col_colaborador` (`COL_ID`),
  CONSTRAINT `IRTCOCON`
    FOREIGN KEY (`TCO_ID`)
    REFERENCES `colaboradores`.`tco_tipo_contato` (`TCO_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`cpt_competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`cpt_competencia` (
  `CPT_ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `CPT_NM_NOME` VARCHAR(150) NULL DEFAULT NULL,
  `CPT_DT_CRIACAO` DATE NOT NULL,
  `CPT_DT_ATUALIZACAO` DATE NOT NULL,
  PRIMARY KEY (`CPT_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`tit_titulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`tit_titulo` (
  `TIT_ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `TIT_NM_NOME` VARCHAR(150) NULL DEFAULT NULL,
  `TIT_DT_CRIACAO` DATE NOT NULL,
  `TIT_DT_ATUALIZACAO` DATE NOT NULL,
  PRIMARY KEY (`TIT_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`col_colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`col_colaborador` (
  `COL_ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `ALC_ID` BIGINT(20) NULL DEFAULT NULL,
  `CON_ID` BIGINT(20) NULL DEFAULT NULL,
  `CPT_ID` BIGINT(20) NULL DEFAULT NULL,
  `TIT_ID` BIGINT(20) NULL DEFAULT NULL,
  `COL_NM_NOME` VARCHAR(150) NULL DEFAULT NULL,
  `COL_DS_DESCRICAO` VARCHAR(500) NULL DEFAULT NULL,
  `COL_PH_AVATAR` VARCHAR(10000) NULL DEFAULT NULL,
  `COL_AD_ALOCACAO` VARCHAR(250) NULL DEFAULT NULL,
  `COL_DT_CRIACAO` DATE NOT NULL,
  `COL_DT_ATUALIZACAO` DATE NOT NULL,
  `col_ad_endereco` VARCHAR(255) NULL DEFAULT NULL,
  `col_nm_titulo` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`COL_ID`),
  INDEX `FKqby8d0piuun45734tk7np321k` (`ALC_ID` ASC),
  INDEX `FK80mbod3rr7vrqgfca84kgexl1` (`CON_ID` ASC),
  INDEX `FKpd46ays1wys35gvqa9dgomyg2` (`TIT_ID` ASC),
  INDEX `FKo0ls9q54rdsd04taq5uswc6kw` (`CPT_ID` ASC),
  CONSTRAINT `FK80mbod3rr7vrqgfca84kgexl1`
    FOREIGN KEY (`CON_ID`)
    REFERENCES `colaboradores`.`con_contato` (`CON_ID`),
  CONSTRAINT `FKo0ls9q54rdsd04taq5uswc6kw`
    FOREIGN KEY (`CPT_ID`)
    REFERENCES `colaboradores`.`cpt_competencia` (`CPT_ID`),
  CONSTRAINT `FKpd46ays1wys35gvqa9dgomyg2`
    FOREIGN KEY (`TIT_ID`)
    REFERENCES `colaboradores`.`tit_titulo` (`TIT_ID`),
  CONSTRAINT `FKqby8d0piuun45734tk7np321k`
    FOREIGN KEY (`ALC_ID`)
    REFERENCES `colaboradores`.`alc_alocacao` (`ALC_ID`),
  CONSTRAINT `IRCOLALC`
    FOREIGN KEY (`ALC_ID`)
    REFERENCES `colaboradores`.`alc_alocacao` (`ALC_ID`),
  CONSTRAINT `IRCOLCPT`
    FOREIGN KEY (`CPT_ID`)
    REFERENCES `colaboradores`.`cpt_competencia` (`CPT_ID`),
  CONSTRAINT `IRCOLTIT`
    FOREIGN KEY (`COL_ID`)
    REFERENCES `colaboradores`.`tit_titulo` (`TIT_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`colaborador_competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`colaborador_competencia` (
  `col_id` BIGINT(20) NOT NULL,
  `cpt_id` BIGINT(20) NOT NULL,
  INDEX `FKtlgg5odlymlluediys1k6cpmd` (`cpt_id` ASC),
  INDEX `FKmbkmg5asmvx7opg2xiao8cd27` (`col_id` ASC),
  CONSTRAINT `FKmbkmg5asmvx7opg2xiao8cd27`
    FOREIGN KEY (`col_id`)
    REFERENCES `colaboradores`.`col_colaborador` (`COL_ID`),
  CONSTRAINT `FKtlgg5odlymlluediys1k6cpmd`
    FOREIGN KEY (`cpt_id`)
    REFERENCES `colaboradores`.`cpt_competencia` (`CPT_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `colaboradores`.`rl_colaborador_competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores`.`rl_colaborador_competencia` (
  `COL_ID` BIGINT(20) NOT NULL,
  `CPT_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`COL_ID`, `CPT_ID`),
  INDEX `IRRLCOM_idx` (`CPT_ID` ASC),
  CONSTRAINT `FK2d9k8eupi46ex708bjfgqxhap`
    FOREIGN KEY (`CPT_ID`)
    REFERENCES `colaboradores`.`cpt_competencia` (`CPT_ID`),
  CONSTRAINT `FKgvy5wijoavl693fqql57tw4os`
    FOREIGN KEY (`COL_ID`)
    REFERENCES `colaboradores`.`col_colaborador` (`COL_ID`),
  CONSTRAINT `IRRLCOL`
    FOREIGN KEY (`COL_ID`)
    REFERENCES `colaboradores`.`col_colaborador` (`COL_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IRRLCOM`
    FOREIGN KEY (`CPT_ID`)
    REFERENCES `colaboradores`.`cpt_competencia` (`CPT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

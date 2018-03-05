CREATE DATABASE  IF NOT EXISTS `colaboradores` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `colaboradores`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: colaboradores
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alc_alocacao`
--

DROP TABLE IF EXISTS `alc_alocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alc_alocacao` (
  `ALC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ALC_NM_NOME` varchar(150) DEFAULT NULL,
  `ALC_DT_CRIACAO` date NOT NULL,
  `ALC_DT_ATUALIZACAO` date NOT NULL,
  PRIMARY KEY (`ALC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alc_alocacao`
--

LOCK TABLES `alc_alocacao` WRITE;
/*!40000 ALTER TABLE `alc_alocacao` DISABLE KEYS */;
INSERT INTO `alc_alocacao` VALUES (1,'Escritório de Inovações','2018-03-02','2018-03-02'),(2,'Fábrica de Software','2018-03-02','2018-03-02'),(3,'Pool de Consultores','2018-03-02','2018-03-02'),(4,'Núcleo de Arquitetura','2018-03-02','2018-03-02'),(5,'Divisão de Qualidade','2018-03-02','2018-03-02');
/*!40000 ALTER TABLE `alc_alocacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `col_colaborador`
--

DROP TABLE IF EXISTS `col_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `col_colaborador` (
  `COL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ALC_ID` bigint(20) DEFAULT NULL,
  `CON_ID` bigint(20) DEFAULT NULL,
  `CPT_ID` bigint(20) DEFAULT NULL,
  `TIT_ID` bigint(20) DEFAULT NULL,
  `COL_NM_NOME` varchar(150) DEFAULT NULL,
  `COL_DS_DESCRICAO` varchar(500) DEFAULT NULL,
  `COL_PH_AVATAR` varchar(10000) DEFAULT NULL,
  `COL_AD_ALOCACAO` varchar(250) DEFAULT NULL,
  `COL_DT_CRIACAO` date NOT NULL,
  `COL_DT_ATUALIZACAO` date NOT NULL,
  `col_ad_endereco` varchar(255) DEFAULT NULL,
  `col_nm_titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COL_ID`),
  KEY `FKqby8d0piuun45734tk7np321k` (`ALC_ID`),
  KEY `FK80mbod3rr7vrqgfca84kgexl1` (`CON_ID`),
  KEY `FKpd46ays1wys35gvqa9dgomyg2` (`TIT_ID`),
  KEY `FKo0ls9q54rdsd04taq5uswc6kw` (`CPT_ID`),
  CONSTRAINT `FK80mbod3rr7vrqgfca84kgexl1` FOREIGN KEY (`CON_ID`) REFERENCES `con_contato` (`CON_ID`),
  CONSTRAINT `FKo0ls9q54rdsd04taq5uswc6kw` FOREIGN KEY (`CPT_ID`) REFERENCES `cpt_competencia` (`CPT_ID`),
  CONSTRAINT `FKpd46ays1wys35gvqa9dgomyg2` FOREIGN KEY (`TIT_ID`) REFERENCES `tit_titulo` (`TIT_ID`),
  CONSTRAINT `FKqby8d0piuun45734tk7np321k` FOREIGN KEY (`ALC_ID`) REFERENCES `alc_alocacao` (`ALC_ID`),
  CONSTRAINT `IRCOLALC` FOREIGN KEY (`ALC_ID`) REFERENCES `alc_alocacao` (`ALC_ID`),
  CONSTRAINT `IRCOLCPT` FOREIGN KEY (`CPT_ID`) REFERENCES `cpt_competencia` (`CPT_ID`),
  CONSTRAINT `IRCOLTIT` FOREIGN KEY (`COL_ID`) REFERENCES `tit_titulo` (`TIT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `col_colaborador`
--

LOCK TABLES `col_colaborador` WRITE;
/*!40000 ALTER TABLE `col_colaborador` DISABLE KEYS */;
INSERT INTO `col_colaborador` VALUES (1,2,NULL,NULL,2,'Daniel Matos','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,'2018-03-02','2018-03-02','SEPN 504 - Bloco A, Nº 100 - Asa Norte, Brasília - DF, 70730-521',NULL),(2,1,NULL,NULL,7,'Carlos Wallace','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,'2018-03-02','2018-03-02',' SEPN 504 - Bloco A, Nº 100 - Asa Norte, Brasília - DF, 70730-521',NULL),(3,4,NULL,NULL,9,'Luis Fernandes','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,'2018-03-02','2018-03-02','SEPN 504 - Bloco A, Nº 100 - Asa Norte, Brasília - DF, 70730-521',NULL),(4,1,NULL,NULL,10,'Bruno Taves','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,'2018-03-02','2018-03-02','SEPN 504 - Bloco A, Nº 100 - Asa Norte, Brasília - DF, 70730-521',NULL),(6,2,NULL,NULL,2,'Yuri Ederdon','dadsasdasd',NULL,NULL,'2018-03-05','2018-03-05','asdsadas',NULL),(7,2,NULL,NULL,1,'Daniel','dasdsadsa',NULL,NULL,'2018-03-05','2018-03-05','adasdsa',NULL);
/*!40000 ALTER TABLE `col_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_competencia`
--

DROP TABLE IF EXISTS `colaborador_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_competencia` (
  `col_id` bigint(20) NOT NULL,
  `cpt_id` bigint(20) NOT NULL,
  KEY `FKtlgg5odlymlluediys1k6cpmd` (`cpt_id`),
  KEY `FKmbkmg5asmvx7opg2xiao8cd27` (`col_id`),
  CONSTRAINT `FKmbkmg5asmvx7opg2xiao8cd27` FOREIGN KEY (`col_id`) REFERENCES `col_colaborador` (`COL_ID`),
  CONSTRAINT `FKtlgg5odlymlluediys1k6cpmd` FOREIGN KEY (`cpt_id`) REFERENCES `cpt_competencia` (`CPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_competencia`
--

LOCK TABLES `colaborador_competencia` WRITE;
/*!40000 ALTER TABLE `colaborador_competencia` DISABLE KEYS */;
INSERT INTO `colaborador_competencia` VALUES (3,3),(3,4),(3,5),(4,3),(4,5),(4,11),(4,12),(6,3),(6,5),(7,9),(7,10);
/*!40000 ALTER TABLE `colaborador_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `con_contato`
--

DROP TABLE IF EXISTS `con_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_contato` (
  `CON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `COL_ID` bigint(20) DEFAULT NULL,
  `CON_CD_NUMERO` varchar(150) DEFAULT NULL,
  `CON_DS_TIPO` varchar(250) DEFAULT NULL,
  `CON_DT_CRIACAO` date NOT NULL,
  `CON_DT_ATUALIZACAO` date NOT NULL,
  `TCO_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CON_ID`),
  KEY `FKr8n0ghqgel908b3u55tjadh5d` (`COL_ID`),
  KEY `FK2gj0wwtn131b426x197l7cwgy` (`TCO_ID`),
  CONSTRAINT `FK2gj0wwtn131b426x197l7cwgy` FOREIGN KEY (`TCO_ID`) REFERENCES `tco_tipo_contato` (`TCO_ID`),
  CONSTRAINT `FKr8n0ghqgel908b3u55tjadh5d` FOREIGN KEY (`COL_ID`) REFERENCES `col_colaborador` (`COL_ID`),
  CONSTRAINT `IRCOLCON` FOREIGN KEY (`COL_ID`) REFERENCES `col_colaborador` (`COL_ID`),
  CONSTRAINT `IRTCOCON` FOREIGN KEY (`TCO_ID`) REFERENCES `tco_tipo_contato` (`TCO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `con_contato`
--

LOCK TABLES `con_contato` WRITE;
/*!40000 ALTER TABLE `con_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `con_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpt_competencia`
--

DROP TABLE IF EXISTS `cpt_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpt_competencia` (
  `CPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CPT_NM_NOME` varchar(150) DEFAULT NULL,
  `CPT_DT_CRIACAO` date NOT NULL,
  `CPT_DT_ATUALIZACAO` date NOT NULL,
  PRIMARY KEY (`CPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpt_competencia`
--

LOCK TABLES `cpt_competencia` WRITE;
/*!40000 ALTER TABLE `cpt_competencia` DISABLE KEYS */;
INSERT INTO `cpt_competencia` VALUES (2,'UX','2018-03-02','2018-03-02'),(3,'HTML','2018-03-02','2018-03-02'),(4,'CSS','2018-03-02','2018-03-02'),(5,'Web Design','2018-03-02','2018-03-02'),(6,'JAVA','2018-03-02','2018-03-02'),(9,'Angular','2018-03-02','2018-03-02'),(10,'Angular JS','2018-03-02','2018-03-02'),(11,'Bootstrap','2018-03-02','2018-03-02'),(12,'Materialize','2018-03-02','2018-03-02');
/*!40000 ALTER TABLE `cpt_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rl_colaborador_competencia`
--

DROP TABLE IF EXISTS `rl_colaborador_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rl_colaborador_competencia` (
  `COL_ID` bigint(20) NOT NULL,
  `CPT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`COL_ID`,`CPT_ID`),
  KEY `IRRLCOM_idx` (`CPT_ID`),
  CONSTRAINT `FK2d9k8eupi46ex708bjfgqxhap` FOREIGN KEY (`CPT_ID`) REFERENCES `cpt_competencia` (`CPT_ID`),
  CONSTRAINT `FKgvy5wijoavl693fqql57tw4os` FOREIGN KEY (`COL_ID`) REFERENCES `col_colaborador` (`COL_ID`),
  CONSTRAINT `IRRLCOL` FOREIGN KEY (`COL_ID`) REFERENCES `col_colaborador` (`COL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IRRLCOM` FOREIGN KEY (`CPT_ID`) REFERENCES `cpt_competencia` (`CPT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rl_colaborador_competencia`
--

LOCK TABLES `rl_colaborador_competencia` WRITE;
/*!40000 ALTER TABLE `rl_colaborador_competencia` DISABLE KEYS */;
INSERT INTO `rl_colaborador_competencia` VALUES (1,3),(2,3),(1,4),(2,4),(2,5),(2,6),(2,9),(2,10),(2,11);
/*!40000 ALTER TABLE `rl_colaborador_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tco_tipo_contato`
--

DROP TABLE IF EXISTS `tco_tipo_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tco_tipo_contato` (
  `TCO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CON_ID` bigint(20) DEFAULT NULL,
  `TCO_NM_NOME` varchar(150) DEFAULT NULL,
  `TCO_DT_CRIACAO` date NOT NULL,
  `TCO_DT_ATUALIZACAO` date NOT NULL,
  PRIMARY KEY (`TCO_ID`),
  KEY `IRCONTCO` (`CON_ID`),
  CONSTRAINT `IRCONTCO` FOREIGN KEY (`CON_ID`) REFERENCES `con_contato` (`CON_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tco_tipo_contato`
--

LOCK TABLES `tco_tipo_contato` WRITE;
/*!40000 ALTER TABLE `tco_tipo_contato` DISABLE KEYS */;
INSERT INTO `tco_tipo_contato` VALUES (1,NULL,'Fixo','2018-03-05','2018-03-05'),(2,NULL,'Celular','2018-03-05','2018-03-05'),(3,NULL,'email','2018-03-05','2018-03-05'),(4,NULL,'Linkedin','2018-03-05','2018-03-05'),(5,NULL,'Facebook','2018-03-05','2018-03-05');
/*!40000 ALTER TABLE `tco_tipo_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tit_titulo`
--

DROP TABLE IF EXISTS `tit_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tit_titulo` (
  `TIT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TIT_NM_NOME` varchar(150) DEFAULT NULL,
  `TIT_DT_CRIACAO` date NOT NULL,
  `TIT_DT_ATUALIZACAO` date NOT NULL,
  PRIMARY KEY (`TIT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tit_titulo`
--

LOCK TABLES `tit_titulo` WRITE;
/*!40000 ALTER TABLE `tit_titulo` DISABLE KEYS */;
INSERT INTO `tit_titulo` VALUES (1,'Analista de Sistemas - Júnior','2018-03-02','2018-03-02'),(2,'Analista de Sistema - Pleno','2018-03-02','2018-03-02'),(3,'Analista de Sistemas - Sênior','2018-03-02','2018-03-02'),(4,'Desenvolvedor Júnior','2018-03-02','2018-03-02'),(5,'Desenvolvedor Pleno','2018-03-02','2018-03-02'),(6,'Desenvolvedor Sênior','2018-03-02','2018-03-02'),(7,'Arquiteto Júnior','2018-03-02','2018-03-02'),(8,'Arquiteto Pleno','2018-03-02','2018-03-02'),(9,'Arquiteto Sênior','2018-03-02','2018-03-02'),(10,'Coordenador de Projetos','2018-03-02','2018-03-02'),(11,NULL,'2018-03-05','2018-03-05');
/*!40000 ALTER TABLE `tit_titulo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-05 13:45:05

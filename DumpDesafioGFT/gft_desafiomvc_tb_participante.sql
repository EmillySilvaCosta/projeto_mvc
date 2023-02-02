CREATE DATABASE  IF NOT EXISTS `gft_desafiomvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gft_desafiomvc`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gft_desafiomvc
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_participante`
--

DROP TABLE IF EXISTS `tb_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_participante` (
  `id_participante` bigint NOT NULL AUTO_INCREMENT,
  `atividades` bit(1) NOT NULL,
  `atrasado` bit(1) NOT NULL,
  `atrasos` tinyblob,
  `cont` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `pontuacao_atividade` double NOT NULL,
  `pontuacao_presenca` double NOT NULL,
  `pontuacao_total` double NOT NULL,
  `presencas` tinyblob,
  `presente` bit(1) NOT NULL,
  `quatro_letras` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `grupo_id_grupo` bigint DEFAULT NULL,
  PRIMARY KEY (`id_participante`),
  KEY `FKphwcqyh94uxbv7s1t5x0jmiu2` (`grupo_id_grupo`),
  CONSTRAINT `FKphwcqyh94uxbv7s1t5x0jmiu2` FOREIGN KEY (`grupo_id_grupo`) REFERENCES `tb_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_participante`
--

LOCK TABLES `tb_participante` WRITE;
/*!40000 ALTER TABLE `tb_participante` DISABLE KEYS */;
INSERT INTO `tb_participante` VALUES (1,_binary '\0',_binary '\0',NULL,0,'isa@gft.com','Starter','Isabella Suto',0,0,0,NULL,_binary '\0','IAST',_binary '',1),(2,_binary '\0',_binary '\0',NULL,0,'Jang@gft.com','Starter','Jéssica Nagata',0,0,0,NULL,_binary '\0','JANG',_binary '',1),(3,_binary '\0',_binary '\0',NULL,0,'emily@gft.com','Júnior','Emily Costa',0,0,0,NULL,_binary '\0','EMIL',_binary '',2),(4,_binary '\0',_binary '\0',NULL,0,'julia@gft.com','Pleno','Julia Gubolin',0,0,0,NULL,_binary '\0','JLIA',_binary '',2),(5,_binary '\0',_binary '\0',NULL,0,'luan@gft.com','Sênior','Luan Silva',0,0,0,NULL,_binary '\0','LUAN',_binary '',3),(6,_binary '\0',_binary '\0',NULL,0,'alan@gft.com','Júnior','Alan Turing',0,0,0,NULL,_binary '\0','ALAN',_binary '',3),(7,_binary '\0',_binary '\0',NULL,0,'suzy@gft.com','Pleno','Suzy Silva',0,0,0,NULL,_binary '\0','SUZY',_binary '',3),(8,_binary '\0',_binary '\0',NULL,0,'carlos@gft.com','Trainee','Carlos Monte',0,0,0,NULL,_binary '\0','CARS',_binary '',4),(9,_binary '\0',_binary '\0',NULL,0,'leia@gft.com','Sênior','Leia Organa',0,0,0,NULL,_binary '\0','LEIA',_binary '',4),(10,_binary '\0',_binary '\0',NULL,0,'han@gft.com','Júnior','Han Solo',0,0,0,NULL,_binary '\0','HANZ',_binary '',4);
/*!40000 ALTER TABLE `tb_participante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 15:03:14

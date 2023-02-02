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
-- Table structure for table `tb_atividade`
--

DROP TABLE IF EXISTS `tb_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_atividade` (
  `id_atividade` bigint NOT NULL AUTO_INCREMENT,
  `data_entrega` datetime(6) DEFAULT NULL,
  `data_inicio` datetime(6) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `pontos_atribuidos_na_entrega` double NOT NULL,
  `status` bit(1) NOT NULL,
  `status_entrega` bit(1) NOT NULL,
  `evento_id_evento` bigint DEFAULT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `FK5s6tm52rrgsj3neeyrcqcyd58` (`evento_id_evento`),
  CONSTRAINT `FK5s6tm52rrgsj3neeyrcqcyd58` FOREIGN KEY (`evento_id_evento`) REFERENCES `tb_evento` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_atividade`
--

LOCK TABLES `tb_atividade` WRITE;
/*!40000 ALTER TABLE `tb_atividade` DISABLE KEYS */;
INSERT INTO `tb_atividade` VALUES (1,'2022-11-07 00:00:00.000000','2022-11-06 00:00:00.000000','Criar API',5,_binary '',_binary '\0',NULL),(2,'2022-11-08 00:00:00.000000','2022-11-07 00:00:00.000000','Implementação de testes',5,_binary '',_binary '\0',NULL),(3,'2022-11-09 00:00:00.000000','2022-11-08 00:00:00.000000','Criar projeto com arduíno',5,_binary '',_binary '\0',NULL),(4,'2022-11-08 00:00:00.000000','2022-11-08 00:00:00.000000','Assistir palestra Loiane Groner',5,_binary '',_binary '\0',NULL),(5,'2022-11-09 00:00:00.000000','2022-11-09 00:00:00.000000','TED Manas nas STEAM',5,_binary '',_binary '\0',NULL),(6,'2022-11-12 00:00:00.000000','2022-11-11 00:00:00.000000','Concurso de fantasia',5,_binary '',_binary '\0',NULL);
/*!40000 ALTER TABLE `tb_atividade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 15:03:15

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
-- Table structure for table `tb_grupo`
--

DROP TABLE IF EXISTS `tb_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grupo` (
  `id_grupo` bigint NOT NULL AUTO_INCREMENT,
  `atividades` bit(1) NOT NULL,
  `atrasos` bit(1) NOT NULL,
  `bonus_atividade` double NOT NULL,
  `bonus_presenca` double NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `num_integrantes` int NOT NULL,
  `pontuacao` int NOT NULL,
  `pontuacao_total` double NOT NULL,
  `presencas` bit(1) NOT NULL,
  `status` bit(1) NOT NULL,
  `evento_id_evento` bigint DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `FKblnriptkbhovo337aw7ba5e38` (`evento_id_evento`),
  CONSTRAINT `FKblnriptkbhovo337aw7ba5e38` FOREIGN KEY (`evento_id_evento`) REFERENCES `tb_evento` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grupo`
--

LOCK TABLES `tb_grupo` WRITE;
/*!40000 ALTER TABLE `tb_grupo` DISABLE KEYS */;
INSERT INTO `tb_grupo` VALUES (1,_binary '\0',_binary '\0',3,5,'Javeiros',2,0,0,_binary '\0',_binary '',1),(2,_binary '\0',_binary '\0',3,5,'Dev Girls',2,0,0,_binary '\0',_binary '',3),(3,_binary '\0',_binary '\0',3,5,'Dev Geek',3,0,0,_binary '\0',_binary '',5),(4,_binary '\0',_binary '\0',3,5,'R2-D2',3,0,0,_binary '\0',_binary '',2);
/*!40000 ALTER TABLE `tb_grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 15:03:16

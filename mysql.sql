CREATE DATABASE  IF NOT EXISTS `pizzariacalabresos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzariacalabresos`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzariacalabresos
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `pizzaria`
--

DROP TABLE IF EXISTS `pizzaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzaria` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(200) DEFAULT NULL,
  `password_usuario` varchar(300) DEFAULT NULL,
  `nivel_acesso_usuario` int DEFAULT NULL,
  `user_usuario` varchar(100) DEFAULT NULL,
  `cpf_usuario` char(11) DEFAULT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `celular_usuario` char(11) DEFAULT NULL,
  `rua_usuario` varchar(200) DEFAULT NULL,
  `bairro_usuario` varchar(200) DEFAULT NULL,
  `numeroCasa_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzaria`
--

LOCK TABLES `pizzaria` WRITE;
/*!40000 ALTER TABLE `pizzaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizzaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbentrega`
--

DROP TABLE IF EXISTS `tbentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbentrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_pedido_cliente` varchar(45) NOT NULL,
  `id_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_entrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbentrega`
--

LOCK TABLES `tbentrega` WRITE;
/*!40000 ALTER TABLE `tbentrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpagamento`
--

DROP TABLE IF EXISTS `tbpagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpagamento` (
  `id_tbpagamento` int NOT NULL AUTO_INCREMENT,
  `forma_pagamento` varchar(70) NOT NULL,
  `cartao` char(70) NOT NULL,
  PRIMARY KEY (`id_tbpagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpagamento`
--

LOCK TABLES `tbpagamento` WRITE;
/*!40000 ALTER TABLE `tbpagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbpagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedido`
--

DROP TABLE IF EXISTS `tbpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpedido` (
  `id_tbpedido` int NOT NULL AUTO_INCREMENT,
  `id_pizza` int NOT NULL,
  `id_pedido_cliente` int NOT NULL,
  `quantidade_pizza` int NOT NULL,
  PRIMARY KEY (`id_tbpedido`),
  KEY `id_pizza_idx` (`id_pizza`),
  CONSTRAINT `id_pizza` FOREIGN KEY (`id_pizza`) REFERENCES `tbpizzas` (`id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
INSERT INTO `tbpedido` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `tbpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedidocliente`
--

DROP TABLE IF EXISTS `tbpedidocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpedidocliente` (
  `id_pedido_cliente` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `hora_pedido` datetime NOT NULL,
  `status_pedido` int NOT NULL,
  `valor_total` varchar(45) NOT NULL,
  `tipo_pagamento` varchar(70) NOT NULL,
  `pagamento` tinyint NOT NULL,
  PRIMARY KEY (`id_pedido_cliente`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_pedido_cliente` FOREIGN KEY (`id_pedido_cliente`) REFERENCES `tbpedido` (`id_tbpedido`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `pizzaria` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedidocliente`
--

LOCK TABLES `tbpedidocliente` WRITE;
/*!40000 ALTER TABLE `tbpedidocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbpedidocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpizzas`
--

DROP TABLE IF EXISTS `tbpizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpizzas` (
  `id_pizza` int NOT NULL AUTO_INCREMENT,
  `nome_pizza` varchar(200) NOT NULL,
  `caminho_img_pizza` varchar(200) NOT NULL,
  `descricao_pizza` varchar(300) NOT NULL,
  `valor_pizza` decimal(20,0) NOT NULL,
  `estoque_pizza` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpizzas`
--

LOCK TABLES `tbpizzas` WRITE;
/*!40000 ALTER TABLE `tbpizzas` DISABLE KEYS */;
INSERT INTO `tbpizzas` VALUES (1,'Peperoni','img.jpg','isso ai',100,'1');
/*!40000 ALTER TABLE `tbpizzas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-14 20:11:58

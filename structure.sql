-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: laferme
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alimentation`
--

DROP TABLE IF EXISTS `alimentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alimentation` (
  `fkplante` int(10) unsigned NOT NULL,
  `fkanimal` int(10) unsigned NOT NULL,
  `annee` tinyint(4) NOT NULL,
  `qtx` smallint(6) NOT NULL COMMENT 'quantite de plante consommee par an, unite kg',
  PRIMARY KEY (`fkplante`,`fkanimal`,`annee`),
  KEY `plante_idx` (`fkplante`),
  KEY `animal_idx` (`fkanimal`),
  CONSTRAINT `idanimal` FOREIGN KEY (`fkanimal`) REFERENCES `animal` (`idanimal`),
  CONSTRAINT `idplante` FOREIGN KEY (`fkplante`) REFERENCES `plante` (`idplante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animal` (
  `idanimal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idanimal`),
  UNIQUE KEY `nom_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culture`
--

DROP TABLE IF EXISTS `culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `culture` (
  `idculture` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fkplante` int(10) unsigned NOT NULL,
  `annee` tinyint(3) unsigned NOT NULL,
  `rendement` int(10) unsigned NOT NULL COMMENT 'en kg',
  `fkterrain` int(10) unsigned NOT NULL,
  `fkresponsable` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idculture`),
  UNIQUE KEY `uniqueCouple` (`fkplante`,`fkterrain`,`annee`),
  KEY `plante_idx` (`fkplante`),
  KEY `terrain_idx` (`fkterrain`),
  CONSTRAINT `plante` FOREIGN KEY (`fkplante`) REFERENCES `plante` (`idplante`),
  CONSTRAINT `terrain` FOREIGN KEY (`fkterrain`) REFERENCES `terrain` (`idterrain`)
) ENGINE=InnoDB AUTO_INCREMENT=1404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elevage`
--

DROP TABLE IF EXISTS `elevage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `elevage` (
  `idelevage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fkanimal` int(10) unsigned NOT NULL,
  `fkterrain` int(10) unsigned NOT NULL,
  `capacite` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idelevage`),
  KEY `animal_idx` (`fkanimal`),
  KEY `terrain_idx` (`fkterrain`),
  CONSTRAINT `animal` FOREIGN KEY (`fkanimal`) REFERENCES `animal` (`idanimal`),
  CONSTRAINT `idterrain` FOREIGN KEY (`fkterrain`) REFERENCES `terrain` (`idterrain`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employe` (
  `idemploye` int(10) unsigned NOT NULL,
  `nom` varchar(45) NOT NULL,
  `fkposte` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`idemploye`),
  KEY `poste_idx` (`fkposte`),
  CONSTRAINT `poste` FOREIGN KEY (`fkposte`) REFERENCES `poste` (`idposte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `plante`
--

DROP TABLE IF EXISTS `plante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plante` (
  `idplante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `fktype` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idplante`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  KEY `type_idx` (`fktype`),
  CONSTRAINT `type` FOREIGN KEY (`fktype`) REFERENCES `type_plante` (`idtype_plante`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poste`
--

DROP TABLE IF EXISTS `poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poste` (
  `idposte` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idposte`),
  UNIQUE KEY `nom_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productionviande`
--

DROP TABLE IF EXISTS `productionviande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productionviande` (
  `fkelevage` int(10) unsigned NOT NULL,
  `annee` tinyint(4) unsigned NOT NULL,
  `quantite` int(11) unsigned NOT NULL COMMENT 'en kg pour un an',
  PRIMARY KEY (`annee`,`fkelevage`),
  KEY `idelevage` (`fkelevage`),
  CONSTRAINT `idelevage` FOREIGN KEY (`fkelevage`) REFERENCES `elevage` (`idelevage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produit` (
  `idproduit` int(10) unsigned NOT NULL,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terrain`
--

DROP TABLE IF EXISTS `terrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `terrain` (
  `idterrain` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `surface` float unsigned NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `fktype_terre` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idterrain`),
  UNIQUE KEY `longitude_UNIQUE` (`longitude`),
  UNIQUE KEY `latitude_UNIQUE` (`latitude`),
  KEY `type_terre_idx` (`fktype_terre`),
  CONSTRAINT `type_terre` FOREIGN KEY (`fktype_terre`) REFERENCES `type_terre` (`idtype_terre`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `traitement` (
  `fkproduit` int(10) unsigned NOT NULL,
  `fkculture` int(10) unsigned NOT NULL,
  `qtx` smallint(6) unsigned NOT NULL COMMENT 'en kg',
  PRIMARY KEY (`fkproduit`,`fkculture`),
  KEY `culture_idx` (`fkculture`),
  CONSTRAINT `culture` FOREIGN KEY (`fkculture`) REFERENCES `culture` (`idculture`),
  CONSTRAINT `produit` FOREIGN KEY (`fkproduit`) REFERENCES `produit` (`idproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_plante`
--

DROP TABLE IF EXISTS `type_plante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type_plante` (
  `idtype_plante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idtype_plante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_terre`
--

DROP TABLE IF EXISTS `type_terre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type_terre` (
  `idtype_terre` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idtype_terre`),
  UNIQUE KEY `nom_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-07  5:47:12

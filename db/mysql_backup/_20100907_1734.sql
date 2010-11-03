-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.3


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema depot2_development
--

CREATE DATABASE IF NOT EXISTS depot2_development;
USE depot2_development;

--
-- Definition of table `depot2_development`.`containers`
--

DROP TABLE IF EXISTS `depot2_development`.`containers`;
CREATE TABLE  `depot2_development`.`containers` (
  `id` int(11) NOT NULL auto_increment,
  `template` text,
  `descripcion` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`containers`
--

/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
LOCK TABLES `containers` WRITE;
INSERT INTO `depot2_development`.`containers` VALUES  (2,'principal_coop_virazon','Virazón','2010-09-07 15:05:27','2010-09-07 15:06:06'),
 (3,'principal_coop_gardeliana','Gardeliana','2010-09-07 15:05:52','2010-09-07 15:05:52');
UNLOCK TABLES;
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`contenidos`
--

DROP TABLE IF EXISTS `depot2_development`.`contenidos`;
CREATE TABLE  `depot2_development`.`contenidos` (
  `id` int(11) NOT NULL auto_increment,
  `redenderer` varchar(255) default NULL,
  `ubicacion` int(11) default NULL,
  `tiempo_muestreo` int(11) default NULL,
  `tipo` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`contenidos`
--

/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
LOCK TABLES `contenidos` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`profiles`
--

DROP TABLE IF EXISTS `depot2_development`.`profiles`;
CREATE TABLE  `depot2_development`.`profiles` (
  `id` int(11) NOT NULL auto_increment,
  `identificador` varchar(255) default NULL,
  `descripcion` varchar(255) default NULL,
  `container_id` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`profiles`
--

/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
LOCK TABLES `profiles` WRITE;
INSERT INTO `depot2_development`.`profiles` VALUES  (2,'profile_virazon','Usuario cliente virazon',2,'2010-09-07 15:39:18','2010-09-07 18:43:25'),
 (3,'profile_gardeliana','Usuario cliente Gardeliana',3,'2010-09-07 15:39:39','2010-09-07 18:43:40');
UNLOCK TABLES;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`schema_migrations`
--

DROP TABLE IF EXISTS `depot2_development`.`schema_migrations`;
CREATE TABLE  `depot2_development`.`schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`schema_migrations`
--

/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
LOCK TABLES `schema_migrations` WRITE;
INSERT INTO `depot2_development`.`schema_migrations` VALUES  ('20100527151541'),
 ('20100605023905'),
 ('20100720024952'),
 ('20100827154527'),
 ('20100827163013');
UNLOCK TABLES;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`sessions`
--

DROP TABLE IF EXISTS `depot2_development`.`sessions`;
CREATE TABLE  `depot2_development`.`sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `depot2_development`.`sessions` VALUES  (1,'8cd6c724f93202d8e0ee2b1b42e2f8ab','BAh7CDoQX2NzcmZfdG9rZW4iMXJ6aGpRSG9WeU5hK3N6eS9NcHBUeEdJa3Zx\nbSswakF1bklZT1BDS0oxM3M9Ogx1c2VyX2lkaQciCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-07 13:01:59','2010-09-07 20:30:52');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`users`
--

DROP TABLE IF EXISTS `depot2_development`.`users`;
CREATE TABLE  `depot2_development`.`users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `hashed_password` varchar(255) default NULL,
  `salt` varchar(255) default NULL,
  `profile_id` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `depot2_development`.`users` VALUES  (2,'usrvira','6a577e857db3911e7dcdf2d0af6621566e37620d','-6087857080.164033181554388',2,'2010-09-07 19:06:29','2010-09-07 19:06:29'),
 (3,'usrgar','fa24f4888147f64d6edf0ce740b7c1093fc7b3f3','-6058907280.0854223355068845',3,'2010-09-07 19:06:50','2010-09-07 19:06:50');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

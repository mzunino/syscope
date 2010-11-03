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
INSERT INTO `depot2_development`.`containers` VALUES  (1,'principal_coop_virazon','Virazón','2010-09-07 15:05:27','2010-09-07 15:06:06'),
 (2,'principal_coop_gardeliana','Gardeliana','2010-09-07 15:05:52','2010-09-07 15:05:52');
UNLOCK TABLES;
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`contenidos`
--

DROP TABLE IF EXISTS `depot2_development`.`contenidos`;
CREATE TABLE  `depot2_development`.`contenidos` (
  `id` int(11) NOT NULL auto_increment,
  `descripcion` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `rotacion` int(11) default NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`contenidos`
--

/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
LOCK TABLES `contenidos` WRITE;
INSERT INTO `depot2_development`.`contenidos` VALUES  (1,'lunes 19 de octubre de 2009\r\nJornada de Integración. ','2010-09-14 13:13:18','2010-09-14 14:54:37',20,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`elementos`
--

DROP TABLE IF EXISTS `depot2_development`.`elementos`;
CREATE TABLE  `depot2_development`.`elementos` (
  `id` int(11) NOT NULL auto_increment,
  `contenido_id` int(11) NOT NULL,
  `valor` varchar(255) default NULL,
  `tipo_id` int(11) NOT NULL,
  `ubicacion` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`elementos`
--

/*!40000 ALTER TABLE `elementos` DISABLE KEYS */;
LOCK TABLES `elementos` WRITE;
INSERT INTO `depot2_development`.`elementos` VALUES  (1,1,'Jornada de Integración.',1,1,'2010-09-14 13:48:51','2010-09-14 13:50:27'),
 (2,1,'Compañer@s: Finalmente realizamos la dichosa jornada de integración. Colgamos las fotos que sacamos para que, los que pudieron ir, recuerden esos inolvidables momentos; y los que no pudieron, se arrepientan eternamente y juren que nuuuuuunca más en la vid',1,3,'2010-09-14 13:50:51','2010-09-14 13:52:32'),
 (3,1,'http://1.bp.blogspot.com/_HVsObiMuNWI/St0HEPadtZI/AAAAAAAAAlw/lN_XrfzFUCs/s320/la+mujer+paleta.jpg',2,2,'2010-09-14 13:51:42','2010-09-14 13:52:41'),
 (4,1,'http://4.bp.blogspot.com/_HVsObiMuNWI/SGBDpuqXxaI/AAAAAAAAABs/wLu2WsQVesg/S1600-R/VIRAZON.jpg',2,2,'2010-09-14 13:52:18','2010-09-14 18:38:04');
UNLOCK TABLES;
/*!40000 ALTER TABLE `elementos` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`line_items`
--

DROP TABLE IF EXISTS `depot2_development`.`line_items`;
CREATE TABLE  `depot2_development`.`line_items` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`line_items`
--

/*!40000 ALTER TABLE `line_items` DISABLE KEYS */;
LOCK TABLES `line_items` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `line_items` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`orders`
--

DROP TABLE IF EXISTS `depot2_development`.`orders`;
CREATE TABLE  `depot2_development`.`orders` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `address` text,
  `email` varchar(255) default NULL,
  `pay_type` varchar(10) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
LOCK TABLES `orders` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`products`
--

DROP TABLE IF EXISTS `depot2_development`.`products`;
CREATE TABLE  `depot2_development`.`products` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `description` text,
  `image_url` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `price` decimal(8,2) default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
LOCK TABLES `products` WRITE;
INSERT INTO `depot2_development`.`products` VALUES  (1,'Pragmatic Project Automation','<p>\n       <em>Pragmatic Project Automation</em> shows you how to improve the \n       consistency and repeatability of your project\'s procedures using \n       automation to reduce risk and errors.\n      </p>\n      <p>\n        Simply put, we\'re going to put this thing called a computer to work \n        for you doing the mundane (but important) project stuff. That means \n        you\'ll have more time and energy to do the really \n        exciting---and difficult---stuff, like writing quality code.\n      </p>','/images/auto.jpg','2010-09-14 16:07:39','2010-09-14 16:07:39','29.95'),
 (2,'Pragmatic Version Control','<p>\n         This book is a recipe-based approach to using Subversion that will \n         get you up and running quickly---and correctly. All projects need\n         version control: it\'s a foundational piece of any project\'s \n         infrastructure. Yet half of all project teams in the U.S. don\'t use\n         any version control at all. Many others don\'t use it well, and end \n         up experiencing time-consuming problems.\n      </p>','/images/svn.jpg','2010-09-14 16:07:39','2010-09-14 16:07:39','28.50'),
 (3,'Pragmatic Unit Testing (C#)','<p>\n        Pragmatic programmers use feedback to drive their development and \n        personal processes. The most valuable feedback you can get while \n        coding comes from unit testing.\n      </p>\n      <p>\n        Without good tests in place, coding can become a frustrating game of \n        \"whack-a-mole.\" That\'s the carnival game where the player strikes at a \n        mechanical mole; it retreats and another mole pops up on the opposite side \n        of the field. The moles pop up and down so fast that you end up flailing \n        your mallet helplessly as the moles continue to pop up where you least \n        expect them.\n      </p>','/images/utc.jpg','2010-09-14 16:07:39','2010-09-14 16:07:39','27.75');
UNLOCK TABLES;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


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
  `nivel` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`profiles`
--

/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
LOCK TABLES `profiles` WRITE;
INSERT INTO `depot2_development`.`profiles` VALUES  (2,'profile_virazon','Usuario cliente virazon',1,'2010-09-07 15:39:18','2010-09-14 15:42:54',0),
 (3,'profile_gardeliana','Usuario cliente Gardeliana',2,'2010-09-07 15:39:39','2010-09-14 15:42:45',0);
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
INSERT INTO `depot2_development`.`schema_migrations` VALUES  ('20100527130244'),
 ('20100527130925'),
 ('20100527132509'),
 ('20100527151541'),
 ('20100604005411'),
 ('20100604005428'),
 ('20100605023905'),
 ('20100720024952'),
 ('20100827154527'),
 ('20100827163013'),
 ('20100912142629'),
 ('20100913124441'),
 ('20100914124137'),
 ('20100914124415'),
 ('20100914124504'),
 ('20100914131046'),
 ('20100914142629');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `depot2_development`.`sessions` VALUES  (5,'b824b66f90da8502c7741429a1622872','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxVTFQVzltY1BtYWw3eDVJ\nYi9jT2gyR09DVk0yK3E1YWJ6eGZHd1ZxckJ2az0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-14 16:28:29','2010-09-14 19:06:49');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`tipo_contenidos`
--

DROP TABLE IF EXISTS `depot2_development`.`tipo_contenidos`;
CREATE TABLE  `depot2_development`.`tipo_contenidos` (
  `id` int(11) NOT NULL auto_increment,
  `template` varchar(255) default NULL,
  `descripcion` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`tipo_contenidos`
--

/*!40000 ALTER TABLE `tipo_contenidos` DISABLE KEYS */;
LOCK TABLES `tipo_contenidos` WRITE;
INSERT INTO `depot2_development`.`tipo_contenidos` VALUES  (1,'template_noticias_1','Noticias','2010-09-14 14:36:25','2010-09-14 14:55:13');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tipo_contenidos` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`tipo_elementos`
--

DROP TABLE IF EXISTS `depot2_development`.`tipo_elementos`;
CREATE TABLE  `depot2_development`.`tipo_elementos` (
  `id` int(11) NOT NULL auto_increment,
  `template` varchar(255) default NULL,
  `descripcion` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`tipo_elementos`
--

/*!40000 ALTER TABLE `tipo_elementos` DISABLE KEYS */;
LOCK TABLES `tipo_elementos` WRITE;
INSERT INTO `depot2_development`.`tipo_elementos` VALUES  (1,'render_texto','Tipo de elemento Texto','2010-09-14 12:58:53','2010-09-14 12:58:53'),
 (2,'render_imagen','Tipo de elemento Imágen','2010-09-14 12:59:26','2010-09-14 12:59:26');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tipo_elementos` ENABLE KEYS */;


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

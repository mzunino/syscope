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
-- Definition of table `depot2_development`.`app_profiles`
--

DROP TABLE IF EXISTS `depot2_development`.`app_profiles`;
CREATE TABLE  `depot2_development`.`app_profiles` (
  `id` int(11) NOT NULL auto_increment,
  `app_id` int(11) default NULL,
  `profile_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `action` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`app_profiles`
--

/*!40000 ALTER TABLE `app_profiles` DISABLE KEYS */;
LOCK TABLES `app_profiles` WRITE;
INSERT INTO `depot2_development`.`app_profiles` VALUES  (1,1,2,'2010-09-21 14:33:57','2010-09-21 14:33:57',NULL),
 (3,2,2,'2010-09-21 14:34:41','2010-09-21 14:34:41',NULL),
 (4,3,4,'2010-09-21 14:34:57','2010-09-21 14:34:57',NULL),
 (5,2,4,'2010-09-21 14:35:36','2010-09-21 14:35:36',NULL),
 (6,4,2,'2010-10-04 18:35:33','2010-10-04 18:35:33',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_profiles` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`apps`
--

DROP TABLE IF EXISTS `depot2_development`.`apps`;
CREATE TABLE  `depot2_development`.`apps` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) default NULL,
  `controller` varchar(255) default NULL,
  `nivel` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`apps`
--

/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
LOCK TABLES `apps` WRITE;
INSERT INTO `depot2_development`.`apps` VALUES  (1,'Noticias ','app_noticias',0,'2010-09-21 12:53:39','2010-09-21 12:53:39'),
 (2,'Cuentas','app_cuentas',0,'2010-09-21 12:55:06','2010-09-21 12:55:06'),
 (3,'Administración','app_admin',1,'2010-09-21 12:55:24','2010-09-21 12:55:24'),
 (4,'Manejo de Noticias','contenidos/admin',0,'2010-10-04 18:35:10','2010-10-04 18:35:10');
UNLOCK TABLES;
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`asociacion_perfils`
--

DROP TABLE IF EXISTS `depot2_development`.`asociacion_perfils`;
CREATE TABLE  `depot2_development`.`asociacion_perfils` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) default NULL,
  `descripcion` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`asociacion_perfils`
--

/*!40000 ALTER TABLE `asociacion_perfils` DISABLE KEYS */;
LOCK TABLES `asociacion_perfils` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `asociacion_perfils` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
-- Definition of table `depot2_development`.`contenido_profiles`
--

DROP TABLE IF EXISTS `depot2_development`.`contenido_profiles`;
CREATE TABLE  `depot2_development`.`contenido_profiles` (
  `id` int(11) NOT NULL auto_increment,
  `contenido_id` int(11) NOT NULL,
  `profile_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`contenido_profiles`
--

/*!40000 ALTER TABLE `contenido_profiles` DISABLE KEYS */;
LOCK TABLES `contenido_profiles` WRITE;
INSERT INTO `depot2_development`.`contenido_profiles` VALUES  (2,1,2,'2010-09-16 16:05:27','2010-09-16 16:05:27'),
 (3,2,5,'2010-09-16 16:28:57','2010-09-16 16:28:57'),
 (4,1,5,'2010-09-16 16:41:31','2010-09-16 16:41:31'),
 (5,3,4,'2010-09-23 14:12:11','2010-09-23 14:12:11'),
 (6,8,2,'2010-09-23 18:22:58','2010-09-23 18:22:58'),
 (7,9,2,'2010-10-07 12:38:48','2010-10-07 12:38:48'),
 (20,1,4,'2010-10-21 20:27:51','2010-10-21 20:27:51'),
 (21,1,20,'2010-10-21 20:28:14','2010-10-21 20:28:14');
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenido_profiles` ENABLE KEYS */;


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
  `fecha` date default NULL,
  `app_id` int(11) default NULL,
  `fecha_inicio` date default NULL,
  `fecha_fin` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`contenidos`
--

/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
LOCK TABLES `contenidos` WRITE;
INSERT INTO `depot2_development`.`contenidos` VALUES  (1,'lunes 19 de octubre de 2009 Jornada de Integración. ','2010-09-14 13:13:18','2010-10-19 18:32:18',20,1,'2010-09-21',1,NULL,NULL),
 (2,'Noticias usuario virazón Extendido','2010-09-16 14:51:40','2010-09-16 14:51:40',20,1,'2010-09-16',1,NULL,NULL),
 (3,'Noticias administrador Virazón','2010-09-16 14:52:03','2010-09-16 14:52:03',20,1,'2010-09-16',1,NULL,NULL),
 (4,'Noticias para todos 4','2010-09-16 15:50:49','2010-10-20 19:22:27',10,1,'2010-09-16',1,NULL,NULL),
 (7,'Este es un contenido público, algo que se mostrara cuando no hayan usuarios logueados.','2010-09-23 13:15:33','2010-09-23 13:15:33',20,1,'2010-09-23',1,NULL,NULL),
 (8,'Servicios','2010-09-23 18:21:17','2010-09-23 18:21:17',10,1,'2010-09-23',1,NULL,NULL),
 (9,'MURGA COOPERATIVA VIRAZÓN','2010-10-07 12:35:34','2010-10-07 12:35:34',NULL,1,'2010-10-07',1,NULL,NULL),
 (10,'Contenido verificación pasos','2010-10-14 18:36:42','2010-10-14 18:36:42',NULL,1,NULL,1,NULL,NULL),
 (15,'Noticia #4','2010-10-15 12:48:30','2010-10-15 12:48:30',30,1,'2010-10-15',1,NULL,NULL);
INSERT INTO `depot2_development`.`contenidos` VALUES  (17,'Noticia prueba admin alta','2010-10-20 19:42:47','2010-10-20 19:42:47',NULL,1,NULL,1,NULL,NULL),
 (19,'Por lo menos el título','2010-10-20 19:44:40','2010-10-20 19:44:40',NULL,1,NULL,1,NULL,NULL),
 (20,'Noti 21-10 #1','2010-10-21 13:14:50','2010-10-21 13:14:50',NULL,1,NULL,1,NULL,NULL),
 (21,'noticia 21-10-10 #3','2010-10-21 18:30:40','2010-10-21 18:30:40',20,1,'0021-10-10',1,'0021-10-10','0021-10-10');
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`elementos`
--

DROP TABLE IF EXISTS `depot2_development`.`elementos`;
CREATE TABLE  `depot2_development`.`elementos` (
  `id` int(11) NOT NULL auto_increment,
  `contenido_id` int(11) NOT NULL,
  `valor` text,
  `tipo_id` int(11) NOT NULL,
  `ubicacion` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`elementos`
--

/*!40000 ALTER TABLE `elementos` DISABLE KEYS */;
LOCK TABLES `elementos` WRITE;
INSERT INTO `depot2_development`.`elementos` VALUES  (2,1,'Compañer@s: Finalmente realizamos la dichosa jornada de integración. Colgamos las fotos que sacamos para que, los que pudieron ir, recuerden esos inolvidables momentos; y los que no pudieron, se arrepientan eternamente y juren que nuuuuuunca más en la vid',1,2,'2010-09-14 13:50:51','2010-09-16 14:54:40'),
 (3,1,'/images/balon.jpg2',2,1,'2010-09-14 13:51:42','2010-10-05 15:17:00'),
 (5,2,'Contenido texto de noticia para usuario virazón extendido',1,2,'2010-09-16 14:55:15','2010-09-16 14:55:15'),
 (6,2,'images/auto.jpg',2,1,'2010-09-16 14:56:17','2010-09-16 14:56:17'),
 (7,3,'Contenido texto de noticia para usuario virazón ADMINSTRADOR',1,2,'2010-09-16 14:56:46','2010-09-16 14:56:46'),
 (8,3,'images/utc.jpg',2,1,'2010-09-16 14:57:10','2010-09-16 14:57:10'),
 (9,4,'Texto de una noticia para todos',1,2,'2010-09-16 15:51:17','2010-09-16 15:51:17'),
 (10,4,'/images/logo.png',2,1,'2010-09-16 15:52:16','2010-09-23 13:17:21'),
 (11,7,'/images/auto.jpg',2,1,'2010-09-23 13:17:08','2010-09-23 13:17:08'),
 (12,7,'Este es un contenido publico, es este lugar se ubicarán noticias destinadas al sitio, donde la gente podrá informarse como puede utilizar esta herramienta. En caso de que el sitio no tenga necesidad de utilizar autentificación, mostrará esta lista de contenidos',1,2,'2010-09-23 13:26:06','2010-09-23 13:28:34');
INSERT INTO `depot2_development`.`elementos` VALUES  (13,8,'<div id=\"content\"><a id=\"top\"></a> <div class=\"pad2\"></div>  <h2>Servicios</h2>   <div class=\"submenu\"> <a href=\"servicios.php\">Servicios</a> <strong>Asesoramiento      jurídico y artículos relacionados</strong> <a href=\"?p=contable\">Servicio      contable</a> <a href=\"?p=convenios\">Convenios</a></div> 	   <h4>Asesoramiento Jurídico</h4>    <p>Este asesoramiento está cubierto por la cuota gremial que abona mensualmente      la Cooperativa, y está a disposición en la sede de la Federación      (W. Ferreira Aldunate 1345 of 502 – 9010590) los días martes      (hábiles) de 18 a 20 hs.</p>   <p><strong>Legislación y artículos de interés</strong></p> <ul>     <li><a href=\"#a\" target=\"_blank\" class=\"marcadores\">Comentarios sobre la Ley 17062</a> (Retasación        y cuotas de amortización)</li>     <li><a href=\"#b\" target=\"_blank\" class=\"marcadores\"> Ley 17292 art. 47</a> (Fusión        de Cooperativas de vivienda)</li>      <li><a href=\"#c\" target=\"_blank\" class=\"marcadores\"> Ley 17296 art. 633</a> (Reintegro de        partes sociales)</li>     <li><a href=\"#d\" target=\"_blank\" class=\"marcadores\">Ley 17296 art. 634</a> (Representación        de los socios en la Cooperativa)<a name=\"a\"></a></li>     <li><a href=\"#f\" target=\"_blank\" class=\"marcadores\">Informe sobre la Tarifa de Saneamiento</a>        (Ver modificación al pie)</li>     <li><a href=\"servicios/tolvi.pdf\" target=\"_blank\" class=\"marcadores\">Decreto 76/998        - Texto Ordenado de la Ley de Vivienda (T.O.L.VI.)</a> (archivo DF)</li>      <li><a href=\"/servicios/ContratodeUsoyGoce.pdf\" target=\"_blank\">Contrato de Uso y Goce (archivo PDF) </a></li>     <li><a href=\"/servicios/RESCISIONContratodeUsoyGoce.pdf\" target=\"_blank\">Rescisión Contrato de Uso y Goce  (archivo PDF) </a></li>     <li><a href=\"/servicios/ESTATUTOS-AHORROPREVIO-USUARIOS.pdf\" target=\"_blank\">Estatutos: Ahorro Previo Usuarios (archivo PDF) </a></li>     <li><a href=\"/servicios/Institutos_de_Asistencia_Tecnica_Decreto_No_73-07.pdf\" target=\"_blank\">Nueva reglamentación de Institutos de Asistencia Técnica (archivo PDF) </a></li>     <li><a href=\"/servicios/Cooperativas_de_vivienda_y_Fondos_Sociales_Decreto_N_266_06.pdf\" target=\"_blank\">Reglamento de Control de las Cooperativas de Vivienda (archivo PDF) </a></li>     <li><a href=\"MVOTMAreglamentosdesubsidioalademanda.pdf\" target=\"_blank\">MVOTMA - Reglamento de Subsidio a la Demanda, R.M.   539/2008</a><br>        </li>     <li><a href=\"MVOTMAReglamentodePrestamosySubsidiosalaCuota.pdf\" target=\"_blank\">MVOTMA - Reglamento de   Préstamos y Subsidios a la Cuota RM 540/2008</a><br>   </li>     <li><a href=\"../afectaciondecuotas.xls\" target=\"_blank\">MVOTMA - Simulador de Cuota y   calculador de subsidios </a><br>       </li>     <li><a href=\"calculadordecuotaysubsidio.xls\" target=\"_blank\">MVOTMA&nbsp;- Calculador de cuota   y subsidio</a></li> </ul>    <h4>COMENTARIOS SOBRE LA LEY 17.062 (Retasación y cuotas)</h4>   <p>Con fecha 11 de enero de 1999, se publica en el D. Oficial la ley 17.062,      que establece normas relativas a préstamos para vivienda otorgados      por el Banco Hipotecario, en especial y entre otras; normas relativas a retasación      de vivienda y facilidades para el pago de cuotas.</p>   <p>Consultado por el profesional dicente, el Banco expresa que la normativa      establecida en la referida ley \"no comprende a las Cooperativas de Vivienda\"      sin perjuicio de lo expresado, en anteriores oportunidades realizadas las      gestiones pertinentes ante las autoridades de dicho Banco, se logró      que el beneficio otorgado por alguna ley o reglamentación se hiciera      extensivo al movimiento Cooperativo. Por lo que consideramos importante informar      que beneficios otorga la ley de referencia.</p>   <p>RETASACIÓN DE LAS UNIDADES.- El art. 11 establece: \"Autorizase      al BHU... a reducir el saldo de precio de la deuda hipotecaria, hasta igualar      el valor del 90% de la TASACIÓN realizada por sus servicios, atendiendo      a los valores de mercado, SIEMPRE QUE EL DEUDOR PROCEDA A SU CANCELACIÓN.      Los interesados que estuvieran al día de la fecha de promulgación      de la presente ley y hubieran cumplido con no menos del 50% de las cuotas      contratadas, tendrán derecho a este procedimiento, deduciendo del saldo      así calculado la parte que corresponde a amortización de los      pagos ya efectuados.</p>   <p>Como vemos éste artículo aún haciéndolo extensivo      a las Cooperativas no beneficia a éstas en lo referente a la disminución      de las cuotas, y tampoco creemos que las Cooperativas cuenten con posibilidad      de saldar el préstamo en su totalidad como exige el procedimiento.</p>   <p>CUOTAS.- El art. 1º de la ley que analizamos establece en su inciso      3, algo que puede interesar de futuro a las Cooperativas si se consigue que      el articulado pueda aplicarse a las mismas, en dicho artículo se establece:      INC. 3...\" ...Los prominentes compradores de viviendas pertenecientes      a las categorías I, II y III que hubieran contratado con el BHU con      anterioridad a la vigencia de la presente ley, tendrán derecho a que      la cuota NO SUPERE EN CASO ALGUNO EL REFERIDO 30% de los ingresos nominales      del núcleo familiar. Si resultaren cantidades impagas por la rebaja      de la cuota, SE TRASLADARÁN EN UNIDADES REAJUSTABLES, AL FINAL DEL      PLAZO CONTRACTUAL, SIN INTERESES NI RECARGOS, de ninguna especie, extendiéndose      el plazo de prestación de servicios hasta el máximo legal, transcurrido      el cual, el Banco queda facultado a DAR POR EXTINGUIDO EL SALDO.-\"...</p>    <p>Correspondería por parte de la Cooperativa, realizar un padrón      con la declaración jurada de todos sus socios y si la cuota que amortiza      la Cooperativa supera el 30% de los ingresos nominales de los mismos, se podría      solicitar acogerse al referido beneficio.-</p>   <a name=\"b\"></a>    <p>DR. ALBERTO RAFFO BALLESTEROS.<br>     ASESOR JURIDICO DE FE.CO.VI</p>   <div class=\"separador\"></div>   <a href=\"#top\" class=\"ampliar\">volver arriba</a>       <h4>Ley 17.292</h4>    <p><strong>TITULO II - FUSION DE COOPERATIVAS DE VIVIENDA.</strong></p>   <p>Artículo 47.</p>   <p>Las Cooperativas de Vivienda previstas en la Ley No. 13.728, de 17 de diciembre      de 1968, podrán fusionarse en todo caso, siempre y cuando el número      de socios de la resultante no sea superior a doscientos. A dichos efectos      se seguirán los trámites previstos en la Ley No. 16.060, de      4 de setiembre de 1989, en lo compatible. </p>   <p>No obstante, se faculta excepcionalmente la fusión entre cooperativas      de viviendas, que a la fecha de la promulgación de la presente ley      compartan el mismo complejo habitacional, hayan construido complejos habitacionales      contiguos o sean copropietarios de los mismos aunque la cooperativa resultante      de la fusión tengan mas de doscientos socios.</p>   <p>Si la cooperativa resultante de la fusión supera los doscientos socios,      se podrá por vía estatutaria crear el órgano asamblea      representativa. Esta se elegirá por voto secreto y tendrá las      mismas facultades que la asamblea general con excepción de las que      impliquen resolver la disolución, <a name=\"c\"></a>escisión o      fusión de la cooperativa o la reforma de sus estatutos y todas aquellas      limitaciones que le imponga el estatuto. Las resoluciones reservadas exclusivamente      a la asamblea general podrán aprobarse por acto eleccionario.</p>   <p>Fuente: DIARIO OFICIAL No. 25.695 del 29 de enero de 2001.</p>    <div class=\"separador\"></div>   <a href=\"#top\" class=\"ampliar\">volver arriba</a>       <h4> DIARIO OFICIAL No. 25.714 del 23 de febrero de 2001.</h4>   <p><b>Ley 17.296</b></p>   <p>Artículo 633.</p>   <p>Modifíquese el texto del inciso final del articulo 144 del Texto Ordenado      de la Ley 13.728, de 17 de diciembre de 1968, el que quedará redactado      de la siguiente forma:<br>      \"Artículo 144.- La cooperativa dispondrá de un plazo de <a name=\"d\"></a>      doce meses para hacer efectivo el pago del 50% (cincuenta porciento) del reintegro      al que el usuario tuviera derecho. El 50% (cincuenta porciento) restante deberá      hacerse efectivo en forma posterior a que sea designado el nuevo socio que      lo sustituya, pero no más tarde de tres años, contados a partir      del vencimiento del plazo anterior\"</p>   <div class=\"separador\"></div>   <a href=\"#top\" class=\"ampliar\">volver arriba</a>       <h4>POSIBILIDAD DE REPRESENTACIÓN DEL SOCIO EN CARGOS DE LA COOPERATIVA</h4>   <p>Con fecha 23 de febrero de 2001, se publíca en el Diario Oficial la      ley 17.296 que en su artículo 634 establece modificaciones entre otros      artículos al artículo 122 del T.O.L.VI. 13.728, a través      del siguiente texto:</p>   <p>Artículo 634.</p>    <p>Agregase al artículo 122 del Texto Ordenado de la Ley No. 13.728 del      17 de diciembre de 1968, el siguiente texto:<br>     \"Permítase, la representación del socio en cargos de la      cooperativa de carácter electivo, por integrantes del núcleo      habitacional del socio, como representante de éste requiriéndose,      que la propuesta sea formulada por el socio titular que el deleggado sea votado      por la masa social en la forma que dispone el artículo 115, literal      J) de la presente ley\".</p>   <p>El artículo 115 literal J establece: \"Las elecciones de miembros      de Consejos Directivos y de la Comisión Fiscal se efectuarán      en votación secreta y obligatoria y si se hicieran por medio de listas,      deberá aplicarse el principio de la representación proporcional      integral.\"</p>   <p>Como observamos la ley en su aplicación limita la representación      para el ejercicio de los cargos de Consejo Directivo y Comisión Fiscal      en el entendido que sean elegidos por la masa social en las elecciones que      se efectúen para dichos cargos. tampoco la ley establece los procedimientos      para el ejercicio de los derechos establecidos en la misma, entendemos que:</p> <ol>   <li>    En la especie asume importancia y diríamos casi se hace imprescindible        la regularización del PADRÓN SOCIO-ECONÓMICO, de cada        núcleo familiar, dado que solo del mismo se podrá establecer,        con las garantías debidas, quienes integran el núcleo familiar,        entendiendo que de no estar incluído en tiempo y forma en el padrón        socio económico y declaración jurada, se podrá rechazar        la propuesta que realice el socio, evitando de ésta manera que asuman        representación y por ende puedan administrar en la Cooperativa, personas        ajenas a la misma, o incluso familiares que no viven allí.   </li>    <li>      Debe entenderse que para ser representante del socio además de        integrar el núcleo familiar debe reunir las condiciones para ser        socio de la Cooperativa, entre ellas, y de carácter excluyente, tener        18 de edad.   </li>   <li>     Consideramos que para ejercer este derecho el socio deberá presentar        carta simple dirigida al Consejo Directivo, con su firma (no vemos necesario        que la misma sea certificada por escribano, o la necesidad de un poder),        previo al acto eleccionario, designando su representante, estableciendo        el nombre de quien lo representara, para que cargo y durante que tiempo        tendrá la representación. (entendemos que de ser electo el        representante en una elección el plazo será el que establezca        el estatuto para el cargo). Dicha carta deberá ser aprobada o rechazada        por el Consejo Directivo, y comunicada oportunamente al socio con anterioridad        a la elección, en caso de rechazo se deberá dar oportunidad        para que el socio levante las objeciones interpuestas, y en última        instancia será la Asamblea de la Cooperativa la que decida en el        tema.-   </li>   <li>      La Comisión Electoral deberá tener para cada elección        el padrón de socios habilitados y quienes se harán representar        con el nombre del representante y para que cargo (el voto lo sigue emitiendo        el socio titular, no debe confundirse la representación con el voto).-   </li> </ol> <p>Modificación a la ley 13.728, (reintegro de partes sociales a los socios)</p>   <p>Estudiada la propuesta de FUCVAM en lo referente a modificar el inciso final      del art. 152 de la ley 13.728 (plazos reintegro de partes sociales). Entendemos      que se comparte en su totalidad los fundamentos expuestos para solicitar la      modificación a dicho artículo.-<br>      Sin embargo entendemos que la extensión del plazo propuesto no soluciona      el problema en mérito a que las Cooperativas deben competir con financiaciones      a largo plazo, y por ende si no se establecen plazos mayores para realizar      la integración del capital social y por ende la devolución del      mismo.-<br>     Entendemos que también debe contemplarse el interés del socio      que se retira, por ende consideramos conveniente establecer una propuesta      que contemple ambos intereses y que permita hallar una solución definitiva,      por ende proponemos la siguiente modificación:</p>   <p>\"La Cooperativa dispondrá de un plazo de 180 días para      devolver el 20 % del reintegro a que el usuario tuviera derecho. El 80 % restante      deberá hacerse efectivo una vez designado el nuevo socio que lo sustituya.      En todos los casos de retiro del socio el mismo podrá proponer un nuevo      socio y la forma de integración de partes sociales a la Cooperativa, <a name=\"f\"></a>     que de ser aceptada por esta será devuelta en los mismos plazos, el      socio que se retira. La Cooperativa se reserva el derecho de aceptar o rechazar      al socio siempre por razones fundadas\".-</p>   <p>Dr. Alberto Raffo Ballesteros</p>   <div class=\"separador\"></div>    <a href=\"#top\" class=\"ampliar\">volver arriba</a>       <h4>INFORME SOBRE LA TARIFA DE SANEAMIENTO</h4>   <p>ANTECEDENTES.-</p> <p> La Tarifa de Saneamiento que aplica la Intendencia Municipal de Montevideo está    de acuerdo con lo exigido por el Banco Interamericano de Desarrollo en lo referente    a que, las obras de saneamiento que construye la Intendencia deben ser pagadas    por los usuarios en proporción a los consumos de agua que realice cada    usuario de vivienda.-<br>   Un grupo de vecinos interpuso un recurso ante el Parlamento, el cual fue rechazado,    quedando por ende vigente y en condiciones de aplicarse.-</p>   <p>FORMA DE APLICACIÓN</p>    <p>Fue creada a partir de Junio/01, con su primer cobro en Julio/01, luego de derogar    los conceptos de “Adicional de Saneamiento” de los Tributos Domiciliarios    y el “Alcantarillado” de la Contribución Inmobiliaria. Esta    tarifa deben pagarla los usuarios de inmuebles que hacen uso de las redes de    saneamiento y su cobro es bimestral. Tiene dos componentes, el cargo fijo y    un cargo variable en función de los consumos de agua de OSE. La Intendencia    ha fijado una tarifa con bonificación social de acuerdo al valor de la    vivienda y tres categorías de usuarios: 1) Usuario Residencial Común    2) Usuario Residencial con Bonificación Social (constituyendo este grupo    el 40% de las viviendas de Montevideo) y 3) Usuario no Residencial.</p>   <p>METODO DE CÁLCULO</p>   <p>De acuerdo a lo averiguado en la IMM, para calcular la Tarifa se debe aplicar:</p>   <p>1 – Un<strong> cargo fijo</strong> que a Marzo/03 es de $ 12.37 por      unidad habitacional y por mes. Recuérdese que la Tarifa de Saneamiento      se paga cada 2 meses, por lo tanto al hacer el cálculo, debe tenerse      esto en cuenta.</p>   <p>2 – Un <strong>cargo variable</strong> que a Marzo/03, se paga a razón      de $ 6.94 por m3 de agua consumida según factura de OSE.<br>      En la factura de la IMM aparecerán los consumos de agua (en m3) de      2 meses y sobre el total, se aplica el cargo variable.</p>   <p>Existe una bonificación de un 74% de descuento sobre el cargo      variable, hasta los primeros 12 m3 que se aplica según el valor imponible      de Catastro y según la zona a la que pertenezca la Cooperativa (datos      que se pueden consultar en la factura de la Contribución Inmobiliaria,      arriba en el encabezado).<br>     <a name=\"h\"></a>     Para las zonas 1 y 2, el descuento se aplica para los valores imponibles de      hasta 66.384 inclusive, por unidad habitacional (valor expresado en Unidades      Catastrales).<br>     Para la zona 3, el descuento se aplica para un valor imponible de hasta 240.640  inclusive, por unidad habitacional (valor expresado en Unidades Catastrales).</p>   <div class=\"separador\"></div>   <a href=\"#top\" class=\"ampliar\">volver arriba</a>    <div class=\"separador\"></div>  <div class=\"pad4\"></div> </div>',1,2,'2010-09-23 18:22:23','2010-09-23 18:28:07'),
 (14,9,'http://3.bp.blogspot.com/_HVsObiMuNWI/SiCqQm_i7VI/AAAAAAAAAaQ/cKPO58gPrIw/s200/Dibujo.jpg',2,1,'2010-10-07 12:37:37','2010-10-07 12:37:37');
INSERT INTO `depot2_development`.`elementos` VALUES  (15,9,'Voy con las riendas tensas y refrenando el vuelo porque no es lo importante llegar solo ni pronto sino juntos y a tiempo  León Felipe     Cooperativa ésta es una forma de andar compartiendo la vida, juntos se puede más. Frenando el vuelo, tal como lo dijo León, llegar juntos y a tiempo, solos nunca es mejor.  Como las partes de una cometa cola de serpentina, cambios de viento, virazón de la vida no afloja y tira que tira, cometa Cruz del Sur ventana abierta al sur uh uh la la la … (repite)   Acá está la cooperativa Vas a ver que va a funcionar (2 veces)  Vamos a llamar a  Chiche Al ñato Nacho Mariana Gardeliana Mateo Claudia   1. El chiche lo diche por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir 2. El ñato alegato, el chice lo diche por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir 3. El nacho gazpacho, el ñato alegato, el chiche lo diche , por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir 4. Mariana modera el nacho gazpacho, el ñato alegato, el chiche lo diche , por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir 5. Gardeliana insolada (virazón qué zafada), mariana modera el nacho gazpacho, el ñato alegato, el chiche lo diche , por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir 5. Mateo (cartel te lo debo), gardeliana insolada (virazón qué zafada) mariana modera el nacho gazpacho, el ñato alegato, el chiche lo diche , por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir 6. La claudia en guardia, mateo (cartel te lo debo), Gardeliana insolada (virazón qué zafada) mariana modera el nacho gazpacho, el ñato alegato, el chiche lo diche , por la afirmativa por la negativa contar abstenciones si no hay mas mociones vamo a seguir   Si usted tiene muchas ganar de ahorrrar – en ur Si usted tiene muchas ganas de ahorrar – en ur. Usted tiene la razón vengase pa virazón Pero escuche que hay alguna condición No se haga el dificilón Busquesé una comisión No falte a las asambleas Ni siquiera con diarrea Tos convulsa, seborrea O convulsión Cósale al bolsillo el forro Y con capacidad de ahorro Paso a paso irá creciendo virazón   Era un problema de difícil solución En una etapa importante de mi vida Quería algo más que levantar una pared Me decidi a formar una cooperativa Para empezar la construcción Despues de idas y venidas No imaginé que la situación Me enfrentaria con tantas alternativas  Porque yo no quiero ese IAT Demasiado formal No trabaja en equipo Mirá estos otros qué bien parece que laburan Pero no tienen experiencia con la altura Este otro esta muy bien, conocen bien la ley Trabajan en la zona Solo un detalle que no sé cómo coordinan ¿no saben el nombre de la cooperativa?   CUPLÉ DEL EDIFICIO  Che don edificio queríamos verte La gente está ansiosa, quiere conocerte Te quieren bonito y con vista al mar Pero no muy caro, tenemos que ahorrar…  1. Tendremos 16 pisos desde el suelo a la azotea Economizando espacio, tendremos sólo escalera No usaremos ascensores, que encarecen y es un vicio En esta cooperativa Se fomenta el ejercicio  2. Cómo era previsible, nadie quiere el piso 13 Así que hice una consulta a ver lo que les parece 7 votos parrillero 8 votos guardería 9 votos fútbol 5 25 wiskería  3. Por supuesto que una parte, con estripper para damas Que la coope no es machista, no queremos mala fama. Y como no hay ascensores, extendamos un agujero Siguiendo el baile del caño Bajamos como bomberos…  4. Las ventanas a la rambla encarecen demasiado Con lo que sopla ese viento, nos pondremos de costado Ché qué extraño de este lado Está todo muy desierto… Las casas son tan bajitas Y el barrio está un poco muerto  5. Con el desnivel del suelo ya me imagino cojeando Hay que conseguir escombros aunque sea de contrabando Se me ocurre los vecinos, tan tranquilos de acá al lado… No creo que les moleste Unos mármoles prestados…  6. La gente quiere tres cuartos con sus buenas dimensiones Bajar el tope de urs, y otras reivindicaciones. Si agrandamos la familia, y nos falla el casalito apuntamos a la abuela, Al perro y al canarito…',1,2,'2010-10-07 12:38:18','2010-10-07 12:38:18'),
 (16,10,'elemento verificación de pasos',1,1,'2010-10-14 18:38:38','2010-10-14 18:38:38');
INSERT INTO `depot2_development`.`elementos` VALUES  (18,15,'Elemento Noticia #4',1,1,'2010-10-15 12:48:30','2010-10-15 12:48:30');
UNLOCK TABLES;
/*!40000 ALTER TABLE `elementos` ENABLE KEYS */;


--
-- Definition of table `depot2_development`.`func_apps`
--

DROP TABLE IF EXISTS `depot2_development`.`func_apps`;
CREATE TABLE  `depot2_development`.`func_apps` (
  `id` int(11) NOT NULL auto_increment,
  `app_id` int(11) default NULL,
  `nombre` varchar(255) default NULL,
  `action` varchar(255) default NULL,
  `descripcion` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`func_apps`
--

/*!40000 ALTER TABLE `func_apps` DISABLE KEYS */;
LOCK TABLES `func_apps` WRITE;
INSERT INTO `depot2_development`.`func_apps` VALUES  (1,1,'Admin Noticias','new','Administración de noticias.','2010-10-05 11:44:27','2010-10-07 15:11:49');
UNLOCK TABLES;
/*!40000 ALTER TABLE `func_apps` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`profiles`
--

/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
LOCK TABLES `profiles` WRITE;
INSERT INTO `depot2_development`.`profiles` VALUES  (2,'profile_virazon_usuario','Usuario cliente virazon',1,'2010-09-07 15:39:18','2010-09-16 14:49:21',0),
 (3,'profile_gardeliana','Usuario cliente Gardeliana',2,'2010-09-07 15:39:39','2010-09-14 15:42:45',0),
 (4,'profile_virazon_admin','Perfil administrador Virazon',1,'2010-09-16 14:41:06','2010-09-16 14:41:06',1),
 (5,'profile_virazon_usuario_extendido','Usuario cliente extendido Virazón',1,'2010-09-16 14:41:54','2010-09-16 14:41:54',0);
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
 ('20100914142629'),
 ('20100915024637'),
 ('20100916142543'),
 ('20100916190800'),
 ('20100921115319'),
 ('20100921115513'),
 ('20100921120350'),
 ('20101004183809'),
 ('20101005114138'),
 ('20101015191151'),
 ('20101015191210');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `depot2_development`.`sessions` VALUES  (5,'b824b66f90da8502c7741429a1622872','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxVTFQVzltY1BtYWw3eDVJ\nYi9jT2gyR09DVk0yK3E1YWJ6eGZHd1ZxckJ2az0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-14 16:28:29','2010-09-14 19:06:49'),
 (6,'0db2b4cd97e8902927b41bc48e58dc7a','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxVDkvOEMzcVdpZXhsZWY3\nUG9GM1pXRFlYbEhvY2xhdWVrbnRNZkdHRUUvND0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-15 20:12:25','2010-09-15 20:26:05'),
 (7,'4e40a505aaf43afb7e065581f2ddc8a1','BAh7CDoMdXNlcl9pZGkJOhBfY3NyZl90b2tlbiIxaVVmQmtFMzN5UDdVUTZZ\nNW5tUDV4dmErTlJ1cU1kZkF0aFhNY3lLWWNSbz0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-16 14:40:22','2010-09-16 18:52:05'),
 (8,'7fd2d8b49d0d3fff35419099a3297ae8','BAh7BzoMdXNlcl9pZGkJOhBfY3NyZl90b2tlbiIxWEtwQ1Jpb1BNdDB6dVFJ\nZEtZNzZ2UzVDL3hlSzRoc0RoaFBqeStIMTZxTT0=\n','2010-09-17 15:11:55','2010-09-17 15:12:04'),
 (9,'d0212339d01ba89222a812296471c323','BAh7BzoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxMk1EQzM2OS84Q3hlR1Er\nWkY0Z1dxME5yS05tTWg3U3Ryc1JJQ0FENm12ND0=\n','2010-09-17 20:16:56','2010-09-17 20:17:11');
INSERT INTO `depot2_development`.`sessions` VALUES  (10,'93e5556d02843c0ac70a35b130f9679d','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxUXBycWFBa2RKNmFBZ0gw\nU2dYTTRFQ0JWalNYOEVOb1l6NXUzbkR3SVV5UT0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-20 11:21:07','2010-09-20 11:58:45'),
 (11,'ae89bf0bf38bbf3745759a075a4c721d','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxQ3NURnl1VVNJejVNZyta\nRG1UT0xneFIwQkRpNWtRb0tjNUZyVVkvNGtwUT0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-21 12:29:21','2010-09-21 14:35:38'),
 (12,'8ce35a48eed943b31bf8243d2b856f4f','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxaGdmbTBTdjdaWElWeWV1\nUUNNK1NObUtJWHJaSzZUQUZrWmgxeXBYTWpSTT0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIiJObyBz\nZSBwdWRvIG9idGVuZXIgbGEgbm90aWNpYQY6CkB1c2VkewY7CEY=\n','2010-09-22 18:14:50','2010-09-22 20:51:23'),
 (13,'34e721162c4d60ddc46063bacad238cb','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxblpIcFVlbVBBbkxIc2VR\neVlqbC9RMDNaSFFzMHpHY0Z4T1ZFUmpocDRhOD0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-23 12:38:55','2010-09-23 18:28:21'),
 (14,'d011e05e6cdf019e3d56c9ae47cecadf','BAh7CToMdXNlcl9pZGkHOg9wcm9maWxlX2lkaQc6EF9jc3JmX3Rva2VuIjEx\nUHJuVFgydTdhTFRtSVdmbU4xZGU2T2VEeFpsK0ZQWlpKT0EvczJKMnVjPSIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7AA==\n','2010-09-24 14:37:08','2010-09-24 18:19:32');
INSERT INTO `depot2_development`.`sessions` VALUES  (15,'01473774c774682e9ba3aee0198a39fb','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxT0ZBd3BLenYxOGRZcld0\ndVRiMHhYdTdFWENEZVl3Wm5ENUpaeWJtOVNaZz06D3Byb2ZpbGVfaWRpBw==\n','2010-09-28 11:59:42','2010-09-28 11:59:57'),
 (16,'22883b6a7630630c5a6fd5127b0b76d7','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxT1RqWWd4WDhiUVlacXBT\nOVNQWWdwaklrZENoN1hIMmdXN0RMOE5TTFMwQT06D3Byb2ZpbGVfaWRpBw==\n','2010-09-29 19:36:03','2010-09-29 19:36:13'),
 (17,'9197ac4a51962ee9cfdd4e8634a0e579','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxeXdnZkZXc2hFR2pTblNq\nV2hnMWFveUVMdGhHSEFNMDJDWG1mUm54S082OD06D3Byb2ZpbGVfaWRpByIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7AA==\n','2010-10-01 19:43:06','2010-10-01 22:37:20'),
 (18,'e8f798b5f3cb03f6b087f98356a7ecbc','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxMElieGppYmEzWnh0bitF\nQ1RsQVk4TENvL05lMzZYRG1PL2UyOUZzWUM3UT06D3Byb2ZpbGVfaWRpByIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsG\nOgtub3RpY2UiKUFwcFByb2ZpbGUgd2FzIHN1Y2Nlc3NmdWxseSBjcmVhdGVk\nLgY6CkB1c2VkewY7CVQ=\n','2010-10-04 10:30:18','2010-10-04 18:35:33'),
 (19,'130c79daef3fe8dd49a11053ebb5d8fa','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxSlVyeVcrWHlyWSs4SzNy\nNEp3NUlUTGNMUUc5TmVGZDltM1Z0VkZPeVRHcz0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-05 10:24:41','2010-10-05 15:17:06');
INSERT INTO `depot2_development`.`sessions` VALUES  (20,'da763207285982b14ff63843994e1258','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxN2xLaS9RYUhFV0JEMXQ0\nOWNpUHMrcjk0YjQwVGxkSlBEaEhuR1liZ0Z6Zz06D3Byb2ZpbGVfaWRpBw==\n','2010-10-06 18:01:06','2010-10-06 18:02:18'),
 (21,'78c396e0f1c388f24536e8f8b6cac112','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxRTdDL0NUdEN5dHJZNHpt\nM085eDhzV3E4SXdjQUVEOUk4QS9sWUJXaTVnaz06D3Byb2ZpbGVfaWRpBw==\n','2010-10-06 19:50:15','2010-10-06 20:00:05'),
 (22,'cb050adfcf97a962613a5cc4c5a36353','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxWlpHVHJnaDgyRHU0M3ZH\nam5aaUVYQktDQ0laSWlPTlg5WlRUTmxEbmNVQT0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-07 11:33:49','2010-10-07 15:11:53'),
 (23,'c529b89eb115d03a9be0194ebaaa5e5d','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxWTlPYStYYW1rVFBVVE5a\nNmlxeTVzQk8wTHpoeWZJRDEwc2xMUVZSYlY3cz0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-08 11:40:56','2010-10-08 19:32:09'),
 (24,'a99fdfc38f7e55cb5a3262bef0878a07','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxWXdya1JpZ0FVbjl3YWsy\nZEU3N2xtTllGaUU2dDR6clQ4bHhnYjN5Z3dyaz0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-12 10:37:28','2010-10-12 12:51:32');
INSERT INTO `depot2_development`.`sessions` VALUES  (25,'ac771d7b428e051c5eed1486a2bc1b46','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxR0w0K0M0anJySFAvendN\ndW1tb3FPZTRLSlNBMExJcWZpUDlFOVE0Tjhhbz06D3Byb2ZpbGVfaWRpBw==\n','2010-10-13 17:51:47','2010-10-13 17:52:00'),
 (26,'ebf911fa461f92a5b6f7ecc381a3e38f','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxNlgxMExzQUgxODNYUFZ3\neVVmS2IzUHVtUUFXNzJUeTVSUUdiMUxTTW52Zz06D3Byb2ZpbGVfaWRpBw==\n','2010-10-14 12:07:59','2010-10-14 12:08:06'),
 (27,'0b628cb7aa5da6d51c59e6e215fb30d2','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxRllrQXd4c2w1NXB0akVH\nMXlUc2VIcUJWUjRwdlVlVHU3Y0xIdmlua01aMD0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-14 18:27:38','2010-10-14 19:36:54'),
 (28,'994e871db5f0531a92d6e0b84a4c9616','BAh7CToPcHJvZmlsZV9pZGkHOgx1c2VyX2lkaQc6EF9jc3JmX3Rva2VuIjFW\nYkZYMkhmRzlZOWovREhMcXh0WGNoV1lvWC9INWMxUE9MQXRjdmdvTWpRPSIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7AA==\n','2010-10-15 12:15:43','2010-10-15 15:10:00'),
 (29,'cbe2758eac9d3e5268498c4a1e7a7dc9','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxanlmU2RhR1RUQ044cXpN\nQ21lM2xKM1ZzYnIxb08rWEttQUN4RUk5MDVZcz06D3Byb2ZpbGVfaWRpBw==\n','2010-10-15 16:57:33','2010-10-15 17:09:04');
INSERT INTO `depot2_development`.`sessions` VALUES  (30,'f5e89aa027f3d86cb7a27b344182491f','BAh7BjoQX2NzcmZfdG9rZW4iMVUzNGhmbjl5ZlNDRGlwNTF6dXVXZHpUS2Rs\nYThYZFZxUDk0c01Ja2o0VWM9\n','2010-10-15 17:08:22','2010-10-15 17:08:22'),
 (31,'1246cf17227468ee581b058a7cc81c2f','BAh7CDoMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxeHE2WFhHd2RIOHQxelM0\nNFNEaWlDeDNIeDl6RUoxd0grcU9xRHh0V29TST06D3Byb2ZpbGVfaWRpBw==\n','2010-10-18 11:16:49','2010-10-18 11:20:18'),
 (32,'e02a73e1537d2918313daf0e298871af','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxSUVVV2ozTmFqS1RDNkFI\nVVpGVE5Ca0NXQ1QrZ3hvaGhCR0p6R0NUOVk0VT0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-19 11:56:38','2010-10-19 18:34:50'),
 (33,'1e70cf011fcdc1aa5f388b9cc2893453','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxc2x1S05JbXFzR1Jqb0NT\neE5SNFAxTzhhSEhFRHhVazAvcExPVWdpSVZpQT0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-20 17:31:36','2010-10-20 19:44:53'),
 (34,'f4522e6674da7d6b58d4ace76e90948d','BAh7CToMdXNlcl9pZGkHOhBfY3NyZl90b2tlbiIxTHNEWjBNa2NWV3E3bU1i\nT0srVCtKQXBZTXBXUDlkQkkwMG5VUGR0U2JKcz0iCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6D3By\nb2ZpbGVfaWRpBw==\n','2010-10-21 11:37:05','2010-10-21 18:34:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`tipo_contenidos`
--

/*!40000 ALTER TABLE `tipo_contenidos` DISABLE KEYS */;
LOCK TABLES `tipo_contenidos` WRITE;
INSERT INTO `depot2_development`.`tipo_contenidos` VALUES  (1,'template_noticias_1','Noticias simple','2010-09-14 14:36:25','2010-10-08 19:31:35'),
 (3,'template_noticias_1','Noticia doble cuadrante','2010-10-08 19:31:24','2010-10-08 19:31:24'),
 (4,'template_noticias_1','Noticia completa','2010-10-08 19:31:47','2010-10-08 19:31:47'),
 (5,'template_noticias_1','Noticia Triple espacio','2010-10-08 19:32:06','2010-10-08 19:32:06'),
 (6,'template_noticias_1','Noticia tipo 4','2010-10-12 11:07:12','2010-10-12 11:07:12'),
 (7,'template_noticias_1','Noticia 5','2010-10-12 11:08:21','2010-10-12 11:08:21'),
 (8,'template_noticias_1','noticia 6','2010-10-12 12:51:29','2010-10-12 12:51:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot2_development`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `depot2_development`.`users` VALUES  (2,'usrvira','6a577e857db3911e7dcdf2d0af6621566e37620d','-6087857080.164033181554388',2,'2010-09-07 19:06:29','2010-09-07 19:06:29'),
 (3,'usrgar','fa24f4888147f64d6edf0ce740b7c1093fc7b3f3','-6058907280.0854223355068845',3,'2010-09-07 19:06:50','2010-09-07 19:06:50'),
 (4,'usrvira2','47156bda9f60f77f4d302654f89a34cece0bd544','-6122294180.76069472412064',5,'2010-09-16 14:50:08','2010-09-16 14:50:08'),
 (5,'usrviraadmin','91a550f66d38ff25b500edac2aed26d2111549a8','-6131596880.541429874183554',4,'2010-09-16 14:50:28','2010-09-16 14:50:28');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

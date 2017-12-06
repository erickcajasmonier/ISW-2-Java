CREATE DATABASE  IF NOT EXISTS `bd_sgvp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_sgvp`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_sgvp
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `t_chofer`
--

DROP TABLE IF EXISTS `t_chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_chofer` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `ape_pat` varchar(50) NOT NULL,
  `ape_mat` varchar(50) NOT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_chofer`
--

LOCK TABLES `t_chofer` WRITE;
/*!40000 ALTER TABLE `t_chofer` DISABLE KEYS */;
INSERT INTO `t_chofer` VALUES (46106540,'Luis','Chilque','Aragón','San Juan de Lurigancho','M',993605841,'lchilque@cmengineering.pe'),(75431840,'Erick','Cajas','Monier','Surquillo','M',993671590,'ecajas@cmengineering.pe');
/*!40000 ALTER TABLE `t_chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_det_multa`
--

DROP TABLE IF EXISTS `t_det_multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_det_multa` (
  `cod_mul` int(11) NOT NULL,
  `dni_cho` int(11) DEFAULT NULL,
  `causa_multa` varchar(45) DEFAULT NULL,
  `calificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_mul`),
  KEY `cho_idx` (`dni_cho`),
  CONSTRAINT `cho` FOREIGN KEY (`dni_cho`) REFERENCES `t_chofer` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mul` FOREIGN KEY (`cod_mul`) REFERENCES `t_multa` (`cod_mul`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_det_multa`
--

LOCK TABLES `t_det_multa` WRITE;
/*!40000 ALTER TABLE `t_det_multa` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_det_multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_entrada`
--

DROP TABLE IF EXISTS `t_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_entrada` (
  `num_ent` int(11) NOT NULL AUTO_INCREMENT,
  `num_sal` int(11) NOT NULL,
  `dni_cho` int(11) NOT NULL,
  `placa` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `kil_ent` int(11) NOT NULL,
  `comentario` varchar(45) NOT NULL,
  PRIMARY KEY (`num_ent`),
  UNIQUE KEY `num_ent_UNIQUE` (`num_ent`),
  UNIQUE KEY `num_sal_UNIQUE` (`num_sal`),
  KEY `dni_idx` (`dni_cho`),
  KEY `pla_idx` (`placa`),
  CONSTRAINT `dni` FOREIGN KEY (`dni_cho`) REFERENCES `t_chofer` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pla` FOREIGN KEY (`placa`) REFERENCES `t_vehiculo` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_entrada`
--

LOCK TABLES `t_entrada` WRITE;
/*!40000 ALTER TABLE `t_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_factura`
--

DROP TABLE IF EXISTS `t_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_factura` (
  `num_fac` varchar(13) NOT NULL,
  `nom_conces` varchar(20) NOT NULL,
  `mon_tot` decimal(8,2) NOT NULL,
  PRIMARY KEY (`num_fac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_factura`
--

LOCK TABLES `t_factura` WRITE;
/*!40000 ALTER TABLE `t_factura` DISABLE KEYS */;
INSERT INTO `t_factura` VALUES ('1234567','asd',12.12),('12345678','asd',12.12),('asd-123123','wwww',123.00),('B143-00349971','Toyota',1200.00),('brs-12121212','aaa',1250.00),('bvc-78788','Nissan',1234.00),('qwe-121212','zzzz',150.00);
/*!40000 ALTER TABLE `t_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_multa`
--

DROP TABLE IF EXISTS `t_multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_multa` (
  `cod_mul` int(11) NOT NULL,
  `dni_cho` int(8) NOT NULL,
  `pla_veh` varchar(7) NOT NULL,
  `fec_mul` date NOT NULL,
  `causa` varchar(20) NOT NULL,
  `lugar` varchar(20) NOT NULL,
  `califica` varchar(9) NOT NULL,
  `fec_exp` date NOT NULL,
  `mon_tot` decimal(7,2) NOT NULL,
  PRIMARY KEY (`cod_mul`),
  KEY `placa_idx` (`pla_veh`),
  KEY `placa_veh_idx` (`pla_veh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_multa`
--

LOCK TABLES `t_multa` WRITE;
/*!40000 ALTER TABLE `t_multa` DISABLE KEYS */;
INSERT INTO `t_multa` VALUES (100,46106540,'hrf-654','2017-03-15','Exceso de velocidad','Trujillo','Leve','2017-07-30',1200.00),(101,46106540,'hrf-654','2012-12-12','no c','Lima','null','2012-12-12',12.00),(102,46106540,'hrf-654','2012-12-12','okis','Lima','Leve','2012-12-12',123.23),(103,46106540,'hrf-654','2012-12-12','as','LIma','Leve','2012-12-12',12.00),(104,46106540,'hrf-654','2012-12-12','','','Leve','2012-12-12',12.67),(105,75431840,'que-315','2012-12-12','sd','as','Leve','2012-12-12',12.00),(106,46106540,'hrf-654','2012-12-12','asd','sdf','Leve','2012-12-12',222.44);
/*!40000 ALTER TABLE `t_multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rev_tec`
--

DROP TABLE IF EXISTS `t_rev_tec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_rev_tec` (
  `num_rev` int(11) NOT NULL AUTO_INCREMENT,
  `num_fac` varchar(13) NOT NULL,
  `pla_veh` varchar(7) NOT NULL,
  `fec_rev_tec` date NOT NULL,
  `tip_man` varchar(35) NOT NULL,
  `motivo` varchar(35) NOT NULL,
  PRIMARY KEY (`num_rev`),
  UNIQUE KEY `num_fac_UNIQUE` (`num_fac`),
  UNIQUE KEY `num_rev_UNIQUE` (`num_rev`),
  KEY `placa_vehiculo_idx` (`pla_veh`),
  KEY `num_fac_idx` (`num_fac`),
  CONSTRAINT `placa_vehiculo` FOREIGN KEY (`pla_veh`) REFERENCES `t_vehiculo` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rev_tec`
--

LOCK TABLES `t_rev_tec` WRITE;
/*!40000 ALTER TABLE `t_rev_tec` DISABLE KEYS */;
INSERT INTO `t_rev_tec` VALUES (10,'B143-00349971','hrf-654','2014-12-14','Preventivo','Choque'),(11,'1234567','hrf-654','2012-12-12','Correctivo','asd'),(16,'12345678','hrf-654','2012-12-12','Correctivo','sd');
/*!40000 ALTER TABLE `t_rev_tec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_salida`
--

DROP TABLE IF EXISTS `t_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_salida` (
  `num_sal` int(11) NOT NULL AUTO_INCREMENT,
  `dni_cho` int(11) NOT NULL,
  `placa` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `kil_sal` int(11) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `motivo` varchar(45) NOT NULL,
  `sede` varchar(45) NOT NULL,
  `comentario` varchar(45) NOT NULL,
  PRIMARY KEY (`num_sal`),
  UNIQUE KEY `num_sal_UNIQUE` (`num_sal`),
  KEY `dni_c_idx` (`dni_cho`),
  KEY `placa_v_idx` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_salida`
--

LOCK TABLES `t_salida` WRITE;
/*!40000 ALTER TABLE `t_salida` DISABLE KEYS */;
INSERT INTO `t_salida` VALUES (100,46106540,'hrf-654','2012-10-17 00:00:00',25000,'Chiclayo','Instalación de postes','Lima','OK'),(101,46106540,'que-315','2017-10-24 19:04:09',82475,'Ayacucho','Instalacion de poste','Lima','Okay'),(102,46106540,'hrf-654','2017-10-24 19:13:20',2500,'Junín','Mnatenimiento de postes','Lima','Ok'),(103,46106540,'hrf-654','2017-10-29 18:54:22',12,'asd','asd','Lima','xc');
/*!40000 ALTER TABLE `t_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sol_rev_tec`
--

DROP TABLE IF EXISTS `t_sol_rev_tec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sol_rev_tec` (
  `num_sol` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(15) NOT NULL,
  `kil_veh` int(11) NOT NULL,
  `tip_man` varchar(35) NOT NULL,
  `fec_asig` date NOT NULL,
  `motivo` varchar(35) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`num_sol`),
  KEY `placa_idx` (`placa`),
  CONSTRAINT `pla_veh` FOREIGN KEY (`placa`) REFERENCES `t_vehiculo` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sol_rev_tec`
--

LOCK TABLES `t_sol_rev_tec` WRITE;
/*!40000 ALTER TABLE `t_sol_rev_tec` DISABLE KEYS */;
INSERT INTO `t_sol_rev_tec` VALUES (50,'hrf-654',25666,'Correctivo','2001-01-01','ok','Aprobado'),(60,'hrf-654',25666,'Preventivo','2009-01-10','Otro','Aprobado'),(61,'que-315',34689,'Correctivo','2012-12-12','OKIS','Aprobado'),(62,'hrf-654',25666,'Correctivo','2012-12-12','visto','Pendiente'),(63,'hrf-654',25666,'Correctivo','2012-12-12','seen','Pendiente'),(64,'hrf-654',25666,'Correctivo','2012-12-12','','Pendiente'),(65,'hrf-654',25666,'Correctivo','2012-12-12','asd','Pendiente');
/*!40000 ALTER TABLE `t_sol_rev_tec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario`
--

DROP TABLE IF EXISTS `t_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usuario` (
  `dni` int(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ape_pat` varchar(15) NOT NULL,
  `ape_mat` varchar(15) NOT NULL,
  `perfil` varchar(25) NOT NULL,
  `user` varchar(8) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario`
--

LOCK TABLES `t_usuario` WRITE;
/*!40000 ALTER TABLE `t_usuario` DISABLE KEYS */;
INSERT INTO `t_usuario` VALUES (45121526,'Lucía','Mori','Castañeda','Jefe de Logística','lmori','lmori'),(46106540,'José','Román','Ojmanovskaya','Almacenero','jroman','jroman');
/*!40000 ALTER TABLE `t_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vehiculo`
--

DROP TABLE IF EXISTS `t_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_vehiculo` (
  `placa` varchar(15) NOT NULL,
  `marca` varchar(25) NOT NULL,
  `año` int(4) NOT NULL,
  `num_ser` int(11) NOT NULL,
  `num_mot` int(11) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `color` varchar(25) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `fec_ult_rev` date DEFAULT NULL,
  PRIMARY KEY (`placa`),
  UNIQUE KEY `placa_UNIQUE` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vehiculo`
--

LOCK TABLES `t_vehiculo` WRITE;
/*!40000 ALTER TABLE `t_vehiculo` DISABLE KEYS */;
INSERT INTO `t_vehiculo` VALUES ('hrf-654','Nissan',1990,34858965,846589,'Hylux','negro',25666,'2012-12-12'),('que-315','Toyota',2000,78789431,768653,'Caldina','azul',34689,'2012-12-12');
/*!40000 ALTER TABLE `t_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-02  0:30:34

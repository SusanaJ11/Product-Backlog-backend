/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.19-MariaDB : Database - fraccionariacontrol
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fraccionariacontrol` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `fraccionariacontrol`;

/*Table structure for table `direccion` */

DROP TABLE IF EXISTS `direccion`;

CREATE TABLE `direccion` (
  `id_direccion` int(10) NOT NULL AUTO_INCREMENT,
  `manzana` varchar(255) DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `direccion` */

LOCK TABLES `direccion` WRITE;

insert  into `direccion`(`id_direccion`,`manzana`,`lote`) values (1,'2','123'),(2,'1','234'),(3,'3','456');

UNLOCK TABLES;

/*Table structure for table `status_visit` */

DROP TABLE IF EXISTS `status_visit`;

CREATE TABLE `status_visit` (
  `id_ev` int(10) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ev`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `status_visit` */

LOCK TABLES `status_visit` WRITE;

insert  into `status_visit`(`id_ev`,`status`) values (1,'Activo'),(2,'No activo');

UNLOCK TABLES;

/*Table structure for table `tipo_identivisitante` */

DROP TABLE IF EXISTS `tipo_identivisitante`;

CREATE TABLE `tipo_identivisitante` (
  `id_itv` int(10) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_itv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo_identivisitante` */

LOCK TABLES `tipo_identivisitante` WRITE;

insert  into `tipo_identivisitante`(`id_itv`,`tipo`) values (1,'INE'),(2,'IFE'),(3,'Licencia'),(4,'DNI'),(5,'Pasaporte');

UNLOCK TABLES;

/*Table structure for table `tipo_usuario` */

DROP TABLE IF EXISTS `tipo_usuario`;

CREATE TABLE `tipo_usuario` (
  `id_tipousuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo_usuario` */

LOCK TABLES `tipo_usuario` WRITE;

insert  into `tipo_usuario`(`id_tipousuario`,`nombre`) values (1,'Amigo'),(2,'Familiar');

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido1` varchar(255) DEFAULT NULL,
  `apellido2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_tipousuario` int(10) DEFAULT NULL,
  `id_direccion` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipousuario` (`id_direccion`),
  CONSTRAINT `id_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `id_tipousuario` FOREIGN KEY (`id_direccion`) REFERENCES `tipo_usuario` (`id_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`id_usuario`,`nombre`,`apellido1`,`apellido2`,`email`,`password`,`id_tipousuario`,`id_direccion`) values (1,'Elena ','Perez','Juarez','elena@gmail.com','elena1234',2,1),(2,'Mauricio','Martinez','Morales','mauricio@gmail.com','mau22789',1,2);

UNLOCK TABLES;

/*Table structure for table `visitante` */

DROP TABLE IF EXISTS `visitante`;

CREATE TABLE `visitante` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido1` varchar(255) DEFAULT NULL,
  `apellido2` varchar(255) DEFAULT NULL,
  `id_itv` int(255) DEFAULT NULL,
  `identifi_number` varchar(255) DEFAULT NULL,
  `placa_auto` varchar(255) DEFAULT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  `FechaEntrada` varchar(255) DEFAULT NULL,
  `HoraEntrada` varchar(255) DEFAULT NULL,
  `FechaSalida` varchar(255) DEFAULT NULL,
  `id_ev` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_ev` (`id_ev`),
  KEY `id_itv` (`id_itv`),
  CONSTRAINT `id_ev` FOREIGN KEY (`id_ev`) REFERENCES `status_visit` (`id_ev`),
  CONSTRAINT `id_itv` FOREIGN KEY (`id_itv`) REFERENCES `tipo_identivisitante` (`id_itv`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `visitante` */

LOCK TABLES `visitante` WRITE;

insert  into `visitante`(`id`,`nombre`,`apellido1`,`apellido2`,`id_itv`,`identifi_number`,`placa_auto`,`id_usuario`,`FechaEntrada`,`HoraEntrada`,`FechaSalida`,`id_ev`) values (1,'Ariane','Perez','Juarez',2,'183657717','354NYH',1,'2000/11/12','12:35','200/11/12',1);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

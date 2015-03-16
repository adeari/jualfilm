/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.32 : Database - jualfilm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jualfilm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jualfilm`;

/*Table structure for table `detail_purchase_order` */

DROP TABLE IF EXISTS `detail_purchase_order`;

CREATE TABLE `detail_purchase_order` (
  `kode_detail_po` double NOT NULL AUTO_INCREMENT,
  `no_po` int(11) DEFAULT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kode_detail_po`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detail_purchase_order` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

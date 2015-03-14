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

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `jumlah_stok` bigint(20) NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang` */

insert  into `barang`(`kode_barang`,`nama_barang`,`harga`,`jumlah_stok`) values ('br-01','milban',2,4),('ob-34','Kursi',12345678,4500020);

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(20) NOT NULL,
  `nama_pegawai` varchar(200) DEFAULT NULL,
  `alamat_pegawai` varchar(200) DEFAULT NULL,
  `telepon_pegawai` varchar(200) DEFAULT NULL,
  `email_pegawai` varchar(200) DEFAULT NULL,
  `divisi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pegawai` */

insert  into `pegawai`(`id_pegawai`,`nama_pegawai`,`alamat_pegawai`,`telepon_pegawai`,`email_pegawai`,`divisi`) values ('ph-001','moji','alam dia','089455','','Akunting'),('ph-002','lomino','jl. molihon','54644545','mildon@yo.net','Sekertaris');

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(200) DEFAULT NULL,
  `alamat_pelanggan` varchar(200) DEFAULT NULL,
  `telepon_pelanggan` varchar(200) DEFAULT NULL,
  `email_pelanggan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`kode_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`kode_pelanggan`,`nama_pelanggan`,`alamat_pelanggan`,`telepon_pelanggan`,`email_pelanggan`) values ('jj-00','milhom1','jl.milhom1','65561','milhom1@yo.net'),('jj-0089','milhomi4','jl. milhomi6','95656599','milhom9i@yo.net'),('kl-93445','lnda','jl. milda','084554','linda@yo.net'),('ko-9455','milrom','alam rihum','4545466','milrom@yo.net'),('ty-45455','rindonim','jl. polinom','435456','');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(200) DEFAULT NULL,
  `alamat_supplier` varchar(200) DEFAULT NULL,
  `telepon_supplier` varchar(200) DEFAULT NULL,
  `email_supplier` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`kode_supplier`,`nama_supplier`,`alamat_supplier`,`telepon_supplier`,`email_supplier`) values ('sp-001','riahna','jl. molida','45645','riahna@yo.net'),('sp-0012','lomino23','jl.polnom3','435453','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

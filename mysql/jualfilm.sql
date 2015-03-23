/*
Navicat MySQL Data Transfer

Source Server         : mysqlku
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : jualfilm

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-03-24 06:19:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `harga` bigint(20) unsigned NOT NULL,
  `jumlah_stok` bigint(20) NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unret4545` (`kode_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES ('br-01', 'perban', '45000', '4', '1');
INSERT INTO `barang` VALUES ('br-10', 'Jendela', '4500000', '23', '2');
INSERT INTO `barang` VALUES ('br-11', 'Kuda', '4500', '2', '3');
INSERT INTO `barang` VALUES ('Item-0005', 'bilanganitu', '45000', '23', '5');

-- ----------------------------
-- Table structure for detail_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `detail_penjualan`;
CREATE TABLE `detail_penjualan` (
  `kode_detail_penjualan` double NOT NULL AUTO_INCREMENT,
  `no_faktur` int(10) unsigned NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `harga` bigint(20) unsigned DEFAULT NULL,
  `diskon` int(10) unsigned DEFAULT NULL,
  `total` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`kode_detail_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detail_penjualan
-- ----------------------------
INSERT INTO `detail_penjualan` VALUES ('3', '1', '3', 'Kuda', '4', '3400', '20', '10880');
INSERT INTO `detail_penjualan` VALUES ('4', '1', '2', 'Jendela', '3', '4500', '5', '12825');

-- ----------------------------
-- Table structure for detail_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_purchase_order`;
CREATE TABLE `detail_purchase_order` (
  `kode_detail_po` double unsigned NOT NULL AUTO_INCREMENT,
  `no_po` int(10) unsigned DEFAULT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_detail_po`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detail_purchase_order
-- ----------------------------
INSERT INTO `detail_purchase_order` VALUES ('4', '2', 'bilanganitu', '67000', '5');
INSERT INTO `detail_purchase_order` VALUES ('5', '3', 'bilanganitu', '4555', '5');
INSERT INTO `detail_purchase_order` VALUES ('6', '3', 'Kuda', '6767', '3');

-- ----------------------------
-- Table structure for klaim_garansi
-- ----------------------------
DROP TABLE IF EXISTS `klaim_garansi`;
CREATE TABLE `klaim_garansi` (
  `no_klaim` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_faktur` int(10) unsigned NOT NULL,
  `id_pelanggan` int(10) unsigned NOT NULL,
  `id_barang` int(10) unsigned NOT NULL,
  `jumlah` int(10) NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `undsf353` (`no_klaim`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of klaim_garansi
-- ----------------------------
INSERT INTO `klaim_garansi` VALUES ('GAR-0001', '2015-03-26 00:00:00', '1', '7', '5', '343500', '1');

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `id_pegawai` varchar(20) NOT NULL,
  `nama_pegawai` varchar(200) DEFAULT NULL,
  `alamat_pegawai` varchar(200) DEFAULT NULL,
  `telepon_pegawai` varchar(200) DEFAULT NULL,
  `email_pegawai` varchar(200) DEFAULT NULL,
  `divisi` varchar(50) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unodft464te` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES ('ph-001', 'moji', 'alam dia', '089455', '', 'Akunting', '1');
INSERT INTO `pegawai` VALUES ('ph-002', 'lomino', 'jl. molihon', '54644545', 'mildon@yo.net', 'Sekertaris', '2');
INSERT INTO `pegawai` VALUES ('Emp-00031', 'mimDan1', 'alam raya1', '084545', 'mildn@yo.net', 'Udara', '3');

-- ----------------------------
-- Table structure for pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan` (
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(200) DEFAULT NULL,
  `alamat_pelanggan` varchar(200) DEFAULT NULL,
  `telepon_pelanggan` varchar(200) DEFAULT NULL,
  `email_pelanggan` varchar(250) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unhu7878u` (`kode_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
INSERT INTO `pelanggan` VALUES ('jj-00', 'milhom1', 'jl.milhom1', '65561', 'milhom1@yo.net', '1');
INSERT INTO `pelanggan` VALUES ('jj-0089', 'milhomi4', 'jl. milhomi', '95656599', 'milhom9i@yo.net', '2');
INSERT INTO `pelanggan` VALUES ('kl-93445', 'lnda', 'jl. milda', '084554', 'linda@yo.net', '3');
INSERT INTO `pelanggan` VALUES ('ko-9455', 'milrom', 'alam rihum', '4545466', 'milrom@yo.net', '4');
INSERT INTO `pelanggan` VALUES ('emp-4545', 'rindonim lio', 'jl. polinom', '435456', '', '5');
INSERT INTO `pelanggan` VALUES ('Emp-0006', 'rinda lina', 'milha', '093434', 'mio@yo.net', '6');
INSERT INTO `pelanggan` VALUES ('Cust-0007', 'Lihanim', 'jiko jalan', '084545', 'moow@go.com', '7');

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan` (
  `no_faktur` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pelanggan` int(10) unsigned NOT NULL,
  `id_pegawai` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `undfghrty565` (`no_faktur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
INSERT INTO `penjualan` VALUES ('JAL-0001', '2015-03-10 00:00:00', '7', '3', '1');

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
  `no_po` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_pegawai` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `untryt56` (`no_po`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('PO-0001', '2015-03-18 00:00:00', '2', '1', '2');
INSERT INTO `purchase_order` VALUES ('PO-0003', '2015-03-18 00:00:00', '3', '3', '3');

-- ----------------------------
-- Table structure for retur_pembelian
-- ----------------------------
DROP TABLE IF EXISTS `retur_pembelian`;
CREATE TABLE `retur_pembelian` (
  `no_retur_pembelian` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_po` int(10) unsigned NOT NULL,
  `id_pegawai` int(10) unsigned NOT NULL,
  `id_supplier` int(10) unsigned NOT NULL,
  `id_barang` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `undfkgm46` (`no_retur_pembelian`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retur_pembelian
-- ----------------------------
INSERT INTO `retur_pembelian` VALUES ('RPO-0001', '2015-03-10 00:00:00', '2', '1', '3', '3', '1');
INSERT INTO `retur_pembelian` VALUES ('RPO-0002', '2015-03-12 00:00:00', '3', '2', '1', '5', '2');

-- ----------------------------
-- Table structure for retur_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `retur_penjualan`;
CREATE TABLE `retur_penjualan` (
  `no_returpenjualan` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_faktur` int(10) unsigned NOT NULL,
  `id_pegawai` int(10) unsigned NOT NULL,
  `id_pelanggan` int(10) unsigned NOT NULL,
  `id_barang` int(10) unsigned NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `undfg4354` (`no_returpenjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retur_penjualan
-- ----------------------------
INSERT INTO `retur_penjualan` VALUES ('RJAL-0001', '2015-03-18 00:00:00', '1', '3', '7', '5', 'bilanganitu', '5600', '1');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(200) DEFAULT NULL,
  `alamat_supplier` varchar(200) DEFAULT NULL,
  `telepon_supplier` varchar(200) DEFAULT NULL,
  `email_supplier` varchar(250) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniy89889` (`kode_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('sp-001', 'riahna', 'jl. molida', '45645', 'riahna@yo.net', '1');
INSERT INTO `supplier` VALUES ('Sup-00031', 'linda1', 'jilan', '34545', 'mioti@yo.net', '3');

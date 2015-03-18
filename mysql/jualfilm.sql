-- phpMyAdmin SQL Dump
-- version 4.3.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2015 at 10:26 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jualfilm`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `harga` bigint(20) unsigned NOT NULL,
  `jumlah_stok` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga`, `jumlah_stok`) VALUES
('br-01', 'perban', 45000, 4),
('br-10', 'Jendela', 4500000, 23),
('br-11', 'Kuda', 4500, 2),
('ob-34', 'Kursi', 12345678, 4500020);

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE IF NOT EXISTS `detail_penjualan` (
  `kode_detail_penjualan` double NOT NULL,
  `no_faktur` varchar(20) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `jumlah` bigint(20) unsigned NOT NULL,
  `harga` bigint(20) unsigned NOT NULL,
  `diskon` int(10) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `detail_purchase_order`
--

CREATE TABLE IF NOT EXISTS `detail_purchase_order` (
  `kode_detail_po` double unsigned NOT NULL,
  `no_po` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `jumlah` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detail_purchase_order`
--

INSERT INTO `detail_purchase_order` (`kode_detail_po`, `no_po`, `kode_barang`, `nama_barang`, `jumlah`) VALUES
(2, 'PO-45', 'br-01', 'perban', 34),
(9, 'po-9344', 'br-10', 'Jendela', 78000),
(10, 'po-9344', 'br-01', 'perban', 89000),
(11, 'po-008355', 'br-01', 'perban', 8906),
(12, 'po-008355', 'br-10', 'Jendela', 4557);

-- --------------------------------------------------------

--
-- Table structure for table `klaim_garan`
--

CREATE TABLE IF NOT EXISTS `klaim_garan` (
  `no_klaim` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_faktur` varchar(20) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `jumlah` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `id_pegawai` varchar(20) NOT NULL,
  `nama_pegawai` varchar(200) DEFAULT NULL,
  `alamat_pegawai` varchar(200) DEFAULT NULL,
  `telepon_pegawai` varchar(200) DEFAULT NULL,
  `email_pegawai` varchar(200) DEFAULT NULL,
  `divisi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `alamat_pegawai`, `telepon_pegawai`, `email_pegawai`, `divisi`) VALUES
('ph-001', 'moji', 'alam dia', '089455', '', 'Akunting'),
('ph-002', 'lomino', 'jl. molihon', '54644545', 'mildon@yo.net', 'Sekertaris');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(200) DEFAULT NULL,
  `alamat_pelanggan` varchar(200) DEFAULT NULL,
  `telepon_pelanggan` varchar(200) DEFAULT NULL,
  `email_pelanggan` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `telepon_pelanggan`, `email_pelanggan`) VALUES
('jj-00', 'milhom1', 'jl.milhom1', '65561', 'milhom1@yo.net'),
('jj-0089', 'milhomi4', 'jl. milhomi', '95656599', 'milhom9i@yo.net'),
('kl-93445', 'lnda', 'jl. milda', '084554', 'linda@yo.net'),
('ko-9455', 'milrom', 'alam rihum', '4545466', 'milrom@yo.net'),
('ty-45455', 'rindonim', 'jl. polinom', '435456', '');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `no_faktur` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kode_pelanggan` varchar(20) NOT NULL,
  `id_pegawai` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE IF NOT EXISTS `purchase_order` (
  `no_po` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kode_supplier` varchar(20) NOT NULL,
  `id_pegawai` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`no_po`, `tanggal`, `kode_supplier`, `id_pegawai`) VALUES
('po-008355', '2015-03-10 17:00:00', 'sp-001', 'ph-002'),
('PO-45', '2015-03-17 17:00:00', 'sp-0012', 'ph-001'),
('po-9344', '2015-03-11 17:00:00', 'sp-0012', 'ph-002');

-- --------------------------------------------------------

--
-- Table structure for table `retur_pembelian`
--

CREATE TABLE IF NOT EXISTS `retur_pembelian` (
  `no_retur_pembelian` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_po` varchar(20) NOT NULL,
  `id_pegawai` varchar(20) NOT NULL,
  `kode_supplier` varchar(20) NOT NULL,
  `kode_barang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `retur_pembelian`
--

INSERT INTO `retur_pembelian` (`no_retur_pembelian`, `tanggal`, `no_po`, `id_pegawai`, `kode_supplier`, `kode_barang`) VALUES
('ro-234', '2015-03-19 17:00:00', 'po-9344', 'ph-002', 'sp-001', 'br-10'),
('ro-344', '2015-03-18 17:00:00', 'po-008355', 'ph-002', 'sp-0012', 'br-10');

-- --------------------------------------------------------

--
-- Table structure for table `retur_penjualan`
--

CREATE TABLE IF NOT EXISTS `retur_penjualan` (
  `no_returpenjualan` varchar(20) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_faktur` varchar(20) NOT NULL,
  `id_pegawai` varchar(20) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `jumlah` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(200) DEFAULT NULL,
  `alamat_supplier` varchar(200) DEFAULT NULL,
  `telepon_supplier` varchar(200) DEFAULT NULL,
  `email_supplier` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kode_supplier`, `nama_supplier`, `alamat_supplier`, `telepon_supplier`, `email_supplier`) VALUES
('sp-001', 'riahna', 'jl. molida', '45645', 'riahna@yo.net'),
('sp-0012', 'lomino23', 'jl.polnom3', '435453', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`kode_detail_penjualan`);

--
-- Indexes for table `detail_purchase_order`
--
ALTER TABLE `detail_purchase_order`
  ADD PRIMARY KEY (`kode_detail_po`);

--
-- Indexes for table `klaim_garan`
--
ALTER TABLE `klaim_garan`
  ADD PRIMARY KEY (`no_klaim`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`no_po`);

--
-- Indexes for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD PRIMARY KEY (`no_retur_pembelian`);

--
-- Indexes for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD PRIMARY KEY (`no_returpenjualan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `kode_detail_penjualan` double NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_purchase_order`
--
ALTER TABLE `detail_purchase_order`
  MODIFY `kode_detail_po` double unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

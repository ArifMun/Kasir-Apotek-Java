-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2021 at 06:38 AM
-- Server version: 10.5.10-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_jual` int(5) NOT NULL,
  `kode_transaksi` int(10) NOT NULL,
  `kode_obat` varchar(20) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `merek_obat` varchar(100) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `kode_obat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_obat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_obat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_obat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merek_obat` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` decimal(10,0) NOT NULL,
  `harga_jual` decimal(10,0) NOT NULL,
  `jumlah_obat` int(5) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `kode_obat`, `nama_obat`, `kategori_obat`, `jenis_obat`, `merek_obat`, `harga_beli`, `harga_jual`, `jumlah_obat`, `expired`) VALUES
(14, 'A1', 'bodrex', 'Obat Dalam', 'Pil', 'bodrex', '5000', '6000', 100, '2021-06-30'),
(15, 'A2', 'paramex', 'Obat Dalam', 'Pil', 'paramex', '5000', '6000', 100, '2021-06-30'),
(16, 'A3', 'paracetamol', 'Obat Dalam', 'Pil', 'novelee', '3000', '6000', 100, '2021-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `Kode_Transaksi` varchar(60) NOT NULL,
  `Nama_Pembeli` varchar(40) NOT NULL,
  `Kode_Obat` varchar(20) NOT NULL,
  `Nama_Obat` varchar(100) NOT NULL,
  `Merek_Obat` varchar(100) NOT NULL,
  `Harga_Jual` int(20) NOT NULL,
  `Jumlah_Beli` int(20) NOT NULL,
  `Tunai` int(20) NOT NULL,
  `Tanggal_Transaksi` varchar(40) NOT NULL,
  `Kembalian` int(100) NOT NULL,
  `Total_Harga` int(100) NOT NULL,
  `id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`Kode_Transaksi`, `Nama_Pembeli`, `Kode_Obat`, `Nama_Obat`, `Merek_Obat`, `Harga_Jual`, `Jumlah_Beli`, `Tunai`, `Tanggal_Transaksi`, `Kembalian`, `Total_Harga`, `id`) VALUES
('BIT/18062021/0001', 'Arifm', 'A2', 'paracetamol', 'novelee', 6000, 2, 20000, 'null', 8000, 12000, 1),
('BIT/18062021/0001', 'ared', 'A3', 'paracetamol', 'novelee', 6000, 2, 20000, '2021-06-19', 8000, 12000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 NOT NULL,
  `jenis_kelamin` varchar(10) CHARACTER SET latin1 NOT NULL,
  `username` varchar(20) CHARACTER SET latin1 NOT NULL,
  `password` varchar(20) CHARACTER SET latin1 NOT NULL,
  `akses` varchar(10) CHARACTER SET latin1 NOT NULL,
  `alamat` text CHARACTER SET latin1 NOT NULL,
  `no_hp` varchar(13) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `jenis_kelamin`, `username`, `password`, `akses`, `alamat`, `no_hp`, `email`) VALUES
(22, 'Arif ', 'Perempuan', 'admin', 'admin', 'Admin', 'Kluwung Kemiri jateng', 'a', '55'),
(23, 'Arif Shafa Maulana', 'Laki-Laki', 'user', 'user', 'Kasir', 'jambii', '08982873488', 'arif@gmail.comm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`),
  ADD UNIQUE KEY `kode_obat` (`kode_obat`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

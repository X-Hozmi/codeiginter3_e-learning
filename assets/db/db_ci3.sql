-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2022 pada 13.59
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ci3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nip` varchar(30) CHARACTER SET latin1 NOT NULL,
  `nama_dosen` varchar(128) CHARACTER SET latin1 NOT NULL,
  `kode_dosen` varchar(30) CHARACTER SET latin1 NOT NULL,
  `no_hp` varchar(13) CHARACTER SET latin1 NOT NULL,
  `email` varchar(128) CHARACTER SET latin1 NOT NULL,
  `kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tmp_lahir` varchar(128) CHARACTER SET latin1 NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(128) CHARACTER SET latin1 NOT NULL,
  `agama` varchar(128) CHARACTER SET latin1 NOT NULL,
  `gambar` varchar(128) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip`, `nama_dosen`, `kode_dosen`, `no_hp`, `email`, `kelamin`, `tmp_lahir`, `tgl_lahir`, `alamat`, `agama`, `gambar`) VALUES
(3, '43A87552189', 'Hans Gretel', 'HG01', '088977441256', 'hans@gmail.com', 'Laki-laki', 'Jakarta', '1998-08-15', 'Jakarta', 'Islam', 'default.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(128) CHARACTER SET latin1 NOT NULL,
  `jenjang` varchar(128) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `jurusan`, `jenjang`) VALUES
(2, 'Teknik Informatika', 'Sarjana'),
(3, 'Sistem Informasi', 'Sarjana'),
(4, 'Manajemen Informasi', 'Diploma'),
(5, 'Teknik Komputer', 'Diploma');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `npm` varchar(30) CHARACTER SET latin1 NOT NULL,
  `nama_mhs` varchar(128) CHARACTER SET latin1 NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `email` varchar(128) CHARACTER SET latin1 NOT NULL,
  `kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tmp_lahir` varchar(128) CHARACTER SET latin1 NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(128) CHARACTER SET latin1 NOT NULL,
  `agama` varchar(128) CHARACTER SET latin1 NOT NULL,
  `ortu` varchar(128) CHARACTER SET latin1 NOT NULL,
  `no_ortu` varchar(13) NOT NULL,
  `gambar` varchar(128) CHARACTER SET latin1 NOT NULL,
  `jurusan` varchar(56) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `npm`, `nama_mhs`, `no_hp`, `email`, `kelamin`, `tmp_lahir`, `tgl_lahir`, `alamat`, `agama`, `ortu`, `no_ortu`, `gambar`, `jurusan`) VALUES
(13, '43A87006220068', 'Abdillah Haidar Mahendro', '088977664271', 'abdil17@gmail.com', 'Laki-laki', 'Jakarta', '2001-04-17', 'Bekasi', 'Islam', 'Asmi Asih', '08815349505', 'default.jpg', 'Teknik Informatika (S1)'),
(14, '43A87006190397', 'Zulfa Ardan Pratama', '085817317081', 'zulfa18@gmail.com', 'Laki-laki', 'Bekasi', '2001-03-18', 'Bekasi', 'Islam', 'Susmiatun', '', 'default.jpg', 'Teknik Informatika (S1)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `kode_matkul` varchar(128) CHARACTER SET latin1 NOT NULL,
  `matkul` varchar(128) CHARACTER SET latin1 NOT NULL,
  `kode_dosen` varchar(128) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `kode_matkul`, `matkul`, `kode_dosen`) VALUES
(2, 'GE12', 'Bahasa Jerman 1', 'HG01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(128) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Dosen'),
(4, 'Mahasiswa'),
(5, 'Menu'),
(8, 'Info');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_akses`
--

CREATE TABLE `menu_akses` (
  `id_akses` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu_akses`
--

INSERT INTO `menu_akses` (`id_akses`, `id_role`, `id_menu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 2),
(6, 3, 3),
(7, 4, 4),
(8, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_short`
--

CREATE TABLE `menu_short` (
  `id_short` int(11) NOT NULL,
  `nama_short` varchar(128) CHARACTER SET latin1 NOT NULL,
  `card_class` varchar(128) CHARACTER SET latin1 NOT NULL,
  `text_upper` varchar(128) CHARACTER SET latin1 NOT NULL,
  `text_count` varchar(128) CHARACTER SET latin1 NOT NULL,
  `ikon_class` varchar(128) CHARACTER SET latin1 NOT NULL,
  `url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu_short`
--

INSERT INTO `menu_short` (`id_short`, `nama_short`, `card_class`, `text_upper`, `text_count`, `ikon_class`, `url`) VALUES
(1, 'Mahasiswa Terdata', 'card bg-primary shadow h-100 py-2', 'text-xs font-weight-bold text-light text-uppercase mb-1', 'h5 mb-0 font-weight-bold text-light', 'fas fa-user fa-2x text-light', 'admin/dataMHS'),
(2, 'Dosen Terdata', 'card bg-success shadow h-100 py-2', 'text-xs font-weight-bold text-light text-uppercase mb-1', 'h5 mb-0 font-weight-bold text-light', 'fas fa-user fa-2x text-light', 'admin/dataDosen'),
(3, 'Berkas Materi', 'card bg-info shadow h-100 py-2', 'text-xs font-weight-bold text-light text-uppercase mb-1', 'h5 mb-0 font-weight-bold text-light', 'fas fa-book fa-2x text-light', 'admin/dataBerkas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_sub`
--

CREATE TABLE `menu_sub` (
  `id_submenu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama_sub` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `ikon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu_sub`
--

INSERT INTO `menu_sub` (`id_submenu`, `id_menu`, `nama_sub`, `url`, `ikon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-home', 1),
(2, 2, 'Profil Saya', 'user', 'fas fa-fw fa-user', 1),
(3, 3, 'Siakad Dosen', 'dosen', 'fas fa-fw fa-home', 1),
(4, 4, 'Siakad Mahasiswa', 'mahasiswa', 'fas fa-fw fa-home', 1),
(5, 2, 'Edit Profil', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(6, 1, 'Account', 'admin/dataUser', 'fas fa-fw fa-user', 1),
(7, 4, 'Hasil Studi', 'mahasiswa/studi', 'fas fa-fw fa-tasks', 1),
(8, 3, 'Absensi', 'dosen/absen', 'fas fa-fw fa-user', 1),
(9, 3, 'Hasil Studi', 'dosen/studi', 'fas fa-fw fa-tasks', 1),
(10, 5, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(11, 1, 'Data Mahasiswa', 'admin/dataMHS', 'fas fa-fw fa-user', 1),
(12, 1, 'Data Dosen', 'admin/dataDosen', 'fas fa-fw fa-user', 1),
(13, 1, 'Data Jurusan', 'admin/dataJurusan', 'fas fa-fw fa-user-graduate', 1),
(14, 1, 'Data Matkul', 'admin/dataMatkul', 'fas fa-fw fa-book', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(128) CHARACTER SET latin1 NOT NULL,
  `email` varchar(128) CHARACTER SET latin1 NOT NULL,
  `gambar` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `id_role` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `email`, `gambar`, `password`, `id_role`, `is_active`, `date_created`) VALUES
(3, 'Abdillah Haidar', 'hozmi@gmail.com', 'default.jpg', '$2y$10$7v7QUGox6UKt19cdATAZdOVRf8yzfkEODTvehxt5BaRWAm68obINu', 1, 1, 1671186578),
(4, 'Haidar Mahenro', 'haidar@gmail.com', 'default.jpg', '$2y$10$BYtxXOOxfe/MUE39x4zqeOeEd02OqTFTKCWmAWLz2wZCAPMTBkSGi', 2, 0, 1671186602),
(5, 'Hodumi Klaus', 'hodumi@gmail.com', 'default.jpg', '$2y$10$245Nw4ExEinSzcsWZ7fGl.nv2ffAFMEDaQybYMcKCFtCXFRPWWJru', 3, 1, 1671233096),
(7, 'Zulfa Ardan', 'zulfa@gmail.com', 'default.jpg', '$2y$10$oLGyduf4RyhocM6xKpzswuAh2MH3357DuAuNSkK7BMyVeKSAn24te', 1, 1, 1671271869),
(23, 'Abdillah Haidar Mahendro', 'abdil17@gmail.com', 'default.jpg', '$2y$10$4Ecp8DILUIbpPrtqwRgK0OuJAtzuBETJ1c8BhJGB7WjRjUjwZbqIe', 4, 1, 1671358022),
(24, 'Zulfa Ardan Pratama', 'zulfa18@gmail.com', 'default.jpg', '$2y$10$96/YtUInqp4ONSTtByGjHuAr/VJsLvqotj8wZAdwc8/Mj2WEnH62C', 4, 1, 1671358096),
(25, 'Hans Gretel', 'hans@gmail.com', 'default.jpg', '$2y$10$YbKInn1UA2paUEjvplAxgukofzsSWVUvbglGb4S3PxRLBjQidjSr6', 3, 1, 1671358371);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member'),
(3, 'Dosen'),
(4, 'Mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `menu_akses`
--
ALTER TABLE `menu_akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indeks untuk tabel `menu_short`
--
ALTER TABLE `menu_short`
  ADD PRIMARY KEY (`id_short`);

--
-- Indeks untuk tabel `menu_sub`
--
ALTER TABLE `menu_sub`
  ADD PRIMARY KEY (`id_submenu`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `menu_akses`
--
ALTER TABLE `menu_akses`
  MODIFY `id_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `menu_short`
--
ALTER TABLE `menu_short`
  MODIFY `id_short` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `menu_sub`
--
ALTER TABLE `menu_sub`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.4.24-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win64
-- HeidiSQL Versi:               11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- membuang struktur untuk table donors.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jk` varchar(100) DEFAULT NULL,
  `nik` varchar(100) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `url` varchar(255) DEFAULT 'https://th.bing.com/th/id/OIP.3IsXMskZyheEWqtE3Dr7JwHaGe?rs=1&pid=ImgDetMain',
  `refresh_token` text DEFAULT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'pengguna',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
-- Membuang data untuk tabel donors.tbl_users: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_users` (`id`, `name`, `username`, `email`, `password`, `no_telp`, `alamat`, `tanggal_lahir`, `jk`, `nik`, `image`, `url`, `refresh_token`, `role`, `createdAt`, `updatedAt`) VALUES
	(1, 'Testing', 'testing1', 'testing@gmail.com', '$2b$10$XDofCDVJXa9SjH6EIdOpA.0fbgicHGmSNl3N9j4lOi1nKQ.GKNth2', '089786786', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pengguna', '2023-11-26 12:50:19', '2023-12-02 09:54:58'),
	(10, 'Uston Awali', 'ute', 'ustonawalie12@gmail.com', '$2b$10$gJDFxj4my5gd6jdfVg/Y1u2/JtM2GjXSc2IGOHfiI7Ajt9SQIoabG', '01822792000', 'Karang Aren', '2023-12-18', 'male', '123456789', 'aee6adef085a77dfa4708f3fd4a1ffb5.png', 'http://localhost:3000/images/aee6adef085a77dfa4708f3fd4a1ffb5.png', NULL, 'admin', '2023-11-27 00:55:54', '2023-12-02 10:08:32');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
-- membuang struktur untuk table donors.tbl_artikel
CREATE TABLE IF NOT EXISTS `tbl_artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dibuat_pada` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_artikel_constraint_id_users` (`id_users`),
  CONSTRAINT `fk_artikel_constraint_id_users` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel donors.tbl_artikel: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_artikel` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_artikel` (`id`, `id_users`, `judul`, `content`, `image`, `url`, `dibuat_pada`, `createdAt`, `updatedAt`) VALUES
	(1, 10, 'Keterbatasan Informasi Jadi Hambatan Orang untuk Donor Darah', 'Keterbatasan informasi membuat jumlah orang yang mendonorkan darah semakin minim. Padahal, kebutuhan pasokan darah untuk menyelamatkan nyawa orang lain sangat tinggi.', 'f86e4c31683f3ed04ce65da60a828eac.png', 'http://localhost:3000/images/f86e4c31683f3ed04ce65da60a828eac.png', '2023-12-02 02:45:32', '2023-12-02 02:45:32', '2023-12-02 02:45:32'),
	(2, 10, 'Donor darah: membantu sesama dan menyehatkan diri', 'Donor darah adalah kegiatan yang positif dan mulia dan kita bisa menolong sesama. Donor darah bisa membantu mereka yang membutuhkan darah dalam situasi mendesak. Karena seringkali saat pasien dalam kondisi kritis, pihak PMI atau rumah sakit tak memiliki stok darah yang cukup.', 'c4287353289d31ec8dbb46ccc2b4a0ce.png', 'http://localhost:3000/images/c4287353289d31ec8dbb46ccc2b4a0ce.png', '2023-12-02 02:47:34', '2023-12-02 02:47:34', '2023-12-02 02:47:34'),
	(3, 10, 'Donor Darah - Risiko Penyakit Jantung', 'Dengan mendonorkan darah secara rutin, dikatakan bahwa banyak manfaat yang didapat dari segi kesehatan. Salah satunya adalah dalam hal menurunkan risiko terkena penyakit jantung.', '22478fc8bcd15b43c233fde4c19f2a3b.png', 'http://localhost:3000/images/22478fc8bcd15b43c233fde4c19f2a3b.png', '2023-12-02 02:47:56', '2023-12-02 02:47:56', '2023-12-02 02:47:56'),
	(4, 10, 'Donor Darah | Apakah Habis Donor Darah Boleh Lari?', 'Setelah donor darah, disarankan untuk menghindari aktivitas fisik yang berlebihan atau terlalu intens, termasuk lari. Untuk menjaga kesehatan dan memastikan pemulihan yang optimal, disarankan untuk memberikan tubuh waktu untuk beristirahat setelah donor darah.', 'bd01b936c3a683f7ba0f5aea79022c77.png', 'http://localhost:3000/images/bd01b936c3a683f7ba0f5aea79022c77.png', '2023-12-02 02:48:16', '2023-12-02 02:48:16', '2023-12-02 02:48:16');
/*!40000 ALTER TABLE `tbl_artikel` ENABLE KEYS */;

-- membuang struktur untuk table donors.tbl_goldar
CREATE TABLE IF NOT EXISTS `tbl_goldar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `type_goldar` varchar(255) DEFAULT NULL,
  `jumlah_goldar` int(11) DEFAULT 0,
  `diperbarui_pada` datetime NOT NULL DEFAULT current_timestamp(),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goldar_constraint_id_users` (`id_users`),
  CONSTRAINT `fk_goldar_constraint_id_users` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel donors.tbl_goldar: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_goldar` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_goldar` (`id`, `id_users`, `type_goldar`, `jumlah_goldar`, `diperbarui_pada`, `createdAt`, `updatedAt`) VALUES
	(1, 10, 'A+', 6, '2023-12-02 03:02:59', '2023-12-02 03:02:59', '2023-12-02 03:02:59'),
	(2, 10, 'B+', 9, '2023-12-02 03:03:26', '2023-12-02 03:03:26', '2023-12-02 03:03:26'),
	(3, 10, 'AB+', 3, '2023-12-02 03:03:36', '2023-12-02 03:03:36', '2023-12-02 03:03:36'),
	(4, 10, 'O+', 5, '2023-12-02 03:03:50', '2023-12-02 03:03:50', '2023-12-02 03:03:50');
/*!40000 ALTER TABLE `tbl_goldar` ENABLE KEYS */;

-- membuang struktur untuk table donors.tbl_landingpage
CREATE TABLE IF NOT EXISTS `tbl_landingpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `dibuat_pada` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_landing_constraint_id_users` (`id_users`),
  CONSTRAINT `fk_landing_constraint_id_users` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel donors.tbl_landingpage: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_landingpage` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_landingpage` (`id`, `id_users`, `judul`, `deskripsi`, `video_url`, `thumbnail_url`, `dibuat_pada`, `createdAt`, `updatedAt`) VALUES
	(1, 10, 'Landing Page', 'Setiap tetes darah yang kamu berikan adalah\r\n                        tanda cinta dan kepedulianmu terhadap sesama.\r\n                        Mari berbagi kebaikan dengan donor darah', 'https://docs.material-tailwind.com/demo.mp4', NULL, '2023-11-28 18:57:58', '2023-11-28 12:57:57', '2023-12-02 07:12:01');
/*!40000 ALTER TABLE `tbl_landingpage` ENABLE KEYS */;

-- membuang struktur untuk table donors.tbl_lokasi
CREATE TABLE IF NOT EXISTS `tbl_lokasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `nama_tempat` varchar(255) DEFAULT NULL,
  `tempat` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `tanggal_dan_waktu_buka` date DEFAULT NULL,
  `waktu_buka` time DEFAULT NULL,
  `waktu_tutup` time DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lokasi_constraint_id_users` (`id_users`),
  CONSTRAINT `fk_lokasi_constraint_id_users` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel donors.tbl_lokasi: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_lokasi` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_lokasi` (`id`, `id_users`, `nama_tempat`, `tempat`, `image`, `url`, `tanggal_dan_waktu_buka`, `waktu_buka`, `waktu_tutup`, `createdAt`, `updatedAt`) VALUES
	(1, 10, 'Dinas Pendidikan Purbalingga', 'Jl. Letjen S Parman No.345, Kedung Menjangan, Bancar, Kab. Purbalingga, Jawa Tengah ', 'dfdff628de4799450d8fbcb972dba8ff.png', 'http://localhost:3000/images/dfdff628de4799450d8fbcb972dba8ff.png', '2023-11-06', '09:00:00', '16:00:00', '2023-12-02 02:54:07', '2023-12-02 06:40:14'),
	(2, 10, 'Kantor Bupati Purbalingga', 'Jl. Onje, Purbalingga, Purbalingga Lor, Kabupaten Purbalingga, Jawa Tengah', 'd2c97ca26a77e5f0c9f36aebfe935ef1.png', 'http://localhost:3000/images/d2c97ca26a77e5f0c9f36aebfe935ef1.png', '2023-09-12', '09:00:00', '16:00:00', '2023-12-02 02:54:51', '2023-12-02 02:54:51'),
	(3, 10, 'BNN Purbalingga', 'Jl. Kalikabong, Kalimanah, Kalikabong, Kabupaten Purbalingga, Jawa Tengah', 'ab249105645517444f4766420568dd88.png', 'http://localhost:3000/images/ab249105645517444f4766420568dd88.png', '2023-08-28', '09:00:00', '16:00:00', '2023-12-02 02:58:51', '2023-12-02 02:58:51'),
	(4, 10, 'SMA Negeri 1 Purbalingga', 'Jl. MT. Haryono, Dusun 1, Purbalingga Kulon, Kabupaten Purbalingga, Jawa Tengah\r\n', 'e88630548223041d06541c196c3e6521.png', 'http://localhost:3000/images/e88630548223041d06541c196c3e6521.png', '2023-04-17', '09:00:00', '16:00:00', '2023-12-02 02:59:22', '2023-12-02 02:59:22');
/*!40000 ALTER TABLE `tbl_lokasi` ENABLE KEYS */;

-- membuang struktur untuk table donors.tbl_pendonor
CREATE TABLE IF NOT EXISTS `tbl_pendonor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) DEFAULT NULL,
  `id_goldar` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `jenkel` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` datetime DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `nama_ibu_kandung` varchar(255) DEFAULT NULL,
  `status_pernikahan` varchar(255) DEFAULT NULL,
  `reshus` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_constraint_id_users` (`id_users`),
  KEY `fk_constraint_id_goldar` (`id_goldar`),
  CONSTRAINT `fk_constraint_id_goldar` FOREIGN KEY (`id_goldar`) REFERENCES `tbl_goldar` (`id`),
  CONSTRAINT `fk_constraint_id_users` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel donors.tbl_pendonor: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_pendonor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pendonor` ENABLE KEYS */;

-- membuang struktur untuk table donors.tbl_stories
CREATE TABLE IF NOT EXISTS `tbl_stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dibuat_pada` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stori_constraint_id_users` (`id_users`),
  CONSTRAINT `fk_stori_constraint_id_users` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel donors.tbl_stories: ~8 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_stories` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_stories` (`id`, `id_users`, `judul`, `content`, `image`, `url`, `dibuat_pada`, `createdAt`, `updatedAt`) VALUES
	(1, 10, 'Berikan pertolongan ke orang sangat membutuhkan ada hal yang penting', 'Pertolongan kepada utk seorang bayi yg sangat membutuhkan mendesak, menyelamatkan nyawa seorang itu sesuatu yg sangat penting.', '9d409a4c2ae3681430d4858278677f48.png', 'http://localhost:3000/images/9d409a4c2ae3681430d4858278677f48.png', '2023-12-17 00:00:00', '2023-12-02 04:26:34', '2023-12-02 04:26:34'),
	(2, 10, 'ITB Gelar Donor Darah di Kampus Jatinangor', 'Donor darah merupakan contoh bentuk kontribusi sederhana kita terhadap kesehatan masyarakat. Kantong darah yang kita donorkan dapat menyelamatkan nyawa seseorang. Dengan hal sederhana tersebut, kita telah menciptakan senyuman di wajah orang tersebut beserta dengan keluarga dan kerabat terdekatnya,\r\n    Sebelum donor darah, peserta wajib memenuhi persyaratan baik administrasi maupun kesehatan. Mulai dari sehat jasmani dan rohani, usia 17-60 tahun atau 65 tahun ke atas yang rutin mendonorkan, serta tekanan darah, dan kadar haemoglobin.\r\n    \r\n    Berlangsung dari pukul 10.00 hingga 15.00 WIB, acara ini terbuka bagi seluruh civitas academica ITB. Sebanyak 59 kantong darah berhasil dikumpulkan dari 110 pendaftar yang ambil bagian.\r\n    \r\n    “Baru pertama kali, awalnya deg-degan tapi ternyata pas diambil ya biasa saja. Pengalaman yang sangat mengesankan,” ucap salah seorang peserta, Dimas Aryadenata (Magister Teknik Sipil, 2018) usai donor darah.\r\n    \r\n    Selain pengabdian kepada masyarakat dalam bentuk donor darah, setiap mahasiswa fakultas dan sekolah Tahap Persiapan Bersama (TPB) 2023 juga akan melakukan aksi angkatan yang akan dipamerkan pada In Harmonia Fest November 2023 ini.', '7f1f65df05230cbcfaa4d66c412c10f3.png', 'http://localhost:3000/images/7f1f65df05230cbcfaa4d66c412c10f3.png', '2023-09-28 00:00:00', '2023-12-02 04:27:10', '2023-12-02 04:27:10'),
	(3, 10, 'BNN RI Semarakkan HUT Korpri ke-52 Lewat Aksi Donor Darah', 'Aksi donor darah ini berlokasi di area Klinik Atmani Wedhana, Kantor Pusat BNN RI. Dalam kegiatan ini juga turut serta dari Palang Merah Indonesia (PMI) DKI Jakarta.\r\n\r\n    Antusiasme pendonor darah sudah terlihat sejak pukul 08.00 WIB. Pegawai BNN mulai mengantri untuk mendapatkan kesempatan mendonorkan darahnya.\r\n    \r\n    Sebelumnya, bagi para pendonor diwajibkan untuk mengisi form data diri dan beberapa pertanyaan kuisoner, kemudian melakukan screening kesehatan sebelum mendonorkan darahnya. Sesuai prosedur, dilakukan pemeriksaan tekanan darah, cek riwayat kesehatan dan kekentalan darahnya.\r\n    \r\n    Direktur Peran Serta Masyarakat Deputi Bidang Pemberdayaan Masyarakat BNN RI, Drs. Yuki Ruchimat,M.Si. mengatakan kegiatan aksi donor darah ini merupakan rangkaian untuk menyemarakkan HUT Korpri ke-52. Diharapkan darah yang didonor ini bisa membantu masyarakat yang membutuhkan.\r\n    \r\n    “Ini adalah kegiatan bakti sosial salah satu dari rangka kegiatan HUT Korpri ke-52 tahun 2023. Selain bakti sosial ini juga menyemarakkan Korpri peduli dengan sesama. Mudah-mudahan dengan adanya donor darah yang telah dijalankan selama sepekan ini, bisa membaktikan kepada masyarakat bagi yang membutuhkan. Karena kita sering dengar ada kekurangan darah di PMI, mudah-mudahan ini bermanfaat.\r\n    ementara itu, salah satu pendonor yang merupakan pegawai BNN, Fajar Sinayang mengaku ingin membantu sesama lewat aksi donor darah dalam rangka HUT Korpri. Bahkan untuk prosesnya juga mudah dan cepat.\r\n    \r\n    “Alasan saya ikut donor ini ingin membantu sesama. Caranya juga mudah isi form, lalu dicek kesehatannya terus donor dan dapat bekal (recovery).', '12920f645c17fdba2a15badc7033e67e.png', 'http://localhost:3000/images/12920f645c17fdba2a15badc7033e67e.png', '2023-10-13 00:00:00', '2023-12-02 04:27:56', '2023-12-02 04:27:56'),
	(4, 10, 'Kisah Heroik Relawan DonorDarah di Masa Paceklik', 'Pengalaman menarik yang paling saya ingat itu ketika ada orang yang menghubungi saya langsung jam 2 malam dan kebetulan darah yang dibutuhkan itu golongan darah O sama dengan saya,” ucap Asep sambil mengingat kejadian malam itu yang tidak akan pernah ia lupakan.\r\n\r\n    Lebih jauh dirinya menceritakan sebagai seorang relawan kemanusiaan tentunya  ketika ada yang sedang membutuhkan harus selalu siap apapun kondidinya. Tak heran jika ia harus siap melakukan donor darah tengah malam dan kejadian itu masih ia ingat betul setiap peristiwanya sampai sekarang, bahkan menurutnya juga dari puluhan dirinya melakukan donor darah, kejadian tengah malam itu yang paling berkesan baginya.\r\n    \r\n    “Kejadiannya itu ada telpon jam 2 malam sedang membutuhkan darah, karena situasi saat itu sudah tengah malam pasti orang lain juga tentunya sedang istirahat. Sedangkan posisi pasien juga sedang sangat membutuhkan. Jadi, tidak bisa menunggu besok paginya membuat saya berangkat waktu itu juga datang ke Markas PMI, bahkan penjaganya juga sudah ada yang tertidur. Wajar karena memang sudah malam,” sambung pria yang pernah bekerja sebagai maintenance di sebuah hotel yang ada di daerah objek wisata Cipanas Garut.\r\n    \r\n    Dirinya juga mengungkapkan, bahwa alasannya untuk melakukan donor darah itu agar dapat memberi manfaat bagi orang lain yang sedang membutuhkan pertolongan. Dalam hal ini dirinya juga mengatakan bahwa yang dapat ia berikan untuk menolong orang lain bukanlah berupa materi, melainkan darah yang bisa memberi nilai manfaat bagi yang sedang membutuhkan.\r\n    \r\n    “Saya ingin memberikan manfaat bagi orang lain yang sedang membutuhkan pertolongan. Jika, yang saya berikan bukan materi dan saya memiliki darah yang bisa bermanfaat untuk orang lain kenapa tidak untuk saya melakukan donor saja. Agar darah ini memiliki nilai manfaat untuk orang yang sedang membutuhkan,” tuturnya sambil menatap ke arah jam dinding yang menunjukan pukul 14.35 WIB menandakan kami sudah lebih setengah jam berbincang.\r\n    \r\n    Kisah dan aksi relawan kemanusiaan yang rutin melakukan kegiatan donor darah ini tentunya tidak hanya dilakukan oleh Asep Nanu seorang diri saja, bahkan dirinya juga berinisiatif membuat data secara manual dengan ponsel yang ia miliki mengenai siapa saja relawan di Kampungnya.\r\n    \r\n    “Relawan di Nyalindung yang sudah saya data secara manual di handphone itu sekarang ada sekitar 45 orang. Saya data mulai dari nama lengkap, golongan darahnya juga nomer teleponya juga untuk memudahkan jika sedang membutuhkan bantuan bisa langsung menghubungi,” katanya sambil mengirimkan data itu ke nomer WhatsApp saya.', 'c1436892a34872d94edb3a64adf923bb.png', 'http://localhost:3000/images/c1436892a34872d94edb3a64adf923bb.png', '2023-10-31 00:00:00', '2023-12-02 04:33:50', '2023-12-02 04:33:50'),
	(5, 10, 'Pengalaman Unik Sapto Nugroho, Sudah Donor Darah 100 Kali', 'Kemarin saya ingin mendonorkan darah, tetapi ditolak karena Hb (Hemoglobin) saya tinggi. Kemudian hari ini juga tertunda, rupanya ada peringatan ini.\r\n\r\n    Saya tidak tahu ada peringatan Hari Donor Darah,” ujar pria berusia pria 52 tahun dan bergolongan darah O itu, ditemui di PMI Kota Balikpapan.\r\n    \r\n    Perawakan Sapto tinggi besar. Tubuhnya masih bugar meski sudah berusia di atas 50 tahun.\r\n    \r\n    Ia menyebut, tidak begitu memperhatikan manfaat kesehatan dari kebiasaan donor darah. Semua yang dilakukan hanya berasal dari niat untuk menolong orang lain, melalui transfer darah.\r\n    \r\n    “Saya donor darah sejak usia 22 tahun. Januari 1992. Waktu itu ada ibu-ibu melahirkan.\r\n    \r\n    Kami ditawari donor darah, ternyata yang dicari golongan darah O. Waktu itu kejadian di Rumah Sakit Pertamina Balikpapan. Sejak itu saya rutin donor darah,” tuturnya.\r\n    \r\n    Ia mengatakan, sebenarnya sampai saat ini sudah mendonorkan darah sebanyak 104 kali. Proses donor dilakukan tiga bulan sekali, sesuai prosedur dan anjuran PMI Kota Balikpapan. Jadi selama satu tahun, seorang pendonor darah rutin bisa melakukan sebanyak empat kali.\r\n    \r\n    “Itu juga sebenarnya ada yang (waktu donor) tidak tercatat. Tapi memang harus konsisten.', 'baaede36da30ac055b2cbc0286d30534.png', 'http://localhost:3000/images/baaede36da30ac055b2cbc0286d30534.png', '2023-06-14 00:00:00', '2023-12-02 04:34:36', '2023-12-02 04:34:36'),
	(6, 10, 'Cerita Donor Darah Perdana', 'Untuk Pertama kali tanggal 12 Juni 2022 melakukan donor darah Apheresis. Untuk alurnya sendiri yaitu, kita akan di ambil sampel darahnya untuk di tes dan di cocokkan ke pasien yang membutuhkan, waktunya mencapai 5-6 jam untuk selesai pengecekan. Kemarin saya di ambil sampel darahnya pukul 10.00 WIB dan waktu maghrib sekitar jam 18.10 WIB dihubungi oleh pihak rumahsakit dan dinyatakan lolos, lalu dijadwalkan jam 8 malam untuk proses pengambilan darah. Jam 8 kurang sedikit saya sampai di unit Transfusi Darah dan pertama kali saya di cek tensi. Tensi saya normal dan dinyatakan bisa di ambil. Selanjutnya disuruh menunggu dokter jaga untuk menghidupkan mesin pengambilan darahnya, dan pada pukul 20.22 WIB transfusi pengambilan darah dimulai. Proses pengambilan darahnya berlangsung lancar, sampai pukul 21.22 WIB', '6a2e33e29edf4f3c68651e1a884f5e6e.png', 'http://localhost:3000/images/6a2e33e29edf4f3c68651e1a884f5e6e.png', '2023-10-31 00:00:00', '2023-12-02 04:35:08', '2023-12-02 04:35:08'),
	(7, 10, 'Donor Itu Menyenangkan Bertemu Suster', 'Mengalami petualangan donor darah yang tak terlupakan. Ketika Anisa membutuhkan transfusi darah mendesak, Rian tanpa ragu menjadi pendonor yang cocok. Proses donor darah bukan hanya menyelamatkan nyawa Anisa, tetapi juga memperkuat ikatan cinta mereka.', '1a420ac567acd681ed553c1914b1f024.png', 'http://localhost:3000/images/1a420ac567acd681ed553c1914b1f024.png', '2023-10-06 00:00:00', '2023-12-02 04:35:56', '2023-12-02 04:35:56'),
	(8, 10, 'Pengalaman Maya Transfusi Darah Berlebihan', 'Maya menjadi pahlawan tanpa tanda bintang. Ketika krisis darah melanda rumah sakit setempat, Maya memimpin inisiatif donor darah sukarela di tempat kerjanya. Dengan dukungan rekan-rekannya, mereka berhasil mengumpulkan cukup darah untuk menyelamatkan nyawa puluhan pasien. ', 'a9eed653000aae33d760fe15e025b7e2.png', 'http://localhost:3000/images/a9eed653000aae33d760fe15e025b7e2.png', '2023-10-09 00:00:00', '2023-12-02 04:36:24', '2023-12-02 04:36:24'),
	(9, 10, 'Donor Darah Rutinitas TNI', 'kepedulian terhadap kesehatan masyarakat adalah hal yang penting. Mahasiswa senior memberikan dorongan dan pengalaman mereka kepada yang lebih junior, menciptakan ikatan kuat di antara mereka dalam upaya menyelamatkan nyawa.', 'c5580f3d4c23b996e6133eb93be77782.png', 'http://localhost:3000/images/c5580f3d4c23b996e6133eb93be77782.png', '2023-10-14 00:00:00', '2023-12-02 04:36:58', '2023-12-02 04:36:58');
/*!40000 ALTER TABLE `tbl_stories` ENABLE KEYS */;





-- membuang struktur untuk trigger donors.update_goldar_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER update_goldar_count
AFTER INSERT ON tbl_pendonor
FOR EACH ROW
BEGIN
    DECLARE golongan_darah VARCHAR(10);
    DECLARE jumlah_stok INT;

    SELECT type_goldar INTO golongan_darah FROM tbl_goldar WHERE id = NEW.id_goldar;

    SELECT jumlah_goldar INTO jumlah_stok FROM tbl_goldar WHERE id = NEW.id_goldar;

    UPDATE tbl_goldar SET jumlah_goldar = jumlah_stok + 1 WHERE id = NEW.id_goldar;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2021 at 06:38 AM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ckasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int NOT NULL,
  `par_id` int DEFAULT NULL,
  `user_role_ids` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `par_id`, `user_role_ids`, `title`, `icon`, `link`, `sort_order`, `created`, `updated`) VALUES
(38, 0, ',1,5,6,7,', 'Dashboard', 'fa-tachometer-alt', '/', 1, '2021-02-09 22:55:45', '2021-02-09 23:35:35'),
(39, 0, ',1,5,6,', 'Produk', 'fa-shopping-basket', '#', 1, '2021-02-09 23:27:04', '2021-02-09 23:34:36'),
(40, 39, ',1,5,6,', 'Data Barang', 'fa-tag', '/produk', 1, '2021-02-09 23:27:29', '2021-02-09 23:35:01'),
(41, 39, ',1,5,6,', 'Kategori Barang', 'fa-tags', '/kategori', 1, '2021-02-09 23:27:48', '2021-02-09 23:34:49'),
(42, 0, ',1,', 'User', 'fa-user', '#', 1, '2021-02-09 23:36:02', '2021-02-09 23:36:02'),
(43, 42, ',1,', 'Tambah User', 'fa fa-plus', '/user/edit', 1, '2021-02-09 23:36:22', '2021-02-09 23:36:22'),
(44, 42, ',1,', 'User List', 'fa-list', '/user/list', 1, '2021-02-09 23:36:37', '2021-02-09 23:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `id` int UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `bank_number` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `module` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=content,2=product',
  `module_id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unread, 1=read',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(21, 'templates', '{\"public_template\":\"Avilon\",\"admin_template\":\"AdminLTE\"}'),
(22, 'site', '{\"title\":\"Aplikasi Kasir\",\"link\":\"\",\"image\":\"\",\"keyword\":\"\",\"description\":\"\",\"year\":\"\",\"lang\":\"id\",\"use_cache\":\"0\"}'),
(23, 'logo', '{\"title\":\"Aplikasi Kasir\",\"image\":\"\",\"width\":\"\",\"height\":\"\",\"display\":\"title\"}');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int NOT NULL,
  `cat_ids` mediumtext NOT NULL,
  `par_id` int DEFAULT '0',
  `tpl` varchar(255) DEFAULT '0',
  `tag_ids` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `source` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `videos` text,
  `document` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `hits` int NOT NULL,
  `last_hits` datetime NOT NULL,
  `rating` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_cat`
--

CREATE TABLE `content_cat` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `description` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_tag`
--

CREATE TABLE `content_tag` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `payment_method` tinyint(1) NOT NULL DEFAULT '1',
  `notes` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ppn` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `keterangan`) VALUES
(1, 'Pulsa Telkomsel', '-'),
(2, 'Pulsa Indosat', '-');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int NOT NULL,
  `par_id` int NOT NULL DEFAULT '0',
  `position_id` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` mediumtext NOT NULL,
  `tpl` varchar(255) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_position`
--

CREATE TABLE `menu_position` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=unread,2=read',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `cat_ids` text NOT NULL,
  `tag_ids` text NOT NULL,
  `image` varchar(11) NOT NULL,
  `images` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `qty` int NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = not publish, 1 = publish',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_cat`
--

CREATE TABLE `product_cat` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int NOT NULL,
  `kategori_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `stock` int NOT NULL,
  `suplier_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `gambar`, `harga_beli`, `harga_jual`, `stock`, `suplier_id`, `created`, `updated`) VALUES
(1, 2, 'indosat 10k', 'gambar_indosat_10k.png', 10000, 12000, 12, 2, '2021-02-09 20:33:42', '2021-02-09 20:33:43'),
(2, 1, 'telkomsel 10k', '', 10000, 12000, 12, 1, '2021-02-09 20:40:24', '2021-02-09 20:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE `produk_kategori` (
  `id` int NOT NULL,
  `produk_id` int NOT NULL,
  `kategori_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`id`, `nama`, `alamat`, `hp`) VALUES
(1, 'Pak Telko', '-', '0989897897'),
(2, 'Pak Indo', '-', '0890897');

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE `testing` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trash`
--

CREATE TABLE `trash` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `table_id` int NOT NULL,
  `table_title` varchar(255) NOT NULL,
  `table_content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_role_id` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = not active',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `image`, `user_role_id`, `active`, `created`, `updated`) VALUES
(3, 'root', '$2y$10$ZHLzWDf0AH1/H3VfgoW0ueGJEU.HS3T.SQpy0J2Gj2f5idqaph3Je', 'iwansafr@gmail.com', '', 1, 1, '2021-02-04 13:03:09', '2021-02-04 13:03:09'),
(4, 'owner', '$2y$10$fYKgDJjJJk2EdG5QphPrxOjdpJZrJoNhYVbvs9OeUOvN000sKgMWm', 'owner@esg.com', '', 5, 1, '2021-02-10 06:37:12', '2021-02-10 06:37:12'),
(5, 'admin', '$2y$10$CECXLGxjxE5l44bxttUkgOu6LrQOFqHdUMzxP3oRi1baZEN2ZKenq', 'admin@esg.com', '', 6, 1, '2021-02-10 06:37:25', '2021-02-10 06:37:25'),
(6, 'kary', '$2y$10$/02EjfBCz4WUi7jWB1jkAOp11gwaOb4G4huivupc1NU4zurtxUcQ2', 'kary@esg.com', '', 7, 1, '2021-02-10 06:37:43', '2021-02-10 06:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ip` varchar(15) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=failed, 1=success',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `ip`, `browser`, `status`, `created`) VALUES
(488, 3, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', 1, '2021-02-04 13:03:25'),
(489, 3, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', 1, '2021-02-06 13:51:08'),
(490, 3, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '2021-02-09 19:58:02'),
(491, 0, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '2021-02-10 05:55:17'),
(492, 3, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '2021-02-10 05:55:19'),
(493, 3, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '2021-02-10 05:57:40'),
(494, 3, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '2021-02-10 06:33:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_failed`
--

CREATE TABLE `user_login_failed` (
  `id` int NOT NULL,
  `user_login_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login_failed`
--

INSERT INTO `user_login_failed` (`id`, `user_login_id`, `username`, `password`) VALUES
(39, 491, 'root', 'Dks_080308');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `level` tinyint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `level`, `title`, `description`, `created`, `updated`) VALUES
(1, 1, 'root', 'super user', '2021-02-04 06:03:21', '2021-02-09 23:24:17'),
(5, 2, 'owner', 'akun owner', '2021-02-09 23:23:49', '2021-02-09 23:23:49'),
(6, 3, 'admin', 'akun admin', '2021-02-09 23:23:55', '2021-02-09 23:23:55'),
(7, 4, 'kary', 'akun karyawan', '2021-02-09 23:24:07', '2021-02-09 23:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int NOT NULL,
  `ip` varchar(50) NOT NULL,
  `visited` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `country` varchar(10) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `ip`, `visited`, `city`, `region`, `country`, `browser`, `created`) VALUES
(7732, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-04 13:00:14'),
(7733, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-04 13:03:25'),
(7734, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-04 13:06:11'),
(7735, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-04 13:06:14'),
(7736, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:49:57'),
(7737, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:50:37'),
(7738, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:50:44'),
(7739, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:50:49'),
(7740, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:50:58'),
(7741, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:51:09'),
(7742, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:56:48'),
(7743, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:57:42'),
(7744, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 13:57:46'),
(7745, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:00:04'),
(7746, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:00:28'),
(7747, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:02:03'),
(7748, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:02:18'),
(7749, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:02:23'),
(7750, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:02:28'),
(7751, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:02:33'),
(7752, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:02:45'),
(7753, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:04:33'),
(7754, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:05:31'),
(7755, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:05:52'),
(7756, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:06:30'),
(7757, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:06:42'),
(7758, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:06:58'),
(7759, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:07:20'),
(7760, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:07:44'),
(7761, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:08:08'),
(7762, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:09:33'),
(7763, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:09:40'),
(7764, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:09:50'),
(7765, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:09:51'),
(7766, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:10:00'),
(7767, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:10:03'),
(7768, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:10:06'),
(7769, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:10:17'),
(7770, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:10:19'),
(7771, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:10:23'),
(7772, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:11:02'),
(7773, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:11:09'),
(7774, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:11:49'),
(7775, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:11:55'),
(7776, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:01'),
(7777, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:13'),
(7778, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:17'),
(7779, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:19'),
(7780, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:20'),
(7781, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:26'),
(7782, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:32'),
(7783, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:33'),
(7784, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:36'),
(7785, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:38'),
(7786, '::1', 'http://localhost/ckasir/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-06 14:12:48'),
(7787, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36', '2021-02-09 05:49:28'),
(7788, '::1', 'http://localhost/ckasir/', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 19:57:55'),
(7789, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 19:58:02'),
(7790, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 19:58:13'),
(7791, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:10:09'),
(7792, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:10:34'),
(7793, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:10:46'),
(7794, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:10:53'),
(7795, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:11:49'),
(7796, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:12:07'),
(7797, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:26:05'),
(7798, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:26:18'),
(7799, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:27:06'),
(7800, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:27:46'),
(7801, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:28:15'),
(7802, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:28:40'),
(7803, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:29:01'),
(7804, '::1', 'http://localhost/ckasir/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:29:09'),
(7805, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:32:21'),
(7806, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:32:44'),
(7807, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:33:13'),
(7808, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:33:43'),
(7809, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:34:03'),
(7810, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:34:23'),
(7811, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:34:25'),
(7812, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:34:29'),
(7813, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:34:40'),
(7814, '::1', 'http://localhost/ckasir/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:35:07'),
(7815, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:37:48'),
(7816, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:39:49'),
(7817, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:40:25'),
(7818, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:40:31'),
(7819, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 20:41:27'),
(7820, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 21:04:32'),
(7821, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-09 21:04:39'),
(7822, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:55:19'),
(7823, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:55:24'),
(7824, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:55:45'),
(7825, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:55:56'),
(7826, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:56:05'),
(7827, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:56:07'),
(7828, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:56:28'),
(7829, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:56:51'),
(7830, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:57:26'),
(7831, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:57:40'),
(7832, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:57:50'),
(7833, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 05:57:58'),
(7834, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:23:49'),
(7835, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:23:55'),
(7836, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:24:08'),
(7837, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:24:10'),
(7838, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:24:17'),
(7839, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:26:27'),
(7840, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:26:33'),
(7841, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:26:39'),
(7842, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:26:44'),
(7843, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:26:47'),
(7844, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:26:49'),
(7845, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:04'),
(7846, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:08'),
(7847, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:12'),
(7848, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:14'),
(7849, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:29'),
(7850, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:48'),
(7851, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:50'),
(7852, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:53'),
(7853, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:54'),
(7854, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:56'),
(7855, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:27:57'),
(7856, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:32:51'),
(7857, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:31'),
(7858, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:38'),
(7859, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:40'),
(7860, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:47'),
(7861, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:50'),
(7862, '::1', 'http://localhost/ckasir/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:52'),
(7863, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:33:56'),
(7864, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:01'),
(7865, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:03'),
(7866, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:05'),
(7867, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:12'),
(7868, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:14'),
(7869, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:17'),
(7870, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:37'),
(7871, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:38'),
(7872, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:42'),
(7873, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:44'),
(7874, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:50'),
(7875, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:53'),
(7876, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:34:57'),
(7877, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:01'),
(7878, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:02'),
(7879, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:29'),
(7880, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:32'),
(7881, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:35'),
(7882, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:36'),
(7883, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:37'),
(7884, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:41'),
(7885, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:42'),
(7886, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:35:52'),
(7887, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:02'),
(7888, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:05'),
(7889, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:07'),
(7890, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:09'),
(7891, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:22'),
(7892, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:37'),
(7893, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:38'),
(7894, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:41'),
(7895, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:36:44'),
(7896, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:37:12'),
(7897, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:37:25'),
(7898, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:37:43'),
(7899, '::1', 'http://localhost/ckasir/images/ajax-loader.gif', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '2021-02-10 06:37:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_cat`
--
ALTER TABLE `content_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_position`
--
ALTER TABLE `menu_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_cat`
--
ALTER TABLE `product_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trash`
--
ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login_failed`
--
ALTER TABLE `user_login_failed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `bank_account`
--
ALTER TABLE `bank_account`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `content_cat`
--
ALTER TABLE `content_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `content_tag`
--
ALTER TABLE `content_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `menu_position`
--
ALTER TABLE `menu_position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_cat`
--
ALTER TABLE `product_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suplier`
--
ALTER TABLE `suplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testing`
--
ALTER TABLE `testing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100001;

--
-- AUTO_INCREMENT for table `trash`
--
ALTER TABLE `trash`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=495;

--
-- AUTO_INCREMENT for table `user_login_failed`
--
ALTER TABLE `user_login_failed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7900;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD CONSTRAINT `produk_kategori_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_kategori_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trash`
--
ALTER TABLE `trash`
  ADD CONSTRAINT `trash_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

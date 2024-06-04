-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: mysql
-- Üretim Zamanı: 04 Haz 2024, 15:40:46
-- Sunucu sürümü: 5.7.44
-- PHP Sürümü: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `laravel_voyager`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `catalogs`
--

CREATE TABLE `catalogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `catalogs`
--

INSERT INTO `catalogs` (`id`, `title`, `slug`, `image`, `file`, `featured`, `hit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Katalog 1', 'katalog-1', 'catalogs/May2024/C3wyVnpWPPOtKbqVKxlo.png', NULL, 1, 0, 1, '2024-05-30 14:56:06', '2024-05-30 14:56:06', NULL),
(2, 'Katalog 2', 'katalog-2', 'catalogs/May2024/WAYkmotzBv8J2PZP7jMj.png', NULL, 1, 0, 1, '2024-05-30 14:56:31', '2024-05-30 14:56:31', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Kategori 1', 'kategori-1', 1, '2024-05-25 13:05:53', '2024-05-25 13:12:35', NULL),
(2, NULL, 'Kategori 2', 'kategori-2', 2, '2024-05-25 13:05:53', '2024-05-25 13:12:51', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING','VIEWED','RESPONDED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `company`, `subject`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Berkan TEST', 'berkan@test.com', '05123456789', 'Test Company', 'Test Subject', 'Test message', 'PENDING', '2024-06-01 02:48:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forex_buying` decimal(10,0) DEFAULT '0',
  `forex_selling` decimal(10,0) DEFAULT '0',
  `banknote_buying` decimal(10,0) DEFAULT '0',
  `banknote_selling` decimal(10,0) DEFAULT '0',
  `source_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `source_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `forex_buying`, `forex_selling`, `banknote_buying`, `banknote_selling`, `source_at`, `source_no`, `sort`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Türk Lirası', 'TRY', NULL, NULL, NULL, NULL, '2024-06-02 11:27:58', NULL, 1, 1, '2024-06-02 11:27:58', '2024-06-02 11:27:58', NULL),
(2, 'US Dollar', 'USD', NULL, NULL, NULL, NULL, '2024-06-02 11:28:28', NULL, 2, 1, '2024-06-02 11:28:28', '2024-06-02 11:28:28', NULL),
(3, 'Euro', 'EUR', NULL, NULL, NULL, NULL, '2024-06-02 11:28:42', NULL, 3, 1, '2024-06-02 11:28:42', '2024-06-02 11:28:42', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Ad', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'E-posta', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Şifre', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 10),
(6, 1, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 12),
(7, 1, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 0, 0, 0, 0, '{}', 13),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 5),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Rol', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roller', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 8),
(11, 1, 'settings', 'hidden', 'Ayarlar', 0, 0, 0, 0, 0, 0, '{}', 11),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Rol', 0, 1, 1, 1, 1, 1, '{}', 6),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Üst Kategori', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Sıra', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 5),
(25, 4, 'name', 'text', 'Ad', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 3),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"required|max:255\"},\"description\":\"Bo\\u015f b\\u0131rak\\u0131lmas\\u0131 durumunda otomatik olarak olu\\u015fturulacakt\\u0131r.\"}', 4),
(27, 4, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Yazar', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 2),
(31, 5, 'category_id', 'text', 'Kategori', 0, 0, 0, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 3),
(32, 5, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 6),
(33, 5, 'excerpt', 'text_area', 'Alıntı', 0, 0, 1, 1, 1, 1, '{}', 8),
(34, 5, 'body', 'rich_text_box', 'İçerik', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 9),
(35, 5, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 10),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 7),
(37, 5, 'meta_description', 'text_area', 'Meta Açıklaması', 0, 0, 1, 1, 1, 1, '{\"null\":\"\",\"validation\":{\"rule\":\"max:160\"}}', 11),
(38, 5, 'meta_keywords', 'text_area', 'Anahtar Kelimeler', 0, 0, 1, 1, 1, 1, '{\"null\":\"\"}', 12),
(39, 5, 'status', 'select_dropdown', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"yay\\u0131nland\\u0131\",\"DRAFT\":\"taslak\",\"PENDING\":\"bekliyor\"}}', 16),
(40, 5, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 17),
(41, 5, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 18),
(42, 5, 'seo_title', 'text', 'SEO Başlık', 0, 0, 1, 1, 1, 1, '{\"null\":\"\"}', 13),
(43, 5, 'featured', 'checkbox', 'Öne Çıkanlar', 1, 1, 1, 1, 1, 1, '{\"default\":0}', 14),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Yazar', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(48, 6, 'body', 'rich_text_box', 'İçerik', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 4),
(50, 6, 'meta_description', 'text', 'Meta Açıklaması', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"max:160\"}}', 8),
(51, 6, 'meta_keywords', 'text', 'Anahtar Kelimeler', 0, 0, 1, 1, 1, 1, '{}', 9),
(52, 6, 'status', 'select_dropdown', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"Pasif\",\"ACTIVE\":\"Aktif\"}}', 10),
(53, 6, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 11),
(54, 6, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 12),
(55, 6, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(56, 4, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 8),
(57, 5, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 19),
(58, 1, 'email_verified_at', 'timestamp', 'E-posta Doğrulama Tarihi', 0, 1, 1, 1, 1, 1, '{}', 9),
(59, 5, 'post_belongsto_user_relationship', 'relationship', 'Yazar', 1, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(60, 5, 'post_belongsto_category_relationship', 'relationship', 'Kategori', 1, 1, 1, 0, 0, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(61, 5, 'hit', 'number', 'Hit', 0, 1, 1, 0, 0, 0, '{\"default\":0}', 15),
(62, 7, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 7, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 2),
(64, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:catalogs,slug\"}}', 3),
(65, 7, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"250\",\"height\":\"300\"}}]}', 4),
(66, 7, 'featured', 'checkbox', 'Öne Çıkanlar', 1, 1, 1, 1, 1, 1, '{\"default\":0}', 6),
(67, 7, 'hit', 'number', 'Görüntülenme', 0, 1, 1, 0, 0, 0, '{\"default\":0}', 7),
(68, 7, 'status', 'checkbox', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":0}', 8),
(69, 7, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 9),
(70, 7, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 10),
(71, 7, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 11),
(72, 8, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(73, 8, 'author_id', 'text', 'Author Id', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 2),
(74, 8, 'category_id', 'text', 'Category Id', 0, 0, 0, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 3),
(75, 8, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 6),
(76, 8, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:news,slug\"}}', 7),
(77, 8, 'excerpt', 'text_area', 'Alıntı', 0, 0, 1, 1, 1, 1, '{}', 8),
(78, 8, 'body', 'rich_text_box', 'İçerik', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 9),
(79, 8, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 10),
(80, 8, 'meta_description', 'text_area', 'Meta Açıklaması', 0, 0, 1, 1, 1, 1, '{\"null\":\"\",\"validation\":{\"rule\":\"max:160\"}}', 11),
(81, 8, 'meta_keywords', 'text_area', 'Anahtar Kelimeler', 0, 0, 1, 1, 1, 1, '{\"null\":\"\"}', 12),
(82, 8, 'seo_title', 'text', 'SEO Başlık', 0, 0, 1, 1, 1, 1, '{\"null\":\"\"}', 13),
(83, 8, 'featured', 'checkbox', 'Öne Çıkanlar', 1, 1, 1, 1, 1, 1, '{\"default\":0}', 14),
(84, 8, 'hit', 'text', 'Hit', 0, 1, 1, 0, 0, 0, '{\"default\":0}', 15),
(85, 8, 'status', 'select_dropdown', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"yay\\u0131nland\\u0131\",\"DRAFT\":\"taslak\",\"PENDING\":\"bekliyor\"}}', 16),
(86, 8, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 17),
(87, 8, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 18),
(88, 8, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 19),
(89, 8, 'news_belongsto_category_relationship', 'relationship', 'Kategori', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"catalogs\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(90, 8, 'news_belongsto_user_relationship', 'relationship', 'Yazar', 1, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"catalogs\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(91, 9, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(92, 9, 'name', 'text', 'Ad', 1, 1, 1, 0, 0, 1, '{}', 2),
(93, 9, 'email', 'text', 'E-posta', 1, 1, 1, 0, 0, 1, '{}', 3),
(94, 9, 'phone', 'text', 'Telefon', 1, 1, 1, 0, 0, 1, '{}', 4),
(95, 9, 'company', 'text', 'Firma', 0, 1, 1, 0, 0, 1, '{}', 5),
(96, 9, 'subject', 'text', 'Konu', 1, 1, 1, 0, 0, 1, '{}', 6),
(97, 9, 'message', 'rich_text_box', 'Mesaj', 1, 1, 1, 0, 0, 1, '{}', 7),
(98, 9, 'status', 'select_dropdown', 'Durum', 1, 1, 1, 1, 0, 1, '{\"default\":\"PENDING\",\"options\":{\"PENDING\":\"bekliyor\",\"VIEWED\":\"g\\u00f6r\\u00fcnt\\u00fclendi\",\"RESPONDED\":\"yan\\u0131t verildi\"}}', 8),
(99, 9, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 9),
(100, 9, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 10),
(101, 9, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 11),
(102, 10, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(103, 10, 'name', 'text', 'Ad', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50\"}}', 2),
(104, 10, 'code', 'text', 'Kod', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:5\"}}', 3),
(105, 10, 'forex_buying', 'text', 'Döviz Alış', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 4),
(106, 10, 'forex_selling', 'text', 'Döviz Satış', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 5),
(107, 10, 'banknote_buying', 'text', 'Efektif Alış', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 6),
(108, 10, 'banknote_selling', 'text', 'Efektif Satış', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 7),
(109, 10, 'source_at', 'timestamp', 'Kaynak Tarih', 1, 1, 1, 0, 0, 0, '{}', 8),
(110, 10, 'source_no', 'text', 'Kaynak No', 0, 1, 1, 0, 0, 0, '{}', 9),
(111, 10, 'sort', 'number', 'Sıra', 0, 1, 1, 1, 1, 1, '{}', 10),
(112, 10, 'status', 'checkbox', 'Durum', 1, 1, 1, 1, 1, 1, '{}', 11),
(113, 10, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 12),
(114, 10, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 13),
(115, 10, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 14),
(116, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(117, 11, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 2),
(118, 11, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:qualities,slug\"}}', 3),
(119, 11, 'content', 'rich_text_box', 'İçerik', 0, 1, 1, 1, 1, 1, '{}', 5),
(120, 11, 'hit', 'number', 'Hit', 1, 1, 1, 0, 0, 0, '{\"default\":0}', 6),
(121, 11, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 7),
(122, 11, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 8),
(123, 11, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 9),
(124, 11, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(125, 7, 'file', 'file', 'Dosya', 0, 1, 1, 1, 1, 1, '{}', 5),
(126, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(127, 12, 'type', 'select_dropdown', 'Tür', 0, 1, 1, 1, 1, 1, '{\"default\":\"IMAGE\",\"options\":{\"IMAGE\":\"G\\u00f6rsel\",\"VIDEO\":\"Video\",\"EXTERNALVIDEOLINK\":\"Video linki\"}}', 2),
(128, 12, 'media_name', 'media_picker', 'Media Name', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1920\",\"height\":\"500\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"500\",\"height\":\"null\"}}]}', 3),
(129, 12, 'title', 'text', 'Başlık', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 4),
(130, 12, 'description', 'text', 'Açıklama', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 5),
(131, 12, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 6),
(132, 12, 'sort', 'number', 'Sıra', 0, 1, 1, 1, 1, 1, '{}', 7),
(133, 12, 'status', 'checkbox', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":0}', 8),
(134, 12, 'created_at', 'timestamp', 'Oluşturma Tarihi', 0, 1, 1, 0, 0, 0, '{}', 9),
(135, 12, 'updated_at', 'timestamp', 'Güncelleme Tarihi', 0, 0, 1, 0, 0, 0, '{}', 10),
(136, 12, 'deleted_at', 'timestamp', 'Silinme Tarihi', 0, 0, 1, 0, 0, 1, '{}', 11);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Kullanıcı', 'Kullanıcılar', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-25 07:13:16', '2024-05-30 10:47:45'),
(2, 'menus', 'menus', 'Menü', 'Menüler', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-25 07:13:16', '2024-05-28 12:18:46'),
(3, 'roles', 'roles', 'Rol', 'Roller', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-25 07:13:16', '2024-05-28 12:37:41'),
(4, 'categories', 'categories', 'Kategori', 'Kategoriler', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, 'Deneme kategori tanımı', 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-25 13:05:53', '2024-05-28 15:52:59'),
(5, 'posts', 'posts', 'Gönderi', 'Gönderiler', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-25 13:05:53', '2024-05-30 14:47:27'),
(6, 'pages', 'pages', 'Sayfa', 'Sayfalar', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-25 13:05:53', '2024-05-30 12:35:06'),
(7, 'catalogs', 'catalogs', 'Katalog', 'Kataloglar', 'voyager-documentation', 'App\\Models\\Catalog', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-30 13:11:16', '2024-06-04 13:06:56'),
(8, 'news', 'news', 'Haber', 'Haberler', 'voyager-news', 'App\\Models\\News', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-31 11:28:31', '2024-05-31 11:40:13'),
(9, 'contact_messages', 'contact-messages', 'İletişim Mesajı', 'İletişim Mesajları', 'voyager-mail', 'App\\Models\\ContactMessage', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-05-31 23:40:10', '2024-05-31 23:54:02'),
(10, 'currencies', 'currencies', 'Para Birimi', 'Para Birimleri', 'voyager-credit-cards', 'App\\Models\\Currency', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"sort\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-02 11:17:09', '2024-06-02 11:30:01'),
(11, 'qualities', 'qualities', 'Kalite', 'Kaliteler', 'voyager-documentation', 'App\\Models\\Quality', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2024-06-03 07:54:08', '2024-06-04 13:27:12'),
(12, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-images', 'App\\Models\\Slider', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"sort\",\"order_display_column\":\"media_name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-04 14:01:13', '2024-06-04 14:35:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(2, 'site', '2024-05-25 14:16:52', '2024-05-30 12:14:42');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Kontrol Paneli', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2024-05-25 07:13:16', '2024-05-25 14:59:05', 'voyager.dashboard', 'null'),
(2, 1, 'Medya', '', '_self', 'voyager-images', '#000000', NULL, 5, '2024-05-25 07:13:16', '2024-06-02 11:19:43', 'voyager.media.index', 'null'),
(3, 1, 'Kullanıcılar', '', '_self', 'voyager-person', '#000000', 16, 1, '2024-05-25 07:13:16', '2024-05-31 11:05:07', 'voyager.users.index', 'null'),
(4, 1, 'Roller', '', '_self', 'voyager-lock', '#000000', 16, 2, '2024-05-25 07:13:16', '2024-05-31 11:05:07', 'voyager.roles.index', 'null'),
(5, 1, 'Araçlar', '', '_self', 'voyager-tools', '#000000', NULL, 8, '2024-05-25 07:13:16', '2024-06-02 11:19:43', NULL, ''),
(6, 1, 'Menü Oluşturucu', '', '_self', 'voyager-list', '#000000', 5, 1, '2024-05-25 07:13:16', '2024-05-28 14:50:15', 'voyager.menus.index', 'null'),
(7, 1, 'Veritabanı', '', '_self', 'voyager-data', '#000000', 5, 2, '2024-05-25 07:13:16', '2024-05-28 11:48:13', 'voyager.database.index', 'null'),
(8, 1, 'Pusula', '', '_self', 'voyager-compass', '#000000', 5, 3, '2024-05-25 07:13:16', '2024-05-28 14:50:40', 'voyager.compass.index', 'null'),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2024-05-25 07:13:16', '2024-05-25 08:12:25', 'voyager.bread.index', NULL),
(10, 1, 'Ayarlar', '', '_self', 'voyager-settings', '#000000', NULL, 6, '2024-05-25 07:13:16', '2024-06-02 11:19:43', 'voyager.settings.index', 'null'),
(11, 1, 'Kategoriler', '', '_self', 'voyager-categories', '#000000', 17, 7, '2024-05-25 13:05:53', '2024-06-04 14:21:52', 'voyager.categories.index', 'null'),
(12, 1, 'Gönderiler', '', '_self', 'voyager-news', '#000000', 17, 2, '2024-05-25 13:05:53', '2024-05-31 11:09:45', 'voyager.posts.index', 'null'),
(13, 1, 'Sayfalar', '', '_self', 'voyager-file-text', '#000000', 17, 1, '2024-05-25 13:05:53', '2024-05-31 11:09:38', 'voyager.pages.index', 'null'),
(14, 2, 'Anasayfa', '', '_self', 'voyager-dot', '#af1818', NULL, 9, '2024-05-25 15:16:54', '2024-05-30 12:17:59', 'home', 'null'),
(15, 1, 'Kataloglar', '', '_self', 'voyager-documentation', '#000000', 17, 3, '2024-05-30 13:11:17', '2024-05-31 11:09:48', 'voyager.catalogs.index', 'null'),
(16, 1, 'Yetki', '', '_self', 'voyager-people', '#000000', NULL, 7, '2024-05-31 11:04:45', '2024-06-02 11:19:43', NULL, ''),
(17, 1, 'İçerikler', '', '_self', 'voyager-file-code', '#000000', NULL, 2, '2024-05-31 11:09:24', '2024-05-31 11:09:52', NULL, ''),
(18, 1, 'Haberler', '', '_self', 'voyager-news', '#000000', 17, 4, '2024-05-31 11:28:31', '2024-05-31 11:34:06', 'voyager.news.index', 'null'),
(19, 1, 'İletişim Mesajları', '', '_self', 'voyager-mail', '#000000', NULL, 3, '2024-05-31 23:40:10', '2024-05-31 23:43:46', 'voyager.contact-messages.index', 'null'),
(20, 1, 'Para Birimleri', '', '_self', 'voyager-credit-cards', '#000000', NULL, 4, '2024-06-02 11:17:10', '2024-06-02 11:19:43', 'voyager.currencies.index', 'null'),
(21, 1, 'Kaliteler', '', '_self', 'voyager-documentation', '#000000', 17, 5, '2024-06-03 07:54:09', '2024-06-03 08:11:14', 'voyager.qualities.index', 'null'),
(22, 1, 'Sliders', '', '_self', 'voyager-images', '#000000', 17, 6, '2024-06-04 14:01:14', '2024-06-04 14:21:52', 'voyager.sliders.index', 'null');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `news`
--

INSERT INTO `news` (`id`, `author_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `image`, `meta_description`, `meta_keywords`, `seo_title`, `featured`, `hit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Haber 1', 'haber-1', 'Haber 1 alıntı mesajı', '<p>Haber 1 i&ccedil;eriği</p>', 'news/May2024/Ayf6YpvkrZY2Ur736LHo.png', 'Haber 1 meta açıklaması', 'haber, haber 1', NULL, 1, 0, 'PUBLISHED', '2024-05-31 11:49:13', '2024-05-31 11:49:13', NULL),
(2, 2, 2, 'Haber 2', 'haber-2', 'Haber 2 alıntı mesajı', '<p>Haber 2 i&ccedil;eriği</p>', 'news/May2024/apHykyNts427oITW7Wx8.png', 'Haber 2 meta açıklaması', 'haber, haber 2', NULL, 0, 0, 'PUBLISHED', '2024-05-31 11:56:01', '2024-05-31 11:56:01', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Merhaba Dünya', 'Pervaneyi asın, grog, grog çiçeği, kenevir jigiyle dans edin, iskeleye basın, sintine faresini hesap yağmacısına götürün. Nelson\'ın çılgın gabion hattı taslak scallywag yangın gemisi gaff şans eseri kulaç vakası vuruldu. Deniz Bacakları sintine faresi sloop matey gabion uzun elbiseleriyle Gold Road dişli liginde bir atış yapıyor.', '<p>Selam D&uuml;nya. Scallywag grog &ccedil;ubuğu Cat o\'nine tails scuttle te&ccedil;hizatı sert kablo kesici Yellow Jack. C&ouml;mert ruhlar kara yağmacısını kandırıyor ya da sadece Jenny\'nin &ccedil;ay fincanını kırarak şarkı s&ouml;yl&uuml;yorlar. Provost uzun elbiseli siyah nokta Yellow Jack, ana ligindeki laten yelkenli vakasında lee m&uuml;cadelesine saldırdı.</p>\n<p>Balast ruhları şans eseri bana &ccedil;eyrek g&uuml;verte guletinin kara yağmacısını ya da sadece gabion emniyet pimini yağlıyor. Pinnace kı&ccedil; kalyonu sancak tarafındaki &ccedil;&ouml;zg&uuml; atlıkarıncası, zincirleriniz &uuml;zerinde &ouml;l&ccedil;&uuml;lm&uuml;ş kenevir jig neşeli teknesiyle dans etmeye devam ediyor. Delikteki savaş adamı ateşi, c&ouml;mert&ccedil;e doubloon barkader Sahil Kardeşleri darağacı şof&ouml;r&uuml; burun kıvırıyor.</p>', 'pages/page1.jpg', 'merhaba-dunya', 'Meta Açıklaması', 'anahtar kelime 1, anahtar kelime 2', 'ACTIVE', '2024-05-25 13:05:53', '2024-05-25 13:10:26');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(2, 'browse_bread', NULL, '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(3, 'browse_database', NULL, '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(4, 'browse_media', NULL, '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(5, 'browse_compass', NULL, '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(6, 'browse_menus', 'menus', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(7, 'read_menus', 'menus', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(8, 'edit_menus', 'menus', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(9, 'add_menus', 'menus', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(10, 'delete_menus', 'menus', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(11, 'browse_roles', 'roles', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(12, 'read_roles', 'roles', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(13, 'edit_roles', 'roles', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(14, 'add_roles', 'roles', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(15, 'delete_roles', 'roles', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(16, 'browse_users', 'users', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(17, 'read_users', 'users', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(18, 'edit_users', 'users', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(19, 'add_users', 'users', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(20, 'delete_users', 'users', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(21, 'browse_settings', 'settings', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(22, 'read_settings', 'settings', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(23, 'edit_settings', 'settings', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(24, 'add_settings', 'settings', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(25, 'delete_settings', 'settings', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(26, 'browse_categories', 'categories', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(27, 'read_categories', 'categories', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(28, 'edit_categories', 'categories', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(29, 'add_categories', 'categories', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(30, 'delete_categories', 'categories', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(31, 'browse_posts', 'posts', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(32, 'read_posts', 'posts', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(33, 'edit_posts', 'posts', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(34, 'add_posts', 'posts', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(35, 'delete_posts', 'posts', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(36, 'browse_pages', 'pages', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(37, 'read_pages', 'pages', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(38, 'edit_pages', 'pages', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(39, 'add_pages', 'pages', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(40, 'delete_pages', 'pages', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(41, 'browse_catalogs', 'catalogs', '2024-05-30 13:11:17', '2024-05-30 13:11:17'),
(42, 'read_catalogs', 'catalogs', '2024-05-30 13:11:17', '2024-05-30 13:11:17'),
(43, 'edit_catalogs', 'catalogs', '2024-05-30 13:11:17', '2024-05-30 13:11:17'),
(44, 'add_catalogs', 'catalogs', '2024-05-30 13:11:17', '2024-05-30 13:11:17'),
(45, 'delete_catalogs', 'catalogs', '2024-05-30 13:11:17', '2024-05-30 13:11:17'),
(46, 'browse_news', 'news', '2024-05-31 11:28:31', '2024-05-31 11:28:31'),
(47, 'read_news', 'news', '2024-05-31 11:28:31', '2024-05-31 11:28:31'),
(48, 'edit_news', 'news', '2024-05-31 11:28:31', '2024-05-31 11:28:31'),
(49, 'add_news', 'news', '2024-05-31 11:28:31', '2024-05-31 11:28:31'),
(50, 'delete_news', 'news', '2024-05-31 11:28:31', '2024-05-31 11:28:31'),
(51, 'browse_contact_messages', 'contact_messages', '2024-05-31 23:40:10', '2024-05-31 23:40:10'),
(52, 'read_contact_messages', 'contact_messages', '2024-05-31 23:40:10', '2024-05-31 23:40:10'),
(53, 'edit_contact_messages', 'contact_messages', '2024-05-31 23:40:10', '2024-05-31 23:40:10'),
(54, 'add_contact_messages', 'contact_messages', '2024-05-31 23:40:10', '2024-05-31 23:40:10'),
(55, 'delete_contact_messages', 'contact_messages', '2024-05-31 23:40:10', '2024-05-31 23:40:10'),
(56, 'browse_currencies', 'currencies', '2024-06-02 11:17:10', '2024-06-02 11:17:10'),
(57, 'read_currencies', 'currencies', '2024-06-02 11:17:10', '2024-06-02 11:17:10'),
(58, 'edit_currencies', 'currencies', '2024-06-02 11:17:10', '2024-06-02 11:17:10'),
(59, 'add_currencies', 'currencies', '2024-06-02 11:17:10', '2024-06-02 11:17:10'),
(60, 'delete_currencies', 'currencies', '2024-06-02 11:17:10', '2024-06-02 11:17:10'),
(61, 'browse_qualities', 'qualities', '2024-06-03 07:54:09', '2024-06-03 07:54:09'),
(62, 'read_qualities', 'qualities', '2024-06-03 07:54:09', '2024-06-03 07:54:09'),
(63, 'edit_qualities', 'qualities', '2024-06-03 07:54:09', '2024-06-03 07:54:09'),
(64, 'add_qualities', 'qualities', '2024-06-03 07:54:09', '2024-06-03 07:54:09'),
(65, 'delete_qualities', 'qualities', '2024-06-03 07:54:09', '2024-06-03 07:54:09'),
(66, 'browse_sliders', 'sliders', '2024-06-04 14:01:13', '2024-06-04 14:01:13'),
(67, 'read_sliders', 'sliders', '2024-06-04 14:01:13', '2024-06-04 14:01:13'),
(68, 'edit_sliders', 'sliders', '2024-06-04 14:01:13', '2024-06-04 14:01:13'),
(69, 'add_sliders', 'sliders', '2024-06-04 14:01:13', '2024-06-04 14:01:13'),
(70, 'delete_sliders', 'sliders', '2024-06-04 14:01:13', '2024-06-04 14:01:13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `image`, `meta_description`, `meta_keywords`, `seo_title`, `featured`, `hit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Lorem Ipsum Yazısı', 'lorem-ipsum-yazisi', 'Bu yazının kısa açıklamasıdır.', '<p>Bu lorem ipsum yazısının g&ouml;vdesidir.</p>\n<figure class=\"image\"><img title=\"G&ouml;rsel Başlığı\" src=\"http://localhost/storage/posts/May2024/lorem.png\" alt=\"Alternatif A&ccedil;ıklama\" width=\"1560\" height=\"1040\">\n<figcaption>G&ouml;rsel Alt Başlık</figcaption>\n</figure>\n<p>&nbsp;</p>', 'posts/post1.jpg', 'Bu meta açıklamasıdır.', 'anahtar1, anahtar2, anahtar3', 'SEO Başlığı', 0, 0, 'PUBLISHED', '2024-05-25 13:05:53', '2024-05-28 13:16:13', NULL),
(2, 1, 1, 'Örnek Yazı', 'ornek-yazi', 'Bu örnek yazının alıntısıdır', '<p>Bu, g&ouml;vdeyi i&ccedil;eren &ouml;rnek g&ouml;nderinin g&ouml;vdesidir.</p>\n<h2>Her t&uuml;rl&uuml; formatı kullanabiliriz!</h2>\n<p>Ve bir s&uuml;r&uuml; başka şey ekleyin.</p>', 'posts/post2.jpg', 'Örnek yazı için Meta Açıklama', 'anahtar kelime1, anahtar kelime2, anahtar kelime3', '', 0, 0, 'PUBLISHED', '2024-05-25 13:05:54', '2024-05-28 13:15:42', NULL),
(3, 1, 2, 'Son Yazı', 'son-yazi', 'Bu son yazının alıntısı', '<p>Bu son yazının i&ccedil;eriği</p>', 'posts/post3.jpg', 'Bu meta açıklamasıdır', 'anahtar kelime1, anahtar kelime2, anahtar kelime3', '', 0, 0, 'PUBLISHED', '2024-05-25 13:05:55', '2024-05-28 13:17:19', NULL),
(4, 1, 2, 'Yarr Yazısı', 'yarr-yazisi', 'Resif yelkenleri, kablo sandığının üzerine bir yay getiriyor, jüri direği sivri uçlu Sekiz Parçası kıç güvertesini yağmalıyor. Kırpıcı sürücüsü dümenci kalyon kenevir yular baskı çetesi ile geliyor çete kalasları tekneler liderliği sallıyor. Nipperkin yarda gök yelkeni sürüntü kordonu Blimey sintine suyu ho çeyrek Buccaneer.', '<p>Swab &ouml;l&uuml; ışıklar Korsan ateş gemisi kare te&ccedil;hizatlı dans kenevir jig\'i tartmak &ccedil;apa gevezelik meyve i&ccedil;eceği salkımı. Jenny\'nin &ccedil;ay fincanı kovalayan silahlar, kalplerin ruhları, fı&ccedil;ı kafalı Gold Road, zincirlerinize g&ouml;re &ouml;l&ccedil;&uuml;len altı poundluk kula&ccedil;. Ana ıskota vekili, yelkenli barkadeer kıvrımlı mizzenmast tugayı yağmalamaya &ccedil;alışıyor.</p>\n<p>Mizzen ligi keelhaul kalyon ihale dişli kovalamaca Berberi Sahili doublon Jenny\'nin &ccedil;ay bardağını kırdı. Adamı u&ccedil;urun yelkenli ateş gemisi pinnace kıkırdama meyve hattı warp Kara saldırı renkleri doubloon\'un amirali. Jack Ketch\'le m&uuml;cadele edin, kıvrımlı rom draft frengileri pruvada r&uuml;zgar kestane rengi bir atış yapın.</p>\n<p>Interloper listeyi aşağı &ccedil;ekiyor, s&uuml;r&uuml;c&uuml; kutsal taş frengisine basıyor ve &ccedil;apasındaki sintineli sintineyle m&uuml;cadele ediyor. Jack Tar araya giren taslak kıskacı mizzen direği hulk knave kablo kı&ccedil; yatırması fı&ccedil;ıbaşı. Gaff yağma, grog kı&ccedil;ını takip etmek i&ccedil;in silahları korsanlık yardarm d&uuml;zenbaz g&ouml;k g&uuml;r&uuml;lt&uuml;s&uuml; alkışını takip ediyor.</p>', 'posts/post4.jpg', 'bu bir meta açıklama olsun', 'Resif yelkenleri, Nipperkin yarda gök yelkeni, Buccaneer', '', 0, 0, 'PUBLISHED', '2024-05-25 13:05:56', '2024-05-28 13:15:05', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qualities`
--

CREATE TABLE `qualities` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `hit` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `qualities`
--

INSERT INTO `qualities` (`id`, `title`, `slug`, `image`, `content`, `hit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kalite 1', 'kalite-1', 'qualities/June2024/aoumlLiXcFkRdhj3c6HK.png', '<p>Kalite 1 İ&ccedil;erik</p>', 0, '2024-06-03 08:18:08', '2024-06-03 08:18:08', NULL),
(2, 'Kalite 2', 'kalite-2', 'qualities/June2024/2Evz1n3bd2WBgqYpECZ1.png', '<p>Kalite 2 İ&ccedil;erik</p>', 0, '2024-06-03 08:25:53', '2024-06-03 08:25:53', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-05-25 07:13:16', '2024-05-25 07:13:16'),
(2, 'user', 'Normal User', '2024-05-25 07:13:16', '2024-05-25 07:13:16');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/May2024/QpffiDuPUTMh9Tti2dqj.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 6, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 2, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 3, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 4, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 5, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 7, 'Admin'),
(11, 'admin.fw_version', 'Framework Version', 'v1.0.0', NULL, 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `media_name`, `title`, `description`, `url`, `sort`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IMAGE', 'sliders/slider.png', 'Slider 1', 'Slider 1 Açıklama', NULL, 1, 1, '2024-06-04 14:46:23', '2024-06-04 14:46:23', NULL),
(2, 'IMAGE', 'sliders/slider-1.png', 'Slider 2', 'Slider 2 Açıklama', NULL, 2, 1, '2024-06-04 15:36:17', '2024-06-04 15:36:17', NULL),
(3, 'IMAGE', 'sliders/slider-2.png', 'Slider 3', 'Slider 3 Açıklama', NULL, 3, 1, '2024-06-04 15:37:51', '2024-06-04 15:37:51', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-05-25 13:05:53', '2024-05-25 13:05:53'),
(31, 'pages', 'title', 1, 'en', 'Hello World', '2024-05-25 13:10:26', '2024-05-25 13:10:26'),
(32, 'pages', 'body', 1, 'en', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-05-25 13:10:26', '2024-05-25 13:10:26'),
(33, 'pages', 'slug', 1, 'en', 'hello-world', '2024-05-25 13:10:26', '2024-05-25 13:10:26'),
(34, 'categories', 'name', 1, 'en', 'Category 1', '2024-05-25 13:12:35', '2024-05-25 13:12:35'),
(35, 'categories', 'slug', 1, 'en', 'category-1', '2024-05-25 13:12:35', '2024-05-25 13:12:35'),
(36, 'categories', 'name', 2, 'en', 'Category 2', '2024-05-25 13:12:51', '2024-05-25 13:12:51'),
(37, 'categories', 'slug', 2, 'en', 'category-2', '2024-05-25 13:12:51', '2024-05-25 13:12:51'),
(38, 'menu_items', 'title', 1, 'en', 'Dashboard', '2024-05-25 14:59:05', '2024-05-25 14:59:05'),
(39, 'menu_items', 'title', 4, 'en', 'Roles', '2024-05-25 14:59:47', '2024-05-25 14:59:47'),
(40, 'menu_items', 'title', 3, 'en', 'Users', '2024-05-25 15:00:12', '2024-05-25 15:00:12'),
(41, 'menu_items', 'title', 2, 'en', 'Media', '2024-05-25 15:00:21', '2024-05-25 15:00:21'),
(42, 'menu_items', 'title', 5, 'en', 'Tools', '2024-05-25 15:00:46', '2024-05-25 15:00:46'),
(43, 'menu_items', 'title', 10, 'en', 'Settings', '2024-05-25 15:01:01', '2024-05-25 15:01:01'),
(44, 'menu_items', 'title', 13, 'en', 'Pages', '2024-05-25 15:01:43', '2024-05-25 15:01:43'),
(45, 'menu_items', 'title', 11, 'en', 'Categories', '2024-05-25 15:01:53', '2024-05-25 15:01:53'),
(46, 'menu_items', 'title', 14, 'en', 'Home', '2024-05-25 15:16:55', '2024-05-30 12:17:59'),
(47, 'data_rows', 'display_name', 29, 'en', 'ID', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(48, 'data_rows', 'display_name', 30, 'en', 'Author', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(49, 'data_rows', 'display_name', 31, 'en', 'Category', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(50, 'data_rows', 'display_name', 32, 'en', 'Title', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(51, 'data_rows', 'display_name', 42, 'en', 'SEO Title', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(52, 'data_rows', 'display_name', 33, 'en', 'Excerpt', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(53, 'data_rows', 'display_name', 34, 'en', 'Body', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(54, 'data_rows', 'display_name', 35, 'en', 'Post Image', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(55, 'data_rows', 'display_name', 36, 'en', 'Slug', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(56, 'data_rows', 'display_name', 37, 'en', 'Meta Description', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(57, 'data_rows', 'display_name', 38, 'en', 'Meta Keywords', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(58, 'data_rows', 'display_name', 39, 'en', 'Status', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(59, 'data_rows', 'display_name', 43, 'en', 'Featured', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(60, 'data_rows', 'display_name', 40, 'en', 'Created At', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(61, 'data_rows', 'display_name', 41, 'en', 'Updated At', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(62, 'data_types', 'display_name_singular', 5, 'en', 'Post', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(63, 'data_types', 'display_name_plural', 5, 'en', 'Posts', '2024-05-26 12:39:45', '2024-05-26 12:39:45'),
(64, 'menu_items', 'title', 12, 'en', 'Posts', '2024-05-26 12:41:31', '2024-05-26 12:41:31'),
(65, 'menu_items', 'title', 7, 'en', 'Database', '2024-05-28 11:48:13', '2024-05-28 11:48:13'),
(66, 'data_rows', 'display_name', 22, 'en', 'ID', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(67, 'data_rows', 'display_name', 23, 'en', 'Parent', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(68, 'data_rows', 'display_name', 25, 'en', 'Name', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(69, 'data_rows', 'display_name', 26, 'en', 'Slug', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(70, 'data_rows', 'display_name', 24, 'en', 'Order', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(71, 'data_rows', 'display_name', 27, 'en', 'Created At', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(72, 'data_rows', 'display_name', 28, 'en', 'Updated At', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(73, 'data_types', 'display_name_singular', 4, 'en', 'Category', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(74, 'data_types', 'display_name_plural', 4, 'en', 'Categories', '2024-05-28 11:57:51', '2024-05-28 11:57:51'),
(75, 'data_rows', 'display_name', 56, 'en', 'Deleted At', '2024-05-28 12:03:29', '2024-05-28 12:03:29'),
(76, 'data_rows', 'display_name', 12, 'en', 'ID', '2024-05-28 12:18:47', '2024-05-28 12:18:47'),
(77, 'data_rows', 'display_name', 13, 'en', 'Name', '2024-05-28 12:18:47', '2024-05-28 12:18:47'),
(78, 'data_rows', 'display_name', 14, 'en', 'Created At', '2024-05-28 12:18:47', '2024-05-28 12:18:47'),
(79, 'data_rows', 'display_name', 15, 'en', 'Updated At', '2024-05-28 12:18:47', '2024-05-28 12:18:47'),
(80, 'data_types', 'display_name_singular', 2, 'en', 'Menu', '2024-05-28 12:18:47', '2024-05-28 12:18:47'),
(81, 'data_types', 'display_name_plural', 2, 'en', 'Menus', '2024-05-28 12:18:47', '2024-05-28 12:18:47'),
(82, 'data_rows', 'display_name', 44, 'en', 'ID', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(83, 'data_rows', 'display_name', 45, 'en', 'Author', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(84, 'data_rows', 'display_name', 46, 'en', 'Title', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(85, 'data_rows', 'display_name', 47, 'en', 'Excerpt', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(86, 'data_rows', 'display_name', 48, 'en', 'Body', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(87, 'data_rows', 'display_name', 55, 'en', 'Page Image', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(88, 'data_rows', 'display_name', 49, 'en', 'Slug', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(89, 'data_rows', 'display_name', 50, 'en', 'Meta Description', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(90, 'data_rows', 'display_name', 51, 'en', 'Meta Keywords', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(91, 'data_rows', 'display_name', 52, 'en', 'Status', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(92, 'data_rows', 'display_name', 53, 'en', 'Created At', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(93, 'data_rows', 'display_name', 54, 'en', 'Updated At', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(94, 'data_types', 'display_name_singular', 6, 'en', 'Page', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(95, 'data_types', 'display_name_plural', 6, 'en', 'Pages', '2024-05-28 12:22:25', '2024-05-28 12:22:25'),
(96, 'data_rows', 'display_name', 57, 'en', 'Deleted At', '2024-05-28 12:33:25', '2024-05-28 12:33:25'),
(97, 'data_rows', 'display_name', 1, 'en', 'ID', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(98, 'data_rows', 'display_name', 21, 'en', 'Role', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(99, 'data_rows', 'display_name', 2, 'en', 'Name', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(100, 'data_rows', 'display_name', 3, 'en', 'Email', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(101, 'data_rows', 'display_name', 8, 'en', 'Avatar', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(102, 'data_rows', 'display_name', 4, 'en', 'Password', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(103, 'data_rows', 'display_name', 5, 'en', 'Remember Token', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(104, 'data_rows', 'display_name', 11, 'en', 'Settings', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(105, 'data_rows', 'display_name', 6, 'en', 'Created At', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(106, 'data_rows', 'display_name', 7, 'en', 'Updated At', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(107, 'data_rows', 'display_name', 9, 'en', 'Role', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(108, 'data_rows', 'display_name', 10, 'en', 'Roles', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(109, 'data_types', 'display_name_singular', 1, 'en', 'User', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(110, 'data_types', 'display_name_plural', 1, 'en', 'Users', '2024-05-28 12:34:31', '2024-05-28 12:34:31'),
(111, 'data_rows', 'display_name', 16, 'en', 'ID', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(112, 'data_rows', 'display_name', 17, 'en', 'Name', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(113, 'data_rows', 'display_name', 20, 'en', 'Display Name', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(114, 'data_rows', 'display_name', 18, 'en', 'Created At', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(115, 'data_rows', 'display_name', 19, 'en', 'Updated At', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(116, 'data_types', 'display_name_singular', 3, 'en', 'Role', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(117, 'data_types', 'display_name_plural', 3, 'en', 'Roles', '2024-05-28 12:37:41', '2024-05-28 12:37:41'),
(118, 'data_rows', 'display_name', 59, 'en', 'users', '2024-05-28 13:00:24', '2024-05-28 13:00:24'),
(119, 'posts', 'title', 1, 'en', 'Lorem Ipsum Post', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(120, 'posts', 'excerpt', 1, 'en', 'This is the excerpt for the Lorem Ipsum Post', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(121, 'posts', 'body', 1, 'en', '<p>This is the body of the lorem ipsum post</p>', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(122, 'posts', 'slug', 1, 'en', 'lorem-ipsum-post', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(123, 'posts', 'meta_description', 1, 'en', 'This is the meta description', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(124, 'posts', 'meta_keywords', 1, 'en', 'keyword1, keyword2, keyword3', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(125, 'posts', 'seo_title', 1, 'en', 'SEO Title', '2024-05-28 13:06:36', '2024-05-28 13:06:36'),
(126, 'posts', 'title', 2, 'en', 'My Sample Post', '2024-05-28 13:08:55', '2024-05-28 13:08:55'),
(127, 'posts', 'excerpt', 2, 'en', 'This is the excerpt for the sample Post', '2024-05-28 13:08:55', '2024-05-28 13:08:55'),
(128, 'posts', 'body', 2, 'en', '<p>This is the body for the sample post, which includes the body.</p>\n<h2>We can use all kinds of format!</h2>\n<p>And include a bunch of other stuff.</p>', '2024-05-28 13:08:55', '2024-05-28 13:08:55'),
(129, 'posts', 'slug', 2, 'en', 'my-sample-post', '2024-05-28 13:08:55', '2024-05-28 13:08:55'),
(130, 'posts', 'meta_description', 2, 'en', 'Meta Description for sample post', '2024-05-28 13:08:55', '2024-05-28 13:08:55'),
(131, 'posts', 'meta_keywords', 2, 'en', 'keyword1, keyword2, keyword3', '2024-05-28 13:08:55', '2024-05-28 13:08:55'),
(132, 'posts', 'title', 4, 'en', 'Yarr Post', '2024-05-28 13:15:05', '2024-05-28 13:15:05'),
(133, 'posts', 'excerpt', 4, 'en', 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '2024-05-28 13:15:05', '2024-05-28 13:15:05'),
(134, 'posts', 'body', 4, 'en', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', '2024-05-28 13:15:05', '2024-05-28 13:15:05'),
(135, 'posts', 'slug', 4, 'en', 'yarr-post', '2024-05-28 13:15:05', '2024-05-28 13:15:05'),
(136, 'posts', 'meta_description', 4, 'en', 'this be a meta descript', '2024-05-28 13:15:05', '2024-05-28 13:15:05'),
(137, 'posts', 'meta_keywords', 4, 'en', 'Reef sails, Clipper driver, Buccaneer', '2024-05-28 13:15:05', '2024-05-28 13:15:05'),
(138, 'posts', 'title', 3, 'en', 'Latest Post', '2024-05-28 13:17:19', '2024-05-28 13:17:19'),
(139, 'posts', 'excerpt', 3, 'en', 'This is the excerpt for the latest post', '2024-05-28 13:17:19', '2024-05-28 13:17:19'),
(140, 'posts', 'body', 3, 'en', '<p>This is the body for the latest post</p>', '2024-05-28 13:17:19', '2024-05-28 13:17:19'),
(141, 'posts', 'slug', 3, 'en', 'latest-post', '2024-05-28 13:17:19', '2024-05-28 13:17:19'),
(142, 'posts', 'meta_description', 3, 'en', 'This is the meta description', '2024-05-28 13:17:19', '2024-05-28 13:17:19'),
(143, 'posts', 'meta_keywords', 3, 'en', 'keyword1, keyword2, keyword3', '2024-05-28 13:17:19', '2024-05-28 13:17:19'),
(144, 'data_rows', 'display_name', 60, 'en', 'categories', '2024-05-28 13:40:02', '2024-05-28 13:40:02'),
(145, 'data_rows', 'display_name', 61, 'en', 'Hit', '2024-05-28 13:52:37', '2024-05-28 13:52:37'),
(146, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2024-05-28 14:50:15', '2024-05-28 14:50:15'),
(147, 'menu_items', 'title', 8, 'en', 'Compass', '2024-05-28 14:50:40', '2024-05-28 14:50:40'),
(148, 'data_rows', 'display_name', 58, 'en', 'Email Verified At', '2024-05-30 07:14:29', '2024-05-30 07:14:29'),
(149, 'data_rows', 'display_name', 62, 'en', 'Id', '2024-05-30 13:11:34', '2024-05-30 13:11:34'),
(150, 'data_rows', 'display_name', 63, 'en', 'Title', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(151, 'data_rows', 'display_name', 64, 'en', 'Slug', '2024-05-30 13:11:34', '2024-05-30 13:11:34'),
(152, 'data_rows', 'display_name', 65, 'en', 'Image', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(153, 'data_rows', 'display_name', 66, 'en', 'Featured', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(154, 'data_rows', 'display_name', 67, 'en', 'Hit', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(155, 'data_rows', 'display_name', 68, 'en', 'Status', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(156, 'data_rows', 'display_name', 69, 'en', 'Created At', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(157, 'data_rows', 'display_name', 70, 'en', 'Updated At', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(158, 'data_rows', 'display_name', 71, 'en', 'Deleted At', '2024-05-30 13:11:34', '2024-05-30 14:42:29'),
(159, 'data_types', 'display_name_singular', 7, 'en', 'Catalog', '2024-05-30 13:11:34', '2024-05-30 13:11:34'),
(160, 'data_types', 'display_name_plural', 7, 'en', 'Catalogs', '2024-05-30 13:11:34', '2024-05-30 13:11:34'),
(161, 'menu_items', 'title', 15, 'en', 'Catalogs', '2024-05-30 13:24:03', '2024-05-30 13:24:03'),
(162, 'catalogs', 'title', 1, 'en', 'Catalog 1', '2024-05-30 14:56:06', '2024-05-30 14:56:06'),
(163, 'catalogs', 'slug', 1, 'en', 'catalog-1', '2024-05-30 14:56:06', '2024-05-30 14:56:06'),
(164, 'catalogs', 'title', 2, 'en', 'Catalog 2', '2024-05-30 14:56:31', '2024-05-30 14:56:31'),
(165, 'catalogs', 'slug', 2, 'en', 'catalog-2', '2024-05-30 14:56:31', '2024-05-30 14:56:31'),
(166, 'menu_items', 'title', 16, 'en', 'Authority', '2024-05-31 11:04:45', '2024-05-31 11:04:45'),
(167, 'menu_items', 'title', 17, 'en', 'Contents', '2024-05-31 11:09:24', '2024-05-31 11:09:24'),
(168, 'menu_items', 'title', 18, 'en', 'News', '2024-05-31 11:33:45', '2024-05-31 11:33:45'),
(169, 'data_rows', 'display_name', 72, 'en', 'Id', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(170, 'data_rows', 'display_name', 73, 'en', 'Author Id', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(171, 'data_rows', 'display_name', 74, 'en', 'Category Id', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(172, 'data_rows', 'display_name', 75, 'en', 'Title', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(173, 'data_rows', 'display_name', 76, 'en', 'Slug', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(174, 'data_rows', 'display_name', 77, 'en', 'Excerpt', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(175, 'data_rows', 'display_name', 78, 'en', 'Body', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(176, 'data_rows', 'display_name', 79, 'en', 'Image', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(177, 'data_rows', 'display_name', 80, 'en', 'Meta Description', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(178, 'data_rows', 'display_name', 81, 'en', 'Meta Keywords', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(179, 'data_rows', 'display_name', 82, 'en', 'Seo Title', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(180, 'data_rows', 'display_name', 83, 'en', 'Featured', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(181, 'data_rows', 'display_name', 84, 'en', 'Hit', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(182, 'data_rows', 'display_name', 85, 'en', 'Status', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(183, 'data_rows', 'display_name', 86, 'en', 'Created At', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(184, 'data_rows', 'display_name', 87, 'en', 'Updated At', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(185, 'data_rows', 'display_name', 88, 'en', 'Deleted At', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(186, 'data_types', 'display_name_singular', 8, 'en', 'News', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(187, 'data_types', 'display_name_plural', 8, 'en', 'News', '2024-05-31 11:35:52', '2024-05-31 11:35:52'),
(188, 'data_rows', 'display_name', 89, 'en', 'categories', '2024-05-31 11:39:23', '2024-05-31 11:39:23'),
(189, 'data_rows', 'display_name', 90, 'en', 'users', '2024-05-31 11:39:23', '2024-05-31 11:39:23'),
(190, 'news', 'title', 2, 'en', 'News 2', '2024-05-31 11:56:01', '2024-05-31 11:56:01'),
(191, 'news', 'slug', 2, 'en', 'news-2', '2024-05-31 11:56:01', '2024-05-31 11:56:01'),
(192, 'news', 'excerpt', 2, 'en', 'News 2 excerpt', '2024-05-31 11:56:01', '2024-05-31 11:56:01'),
(193, 'news', 'body', 2, 'en', '<p>News 2 content</p>', '2024-05-31 11:56:01', '2024-05-31 11:56:01'),
(194, 'news', 'meta_description', 2, 'en', 'News 2 meta description', '2024-05-31 11:56:01', '2024-05-31 11:56:01'),
(195, 'news', 'meta_keywords', 2, 'en', 'news, news 2', '2024-05-31 11:56:01', '2024-05-31 11:56:01'),
(196, 'news', 'title', 1, 'en', 'News 1', '2024-05-31 11:56:36', '2024-05-31 11:56:36'),
(197, 'news', 'slug', 1, 'en', 'news-1', '2024-05-31 11:56:36', '2024-05-31 11:56:36'),
(198, 'news', 'excerpt', 1, 'en', 'News 1 excerpt', '2024-05-31 11:56:36', '2024-05-31 12:01:04'),
(199, 'news', 'body', 1, 'en', '<p>News 1 content</p>', '2024-05-31 11:56:36', '2024-05-31 11:56:36'),
(200, 'news', 'meta_description', 1, 'en', 'News 1 meta description', '2024-05-31 11:56:36', '2024-05-31 11:56:36'),
(201, 'news', 'meta_keywords', 1, 'en', 'news, news 1', '2024-05-31 11:56:36', '2024-05-31 11:56:36'),
(202, 'data_rows', 'display_name', 91, 'en', 'Id', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(203, 'data_rows', 'display_name', 92, 'en', 'Name', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(204, 'data_rows', 'display_name', 93, 'en', 'Email', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(205, 'data_rows', 'display_name', 94, 'en', 'Phone', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(206, 'data_rows', 'display_name', 95, 'en', 'Company', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(207, 'data_rows', 'display_name', 96, 'en', 'Subject', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(208, 'data_rows', 'display_name', 97, 'en', 'Message', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(209, 'data_rows', 'display_name', 98, 'en', 'Status', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(210, 'data_rows', 'display_name', 99, 'en', 'Created At', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(211, 'data_rows', 'display_name', 100, 'en', 'Updated At', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(212, 'data_rows', 'display_name', 101, 'en', 'Deleted At', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(213, 'data_types', 'display_name_singular', 9, 'en', 'Contact Message', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(214, 'data_types', 'display_name_plural', 9, 'en', 'Contact Messages', '2024-05-31 23:41:12', '2024-05-31 23:41:12'),
(215, 'menu_items', 'title', 19, 'en', 'Contact Messages', '2024-05-31 23:43:36', '2024-05-31 23:43:36'),
(216, 'menu_items', 'title', 20, 'en', 'Currencies', '2024-06-02 11:19:31', '2024-06-02 11:19:31'),
(217, 'data_rows', 'display_name', 102, 'en', 'Id', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(218, 'data_rows', 'display_name', 103, 'en', 'Name', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(219, 'data_rows', 'display_name', 104, 'en', 'Code', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(220, 'data_rows', 'display_name', 105, 'en', 'Forex Buying', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(221, 'data_rows', 'display_name', 106, 'en', 'Forex Selling', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(222, 'data_rows', 'display_name', 107, 'en', 'Banknote Buying', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(223, 'data_rows', 'display_name', 108, 'en', 'Banknote Selling', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(224, 'data_rows', 'display_name', 109, 'en', 'Source At', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(225, 'data_rows', 'display_name', 110, 'en', 'Source No', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(226, 'data_rows', 'display_name', 111, 'en', 'Sort', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(227, 'data_rows', 'display_name', 112, 'en', 'Status', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(228, 'data_rows', 'display_name', 113, 'en', 'Created At', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(229, 'data_rows', 'display_name', 114, 'en', 'Updated At', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(230, 'data_rows', 'display_name', 115, 'en', 'Deleted At', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(231, 'data_types', 'display_name_singular', 10, 'en', 'Currency', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(232, 'data_types', 'display_name_plural', 10, 'en', 'Currencies', '2024-06-02 11:22:51', '2024-06-02 11:22:51'),
(233, 'data_rows', 'display_name', 116, 'en', 'Id', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(234, 'data_rows', 'display_name', 117, 'en', 'Title', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(235, 'data_rows', 'display_name', 118, 'en', 'Slug', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(236, 'data_rows', 'display_name', 119, 'en', 'Content', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(237, 'data_rows', 'display_name', 120, 'en', 'Hit', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(238, 'data_rows', 'display_name', 121, 'en', 'Created At', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(239, 'data_rows', 'display_name', 122, 'en', 'Updated At', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(240, 'data_rows', 'display_name', 123, 'en', 'Deleted At', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(241, 'data_types', 'display_name_singular', 11, 'en', 'Quality', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(242, 'data_types', 'display_name_plural', 11, 'en', 'Qualities', '2024-06-03 08:08:57', '2024-06-03 08:08:57'),
(243, 'menu_items', 'title', 21, 'en', 'Qualities', '2024-06-03 08:11:14', '2024-06-03 08:11:14'),
(244, 'data_rows', 'display_name', 124, 'en', 'Image', '2024-06-03 08:14:44', '2024-06-03 08:14:44'),
(245, 'qualities', 'title', 1, 'en', 'Quality 1', '2024-06-03 08:18:08', '2024-06-03 08:18:08'),
(246, 'qualities', 'slug', 1, 'en', 'quality-1', '2024-06-03 08:18:08', '2024-06-03 08:18:08'),
(247, 'qualities', 'content', 1, 'en', '<p>Quality 1 Content</p>', '2024-06-03 08:18:08', '2024-06-03 08:18:08'),
(248, 'qualities', 'title', 2, 'en', 'Quality 2', '2024-06-03 08:25:53', '2024-06-03 08:25:53'),
(249, 'qualities', 'slug', 2, 'en', 'quality-2', '2024-06-03 08:25:53', '2024-06-03 08:25:53'),
(250, 'qualities', 'content', 2, 'en', '<p>Quality 2 Content</p>', '2024-06-03 08:25:53', '2024-06-03 08:25:53'),
(251, 'data_rows', 'display_name', 126, 'en', 'Id', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(252, 'data_rows', 'display_name', 127, 'en', 'Type', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(253, 'data_rows', 'display_name', 128, 'en', 'Media Name', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(254, 'data_rows', 'display_name', 129, 'en', 'Title', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(255, 'data_rows', 'display_name', 130, 'en', 'Description', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(256, 'data_rows', 'display_name', 131, 'en', 'Url', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(257, 'data_rows', 'display_name', 132, 'en', 'Sort', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(258, 'data_rows', 'display_name', 133, 'en', 'Status', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(259, 'data_rows', 'display_name', 134, 'en', 'Created At', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(260, 'data_rows', 'display_name', 135, 'en', 'Updated At', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(261, 'data_rows', 'display_name', 136, 'en', 'Deleted At', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(262, 'data_types', 'display_name_singular', 12, 'en', 'Slider', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(263, 'data_types', 'display_name_plural', 12, 'en', 'Sliders', '2024-06-04 14:15:32', '2024-06-04 14:15:32'),
(264, 'menu_items', 'title', 22, 'en', 'Sliders', '2024-06-04 14:21:43', '2024-06-04 14:21:43'),
(265, 'sliders', 'title', 2, 'en', 'Slider 2', '2024-06-04 15:36:17', '2024-06-04 15:36:17'),
(266, 'sliders', 'description', 2, 'en', 'Slider 2 Description', '2024-06-04 15:36:17', '2024-06-04 15:36:17'),
(267, 'sliders', 'title', 1, 'en', 'Slider 1', '2024-06-04 15:36:53', '2024-06-04 15:36:53'),
(268, 'sliders', 'description', 1, 'en', 'Slider 1 Description', '2024-06-04 15:36:53', '2024-06-04 15:36:53'),
(269, 'sliders', 'title', 3, 'en', 'Slider 3', '2024-06-04 15:37:51', '2024-06-04 15:37:51'),
(270, 'sliders', 'description', 3, 'en', 'Slider 3 Description', '2024-06-04 15:37:51', '2024-06-04 15:37:51');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$12$hGqVoNWGJNa5.H81u93vB.G6CX.bv.6QT91eGboFt4IKO1L72YKwO', 'NAaFB4UoIvymYzQr0svw5QuuunDvg6F2bsQdc9jeR7pxGNbcRx3QQK4ZEkVV', '{\"locale\":\"tr\"}', '2024-05-25 07:21:47', '2024-05-28 11:37:02'),
(2, 2, 'User', 'user@user.com', 'users/default.png', NULL, '$2y$12$rX.ISptVFOTL.crMksfU6uA2dRldtphvov7R.2ZJwI8hmlRndOSa2', NULL, '{\"locale\":\"tr\"}', '2024-05-30 07:30:57', '2024-05-30 07:30:57');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 2);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `catalogs`
--
ALTER TABLE `catalogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalogs_slug_unique` (`slug`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Tablo için indeksler `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Tablo için indeksler `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Tablo için indeksler `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_slug_unique` (`slug`);

--
-- Tablo için indeksler `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Tablo için indeksler `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Tablo için indeksler `qualities`
--
ALTER TABLE `qualities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qualities_slug_unique` (`slug`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Tablo için indeksler `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Tablo için indeksler `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `catalogs`
--
ALTER TABLE `catalogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- Tablo için AUTO_INCREMENT değeri `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Tablo için AUTO_INCREMENT değeri `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `qualities`
--
ALTER TABLE `qualities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Tablo kısıtlamaları `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

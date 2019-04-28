-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2019 at 03:28 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esosis`
--

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `code`, `student_id`, `created_at`, `updated_at`) VALUES
(49, 'kszyDGjlIm', 75, NULL, NULL),
(50, 'YJzOzSyeKX', 76, NULL, NULL),
(51, 'evUEkoeuCQ', 77, NULL, NULL),
(52, 'zKPiHLfBdZ', 78, NULL, NULL),
(53, 'PLSNumciks', 79, NULL, NULL),
(54, 'vIpOiLEiPI', 80, NULL, NULL),
(55, 'gAwLWbeFIq', 81, NULL, NULL),
(56, 'voWwMHmtGe', 82, NULL, NULL),
(57, 'dluMplbQZx', 83, NULL, NULL),
(58, 'nPbSjgDddE', 84, NULL, NULL),
(59, 'rYlQgybzmv', 85, NULL, NULL),
(60, 'FqjWRpYXHS', 86, NULL, NULL),
(61, 'DHGYLjNJGy', 87, NULL, NULL),
(62, 'ltPbGBCXHU', 88, NULL, NULL),
(63, 'ykkvnfFtYv', 89, NULL, NULL),
(64, 'UrZpkfuQGo', 90, NULL, NULL),
(65, 'aJMlZIMyDv', 92, NULL, NULL),
(66, 'nPLhARhQfJ', 93, NULL, NULL),
(67, 'omqyZSeGMv', 94, NULL, NULL),
(68, 'faLcSvYXaR', 95, NULL, NULL),
(69, 'KThIkuiMlD', 96, NULL, NULL),
(70, 'nGJpbGXtZa', 97, NULL, NULL),
(71, 'yxjbyBISmH', 98, NULL, NULL),
(72, 'geppEkiTeC', 99, NULL, NULL),
(73, 'HWoBoFJwUc', 100, NULL, NULL),
(74, 'WIdskcgKsO', 101, NULL, NULL),
(75, 'SOZhTDyNVY', 102, NULL, NULL),
(76, 'JsaYJnDxfP', 103, NULL, NULL),
(77, 'pOZZHIPGpy', 104, NULL, NULL),
(78, 'dEukRCXqXs', 105, NULL, NULL),
(79, 'sdDVtnwKWh', 106, NULL, NULL),
(80, 'PZTCbbXruC', 107, NULL, NULL),
(81, 'ziqeiYLCRy', 108, NULL, NULL),
(82, 'PDSnJVJwXX', 109, NULL, NULL),
(83, 'FkKATrbthI', 110, NULL, NULL),
(84, 'SiaYaDCfEE', 111, NULL, NULL),
(85, 'owaWikzJsh', 112, NULL, NULL),
(86, 'NBrLdeQsiC', 113, NULL, NULL),
(87, 'uZYMDfKAOE', 114, NULL, NULL),
(88, 'BnCJeGbTva', 115, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Please Fill',
  `second` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Please Fill',
  `third` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Please Fill',
  `fourth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Please Fill',
  `sy_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `student_id`, `grade_level`, `first`, `second`, `third`, `fourth`, `sy_id`, `created_at`, `updated_at`) VALUES
(84, 75, '3', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(85, 76, '4', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(86, 77, '3', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(87, 78, '4', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(88, 79, '7', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(89, 80, '7', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(90, 81, '4', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(91, 82, '6', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(92, 83, '4', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(93, 84, '10', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(94, 85, '5', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(95, 86, '8', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(96, 87, '8', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(97, 88, '9', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(98, 89, '4', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(99, 90, '10', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(100, 92, '5', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(101, 93, '5', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(102, 94, '6', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(103, 95, '5', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(104, 96, '9', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(105, 97, '9', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(106, 98, '3', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(107, 99, '3', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(108, 100, '3', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(109, 101, '6', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(110, 102, '7', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(111, 103, '8', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(112, 104, '6', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(113, 105, '7', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(114, 106, '7', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(115, 107, '7', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(116, 108, '8', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(117, 109, '8', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(118, 110, '9', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(119, 111, '10', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(120, 112, '9', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(121, 113, '9', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(122, 114, '10', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL),
(123, 115, '10', 'Please Fill', 'Please Fill', 'Please Fill', 'Please Fill', 23, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emergencies`
--

CREATE TABLE `emergencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationship` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_contact` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergencies`
--

INSERT INTO `emergencies` (`id`, `student_id`, `name`, `relationship`, `contact`, `address`, `alt_contact`, `created_at`, `updated_at`) VALUES
(60, 75, 'NA', 'NA', '0', 'NA', '0', NULL, NULL),
(61, 76, 'Jay Alameda', 'Father', '9106261873', 'Prk. Talong, Gredu, Panabo City', NULL, NULL, NULL),
(62, 77, 'Nomy Alcoseba', 'Father', '9395651587', 'Prk. Nangka, Gredu. Panabo City', NULL, NULL, NULL),
(63, 78, 'Joanie Buensalida', 'Mother', '9050999515', 'km 31 infront of San Agustin Parich', NULL, NULL, NULL),
(64, 79, 'Caire Cabales', 'Mother', '9095243657', 'Kanari Homes, New Visayas, Panabo City', NULL, NULL, NULL),
(65, 80, 'Daisy Erezo', 'Mother', '9994849483', 'Prk. Nangka, Gredu, Panabo City', NULL, NULL, NULL),
(66, 81, 'Charity Ann Elarcosa', 'Mother', '9158226519', 'Prk. Gabi, Gredu, Panabo City', NULL, NULL, NULL),
(67, 82, 'Mike Alfie Ejara', 'Father', '9395420673', 'P1 Durian Sr. Macla Homes Subd. New Visayas, Panabo City', NULL, NULL, NULL),
(68, 83, 'Darius Diaz', 'Father', '9205010630', 'Prk. Pechay, Gredu, Panabo City', NULL, NULL, NULL),
(69, 84, 'Josephine Caballes', 'Mother', '9307792045', 'White Plains Brgy. Gredu, Panabo City', NULL, NULL, NULL),
(70, 85, 'Lonard Dombase', 'Father', '9108214626', 'Oakwood Reidence, New Visayas, Panabo City', NULL, NULL, NULL),
(71, 86, 'Arthur Dadia', 'Father', '9197890186', 'Datu Abdul Dadia, Purok Caimito, Panabo City', NULL, NULL, NULL),
(72, 87, 'Helen Ramos', 'Aunt', '9', 'Valle St. Via, Vida. Datu Abdul, Panabo City', NULL, NULL, NULL),
(73, 88, 'Anna Maria Liza', 'Mother', '9501716284', 'New Visayas, Panabo City', NULL, NULL, NULL),
(74, 89, 'Precilla Lerion', 'Mother', '9071345430', 'Crystal Plain Subd, Gredu, Panabo City', NULL, NULL, NULL),
(75, 90, 'Rosele Layan', 'Mother', '9101895597', 'Prk. Atis, Brgy. Cangohan, Panabo City', NULL, NULL, NULL),
(76, 92, 'Violeta Isada', 'Mother', '9350185526', 'Prk. Sunkist, Niceville Subd. Cagangohan, Panabo City', NULL, NULL, NULL),
(77, 93, 'Remar Ignacio', 'Father', '9489602237', 'St. Northern Plain, Gredu, Panabo City', NULL, NULL, NULL),
(78, 94, 'Cristine Palomar', 'Aunt', '9105693802', 'Brgy. Datu Adbul, Panabo City', NULL, NULL, NULL),
(79, 95, 'Jeffrey Penarroyo', 'Father', '9093166939', 'Lilia Homes, New Visayas, Panabo City', NULL, NULL, NULL),
(80, 96, 'Analiza Padernal', 'Mother', '9121834088', 'Prk. Okra, Gredu, Panano City', NULL, NULL, NULL),
(81, 97, 'Jaclyn Nisnisan', 'Mother', '9068018174', 'White Plain, Brgy. Gredu, Panabo City', NULL, NULL, NULL),
(82, 98, 'Lenette Mea Almero', 'Aunt', '9961433110', 'Via Vida, Datu Abdul, Panabo City', NULL, NULL, NULL),
(83, 99, 'Khayin Qiyam Moya', 'Father', '909091934', 'New Visayas, Panabo City', NULL, NULL, NULL),
(84, 100, 'Roland Moreno Jr', 'Father', '9981598855', 'San Francisco, Panabo City', NULL, NULL, NULL),
(85, 101, 'Elmer Nimes', 'Father', '9486101948', 'Carmen, Davao del Norte', NULL, NULL, NULL),
(86, 102, 'Magdalena Navarro', 'Mother', '9050769963', 'Brgy. New Pandan, Panabo City', NULL, NULL, NULL),
(87, 103, 'Edgar Narvasa', 'Father', '9295273583', 'Northern Plain Subd. Gredu, Panabo City', NULL, NULL, NULL),
(88, 104, 'Nelson Medoza', 'Father', '9207667691', 'Northern Plains Gredu, Panabo City', NULL, NULL, NULL),
(89, 105, 'Genalyn Marqueso', 'Mother', '9272827774', 'Niceville Subd. Cagangohan, Panabo City', NULL, NULL, NULL),
(90, 106, 'Nabilah Bantuas', 'Aunt', '9383188140', 'Prk Islam, Gredu, Panabo City', NULL, NULL, NULL),
(91, 107, 'Francisco Derla Jr.', 'Father', '9089124257', 'Prk. Puso, Panabo City', NULL, NULL, NULL),
(92, 108, 'Joseph Dugang', 'Father', '9382496734', 'Nartatez Ville, Cagangohan, Panabo City', NULL, NULL, NULL),
(93, 109, 'Reynaldo Decena', 'Father', '9199517253', 'Prk. Mangga, Cagangohan, Panabo City', NULL, NULL, NULL),
(94, 110, 'Arlene Candolita', 'Mother', '9161206906', 'Kanari Homes, Panabo City', NULL, NULL, NULL),
(95, 111, 'Fidel Indie', 'Aunt', '9424924378', 'Prk. Sibuyas, Gredu, Panabo City', NULL, NULL, NULL),
(96, 112, 'Rex Hadlocon', 'Father', '9091767936', 'Prk. Carmen, Davao del Norte', NULL, NULL, NULL),
(97, 113, 'Rhoda Mahilum', 'Father', '9106609278', 'Prk. Okra, Gredu, Panabo City', NULL, NULL, NULL),
(98, 114, 'Rose Menoza', 'Mother', '9228293362', 'Prk. Alacta, Brgy. New Pandan, Panabo City', NULL, NULL, NULL),
(99, 115, 'Roger Baring', 'Father', '9776684646', 'Prk. Cogon, JP Laurel, Panabo City', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(191) NOT NULL,
  `whole_year` double(10,2) NOT NULL,
  `misc` double(10,2) NOT NULL,
  `books` double(10,2) NOT NULL,
  `uniform` double(10,2) NOT NULL,
  `pta` double(10,2) NOT NULL,
  `min_downpayment` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `grade_level`, `whole_year`, `misc`, `books`, `uniform`, `pta`, `min_downpayment`, `created_at`, `updated_at`) VALUES
(3, 3, 5000.00, 23423.00, 90.00, 8002.00, 200.00, 600.00, NULL, '2019-01-16 07:26:59'),
(4, 4, 5000.00, 234.00, 1203.00, 45654.00, 200.00, 600.00, NULL, '2019-01-16 07:27:05'),
(5, 5, 5000.00, 23423.00, 123.00, 123.00, 200.00, 600.00, NULL, '2019-01-16 07:27:12'),
(6, 6, 5000.00, 234234.00, 231231.00, 231231.00, 200.00, 600.00, NULL, '2019-01-16 07:27:18'),
(7, 7, 5000.00, 234.00, 23432.00, 234.00, 200.00, 600.00, NULL, '2019-01-16 07:27:23'),
(8, 8, 5000.00, 23423.00, 34322.00, 2342.00, 200.00, 600.00, NULL, '2019-01-16 07:27:28'),
(9, 9, 5000.00, 342.00, 234.00, 234.00, 200.00, 600.00, NULL, '2019-01-16 07:27:34'),
(10, 10, 5000.00, 234234.00, 23423.00, 3423.00, 200.00, 600.00, NULL, '2019-01-16 07:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `first_rankings`
--

CREATE TABLE `first_rankings` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `average` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `first_rankings`
--

INSERT INTO `first_rankings` (`id`, `grade_level`, `student_id`, `average`, `created_at`, `updated_at`) VALUES
(47, 3, 75, 0.00, NULL, NULL),
(48, 4, 76, 0.00, NULL, NULL),
(49, 3, 77, 0.00, NULL, NULL),
(50, 4, 78, 0.00, NULL, NULL),
(51, 7, 79, 0.00, NULL, NULL),
(52, 7, 80, 0.00, NULL, NULL),
(53, 4, 81, 0.00, NULL, NULL),
(54, 6, 82, 0.00, NULL, NULL),
(55, 4, 83, 0.00, NULL, NULL),
(56, 10, 84, 0.00, NULL, NULL),
(57, 5, 85, 0.00, NULL, NULL),
(58, 8, 86, 0.00, NULL, NULL),
(59, 8, 87, 0.00, NULL, NULL),
(60, 9, 88, 0.00, NULL, NULL),
(61, 4, 89, 0.00, NULL, NULL),
(62, 10, 90, 0.00, NULL, NULL),
(63, 5, 92, 0.00, NULL, NULL),
(64, 5, 93, 0.00, NULL, NULL),
(65, 6, 94, 0.00, NULL, NULL),
(66, 5, 95, 0.00, NULL, NULL),
(67, 9, 96, 0.00, NULL, NULL),
(68, 9, 97, 0.00, NULL, NULL),
(69, 3, 98, 0.00, NULL, NULL),
(70, 3, 99, 0.00, NULL, NULL),
(71, 3, 100, 0.00, NULL, NULL),
(72, 6, 101, 0.00, NULL, NULL),
(73, 7, 102, 0.00, NULL, NULL),
(74, 8, 103, 0.00, NULL, NULL),
(75, 6, 104, 0.00, NULL, NULL),
(76, 7, 105, 0.00, NULL, NULL),
(77, 7, 106, 0.00, NULL, NULL),
(78, 7, 107, 0.00, NULL, NULL),
(79, 8, 108, 0.00, NULL, NULL),
(80, 8, 109, 0.00, NULL, NULL),
(81, 9, 110, 0.00, NULL, NULL),
(82, 10, 111, 0.00, NULL, NULL),
(83, 9, 112, 0.00, NULL, NULL),
(84, 9, 113, 0.00, NULL, NULL),
(85, 10, 114, 0.00, NULL, NULL),
(86, 10, 115, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fourth_rankings`
--

CREATE TABLE `fourth_rankings` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `average` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fourth_rankings`
--

INSERT INTO `fourth_rankings` (`id`, `grade_level`, `student_id`, `average`, `created_at`, `updated_at`) VALUES
(47, 3, 75, 0.00, NULL, NULL),
(48, 4, 76, 0.00, NULL, NULL),
(49, 3, 77, 0.00, NULL, NULL),
(50, 4, 78, 0.00, NULL, NULL),
(51, 7, 79, 0.00, NULL, NULL),
(52, 7, 80, 0.00, NULL, NULL),
(53, 4, 81, 0.00, NULL, NULL),
(54, 6, 82, 0.00, NULL, NULL),
(55, 4, 83, 0.00, NULL, NULL),
(56, 10, 84, 0.00, NULL, NULL),
(57, 5, 85, 0.00, NULL, NULL),
(58, 8, 86, 0.00, NULL, NULL),
(59, 8, 87, 0.00, NULL, NULL),
(60, 9, 88, 0.00, NULL, NULL),
(61, 4, 89, 0.00, NULL, NULL),
(62, 10, 90, 0.00, NULL, NULL),
(63, 5, 92, 0.00, NULL, NULL),
(64, 5, 93, 0.00, NULL, NULL),
(65, 6, 94, 0.00, NULL, NULL),
(66, 5, 95, 0.00, NULL, NULL),
(67, 9, 96, 0.00, NULL, NULL),
(68, 9, 97, 0.00, NULL, NULL),
(69, 3, 98, 0.00, NULL, NULL),
(70, 3, 99, 0.00, NULL, NULL),
(71, 3, 100, 0.00, NULL, NULL),
(72, 6, 101, 0.00, NULL, NULL),
(73, 7, 102, 0.00, NULL, NULL),
(74, 8, 103, 0.00, NULL, NULL),
(75, 6, 104, 0.00, NULL, NULL),
(76, 7, 105, 0.00, NULL, NULL),
(77, 7, 106, 0.00, NULL, NULL),
(78, 7, 107, 0.00, NULL, NULL),
(79, 8, 108, 0.00, NULL, NULL),
(80, 8, 109, 0.00, NULL, NULL),
(81, 9, 110, 0.00, NULL, NULL),
(82, 10, 111, 0.00, NULL, NULL),
(83, 9, 112, 0.00, NULL, NULL),
(84, 9, 113, 0.00, NULL, NULL),
(85, 10, 114, 0.00, NULL, NULL),
(86, 10, 115, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_level` int(11) NOT NULL,
  `first` int(11) NOT NULL,
  `second` int(11) NOT NULL,
  `third` int(11) NOT NULL,
  `fourth` int(11) NOT NULL,
  `sy_id` int(11) NOT NULL DEFAULT '0',
  `remarks` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject_id`, `grade_level`, `first`, `second`, `third`, `fourth`, `sy_id`, `remarks`, `created_at`, `updated_at`) VALUES
(464, 75, '42', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(465, 75, '43', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(466, 76, '44', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(467, 76, '45', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(468, 76, '46', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(469, 76, '47', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(470, 76, '48', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(471, 76, '49', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(472, 76, '50', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(473, 77, '42', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(474, 77, '43', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(475, 78, '44', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(476, 78, '45', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(477, 78, '46', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(478, 78, '47', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(479, 78, '48', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(480, 78, '49', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(481, 78, '50', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(482, 79, '66', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(483, 79, '67', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(484, 79, '68', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(485, 79, '69', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(486, 79, '70', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(487, 79, '71', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(488, 79, '72', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(489, 79, '73', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(490, 80, '66', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(491, 80, '67', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(492, 80, '68', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(493, 80, '69', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(494, 80, '70', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(495, 80, '71', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(496, 80, '72', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(497, 80, '73', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(498, 81, '44', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(499, 81, '45', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(500, 81, '46', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(501, 81, '47', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(502, 81, '48', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(503, 81, '49', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(504, 81, '50', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(505, 82, '58', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(506, 82, '59', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(507, 82, '60', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(508, 82, '61', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(509, 82, '62', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(510, 82, '63', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(511, 82, '64', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(512, 82, '65', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(513, 83, '44', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(514, 83, '45', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(515, 83, '46', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(516, 83, '47', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(517, 83, '48', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(518, 83, '49', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(519, 83, '50', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(520, 84, '90', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(521, 84, '91', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(522, 84, '92', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(523, 84, '93', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(524, 84, '94', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(525, 84, '95', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(526, 84, '96', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(527, 84, '97', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(528, 85, '51', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(529, 85, '52', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(530, 85, '53', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(531, 85, '54', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(532, 85, '55', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(533, 85, '56', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(534, 85, '57', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(535, 86, '74', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(536, 86, '75', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(537, 86, '76', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(538, 86, '77', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(539, 86, '78', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(540, 86, '79', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(541, 86, '80', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(542, 86, '81', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(543, 87, '74', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(544, 87, '75', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(545, 87, '76', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(546, 87, '77', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(547, 87, '78', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(548, 87, '79', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(549, 87, '80', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(550, 87, '81', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(551, 88, '82', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(552, 88, '83', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(553, 88, '84', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(554, 88, '85', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(555, 88, '86', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(556, 88, '87', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(557, 88, '88', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(558, 88, '89', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(559, 89, '44', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(560, 89, '45', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(561, 89, '46', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(562, 89, '47', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(563, 89, '48', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(564, 89, '49', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(565, 89, '50', 4, 0, 0, 0, 0, 23, 0, NULL, NULL),
(566, 90, '90', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(567, 90, '91', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(568, 90, '92', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(569, 90, '93', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(570, 90, '94', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(571, 90, '95', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(572, 90, '96', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(573, 90, '97', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(574, 92, '51', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(575, 92, '52', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(576, 92, '53', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(577, 92, '54', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(578, 92, '55', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(579, 92, '56', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(580, 92, '57', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(581, 93, '51', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(582, 93, '52', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(583, 93, '53', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(584, 93, '54', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(585, 93, '55', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(586, 93, '56', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(587, 93, '57', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(588, 94, '58', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(589, 94, '59', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(590, 94, '60', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(591, 94, '61', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(592, 94, '62', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(593, 94, '63', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(594, 94, '64', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(595, 94, '65', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(596, 95, '51', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(597, 95, '52', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(598, 95, '53', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(599, 95, '54', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(600, 95, '55', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(601, 95, '56', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(602, 95, '57', 5, 0, 0, 0, 0, 23, 0, NULL, NULL),
(603, 96, '82', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(604, 96, '83', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(605, 96, '84', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(606, 96, '85', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(607, 96, '86', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(608, 96, '87', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(609, 96, '88', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(610, 96, '89', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(611, 97, '82', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(612, 97, '83', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(613, 97, '84', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(614, 97, '85', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(615, 97, '86', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(616, 97, '87', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(617, 97, '88', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(618, 97, '89', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(619, 98, '42', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(620, 98, '43', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(621, 99, '42', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(622, 99, '43', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(623, 100, '42', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(624, 100, '43', 3, 0, 0, 0, 0, 23, 0, NULL, NULL),
(625, 101, '58', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(626, 101, '59', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(627, 101, '60', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(628, 101, '61', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(629, 101, '62', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(630, 101, '63', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(631, 101, '64', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(632, 101, '65', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(633, 102, '66', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(634, 102, '67', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(635, 102, '68', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(636, 102, '69', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(637, 102, '70', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(638, 102, '71', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(639, 102, '72', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(640, 102, '73', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(641, 103, '74', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(642, 103, '75', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(643, 103, '76', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(644, 103, '77', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(645, 103, '78', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(646, 103, '79', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(647, 103, '80', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(648, 103, '81', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(649, 104, '58', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(650, 104, '59', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(651, 104, '60', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(652, 104, '61', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(653, 104, '62', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(654, 104, '63', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(655, 104, '64', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(656, 104, '65', 6, 0, 0, 0, 0, 23, 0, NULL, NULL),
(657, 105, '66', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(658, 105, '67', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(659, 105, '68', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(660, 105, '69', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(661, 105, '70', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(662, 105, '71', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(663, 105, '72', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(664, 105, '73', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(665, 106, '66', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(666, 106, '67', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(667, 106, '68', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(668, 106, '69', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(669, 106, '70', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(670, 106, '71', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(671, 106, '72', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(672, 106, '73', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(673, 107, '66', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(674, 107, '67', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(675, 107, '68', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(676, 107, '69', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(677, 107, '70', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(678, 107, '71', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(679, 107, '72', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(680, 107, '73', 7, 0, 0, 0, 0, 23, 0, NULL, NULL),
(681, 108, '74', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(682, 108, '75', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(683, 108, '76', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(684, 108, '77', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(685, 108, '78', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(686, 108, '79', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(687, 108, '80', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(688, 108, '81', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(689, 109, '74', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(690, 109, '75', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(691, 109, '76', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(692, 109, '77', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(693, 109, '78', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(694, 109, '79', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(695, 109, '80', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(696, 109, '81', 8, 0, 0, 0, 0, 23, 0, NULL, NULL),
(697, 110, '82', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(698, 110, '83', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(699, 110, '84', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(700, 110, '85', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(701, 110, '86', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(702, 110, '87', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(703, 110, '88', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(704, 110, '89', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(705, 111, '90', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(706, 111, '91', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(707, 111, '92', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(708, 111, '93', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(709, 111, '94', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(710, 111, '95', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(711, 111, '96', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(712, 111, '97', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(713, 112, '82', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(714, 112, '83', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(715, 112, '84', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(716, 112, '85', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(717, 112, '86', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(718, 112, '87', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(719, 112, '88', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(720, 112, '89', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(721, 113, '82', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(722, 113, '83', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(723, 113, '84', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(724, 113, '85', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(725, 113, '86', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(726, 113, '87', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(727, 113, '88', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(728, 113, '89', 9, 0, 0, 0, 0, 23, 0, NULL, NULL),
(729, 114, '90', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(730, 114, '91', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(731, 114, '92', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(732, 114, '93', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(733, 114, '94', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(734, 114, '95', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(735, 114, '96', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(736, 114, '97', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(737, 115, '90', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(738, 115, '91', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(739, 115, '92', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(740, 115, '93', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(741, 115, '94', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(742, 115, '95', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(743, 115, '96', 10, 0, 0, 0, 0, 23, 0, NULL, NULL),
(744, 115, '97', 10, 0, 0, 0, 0, 23, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_no` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `title`, `created_at`, `updated_at`) VALUES
(0, 'Multi-level', NULL, NULL),
(3, 'Kindergarten', NULL, NULL),
(4, 'Grade 1', NULL, NULL),
(5, 'Grade 2', NULL, NULL),
(6, 'Grade 3', NULL, NULL),
(7, 'Grade 4', NULL, NULL),
(8, 'Grade 5', NULL, NULL),
(9, 'Grade 6', NULL, NULL),
(10, 'Grade 7', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level_student`
--

CREATE TABLE `level_student` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `sy_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `level_student`
--

INSERT INTO `level_student` (`id`, `student_id`, `level_id`, `sy_id`, `created_at`, `updated_at`) VALUES
(70, 75, 3, 23, NULL, NULL),
(71, 76, 4, 23, NULL, NULL),
(72, 77, 3, 23, NULL, NULL),
(73, 78, 4, 23, NULL, NULL),
(74, 79, 7, 23, NULL, NULL),
(75, 80, 7, 23, NULL, NULL),
(76, 81, 4, 23, NULL, NULL),
(77, 82, 6, 23, NULL, NULL),
(78, 83, 4, 23, NULL, NULL),
(79, 84, 10, 23, NULL, NULL),
(80, 85, 5, 23, NULL, NULL),
(81, 86, 8, 23, NULL, NULL),
(82, 87, 8, 23, NULL, NULL),
(83, 88, 9, 23, NULL, NULL),
(84, 89, 4, 23, NULL, NULL),
(85, 90, 10, 23, NULL, NULL),
(86, 92, 5, 23, NULL, NULL),
(87, 93, 5, 23, NULL, NULL),
(88, 94, 6, 23, NULL, NULL),
(89, 95, 5, 23, NULL, NULL),
(90, 96, 9, 23, NULL, NULL),
(91, 97, 9, 23, NULL, NULL),
(92, 98, 3, 23, NULL, NULL),
(93, 99, 3, 23, NULL, NULL),
(94, 100, 3, 23, NULL, NULL),
(95, 101, 6, 23, NULL, NULL),
(96, 102, 7, 23, NULL, NULL),
(97, 103, 8, 23, NULL, NULL),
(98, 104, 6, 23, NULL, NULL),
(99, 105, 7, 23, NULL, NULL),
(100, 106, 7, 23, NULL, NULL),
(101, 107, 7, 23, NULL, NULL),
(102, 108, 8, 23, NULL, NULL),
(103, 109, 8, 23, NULL, NULL),
(104, 110, 9, 23, NULL, NULL),
(105, 111, 10, 23, NULL, NULL),
(106, 112, 9, 23, NULL, NULL),
(107, 113, 9, 23, NULL, NULL),
(108, 114, 10, 23, NULL, NULL),
(109, 115, 10, 23, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `activity`, `created_at`, `updated_at`) VALUES
(1, 28, ', Books fee - P 200 200forabdulazis, bayan', '2019-04-28 01:45:27', '2019-04-28 01:45:27'),
(2, 28, ', Books fee - P 90 90 for aguilar, john lyndon', '2019-04-28 01:47:51', '2019-04-28 01:47:51'),
(3, 28, ', Miscellaneous fee - P 500 500 for aguilar, john lyndon', '2019-04-28 01:52:26', '2019-04-28 01:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_12_001421_create_roles_table', 1),
(64, '2018_08_02_113317_create_students_table', 2),
(65, '2018_08_02_121347_create_lectures_table', 2),
(66, '2018_08_02_121522_create_grades_table', 2),
(67, '2018_08_02_121728_create_payments_table', 2),
(68, '2018_08_02_121805_create_comments_table', 2),
(69, '2018_08_02_123345_create_transactions_table', 2),
(70, '2018_08_02_124707_create_user_student_table', 2),
(71, '2018_08_03_014317_create_announcements_table', 2),
(72, '2018_08_05_112848_create_subjects_table', 2),
(73, '2018_10_30_105041_create_populations_table', 2),
(74, '2018_10_30_131124_create_teachers_table', 2),
(75, '2018_10_30_134301_create_rankings_table', 2),
(76, '2018_10_30_140351_create_fees_table', 2),
(77, '2018_11_05_060633_create_parents_table', 2),
(78, '2018_11_05_061056_create_parent_student_table', 2),
(79, '2018_11_05_061846_create_requirements_table', 2),
(80, '2018_11_05_062209_create_emergencies_table', 2),
(81, '2018_11_05_062817_create_schedules_table', 2),
(82, '2018_11_05_070031_create_rooms_table', 2),
(83, '2018_11_05_070225_create_sponsors_table', 2),
(84, '2018_11_05_070506_create_school_year_table', 2),
(85, '2018_11_05_070638_create_sponsor_students_table', 2),
(86, '2018_11_06_160000_add_duration_to_subjects_table', 3),
(87, '2018_11_08_035302_create_levels_table', 4),
(88, '2018_12_12_145035_create_past_schools_table', 5),
(89, '2018_12_14_070732_create_siblings_table', 6),
(90, '2019_01_12_140712_drop_schedules_table', 7),
(91, '2019_01_12_141554_create_schedules_table', 7),
(92, '2019_01_16_162455_create_level_student_table', 8),
(93, '2019_01_18_051652_create_codes_table', 9),
(94, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(95, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(96, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(97, '2016_06_01_000004_create_oauth_clients_table', 10),
(98, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(99, '2019_02_10_024400_create_messages_table', 11),
(100, '2019_02_22_035131_create_first_rankings_table', 12),
(101, '2019_02_22_035648_create_second_rankings_table', 13),
(102, '2019_02_22_035704_create_third_rankings_table', 13),
(103, '2019_02_22_035718_create_fourth_rankings_table', 13),
(104, '2019_03_03_130045_create_messages_table', 14),
(105, '2019_03_14_130545_create_sy_student_table', 15),
(106, '2019_04_28_080410_create_logs_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('8f636a5cd4611074ba39b07674a07aedaea003719c680bc8ede3b9bbc75a7801591d3b18d9d8018f', 26, 1, 'DSADS', '[]', 1, '2019-01-20 00:04:40', '2019-01-20 00:04:40', '2020-01-20 08:04:40'),
('dc1ab2e8e0f5ca4ee3134e3219b3a8a4646f74812451808cee95bcaab25d24173b4ac4c392fb88da', 26, 1, 'DSADS', '[]', 1, '2019-01-20 00:04:38', '2019-01-20 00:04:38', '2020-01-20 08:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'oZqDhmgw55gAYW0ZfCWG9zAevA9FiUsppbh3C8YD', 'http://localhost', 1, 0, 0, '2019-01-19 23:01:00', '2019-01-19 23:01:00'),
(2, NULL, 'Laravel Password Grant Client', '0xW4PhFV7HCmXtYnufMv8Lh4m8K8e2HMvSGDquNE', 'http://localhost', 0, 1, 0, '2019-01-19 23:01:00', '2019-01-19 23:01:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-01-19 23:01:00', '2019-01-19 23:01:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `monthly_income` double(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `student_id`, `type`, `name`, `occupation`, `company`, `monthly_income`, `created_at`, `updated_at`) VALUES
(131, 74, 'guardian', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(132, 75, 'guardian', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(133, 76, 'father', 'Jay Alameda', 'Church Employee', 'NA', 0.00, NULL, NULL),
(134, 76, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(135, 77, 'father', 'Nomy Alcoseba', 'Laborer', 'NA', 0.00, NULL, NULL),
(136, 77, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(137, 78, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(138, 78, 'mother', 'Joanie Buensalida', 'Self-Employed', 'NA', 0.00, NULL, NULL),
(139, 79, 'father', 'Caire Cabales', 'Housewife', 'NA', 0.00, NULL, NULL),
(140, 79, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(141, 80, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(142, 80, 'mother', 'Daisy Erezo', 'NA', 'NA', 0.00, NULL, NULL),
(143, 81, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(144, 81, 'mother', 'Charity Ann Elarcosa', 'Online Business', 'NA', 0.00, NULL, NULL),
(145, 82, 'father', 'Mike Alfie Ejara', 'NA', 'NA', 0.00, NULL, NULL),
(146, 82, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(147, 83, 'father', 'Darius Diaz', 'NA', 'NA', 0.00, NULL, NULL),
(148, 83, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(149, 84, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(150, 84, 'mother', 'Josephine Caballes', 'NA', 'NA', 0.00, NULL, NULL),
(151, 85, 'father', 'Lonard Dombase', 'NA', 'NA', 0.00, NULL, NULL),
(152, 85, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(153, 86, 'father', 'Arthur Dadia', 'NA', 'NA', 0.00, NULL, NULL),
(154, 86, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(155, 87, 'guardian', 'Helen Ramos', 'NA', 'NA', 0.00, NULL, NULL),
(156, 88, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(157, 88, 'mother', 'Anna Maria Liza', 'NA', 'NA', 0.00, NULL, NULL),
(158, 89, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(159, 89, 'mother', 'Precilla Lerion', 'NA', 'NA', 0.00, NULL, NULL),
(160, 90, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(161, 90, 'mother', 'Rosele Layan', 'Government Employee', 'NA', 0.00, NULL, NULL),
(162, 91, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(163, 92, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(164, 92, 'mother', 'Violeta Isada', 'NA', 'NA', 0.00, NULL, NULL),
(165, 93, 'father', 'Remar Ignacio', 'NA', 'NA', 0.00, NULL, NULL),
(166, 93, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(167, 94, 'guardian', 'Cristine Palomar', 'NA', 'NA', 0.00, NULL, NULL),
(168, 95, 'father', 'Jeffrey Penarroyo', 'NA', 'NA', 0.00, NULL, NULL),
(169, 95, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(170, 96, 'father', 'Analiza Padernal', 'NA', 'NA', 0.00, NULL, NULL),
(171, 96, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(172, 97, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(173, 97, 'mother', 'Jaclyn Nisnisan', 'NA', 'NA', 0.00, NULL, NULL),
(174, 98, 'guardian', 'Lenette Mea Almero', 'NA', 'NA', 0.00, NULL, NULL),
(175, 99, 'father', 'Khayin Qiyam Moya', 'NA', 'NA', 0.00, NULL, NULL),
(176, 99, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(177, 100, 'father', 'Roland Moreno Jr', 'NA', 'NA', 0.00, NULL, NULL),
(178, 100, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(179, 101, 'father', 'Elmer Nimes', 'NA', 'NA', 0.00, NULL, NULL),
(180, 101, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(181, 102, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(182, 102, 'mother', 'Magdalena Navarro', 'NA', 'NA', 0.00, NULL, NULL),
(183, 103, 'father', 'Edgar Narvasa', 'Pensioner', 'NA', 0.00, NULL, NULL),
(184, 103, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(185, 104, 'father', 'Nelson Medoza', 'NA', 'NA', 0.00, NULL, NULL),
(186, 104, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(187, 105, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(188, 105, 'mother', 'Genalyn Marqueso', 'NA', 'NA', 0.00, NULL, NULL),
(189, 106, 'guardian', 'Nabilah Bantuas', 'NA', 'NA', 0.00, NULL, NULL),
(190, 107, 'father', 'Francisco Derla Jr.', 'NA', 'NA', 0.00, NULL, NULL),
(191, 107, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(192, 108, 'father', 'Joseph Dugang', 'NA', 'NA', 0.00, NULL, NULL),
(193, 108, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(194, 109, 'father', 'Reynaldo Decena', 'NA', 'NA', 0.00, NULL, NULL),
(195, 109, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(196, 110, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(197, 110, 'mother', 'Arlene Candolita', 'NA', 'NA', 0.00, NULL, NULL),
(198, 111, 'guardian', 'Fidela Indie', 'NA', 'NA', 0.00, NULL, NULL),
(199, 112, 'father', 'Rex Hadlocon', 'NA', 'NA', 0.00, NULL, NULL),
(200, 112, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(201, 113, 'father', 'Rhoda Mahilum', 'NA', 'NA', 0.00, NULL, NULL),
(202, 113, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(203, 114, 'father', 'NA', 'NA', 'NA', 0.00, NULL, NULL),
(204, 114, 'mother', 'Rose Menoza', 'NA', 'NA', 0.00, NULL, NULL),
(205, 115, 'father', 'Roger Baring', 'NA', 'NA', 0.00, NULL, NULL),
(206, 115, 'mother', 'NA', 'NA', 'NA', 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parent_student`
--

CREATE TABLE `parent_student` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('zeddyhotty@gmail.com', '$2y$10$79rIdFSKjpmR98NWIiEGh.rYHTQs1DD.pRcyNfyDE8KbFL0lSUvZu', '2019-01-16 23:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `past_schools`
--

CREATE TABLE `past_schools` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `pastSchool` longtext COLLATE utf8mb4_unicode_ci,
  `schoolAddress` longtext COLLATE utf8mb4_unicode_ci,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `past_schools`
--

INSERT INTO `past_schools` (`id`, `student_id`, `pastSchool`, `schoolAddress`, `date`, `created_at`, `updated_at`) VALUES
(41, 76, 'Lotus', 'Prk. Gabi, Gredu, Panabo City', '23', NULL, NULL),
(42, 78, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(43, 79, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(44, 80, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(45, 81, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(46, 82, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(47, 83, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(48, 84, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(49, 85, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(50, 86, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(51, 87, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(52, 88, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(53, 89, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(54, 90, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(55, 92, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(56, 93, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(57, 94, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(58, 95, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(59, 96, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(60, 97, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(61, 101, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(62, 102, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(63, 103, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(64, 104, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(65, 105, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(66, 106, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(67, 107, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(68, 108, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(69, 109, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(70, 110, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(71, 111, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(72, 112, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(73, 113, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(74, 114, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL),
(75, 115, 'CWS Lotus Foundation', 'Prk. Gabi, Barangay Gredu, Panabo City', '23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `past_balance` double(10,2) NOT NULL,
  `enrollment_fee` double(10,2) NOT NULL,
  `whole_year` double(10,2) NOT NULL,
  `misc` double(10,2) NOT NULL,
  `books` double(10,2) NOT NULL,
  `uniform` double(10,2) NOT NULL,
  `pta` double(10,2) NOT NULL,
  `req_tuition` double(10,2) NOT NULL,
  `bal_tuition` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `student_id`, `past_balance`, `enrollment_fee`, `whole_year`, `misc`, `books`, `uniform`, `pta`, `req_tuition`, `bal_tuition`, `created_at`, `updated_at`) VALUES
(60, 75, 0.00, 0.00, 5000.00, 22923.00, 0.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(61, 76, 0.00, 0.00, 5000.00, 234.00, 1203.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(62, 77, 0.00, 0.00, 5000.00, 23423.00, 90.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(63, 78, 0.00, 0.00, 5000.00, 234.00, 1203.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(64, 79, 0.00, 0.00, 5000.00, 234.00, 23432.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(65, 80, 0.00, 0.00, 5000.00, 234.00, 23432.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(66, 81, 0.00, 0.00, 5000.00, 234.00, 1203.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(67, 82, 0.00, 0.00, 5000.00, 234234.00, 231231.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(68, 83, 0.00, 0.00, 5000.00, 234.00, 1203.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(69, 84, 0.00, 0.00, 5000.00, 234234.00, 23423.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(70, 85, 0.00, 0.00, 5000.00, 23423.00, 123.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(71, 86, 0.00, 0.00, 5000.00, 23423.00, 34322.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(72, 87, 0.00, 0.00, 5000.00, 23423.00, 34322.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(73, 88, 0.00, 0.00, 5000.00, 342.00, 234.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(74, 89, 0.00, 0.00, 5000.00, 234.00, 1203.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(75, 90, 0.00, 0.00, 5000.00, 234234.00, 23423.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(76, 92, 0.00, 0.00, 5000.00, 23423.00, 123.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(77, 93, 0.00, 0.00, 5000.00, 23423.00, 123.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(78, 94, 0.00, 0.00, 5000.00, 234234.00, 231231.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(79, 95, 0.00, 0.00, 5000.00, 23423.00, 123.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(80, 96, 0.00, 0.00, 5000.00, 342.00, 234.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(81, 97, 0.00, 0.00, 5000.00, 342.00, 234.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(82, 98, 0.00, 0.00, 5000.00, 23423.00, 90.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(83, 99, 0.00, 0.00, 5000.00, 23423.00, 90.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(84, 100, 0.00, 0.00, 5000.00, 23423.00, 90.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(85, 101, 0.00, 0.00, 5000.00, 234234.00, 231231.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(86, 102, 0.00, 0.00, 5000.00, 234.00, 23432.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(87, 103, 0.00, 0.00, 5000.00, 23423.00, 34322.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(88, 104, 0.00, 0.00, 5000.00, 234234.00, 231231.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(89, 105, 0.00, 0.00, 5000.00, 234.00, 23432.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(90, 106, 0.00, 0.00, 3700.00, 34.00, 21042.00, 0.00, 0.00, 500.00, 0.00, NULL, NULL),
(91, 107, 0.00, 0.00, 5000.00, 234.00, 23432.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(92, 108, 0.00, 0.00, 5000.00, 23423.00, 34322.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(93, 109, 0.00, 0.00, 5000.00, 23423.00, 34322.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(94, 110, 0.00, 0.00, 5000.00, 342.00, 234.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(95, 111, 0.00, 0.00, 5000.00, 234234.00, 23423.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(96, 112, 0.00, 0.00, 5000.00, 342.00, 234.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(97, 113, 0.00, 0.00, 5000.00, 342.00, 234.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(98, 114, 0.00, 0.00, 5000.00, 234234.00, 23423.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL),
(99, 115, 0.00, 0.00, 5000.00, 234234.00, 23423.00, 0.00, 200.00, 500.00, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `populations`
--

CREATE TABLE `populations` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rankings`
--

CREATE TABLE `rankings` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `average` double(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rankings`
--

INSERT INTO `rankings` (`id`, `grade_level`, `student_id`, `average`, `created_at`, `updated_at`) VALUES
(47, '3', 75, 0.00, NULL, NULL),
(48, '4', 76, 0.00, NULL, NULL),
(49, '3', 77, 0.00, NULL, NULL),
(50, '4', 78, 0.00, NULL, NULL),
(51, '7', 79, 0.00, NULL, NULL),
(52, '7', 80, 0.00, NULL, NULL),
(53, '4', 81, 0.00, NULL, NULL),
(54, '6', 82, 0.00, NULL, NULL),
(55, '4', 83, 0.00, NULL, NULL),
(56, '10', 84, 0.00, NULL, NULL),
(57, '5', 85, 0.00, NULL, NULL),
(58, '8', 86, 0.00, NULL, NULL),
(59, '8', 87, 0.00, NULL, NULL),
(60, '9', 88, 0.00, NULL, NULL),
(61, '4', 89, 0.00, NULL, NULL),
(62, '10', 90, 0.00, NULL, NULL),
(63, '5', 92, 0.00, NULL, NULL),
(64, '5', 93, 0.00, NULL, NULL),
(65, '6', 94, 0.00, NULL, NULL),
(66, '5', 95, 0.00, NULL, NULL),
(67, '9', 96, 0.00, NULL, NULL),
(68, '9', 97, 0.00, NULL, NULL),
(69, '3', 98, 0.00, NULL, NULL),
(70, '3', 99, 0.00, NULL, NULL),
(71, '3', 100, 0.00, NULL, NULL),
(72, '6', 101, 0.00, NULL, NULL),
(73, '7', 102, 0.00, NULL, NULL),
(74, '8', 103, 0.00, NULL, NULL),
(75, '6', 104, 0.00, NULL, NULL),
(76, '7', 105, 0.00, NULL, NULL),
(77, '7', 106, 0.00, NULL, NULL),
(78, '7', 107, 0.00, NULL, NULL),
(79, '8', 108, 0.00, NULL, NULL),
(80, '8', 109, 0.00, NULL, NULL),
(81, '9', 110, 0.00, NULL, NULL),
(82, '10', 111, 0.00, NULL, NULL),
(83, '9', 112, 0.00, NULL, NULL),
(84, '9', 113, 0.00, NULL, NULL),
(85, '10', 114, 0.00, NULL, NULL),
(86, '10', 115, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `form_137` tinyint(1) DEFAULT NULL,
  `birth_cert` tinyint(1) DEFAULT NULL,
  `photo2x2` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `student_id`, `form_137`, `birth_cert`, `photo2x2`, `created_at`, `updated_at`) VALUES
(57, 75, 1, 0, 0, NULL, NULL),
(58, 76, 1, 0, 0, NULL, NULL),
(59, 77, 1, 0, 0, NULL, NULL),
(60, 78, 1, 0, 0, NULL, NULL),
(61, 79, 0, 0, 0, NULL, NULL),
(62, 80, 0, 0, 0, NULL, NULL),
(63, 81, 1, 0, 0, NULL, NULL),
(64, 82, 0, 0, 0, NULL, NULL),
(65, 83, 1, 0, 0, NULL, NULL),
(66, 84, 0, 0, 0, NULL, NULL),
(67, 85, 0, 0, 0, NULL, NULL),
(68, 86, 0, 0, 0, NULL, NULL),
(69, 87, 0, 0, 0, NULL, NULL),
(70, 88, 0, 0, 0, NULL, NULL),
(71, 89, 1, 0, 0, NULL, NULL),
(72, 90, 0, 0, 0, NULL, NULL),
(73, 92, 0, 0, 0, NULL, NULL),
(74, 93, 0, 0, 0, NULL, NULL),
(75, 94, 0, 0, 0, NULL, NULL),
(76, 95, 0, 0, 0, NULL, NULL),
(77, 96, 0, 0, 0, NULL, NULL),
(78, 97, 0, 0, 0, NULL, NULL),
(79, 98, 1, 0, 0, NULL, NULL),
(80, 99, 1, 0, 0, NULL, NULL),
(81, 100, 1, 0, 0, NULL, NULL),
(82, 101, 0, 0, 0, NULL, NULL),
(83, 102, 0, 0, 0, NULL, NULL),
(84, 103, 0, 0, 0, NULL, NULL),
(85, 104, 0, 0, 0, NULL, NULL),
(86, 105, 0, 0, 0, NULL, NULL),
(87, 106, 0, 0, 0, NULL, NULL),
(88, 107, 0, 0, 0, NULL, NULL),
(89, 108, 0, 0, 0, NULL, NULL),
(90, 109, 0, 0, 0, NULL, NULL),
(91, 110, 0, 0, 0, NULL, NULL),
(92, 111, 0, 0, 0, NULL, NULL),
(93, 112, 0, 0, 0, NULL, NULL),
(94, 113, 0, 0, 0, NULL, NULL),
(95, 114, 0, 0, 0, NULL, NULL),
(96, 115, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Staff', NULL, NULL),
(3, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(191) NOT NULL,
  `section` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advicer_id` int(11) NOT NULL,
  `population` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `grade_level`, `section`, `advicer_id`, `population`, `availability`, `status`, `created_at`, `updated_at`) VALUES
(15, 3, '1', 10, 10, 0, 'active', '2019-04-21 06:10:03', '2019-04-21 06:10:03'),
(16, 4, '1', 11, 12, 0, 'active', '2019-04-21 06:38:21', '2019-04-21 06:38:21'),
(17, 5, '1', 12, 7, 0, 'active', '2019-04-21 06:38:47', '2019-04-21 06:38:47'),
(18, 6, '1', 13, 9, 0, 'active', '2019-04-21 06:39:10', '2019-04-21 06:39:10'),
(19, 7, '1', 14, 13, 0, 'active', '2019-04-21 06:39:30', '2019-04-21 06:39:30'),
(20, 8, '1', 15, 10, 0, 'active', '2019-04-21 06:39:44', '2019-04-21 06:39:44'),
(21, 9, '1', 16, 11, 0, 'active', '2019-04-21 06:40:04', '2019-04-21 06:40:04'),
(22, 10, '1', 17, 10, 0, 'active', '2019-04-21 06:40:22', '2019-04-21 06:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `duration` int(11) DEFAULT NULL COMMENT 'in minutes',
  `day` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `subject_id`, `room_id`, `teacher_id`, `start_time`, `end_time`, `duration`, `day`, `created_at`, `updated_at`) VALUES
(87, 45, 16, NULL, '07:20:00', '08:10:00', NULL, 1, '2019-04-21 11:27:37', '2019-04-21 11:27:37'),
(95, 61, 18, NULL, '07:50:00', '08:40:00', NULL, 1, '2019-04-21 11:31:23', '2019-04-27 06:11:38'),
(96, 58, 18, NULL, '07:10:00', '07:50:00', NULL, 1, '2019-04-26 10:18:30', '2019-04-27 06:11:07'),
(98, 60, 18, NULL, '11:20:00', '12:00:00', NULL, 1, '2019-04-28 05:20:14', '2019-04-28 05:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `school_year`
--

CREATE TABLE `school_year` (
  `id` int(11) NOT NULL,
  `school_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_year`
--

INSERT INTO `school_year` (`id`, `school_year`, `created_at`, `updated_at`) VALUES
(23, '2018-2019', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `second_rankings`
--

CREATE TABLE `second_rankings` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `average` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `second_rankings`
--

INSERT INTO `second_rankings` (`id`, `grade_level`, `student_id`, `average`, `created_at`, `updated_at`) VALUES
(47, 3, 75, 0.00, NULL, NULL),
(48, 4, 76, 0.00, NULL, NULL),
(49, 3, 77, 0.00, NULL, NULL),
(50, 4, 78, 0.00, NULL, NULL),
(51, 7, 79, 0.00, NULL, NULL),
(52, 7, 80, 0.00, NULL, NULL),
(53, 4, 81, 0.00, NULL, NULL),
(54, 6, 82, 0.00, NULL, NULL),
(55, 4, 83, 0.00, NULL, NULL),
(56, 10, 84, 0.00, NULL, NULL),
(57, 5, 85, 0.00, NULL, NULL),
(58, 8, 86, 0.00, NULL, NULL),
(59, 8, 87, 0.00, NULL, NULL),
(60, 9, 88, 0.00, NULL, NULL),
(61, 4, 89, 0.00, NULL, NULL),
(62, 10, 90, 0.00, NULL, NULL),
(63, 5, 92, 0.00, NULL, NULL),
(64, 5, 93, 0.00, NULL, NULL),
(65, 6, 94, 0.00, NULL, NULL),
(66, 5, 95, 0.00, NULL, NULL),
(67, 9, 96, 0.00, NULL, NULL),
(68, 9, 97, 0.00, NULL, NULL),
(69, 3, 98, 0.00, NULL, NULL),
(70, 3, 99, 0.00, NULL, NULL),
(71, 3, 100, 0.00, NULL, NULL),
(72, 6, 101, 0.00, NULL, NULL),
(73, 7, 102, 0.00, NULL, NULL),
(74, 8, 103, 0.00, NULL, NULL),
(75, 6, 104, 0.00, NULL, NULL),
(76, 7, 105, 0.00, NULL, NULL),
(77, 7, 106, 0.00, NULL, NULL),
(78, 7, 107, 0.00, NULL, NULL),
(79, 8, 108, 0.00, NULL, NULL),
(80, 8, 109, 0.00, NULL, NULL),
(81, 9, 110, 0.00, NULL, NULL),
(82, 10, 111, 0.00, NULL, NULL),
(83, 9, 112, 0.00, NULL, NULL),
(84, 9, 113, 0.00, NULL, NULL),
(85, 10, 114, 0.00, NULL, NULL),
(86, 10, 115, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `siblings`
--

CREATE TABLE `siblings` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_students`
--

CREATE TABLE `sponsor_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `grade_level_id` int(11) NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `sy_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `proceed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `photo`, `first_name`, `middle_name`, `last_name`, `lecture_id`, `grade_level_id`, `address`, `gender`, `birth_date`, `sy_id`, `status`, `proceed`, `created_at`, `updated_at`) VALUES
(74, '20191', NULL, 'john lyndon', 'n/a', 'aguilar', 15, 3, 'Prk. Caimito, San Agustin, Gredu, Panabo City', 'male', '2013-02-07', 23, 1, 0, '2019-04-27 06:17:29', '2019-04-27 06:17:29'),
(75, '20192', NULL, 'john lyndon', 'n/a', 'aguilar', 15, 3, 'Prk. Caimito, San Agustin, Gredu, Panabo City', 'male', '2013-02-07', 23, 1, 0, '2019-04-27 06:17:46', '2019-04-27 06:17:46'),
(76, '20193', NULL, 'liam jeriah', 'bacay', 'alameda', 16, 4, 'Purok Talong. Gredu, Panabo City', 'male', '2011-10-05', 23, 3, 0, '2019-04-27 06:24:44', '2019-04-27 06:24:44'),
(77, '20194', NULL, 'sam gabriel', 'bernal', 'alcoseba', 15, 3, 'Prk. Nangka, Gredu, Panabo City', 'male', '2013-10-07', 23, 1, 0, '2019-04-27 06:27:26', '2019-04-27 06:27:26'),
(78, '20195', NULL, 'sean david', 'cacanindin', 'beunsalida', 16, 4, 'km 31 infont of San Agustin Parish', 'male', '2011-12-09', 23, 1, 0, '2019-04-27 06:35:38', '2019-04-27 06:35:38'),
(79, '20196', NULL, 'catherine alexandrea', 'villacampa', 'cabales', 19, 7, 'Kanari Homes, New Visayas, Panabo City', 'female', '2008-04-12', 23, 1, 0, '2019-04-27 06:41:47', '2019-04-27 06:41:47'),
(80, '20197', NULL, 'princess norrica', 'severino', 'erezo', 19, 7, 'Prk. Nangka, Gredu, Panabo City', 'female', '2009-02-10', 23, 1, 0, '2019-04-27 06:45:16', '2019-04-27 06:45:16'),
(81, '20198', NULL, 'ceah angela', 'comahig', 'elarcosa', 16, 4, 'Prk. Gabi, Gredu, Panabo City', 'female', '2012-02-12', 23, 1, 0, '2019-04-27 06:50:11', '2019-04-27 06:50:11'),
(82, '20199', NULL, 'shanelle nathalie', 'comera', 'ejara', 18, 6, 'P1 Durian St. Macla Homes Subd, New Visayas, Panabo City', 'female', '2010-05-17', 23, 1, 0, '2019-04-27 06:56:22', '2019-04-27 06:56:22'),
(83, '201910', NULL, 'carlius june', 'monday', 'diaz', 16, 4, 'Prk. Pechay, Gredu, Panabo City', 'male', '2012-06-12', 23, 1, 0, '2019-04-27 07:01:08', '2019-04-27 07:01:08'),
(84, '201911', NULL, 'adam john', 'na', 'caballes', 22, 10, 'White Plains Brgy. Gredu, Panabo City', 'male', '2006-01-02', 23, 1, 0, '2019-04-27 07:05:24', '2019-04-27 07:05:24'),
(85, '201912', NULL, 'charles brent', 'tagud', 'dombase', 17, 5, 'Oakwood Reidence, New Visayas, Panabo City', 'male', '2010-05-31', 23, 1, 0, '2019-04-27 07:12:06', '2019-04-27 07:12:06'),
(86, '201913', NULL, 'norhayya', 'camad', 'dadia', 20, 8, 'Datu Abdul Dadia, Purok Caimito, Panabo City', 'male', '2007-12-28', 23, 1, 0, '2019-04-27 07:19:43', '2019-04-27 07:19:43'),
(87, '201914', NULL, 'chad synnster', 'de ramor', 'caya', 20, 8, 'Valle St. Via, Vida. Datu Abdul, Panabo City', 'male', '2008-05-06', 23, 1, 0, '2019-04-27 07:22:42', '2019-04-27 07:22:42'),
(88, '201915', NULL, 'samantha kitt', 'ararao', 'liza', 21, 9, 'New Visayas, Panabo City', 'female', '2007-02-27', 23, 1, 0, '2019-04-27 07:29:38', '2019-04-27 07:29:38'),
(89, '201916', NULL, 'vhenj kian', 'getuya', 'lerion', 16, 4, 'Crystal Plain Subd, Gredu, Panabo City', 'male', '2012-03-06', 23, 1, 0, '2019-04-27 07:33:10', '2019-04-27 07:33:10'),
(90, '201917', NULL, 'shanley', 'enad', 'layan', 22, 10, 'Prk. Atis, Brgy. Cangohan, Panabo City', 'female', '2005-10-25', 23, 1, 0, '2019-04-27 07:37:22', '2019-04-27 07:37:22'),
(91, '201918', NULL, 'jayshree gail', 'regulacion', 'isada', 17, 5, 'Prk. Sunkist, Niceville Subd. Cagangohan, Panabo City', 'female', '2011-06-03', 23, 1, 0, '2019-04-27 07:43:18', '2019-04-27 07:43:18'),
(92, '201919', NULL, 'jayshree gail', 'regulacion', 'isada', 17, 5, 'Prk. Sunkist, Niceville Subd. Cagangohan, Panabo City', 'female', '2011-06-03', 23, 1, 0, '2019-04-27 07:43:33', '2019-04-27 07:43:33'),
(93, '201920', NULL, 'james cliford', 'na', 'ignacio', 17, 5, 'St. Northern Plain, Gredu, Panabo City', 'male', '2011-03-23', 23, 1, 0, '2019-04-27 07:48:07', '2019-04-27 07:48:07'),
(94, '201921', NULL, 'princess carla', 'na', 'pardillo', 18, 6, 'Brgy. Datu Adbul, Panabo City', 'female', '2010-03-10', 23, 1, 0, '2019-04-27 07:53:32', '2019-04-27 07:53:32'),
(95, '201922', NULL, 'jamieca ezekiel', 'polinar', 'penarroyo', 17, 5, 'Lilia Homes, New Visayas, Panabo City', 'male', '2011-10-05', 23, 1, 0, '2019-04-27 07:59:25', '2019-04-27 07:59:25'),
(96, '201923', NULL, 'shiela margaret', 'alegado', 'padernal', 21, 9, 'Prk. Okra, Gredu, Panano City', 'female', '2007-07-11', 23, 1, 0, '2019-04-27 08:03:27', '2019-04-27 08:03:27'),
(97, '201924', NULL, 'joemar philippe', 'loreteno', 'nisnisan', 21, 9, 'White Plain, Brgy. Gredu, Panabo City', 'male', '2006-08-04', 23, 1, 0, '2019-04-27 08:06:47', '2019-04-27 08:06:47'),
(98, '201925', NULL, 'theo jay', 'almero', 'nambong', 15, 3, 'Via Vida, Datu Abdul, Panabo City', 'male', '2013-03-27', 23, 1, 0, '2019-04-27 08:09:44', '2019-04-27 08:09:44'),
(99, '201926', NULL, 'shuamrul', 'mamac', 'moya', 15, 3, 'New Visayas, Panabo City', 'male', '2012-10-12', 23, 1, 0, '2019-04-27 08:20:18', '2019-04-27 08:20:18'),
(100, '201927', NULL, 'gabriel', 'busbos', 'morano', 15, 3, 'San Francisco, Panabo City', 'male', '2014-04-08', 23, 1, 0, '2019-04-27 08:23:23', '2019-04-27 08:23:23'),
(101, '201928', NULL, 'ezekiel josh', 'maghuyop', 'nimes', 18, 6, 'Carmen, Davao del Norte', 'male', '2010-07-30', 23, 1, 0, '2019-04-27 08:25:55', '2019-04-27 08:25:55'),
(102, '201929', NULL, 'princess diane', 'legaspi', 'navarro', 18, 7, 'Brgy. New Pandan, Panabo City', 'female', '2009-09-10', 23, 1, 0, '2019-04-27 08:29:11', '2019-04-27 08:29:11'),
(103, '201930', NULL, 'cleendee jemern', 'labajo', 'narvasa', 20, 8, 'Northern Plain Subd. Gredu, Panabo City', 'male', '2008-07-18', 23, 1, 0, '2019-04-27 08:32:29', '2019-04-27 08:32:29'),
(104, '201931', NULL, 'marc nelson', 'gulanes', 'mendoza', 18, 6, 'Northern Plains Gredu, Panabo City', 'male', '2010-02-20', 23, 1, 0, '2019-04-27 08:35:22', '2019-04-27 08:35:22'),
(105, '201932', NULL, 'alliah danielle', 'villancio', 'marqueso', 19, 7, 'Niceville Subd. Cagangohan, Panabo City', 'female', '2009-01-30', 23, 1, 0, '2019-04-27 08:38:14', '2019-04-27 08:38:14'),
(106, '201933', NULL, 'bayan', 'diporo', 'abdulazis', 19, 7, 'Prk Islam, Gredu, Panabo City', 'male', '2008-10-26', 23, 1, 0, '2019-04-27 08:41:30', '2019-04-27 08:41:30'),
(107, '201934', NULL, 'jhanley', 'tungal', 'derla', 19, 7, 'Prk. Puso, Panabo City', 'male', '2009-07-12', 23, 1, 0, '2019-04-27 08:44:26', '2019-04-27 08:44:26'),
(108, '201935', NULL, 'julie pearl', 'navarroza', 'dugang', 20, 8, 'Nartatez Ville, Cagangohan, Panabo City', 'female', '2008-07-24', 23, 1, 0, '2019-04-27 08:47:23', '2019-04-27 08:47:23'),
(109, '201936', NULL, 'clydel', 'rabacal', 'decena', 20, 8, 'Prk. Mangga, Cagangohan, Panabo City', 'female', '2008-04-28', 23, 1, 0, '2019-04-27 08:50:27', '2019-04-27 08:50:27'),
(110, '201937', NULL, 'khalil suri', 'javier', 'candolita', 21, 9, 'Kanari Homes, Panabo City', 'male', '2006-09-09', 23, 1, 0, '2019-04-27 08:53:18', '2019-04-27 08:53:18'),
(111, '201938', NULL, 'cheska', 'na', 'harap', 22, 10, 'Prk. Sibuyas, Gredu, Panabo City', 'female', '2003-08-05', 23, 1, 0, '2019-04-27 08:56:02', '2019-04-27 08:56:02'),
(112, '201939', NULL, 'king ace', 'maghuyop', 'hadlocon', 21, 9, 'Prk. Carmen, Davao del Norte', 'male', '2007-07-26', 23, 1, 0, '2019-04-27 08:58:57', '2019-04-27 08:58:57'),
(113, '201940', NULL, 'shane', 'padernal', 'mahilum', 21, 9, 'Prk. Okra, Gredu, Panabo City', 'female', '2007-08-08', 23, 1, 0, '2019-04-27 09:01:51', '2019-04-27 09:01:51'),
(114, '201941', NULL, 'mariale fe', 'lamparas', 'menoza', 22, 10, 'Prk. Alacta, Brgy. New Pandan, Panabo City', 'female', '2005-04-03', 23, 1, 0, '2019-04-27 09:04:28', '2019-04-27 09:04:28'),
(115, '201942', NULL, 'rolly', 'abastas', 'baring', 22, 10, 'Prk. Cogon, JP Laurel, Panabo City', 'male', '2005-10-09', 23, 1, 0, '2019-04-27 09:07:06', '2019-04-27 09:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `student_user`
--

CREATE TABLE `student_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `title`, `teacher_id`, `level`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(42, 'Working Period 1', 10, 3, 45, 'active', '2019-04-21 06:41:53', '2019-04-21 06:42:46'),
(43, 'Workin Period 2', 10, 3, 40, 'active', '2019-04-21 06:42:30', '2019-04-21 06:42:30'),
(44, 'Edukasyon sa Pagpapakatao', 11, 4, 30, 'active', '2019-04-21 06:43:55', '2019-04-21 06:43:55'),
(45, 'Mother Tongue', 11, 4, 50, 'active', '2019-04-21 06:44:14', '2019-04-21 06:44:14'),
(46, 'Filipino', 11, 4, 30, 'active', '2019-04-21 06:44:35', '2019-04-21 06:44:35'),
(47, 'Araling Panlipunan', 11, 4, 40, 'active', '2019-04-21 06:45:13', '2019-04-21 06:45:13'),
(48, 'English', 11, 4, 30, 'active', '2019-04-21 06:45:45', '2019-04-21 06:45:45'),
(49, 'Mathematics', 11, 4, 50, 'active', '2019-04-21 06:46:08', '2019-04-21 06:46:08'),
(50, 'Mapeh', 11, 4, 40, 'active', '2019-04-21 06:46:28', '2019-04-21 06:46:28'),
(51, 'Mother Tongue', 12, 5, 50, 'active', '2019-04-21 06:48:09', '2019-04-21 06:48:09'),
(52, 'Filipino', 12, 5, 50, 'active', '2019-04-21 06:48:26', '2019-04-21 06:48:26'),
(53, 'Araling Panlipunan', 12, 5, 40, 'active', '2019-04-21 06:48:48', '2019-04-21 06:48:48'),
(54, 'English', 12, 5, 50, 'active', '2019-04-21 06:49:33', '2019-04-21 06:49:33'),
(55, 'Mathematics', 12, 5, 50, 'active', '2019-04-21 06:49:59', '2019-04-21 06:49:59'),
(56, 'MAPEH', 12, 5, 40, 'active', '2019-04-21 06:50:23', '2019-04-21 06:50:23'),
(57, 'Values Education', 12, 5, 30, 'active', '2019-04-21 06:50:47', '2019-04-21 06:50:47'),
(58, 'Edukasyon sa Pagpapakatao', 13, 6, 30, 'active', '2019-04-21 06:52:33', '2019-04-21 06:52:33'),
(59, 'Mother Tongue', 13, 6, 50, 'active', '2019-04-21 06:52:55', '2019-04-21 06:52:55'),
(60, 'Araling Panlipunan', 13, 6, 40, 'active', '2019-04-21 06:53:23', '2019-04-21 06:53:23'),
(61, 'English', 13, 6, 50, 'active', '2019-04-21 06:53:39', '2019-04-21 06:53:39'),
(62, 'Filipino', 13, 6, 50, 'active', '2019-04-21 06:54:07', '2019-04-21 06:54:07'),
(63, 'Mathematics', 13, 6, 50, 'active', '2019-04-21 06:54:49', '2019-04-21 06:54:49'),
(64, 'Science', 13, 6, 50, 'active', '2019-04-21 06:55:17', '2019-04-21 06:55:17'),
(65, 'MAPEH', 13, 6, 40, 'active', '2019-04-21 06:55:47', '2019-04-21 06:55:47'),
(66, 'Filipino', 14, 7, 50, 'active', '2019-04-21 07:00:09', '2019-04-21 07:00:09'),
(67, 'Araling Panlipunan', 14, 7, 40, 'active', '2019-04-21 07:00:35', '2019-04-21 07:00:35'),
(68, 'TLE', 15, 7, 40, 'active', '2019-04-21 07:00:51', '2019-04-21 07:00:51'),
(69, 'English', 17, 7, 50, 'active', '2019-04-21 07:01:10', '2019-04-21 07:01:10'),
(70, 'Science', 14, 7, 50, 'active', '2019-04-21 07:01:32', '2019-04-21 07:01:32'),
(71, 'Mathematics', 14, 7, 50, 'active', '2019-04-21 07:04:22', '2019-04-21 07:04:22'),
(72, 'MAPEH', 14, 7, 40, 'active', '2019-04-21 07:05:09', '2019-04-21 07:05:09'),
(73, 'Values Education', 14, 7, 40, 'active', '2019-04-21 07:05:28', '2019-04-21 07:05:28'),
(74, 'ESP', 15, 8, 30, 'active', '2019-04-21 07:17:17', '2019-04-21 07:17:17'),
(75, 'TLE', 15, 8, 50, 'active', '2019-04-21 07:17:34', '2019-04-21 07:17:34'),
(76, 'Araling Panlipunan', 15, 8, 40, 'active', '2019-04-21 07:17:56', '2019-04-21 07:17:56'),
(77, 'English', 15, 8, 50, 'active', '2019-04-21 07:18:18', '2019-04-21 07:18:18'),
(78, 'Science', 15, 8, 50, 'active', '2019-04-21 07:19:00', '2019-04-21 07:19:00'),
(79, 'Filipino', 15, 8, 50, 'active', '2019-04-21 07:19:17', '2019-04-21 07:19:17'),
(80, 'Mathematics', 15, 8, 50, 'active', '2019-04-21 07:19:40', '2019-04-21 07:19:40'),
(81, 'MAPEH', 15, 8, 40, 'active', '2019-04-21 07:20:07', '2019-04-21 07:20:07'),
(82, 'ESP', 16, 9, 30, 'active', '2019-04-21 07:20:38', '2019-04-21 07:20:38'),
(83, 'Filipino', 16, 9, 50, 'active', '2019-04-21 07:20:58', '2019-04-21 07:20:58'),
(84, 'Araling Panlipunan', 16, 9, 40, 'active', '2019-04-21 07:21:15', '2019-04-21 07:21:15'),
(85, 'Science', 16, 9, 50, 'active', '2019-04-21 07:22:22', '2019-04-21 07:22:22'),
(86, 'English', 16, 9, 50, 'active', '2019-04-21 07:22:37', '2019-04-21 07:22:37'),
(87, 'TLE', 16, 9, 50, 'active', '2019-04-21 07:23:01', '2019-04-21 07:23:01'),
(88, 'Mathematics', 16, 9, 50, 'active', '2019-04-21 07:23:15', '2019-04-21 07:23:15'),
(89, 'MAPEH', 16, 9, 40, 'active', '2019-04-21 07:23:31', '2019-04-21 07:23:31'),
(90, 'ESP', 17, 10, 60, 'active', '2019-04-21 07:25:06', '2019-04-21 07:25:06'),
(91, 'English', 17, 10, 60, 'active', '2019-04-21 07:25:30', '2019-04-21 07:25:30'),
(92, 'Filipino', 17, 10, 60, 'active', '2019-04-21 07:26:21', '2019-04-21 07:26:21'),
(93, 'Araling Panlipunan', 17, 10, 60, 'active', '2019-04-21 07:26:39', '2019-04-21 07:26:39'),
(94, 'Science', 17, 10, 60, 'active', '2019-04-21 07:27:07', '2019-04-21 07:27:07'),
(95, 'MAPEH', 17, 10, 60, 'active', '2019-04-21 07:28:36', '2019-04-21 07:28:36'),
(96, 'TLE', 17, 10, 60, 'active', '2019-04-21 07:29:14', '2019-04-21 07:29:14'),
(97, 'Mathematics', 17, 10, 60, 'active', '2019-04-21 07:29:27', '2019-04-21 07:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_attainment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_service` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `educational_attainment`, `civil_service`, `marital_status`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Lera Vanissa M. Pol', 'Graduate of Bachelor of Elementary Education Majot in Generalist', 'Let Passer', 'single', 'active', '2019-04-21 05:56:37', '2019-04-21 05:56:37'),
(11, 'Shalvaw M. Moya', 'Graduate of Bachelor of Science in Elementary Education', 'Let Passer', 'single', 'active', '2019-04-21 05:57:53', '2019-04-21 05:57:53'),
(12, 'Jocevill G. Cornell', 'N/A', 'N/A', 'single', 'active', '2019-04-21 05:59:10', '2019-04-21 05:59:10'),
(13, 'Nelqueen S. Bacalso', 'Graduate of Bachelor of Science in Secondary Education Major in English', 'N/A', 'single', 'active', '2019-04-21 06:00:45', '2019-04-21 06:00:45'),
(14, 'Analyn M. Revilla', 'N/A', 'N/A', 'single', 'active', '2019-04-21 06:01:32', '2019-04-21 06:01:32'),
(15, 'Analyn T. Gamino', 'Graduate of Bachelor of Secondary Education Major in TLE', 'LET Passer', 'single', 'active', '2019-04-21 06:02:45', '2019-04-21 06:02:45'),
(16, 'Jenny E. Sabanal', 'Graduate of Bachelor of Secondary Education Major in Technology and Livelihood Education', 'N/A', 'single', 'active', '2019-04-21 06:04:49', '2019-04-21 06:04:49'),
(17, 'Jezalyn A. Leron', 'Graduate of Bachelor of Secondary Education Major in Biological Science', 'LET Passer', 'single', 'active', '2019-04-21 06:06:05', '2019-04-21 06:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `third_rankings`
--

CREATE TABLE `third_rankings` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `average` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `third_rankings`
--

INSERT INTO `third_rankings` (`id`, `grade_level`, `student_id`, `average`, `created_at`, `updated_at`) VALUES
(47, 3, 75, 0.00, NULL, NULL),
(48, 4, 76, 0.00, NULL, NULL),
(49, 3, 77, 0.00, NULL, NULL),
(50, 4, 78, 0.00, NULL, NULL),
(51, 7, 79, 0.00, NULL, NULL),
(52, 7, 80, 0.00, NULL, NULL),
(53, 4, 81, 0.00, NULL, NULL),
(54, 6, 82, 0.00, NULL, NULL),
(55, 4, 83, 0.00, NULL, NULL),
(56, 10, 84, 0.00, NULL, NULL),
(57, 5, 85, 0.00, NULL, NULL),
(58, 8, 86, 0.00, NULL, NULL),
(59, 8, 87, 0.00, NULL, NULL),
(60, 9, 88, 0.00, NULL, NULL),
(61, 4, 89, 0.00, NULL, NULL),
(62, 10, 90, 0.00, NULL, NULL),
(63, 5, 92, 0.00, NULL, NULL),
(64, 5, 93, 0.00, NULL, NULL),
(65, 6, 94, 0.00, NULL, NULL),
(66, 5, 95, 0.00, NULL, NULL),
(67, 9, 96, 0.00, NULL, NULL),
(68, 9, 97, 0.00, NULL, NULL),
(69, 3, 98, 0.00, NULL, NULL),
(70, 3, 99, 0.00, NULL, NULL),
(71, 3, 100, 0.00, NULL, NULL),
(72, 6, 101, 0.00, NULL, NULL),
(73, 7, 102, 0.00, NULL, NULL),
(74, 8, 103, 0.00, NULL, NULL),
(75, 6, 104, 0.00, NULL, NULL),
(76, 7, 105, 0.00, NULL, NULL),
(77, 7, 106, 0.00, NULL, NULL),
(78, 7, 107, 0.00, NULL, NULL),
(79, 8, 108, 0.00, NULL, NULL),
(80, 8, 109, 0.00, NULL, NULL),
(81, 9, 110, 0.00, NULL, NULL),
(82, 10, 111, 0.00, NULL, NULL),
(83, 9, 112, 0.00, NULL, NULL),
(84, 9, 113, 0.00, NULL, NULL),
(85, 10, 114, 0.00, NULL, NULL),
(86, 10, 115, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `student_id`, `type`, `amount`, `created_at`, `updated_at`) VALUES
(93, 75, 'Enrollment Fee', 600.00, '2019-04-27 06:17:47', '2019-04-27 06:17:47'),
(94, 76, 'Enrollment Fee', 600.00, '2019-04-27 06:24:45', '2019-04-27 06:24:45'),
(95, 77, 'Enrollment Fee', 600.00, '2019-04-27 06:27:27', '2019-04-27 06:27:27'),
(96, 78, 'Enrollment Fee', 600.00, '2019-04-27 06:35:40', '2019-04-27 06:35:40'),
(97, 79, 'Enrollment Fee', 600.00, '2019-04-27 06:41:48', '2019-04-27 06:41:48'),
(98, 80, 'Enrollment Fee', 600.00, '2019-04-27 06:45:18', '2019-04-27 06:45:18'),
(99, 81, 'Enrollment Fee', 600.00, '2019-04-27 06:50:12', '2019-04-27 06:50:12'),
(100, 82, 'Enrollment Fee', 600.00, '2019-04-27 06:56:23', '2019-04-27 06:56:23'),
(101, 83, 'Enrollment Fee', 600.00, '2019-04-27 07:01:09', '2019-04-27 07:01:09'),
(102, 84, 'Enrollment Fee', 600.00, '2019-04-27 07:05:25', '2019-04-27 07:05:25'),
(103, 85, 'Enrollment Fee', 600.00, '2019-04-27 07:12:07', '2019-04-27 07:12:07'),
(104, 86, 'Enrollment Fee', 600.00, '2019-04-27 07:19:44', '2019-04-27 07:19:44'),
(105, 87, 'Enrollment Fee', 600.00, '2019-04-27 07:22:43', '2019-04-27 07:22:43'),
(106, 88, 'Enrollment Fee', 600.00, '2019-04-27 07:29:39', '2019-04-27 07:29:39'),
(107, 89, 'Enrollment Fee', 600.00, '2019-04-27 07:33:11', '2019-04-27 07:33:11'),
(108, 90, 'Enrollment Fee', 600.00, '2019-04-27 07:37:23', '2019-04-27 07:37:23'),
(109, 92, 'Enrollment Fee', 600.00, '2019-04-27 07:43:34', '2019-04-27 07:43:34'),
(110, 93, 'Enrollment Fee', 600.00, '2019-04-27 07:48:07', '2019-04-27 07:48:07'),
(111, 94, 'Enrollment Fee', 600.00, '2019-04-27 07:53:33', '2019-04-27 07:53:33'),
(112, 95, 'Enrollment Fee', 600.00, '2019-04-27 07:59:26', '2019-04-27 07:59:26'),
(113, 96, 'Enrollment Fee', 600.00, '2019-04-27 08:03:29', '2019-04-27 08:03:29'),
(114, 97, 'Enrollment Fee', 600.00, '2019-04-27 08:06:48', '2019-04-27 08:06:48'),
(115, 98, 'Enrollment Fee', 600.00, '2019-04-27 08:09:45', '2019-04-27 08:09:45'),
(116, 99, 'Enrollment Fee', 600.00, '2019-04-27 08:20:19', '2019-04-27 08:20:19'),
(117, 100, 'Enrollment Fee', 600.00, '2019-04-27 08:23:24', '2019-04-27 08:23:24'),
(118, 101, 'Enrollment Fee', 600.00, '2019-04-27 08:25:56', '2019-04-27 08:25:56'),
(119, 102, 'Enrollment Fee', 600.00, '2019-04-27 08:29:11', '2019-04-27 08:29:11'),
(120, 103, 'Enrollment Fee', 600.00, '2019-04-27 08:32:30', '2019-04-27 08:32:30'),
(121, 104, 'Enrollment Fee', 600.00, '2019-04-27 08:35:24', '2019-04-27 08:35:24'),
(122, 105, 'Enrollment Fee', 600.00, '2019-04-27 08:38:15', '2019-04-27 08:38:15'),
(123, 106, 'Enrollment Fee', 600.00, '2019-04-27 08:41:31', '2019-04-27 08:41:31'),
(124, 107, 'Enrollment Fee', 600.00, '2019-04-27 08:44:27', '2019-04-27 08:44:27'),
(125, 108, 'Enrollment Fee', 600.00, '2019-04-27 08:47:23', '2019-04-27 08:47:23'),
(126, 109, 'Enrollment Fee', 600.00, '2019-04-27 08:50:28', '2019-04-27 08:50:28'),
(127, 110, 'Enrollment Fee', 600.00, '2019-04-27 08:53:19', '2019-04-27 08:53:19'),
(128, 111, 'Enrollment Fee', 600.00, '2019-04-27 08:56:03', '2019-04-27 08:56:03'),
(129, 112, 'Enrollment Fee', 600.00, '2019-04-27 08:58:58', '2019-04-27 08:58:58'),
(130, 113, 'Enrollment Fee', 600.00, '2019-04-27 09:01:51', '2019-04-27 09:01:51'),
(131, 114, 'Enrollment Fee', 600.00, '2019-04-27 09:04:29', '2019-04-27 09:04:29'),
(132, 115, 'Enrollment Fee', 600.00, '2019-04-27 09:07:07', '2019-04-27 09:07:07'),
(133, 106, ', April Tuition fee - P 200', 200.00, '2019-04-28 00:59:55', '2019-04-28 00:59:55'),
(134, 106, ', April Tuition fee - P 200', 200.00, '2019-04-28 01:01:14', '2019-04-28 01:01:14'),
(135, 106, ', Pta fee - P 200', 200.00, '2019-04-28 01:02:25', '2019-04-28 01:02:25'),
(136, 106, ', April Tuition fee - P 200', 200.00, '2019-04-28 01:03:27', '2019-04-28 01:03:27'),
(137, 106, ', April Tuition fee - P 200', 200.00, '2019-04-28 01:09:10', '2019-04-28 01:09:10'),
(138, 106, ', Books fee - P 290', 290.00, '2019-04-28 01:10:08', '2019-04-28 01:10:08'),
(139, 106, ', Books fee - P 200', 200.00, '2019-04-28 01:10:26', '2019-04-28 01:10:26'),
(140, 106, ', Books fee - P 200', 200.00, '2019-04-28 01:11:02', '2019-04-28 01:11:02'),
(141, 106, ', April Tuition fee - P 500', 500.00, '2019-04-28 01:17:43', '2019-04-28 01:17:43'),
(142, 106, ', Books fee - P 200', 200.00, '2019-04-28 01:22:23', '2019-04-28 01:22:23'),
(143, 106, ', Books fee - P 300', 300.00, '2019-04-28 01:22:52', '2019-04-28 01:22:52'),
(144, 106, ', Books fee - P 200', 200.00, '2019-04-28 01:32:00', '2019-04-28 01:32:00'),
(145, 106, ', Books fee - P 300', 300.00, '2019-04-28 01:37:28', '2019-04-28 01:37:28'),
(146, 106, ', Miscellaneous fee - P 200', 200.00, '2019-04-28 01:38:23', '2019-04-28 01:38:23'),
(147, 106, ', Books fee - P 300', 300.00, '2019-04-28 01:39:03', '2019-04-28 01:39:03'),
(148, 106, ', Books fee - P 200', 200.00, '2019-04-28 01:40:52', '2019-04-28 01:40:52'),
(149, 106, ', Books fee - P 200', 200.00, '2019-04-28 01:45:27', '2019-04-28 01:45:27'),
(150, 75, ', Books fee - P 90', 90.00, '2019-04-28 01:47:51', '2019-04-28 01:47:51'),
(151, 75, ', Miscellaneous fee - P 500', 500.00, '2019-04-28 01:52:26', '2019-04-28 01:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'user_img.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `role_id`, `email`, `photo`, `password`, `notify`, `remember_token`, `created_at`, `updated_at`) VALUES
(28, 'Lotus', 'none', 'Administrator', 'laravel', 1, 'staff@lotus.com', 'none', '$2y$10$8.8sNHEXs.1cF9e0NbKezufbcPbUMRiVpoMuCMvNU2i4xRpWUsPXC', 0, 'Uyroo9te5ZaUbSvytCTvfioGiPtUf60t4hJZhBX78v5BpFGkAJjFkHzg6xp0', '2019-04-21 05:39:22', '2019-04-21 05:39:22'),
(29, 'Rosele', 'Enad', 'Layan', 'rosele', 3, 'rosele@gmail.com', 'none', '$2y$10$VX1LJ41cAIvioCXAn46Aw.RypD/s4wfTPRAf4WZc.W6xGlqjI8hHS', 1, '3IxTgj1WD6Ipl0PM4nLEQUip3Wl4SXFGbSDxK1CErfqok5qFI1U15xTZz6xb', '2019-04-21 11:39:05', '2019-04-21 11:45:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergencies`
--
ALTER TABLE `emergencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `first_rankings`
--
ALTER TABLE `first_rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fourth_rankings`
--
ALTER TABLE `fourth_rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_student`
--
ALTER TABLE `level_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `past_schools`
--
ALTER TABLE `past_schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `populations`
--
ALTER TABLE `populations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rankings`
--
ALTER TABLE `rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_subject_id_foreign` (`subject_id`),
  ADD KEY `schedules_room_id_foreign` (`room_id`),
  ADD KEY `schedules_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `school_year`
--
ALTER TABLE `school_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `second_rankings`
--
ALTER TABLE `second_rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siblings`
--
ALTER TABLE `siblings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor_students`
--
ALTER TABLE `sponsor_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_user`
--
ALTER TABLE `student_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `third_rankings`
--
ALTER TABLE `third_rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `emergencies`
--
ALTER TABLE `emergencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `first_rankings`
--
ALTER TABLE `first_rankings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `fourth_rankings`
--
ALTER TABLE `fourth_rankings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=745;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `level_student`
--
ALTER TABLE `level_student`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `parent_student`
--
ALTER TABLE `parent_student`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `past_schools`
--
ALTER TABLE `past_schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `populations`
--
ALTER TABLE `populations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `second_rankings`
--
ALTER TABLE `second_rankings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `siblings`
--
ALTER TABLE `siblings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsor_students`
--
ALTER TABLE `sponsor_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `student_user`
--
ALTER TABLE `student_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `third_rankings`
--
ALTER TABLE `third_rankings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

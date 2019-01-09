-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2019 at 04:38 PM
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
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_post` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messsage` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_type` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `expiration` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `school_year` int(11) NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `second` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `third` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourth` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergencies`
--

CREATE TABLE `emergencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationship` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_contact` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergencies`
--

INSERT INTO `emergencies` (`id`, `student_id`, `name`, `relationship`, `contact`, `address`, `alt_contact`, `created_at`, `updated_at`) VALUES
(1, 11, 'asdsadas', 'asdasd', 123123, 'asdad', 123213, NULL, NULL),
(2, 12, 'asdsadas', 'asdasd', 123123, 'asdad', 123213, NULL, NULL),
(3, 13, 'zxczxc', 'acasdasd', 12312, 'asdasd', 1232, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `grade_level` int(191) NOT NULL,
  `whole_year` double(10,2) NOT NULL,
  `books` double(10,2) NOT NULL,
  `uniform` double(10,2) NOT NULL,
  `min_downpayment` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `grade_level`, `whole_year`, `books`, `uniform`, `min_downpayment`, `created_at`, `updated_at`) VALUES
(1, 1, 2345643.00, 100.00, 230.00, 2213.00, NULL, '2019-01-04 03:56:38'),
(2, 2, 12312.00, 100.00, 12312.00, 123412.00, NULL, '2019-01-07 21:45:30'),
(3, 3, 1000.00, 90.00, 8002.00, 8000.00, NULL, '2019-01-04 03:56:46'),
(4, 4, 8456.00, 1203.00, 45654.00, 4567.00, NULL, NULL),
(5, 5, 34.00, 123.00, 123.00, 231.00, NULL, '2019-01-04 03:52:16'),
(6, 6, 1231.00, 231231.00, 231231.00, 231231.00, NULL, '2019-01-04 03:52:31'),
(7, 7, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(8, 8, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(9, 9, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(10, 10, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(11, 14, 0.00, 0.00, 0.00, 0.00, '2019-01-04 03:39:08', '2019-01-04 03:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_year` int(11) NOT NULL,
  `first` int(11) NOT NULL,
  `second` int(11) NOT NULL,
  `third` int(11) NOT NULL,
  `fourth` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Nursery', NULL, NULL),
(2, 'Kinder 1', NULL, NULL),
(3, 'Kinder 2', NULL, NULL),
(4, 'Grade 1', NULL, NULL),
(5, 'Grade 2', NULL, NULL),
(6, 'Grade 3', NULL, NULL),
(7, 'Grade 4', NULL, NULL),
(8, 'Grade 5', NULL, NULL),
(9, 'Grade 6', NULL, NULL),
(10, 'Grade 7', NULL, NULL),
(14, 'Grade 8', '2019-01-04 03:39:08', '2019-01-04 03:39:08');

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
(89, '2018_12_14_070732_create_siblings_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_income` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `student_id`, `type`, `name`, `occupation`, `company`, `monthly_income`, `created_at`, `updated_at`) VALUES
(7, 9, 'Father', 'asdasd', 'asdasd', 'asdasd', 12312.00, NULL, NULL),
(8, 9, 'mother', 'asdasd', 'asdasd', 'asdasd', 123123.00, NULL, NULL),
(9, 9, 'guardian', 'asdasd', 'asdasd', 'asdasd', 123123.00, NULL, NULL),
(10, 11, 'mother', 'asas', 'asa', 'asas', 23.00, NULL, NULL),
(11, 12, 'mother', 'asas', 'asa', 'asas', 23.00, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `past_schools`
--

CREATE TABLE `past_schools` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `pastSchool` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `schoolAddress` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `past_balance` double(10,2) NOT NULL,
  `whole_year` double(10,2) NOT NULL,
  `books` double(10,2) NOT NULL,
  `uniform` double(10,2) NOT NULL,
  `req_tuition` double(10,2) NOT NULL,
  `bal_tuition` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `rank` int(11) NOT NULL,
  `grade_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `average` double(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `form_137` int(11) DEFAULT NULL,
  `birth_cert` int(11) DEFAULT NULL,
  `photo2x2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, 1, '12344', 2, 0, 0, 'inactive', NULL, '2019-01-06 18:00:15'),
(5, 8, '1', 7, 30, 0, 'active', NULL, '2019-01-06 20:09:40'),
(6, 7, '1', 6, 0, 0, 'inactive', NULL, '2019-01-06 18:00:10'),
(7, 4, '1', 3, 0, 0, 'inactive', NULL, '2019-01-06 20:09:34'),
(8, 5, '1', 6, 0, 0, 'active', NULL, '2019-01-04 08:29:27'),
(9, 6, '1', 2, 0, 0, 'active', NULL, '2019-01-04 08:34:00'),
(11, 7, '1', 2, 0, 0, 'active', NULL, NULL),
(12, 8, '1', 2, 0, 0, 'active', NULL, '2019-01-04 08:33:57'),
(13, 9, '1', 2, 0, 0, 'active', NULL, NULL),
(14, 10, '1', 2, 0, 0, 'active', NULL, NULL),
(15, 2, 'test section', 6, 0, 0, 'active', '2019-01-04 08:21:39', '2019-01-04 08:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` int(50) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `duration` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `day` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `subject`, `start_time`, `end_time`, `duration`, `teacher_id`, `room_id`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, '09:30:00', '10:00:00', 30, 2, 1, '', NULL, NULL),
(2, 2, '07:00:00', '07:15:00', 15, NULL, 1, '', NULL, NULL),
(3, 4, '07:30:00', '08:30:00', 60, 3, 2, 'M.T.TH.F.', NULL, NULL),
(4, 8, '08:30:00', '09:00:00', 30, 3, 2, 'M.T.TH.F.', NULL, NULL),
(5, 3, '07:30:00', '09:00:00', 90, NULL, 1, 'M.T.TH.F.', NULL, NULL),
(6, 2, '07:30:00', '08:00:00', 30, 5, 2, 'M.T.TH.F.', NULL, NULL),
(7, 4, '08:00:00', '08:30:00', 30, 4, 2, 'M.T.TH.F.', NULL, NULL),
(8, 2, '08:30:00', '10:10:00', 100, 5, 2, 'M.T.TH.F.', NULL, NULL);

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
(1, '2019', NULL, NULL);

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

--
-- Dumping data for table `siblings`
--

INSERT INTO `siblings` (`id`, `student_id`, `type`, `name`, `birth_date`, `created_at`, `updated_at`) VALUES
(1, 13, 'brother', 'asdasdasd', '2018-12-19', NULL, NULL),
(2, 13, 'brother', 'asdasd', '2018-12-11', NULL, NULL),
(3, 13, 'sister', 'asdasdsd', '2018-12-27', NULL, NULL),
(4, 13, 'sister', 'asdasd', '2018-12-12', NULL, NULL);

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
  `student_id` int(11) NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `school_year` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `photo`, `first_name`, `middle_name`, `last_name`, `lecture_id`, `address`, `gender`, `birth_date`, `school_year`, `status`, `created_at`, `updated_at`) VALUES
(7, 20191, NULL, 'asdsad', 'asdasd', 'asdasd', 13, 'asdasd', 'male', '2018-01-01', 1, 1, '2018-12-13 12:36:48', '2018-12-13 12:36:48'),
(8, 20192, NULL, 'asdsad', 'asdasd', 'asdasd', 13, 'asdasd', 'male', '2018-01-01', 1, 1, '2018-12-13 12:37:52', '2018-12-13 12:37:52'),
(9, 20193, NULL, 'asdsad', 'asdasd', 'asdasd', 13, 'asdasd', 'male', '2018-01-01', 1, 1, '2018-12-13 12:45:00', '2018-12-13 12:45:00'),
(10, 20194, NULL, 'asdasd', 'asdasd', 'asdasd', 7, 'asdasd', 'male', '1982-07-15', 1, 1, '2018-12-13 23:17:46', '2018-12-13 23:17:46'),
(11, 20195, NULL, 'asdasd', 'asdasd', 'asdasd', 7, 'asdasd', 'male', '1982-07-15', 1, 1, '2018-12-13 23:18:31', '2018-12-13 23:18:31'),
(12, 20196, NULL, 'asdasd', 'asdasd', 'asdasd', 7, 'asdasd', 'male', '1982-07-15', 1, 1, '2018-12-13 23:20:09', '2018-12-13 23:20:09'),
(13, 20197, NULL, 'asdasd', 'asdasd', 'asdasd', 7, 'assdasd', 'female', '2018-12-12', 1, 1, '2018-12-13 23:21:58', '2018-12-13 23:21:58');

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
(0, 'Flag Ceremony', 0, 0, 1000, 'active', NULL, '2019-01-06 19:42:12'),
(1, 'Snack Break', 0, 0, 0, 'inactive', NULL, NULL),
(2, 'Silent Moment', 0, 0, 0, 'inactive', NULL, '2019-01-06 19:34:28'),
(3, 'Lunch Break', 0, 0, 0, 'active', NULL, NULL),
(4, 'Stretching Activity', 3, 0, 0, 'active', NULL, NULL),
(5, 'Dismissal Routine', 4, 0, 0, 'active', NULL, NULL),
(6, 'CATHESESIS', 4, 0, 60, 'active', NULL, NULL),
(7, 'PE', 1, 0, 0, 'active', NULL, NULL),
(12, 'ESP', 1, 6, 30, 'active', NULL, NULL),
(13, 'Mother Tounge', 1, 6, 50, 'active', NULL, NULL),
(14, 'Filipino', 1, 6, 50, 'active', NULL, NULL),
(15, 'Araling Panlipunan', 1, 6, 50, 'active', NULL, NULL),
(16, 'English', 1, 6, 60, 'active', NULL, NULL),
(17, 'Math', 1, 6, 60, 'active', NULL, NULL),
(18, 'Science', 1, 6, 60, 'active', NULL, NULL),
(19, 'Music', 1, 6, 60, 'inactive', NULL, '2019-01-06 19:42:17'),
(20, 'Art', 1, 6, 60, 'active', NULL, NULL),
(21, 'Cookery/Home Economics', 1, 6, 55, 'active', NULL, NULL),
(22, 'ICT', 1, 6, 30, 'active', NULL, NULL),
(23, 'filipino', 6, 2, 48, 'active', '2019-01-06 18:43:29', '2019-01-06 18:43:29');

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
(0, 'NONE', 'NONE', 'NONE', 'NONE', 'inactive', NULL, NULL),
(1, 'ADVICER', 'ADVICER', 'ADVICER', 'ADVICER', 'inactive', NULL, NULL),
(2, 'asdasdasd, dssadasd asdasdasd', 'asdasd', 'asdasdsad', 'Married', 'active', '2018-11-05 17:30:56', '2018-11-05 17:30:56'),
(3, 'Layan, Justin Enad', 'asdasd', 'asdasd', 'Single', 'active', '2018-11-08 08:59:53', '2018-11-08 08:59:53'),
(4, 'ranara, John bayot', 'doctoral in cosmetics', 'certified yors', 'Married', 'inactive', '2018-11-13 05:03:56', '2019-01-04 03:53:42'),
(5, 'Teacher1, Teacher1 Teacher1', 'unknown', 'asdasd', 'Married', 'inactive', '2018-11-15 21:01:44', '2019-01-03 23:09:38'),
(6, 'Teacher Sample', 'asdasdgakddfndj', 'Unknown Passer', 'Single', 'inactive', '2019-01-03 22:19:39', '2019-01-06 20:09:26'),
(7, 'RAnara John yors', 'Grade 12', 'Certified Pakboy', 'Single', 'active', '2019-01-03 23:10:09', '2019-01-04 03:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `remaining` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `role_id`, `email`, `photo`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'staffaaaaa', 'staffaaaa', 'staffaaaa', 'staff', 2, 'staff@staff', 'user_img.png', '$2y$12$8umFNid1U.D77S2oH7RQAeQ5WhRgflysL7X1ADTe34p/tS8lhgSq6', 'DbFH9lmiFMgYkC9f5jtLLDKye4PdJPKnph2lENBnoCcCK7xonneiwbb58T1f', NULL, '2018-12-16 10:08:10'),
(3, 'user', 'user', 'user', 'user', 3, 'user@user', 'user_img.png', '$2y$12$8umFNid1U.D77S2oH7RQAeQ5WhRgflysL7X1ADTe34p/tS8lhgSq6', 'T5dKg04YDh8SGyCoxznp2tf56jsce0btQavPzfX2HM4iyCqK50oJ8BES0MUe', NULL, NULL),
(4, 'asdasd', 'asdasd', 'asdasd', 'irexqu', 2, 'markjhayto@terana', 'user_img.png', '$2y$10$Kvgb3VfWIqc2GQ8fanPX7.ymJvb0m2IGdzq.AGGMhJOw25dBKFZEK', NULL, '2018-11-04 04:38:14', '2018-11-04 04:38:14'),
(5, 'asdasd', 'asdasd', 'asdasd', 'irexqus', 2, 'markjhayto@teranas', 'user_img.png', '$2y$10$w.sQID6heyDESbjODt8enu05qmeqpJMqCPaX0bRjzVFIkKqP6Iczy', NULL, '2018-11-04 04:40:42', '2018-11-04 04:40:42'),
(6, 'asdasd', 'asdasd', 'asdasd', 'asdasdw', 2, 'zeddyhotty@gmail.com', 'user_img.png', '$2y$10$oh6b1VQ0AjPjt3TIaCd77eUs8L2LtJzynzrahPcpXhXQuBcKIrk7S', NULL, '2018-11-04 04:41:39', '2018-11-04 04:41:39'),
(7, 'asdasd', 'asdasd', 'asdasdasd', 'irexqu', 2, 'zeddyhossdtty@gmail.com', 'user_img.png', '$2y$10$2ryQskkQfdyrwLFS.Nldn.S9QfX/bj7cU9RKgM5m34gP7r9xWC8XS', NULL, '2018-11-04 04:42:25', '2018-11-04 04:42:25'),
(8, 'sdasd', 'asdas', 'asdsad', 'adasdas', 2, 'asdasd@dsfsdfs', 'user_img.png', 'password', NULL, '2018-12-11 08:06:49', '2018-12-11 08:06:49'),
(9, 'john', 'asdas', 'ranayot', 'baotsia', 2, 'ranara@juyot', 'user_img.png', 'password', NULL, '2018-12-11 08:10:03', '2018-12-11 08:10:03'),
(10, 'asdad', 'asdasdasd', 'asdasd', 'asdasd', 2, 'asdad@dsfds', 'user_img.png', 'password', NULL, '2018-12-11 08:11:10', '2018-12-11 08:11:10'),
(12, 'asdasd', '324', '234234', 'asdasd', 2, 'fsdfds@dq1324', 'user_img.png', 'password', NULL, '2018-12-11 08:16:22', '2018-12-11 08:16:22'),
(13, 'asasddasddsas', 'wwrewqweqw', 'weqwe', 'asd1234', 2, 'ASas@s213', 'user_img.png', 'password', NULL, '2018-12-11 08:27:36', '2018-12-11 08:27:36'),
(14, 'asdasd', 'asdasd', '231212', 'asd1241', 2, 'asdas@4212', 'user_img.png', 'password', NULL, '2018-12-11 08:28:37', '2018-12-11 08:28:37'),
(15, 'asdasd', 'asdasd', 'asdasd', 'lkjlkji', 2, 'asdasd@12312', 'user_img.png', 'password', NULL, '2018-12-11 08:33:22', '2018-12-11 08:33:22'),
(17, 'asdasd', 'asdasd', 'sadasd', '12231aas', 1, 'asdas@2234', 'user_img.png', 'password', NULL, '2018-12-11 08:37:49', '2018-12-11 08:37:49'),
(18, 'admin', 'admin', 'admin', 'admin', 2, 'admin@gmail.com', 'user_img.png', '$2y$10$hitVGoRi/qK0cx.gXQ4JxeMUh.4Al9Te5ZJ52ks97.jkVDNDFESHG', NULL, '2018-12-17 11:25:21', '2018-12-17 11:25:21'),
(19, 'vue', 'vuew', 'vuewe', 'vuewers', 2, 'vue@js', NULL, '$2y$10$bCflBNPBDB7Z2rI1dLNX.ufMQLcNMOlcsHpnq5VGNv3e0jirF8HKa', NULL, '2019-01-02 23:53:02', '2019-01-02 23:53:02'),
(20, 'adding', 'form', 'last', 'aswedsaq', 2, 'asdasdasd@adasdsdsa', NULL, '$2y$10$VtqQV/gIw0kRbjx.cYrcYOXPice6ivD2.Ty4TNvE8PdUsiTSbC5Cq', NULL, '2019-01-03 02:00:56', '2019-01-03 02:00:56'),
(21, 'yeahs', 'yeahs', 'yeahs', 'uesdjens', 3, 'osdey@ssase', NULL, '$2y$10$QMpyJNccSszKiZ4iG3odl.0Tn8rF4XP4mVxmjnUF02dwhLpsD3ywS', NULL, '2019-01-03 02:02:02', '2019-01-03 02:02:02'),
(22, 'sweet', 'alerts', 'swal', 'wasllers', 2, 'swaller@mail', NULL, '$2y$10$IYJXp9LxSc6OhEfIhFPjj.yGLhUWCuXjsDX1wvWPYW0GOk8WcFHHa', NULL, '2019-01-03 02:16:10', '2019-01-03 02:16:10'),
(23, 'larskacs', 'larackjsg', 'larasef', 'laraname', 2, 'jpl25@yahoo.com', NULL, '$2y$10$NpkytAO4gyDZxpr80pFuSuRpZXkOTBhWv4dw3uqaQXxXtXZCap2ii', NULL, '2019-01-03 02:26:28', '2019-01-03 02:26:28'),
(24, 'usertest23', 'usertest', 'usertest', 'usertest', 3, 'tusertest@gmail', NULL, '$2y$10$oXSXPElohQH.eF0nadW2cOlJV6lofB2.sjioP./4UY3nUIfqYdAim', NULL, '2019-01-03 02:30:45', '2019-01-03 20:45:19'),
(25, 'new', 'newuser', 'newuser', 'newusers', 3, 'newuser@mail', NULL, '$2y$10$1P6ntcz8iuyReSs01Os8IOod3peD8d8BpwhOT/d1Jw2YnRf9Y86wy', NULL, '2019-01-03 03:45:51', '2019-01-03 20:52:53'),
(26, 'sampl22', 'sampl212', 'sampl21', 'sapolie2', 2, 'sampl21@gmail', NULL, '$2y$10$F2BMIChIUznis.gDk9bO2e3pAfise7RxRs3D9GJ5hzAwO/6dhiHUK', NULL, '2019-01-03 20:47:13', '2019-01-03 20:51:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_year`
--
ALTER TABLE `school_year`
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
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergencies`
--
ALTER TABLE `emergencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `parent_student`
--
ALTER TABLE `parent_student`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `past_schools`
--
ALTER TABLE `past_schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `populations`
--
ALTER TABLE `populations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siblings`
--
ALTER TABLE `siblings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_user`
--
ALTER TABLE `student_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

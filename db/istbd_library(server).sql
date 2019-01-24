-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2017 at 12:18 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `istbd_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `author_id`, `author_name`) VALUES
(4, 'IST_LIBRARY_2', 'W. A. Triebel'),
(5, 'IST_LIBRARY_3', 'E. Balagurusamy'),
(6, 'IST_LIBRARY_4', 'Seymour Lipschutz'),
(50, 'IST_LIBRARY_5', 'Ahmed Shamsul Arefin'),
(56, 'L_10', 'Udit Acharya'),
(57, 'L_11', 'Abraham Silberschatz'),
(58, 'L_12', 'Henry F. Korth'),
(59, 'L_13', 'S. Sudarshan'),
(52, 'L_6', 'মুহম্মদ জাফর ইকবাল'),
(53, 'L_7', 'আফসার-উজ-জামান'),
(54, 'L_8', 'Avtar Singh'),
(55, 'L_9', 'Test Author');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_isbn` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `book_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_add_date` datetime NOT NULL,
  `manager_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_edition` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `book_place_of_pub` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `book_year_of_pub` year(4) DEFAULT NULL,
  `book_pages` int(11) DEFAULT NULL,
  `book_status` tinyint(4) NOT NULL,
  `book_remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_stock` int(11) NOT NULL DEFAULT '0',
  `book_available` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `book_id`, `book_isbn`, `book_title`, `publication_id`, `book_add_date`, `manager_id`, `book_edition`, `book_place_of_pub`, `book_year_of_pub`, `book_pages`, `book_status`, `book_remarks`, `book_stock`, `book_available`) VALUES
(34, 'IST_LIBRARY_2', '8676543234676', 'Programming in ANSI C', 'IST_LIBRARY_2', '2016-12-21 18:41:30', 'IST_LIBRARY_1', '4th', 'Delhi, India', 2011, 245, 1, '', 11, 10),
(35, 'IST_3', '12345', 'Art of Programming Contest', 'IST_LIBRARY_4', '2016-12-21 20:11:47', 'IST_LIBRARY_1', '1st', 'Dhaka, Bangladesh', 2009, 195, 1, '', 16, 15),
(36, 'L_4', '2358094', 'টাইট্রন একটি গ্রহের নাম', 'L_5', '2016-12-21 23:48:54', 'IST_LIBRARY_1', '1st', 'Dhaka, Bangladesh', 2001, 68, 1, '', 8, 8),
(37, 'L_5', 'uiy6756gh', 'উচ্চ মাধ্যমিক জ্যামিতি ও ক্যালকুলাস', 'L_5', '2016-12-21 23:50:17', 'IST_LIBRARY_1', '2nd', 'Dhaka, Bangladesh', 2011, 298, 1, '', 6, 4),
(38, 'L_6', 'jkluio789023jod', 'The 8088 and 8086 Microprocessor System', 'IST_LIBRARY_3', '2016-12-21 23:52:48', 'IST_LIBRARY_1', '3rd', 'New Delhi', 2004, 593, 1, '', 10, 9),
(39, 'L_7', '39dkdk', 'Bangla Grammar', 'L_6', '2016-12-21 23:54:28', 'IST_LIBRARY_1', '1st', 'Dhaka, Bangladesh', 2000, 198, 1, '', 10, 10),
(43, 'L_8', '978-0073523323', 'Database System Concepts', 'L_7', '2017-12-23 13:07:08', 'IST_LIBRARY_1', '6th', 'Yale', 2006, 678, 1, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_author_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`id`, `book_author_id`, `book_id`, `author_id`) VALUES
(35, '', 'IST_LIBRARY_2', 'IST_LIBRARY_3'),
(37, '', 'IST_3', 'IST_LIBRARY_5'),
(38, '', 'L_4', 'L_6'),
(39, '', 'L_5', 'L_7'),
(40, '', 'L_6', 'IST_LIBRARY_2'),
(41, '', 'L_6', 'L_8'),
(47, '', 'L_7', 'L_10'),
(49, '', 'L_8', 'L_11'),
(50, '', 'L_8', 'L_12'),
(51, '', 'L_8', 'L_13');

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `book_category_id`, `book_id`, `category_id`) VALUES
(71, '', 'IST_LIBRARY_2', 'IST_LIBRARY_1'),
(72, '', 'IST_LIBRARY_2', 'IST_LIBRARY_2'),
(73, '', 'IST_LIBRARY_2', 'IST_LIBRARY_4'),
(78, '', 'IST_3', 'IST_LIBRARY_1'),
(79, '', 'IST_3', 'IST_LIBRARY_2'),
(80, '', 'L_4', 'L_6'),
(81, '', 'L_4', 'L_7'),
(82, '', 'L_5', 'L_8'),
(83, '', 'L_5', 'L_9'),
(84, '', 'L_6', 'L_10'),
(85, '', 'L_6', 'IST_LIBRARY_2'),
(86, '', 'L_6', 'IST_LIBRARY_1'),
(92, '', 'L_7', 'L_11'),
(94, '', 'L_8', 'L_12'),
(95, '', 'L_8', 'IST_LIBRARY_4'),
(96, '', 'L_8', 'IST_LIBRARY_1');

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `book_copy_id` int(10) UNSIGNED NOT NULL,
  `book_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_copy_accession_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `book_copy_status` tinyint(1) NOT NULL,
  `book_copy_type` tinyint(1) NOT NULL,
  `book_copy_date` date NOT NULL,
  `book_copy_price` float DEFAULT NULL,
  `book_copy_source` tinyint(1) DEFAULT NULL,
  `book_copy_remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `book_copy_manager_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `book_copy_is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`book_copy_id`, `book_id`, `book_copy_accession_no`, `book_copy_status`, `book_copy_type`, `book_copy_date`, `book_copy_price`, `book_copy_source`, `book_copy_remarks`, `book_copy_manager_id`, `book_copy_is_deleted`) VALUES
(5, 'IST_LIBRARY_2', 'IST_c_5', 1, 0, '2016-12-21', 93, 1, '', 'IST_LIBRARY_1', 0),
(26, 'IST_LIBRARY_2', 'IST_c_26', 0, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(27, 'IST_LIBRARY_2', 'IST_c_27', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(28, 'IST_LIBRARY_2', 'IST_c_28', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(29, 'IST_LIBRARY_2', 'IST_c_29', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(30, 'IST_LIBRARY_2', 'IST_c_30', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(31, 'IST_LIBRARY_2', 'IST_c_31', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(32, 'IST_LIBRARY_2', 'IST_c_32', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(33, 'IST_LIBRARY_2', 'IST_c_33', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(34, 'IST_LIBRARY_2', 'IST_c_34', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(35, 'IST_LIBRARY_2', 'IST_c_35', 1, 1, '2016-12-21', 75, 1, '', 'IST_LIBRARY_1', 0),
(36, 'IST_3', 'IST_c_36', 1, 0, '2016-12-21', 90, 1, '', 'IST_LIBRARY_1', 0),
(37, 'IST_3', 'IST_c_37', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(38, 'IST_3', 'IST_c_38', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(39, 'IST_3', 'IST_c_39', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(40, 'IST_3', 'IST_c_40', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(41, 'IST_3', 'IST_c_41', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(42, 'IST_3', 'IST_c_42', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(43, 'IST_3', 'IST_c_43', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(44, 'IST_3', 'IST_c_44', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(45, 'IST_3', 'IST_c_45', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(46, 'IST_3', 'IST_c_46', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(47, 'IST_3', 'IST_c_47', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(48, 'IST_3', 'IST_c_48', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(49, 'IST_3', 'IST_c_49', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(50, 'IST_3', 'IST_c_50', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(51, 'IST_3', 'IST_c_51', 1, 1, '2016-12-21', 72.5, 1, '', 'IST_LIBRARY_1', 0),
(52, 'L_4', 'L_c_52', 1, 0, '2016-12-21', 50, 1, '', 'IST_LIBRARY_1', 0),
(53, 'L_4', 'L_c_53', 0, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(54, 'L_4', 'L_c_54', 1, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(55, 'L_4', 'L_c_55', 1, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(56, 'L_4', 'L_c_56', 1, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(57, 'L_4', 'L_c_57', 1, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(58, 'L_4', 'L_c_58', 1, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(59, 'L_4', 'L_c_59', 1, 1, '2016-12-21', 43, 1, '', 'IST_LIBRARY_1', 0),
(60, 'L_5', 'L_c_60', 1, 0, '2016-12-21', 80, 1, '', 'IST_LIBRARY_1', 0),
(61, 'L_5', 'L_c_61', 1, 1, '2016-12-21', 72, 1, '', 'IST_LIBRARY_1', 0),
(62, 'L_5', 'L_c_62', 1, 1, '2016-12-21', 72, 1, '', 'IST_LIBRARY_1', 0),
(63, 'L_5', 'L_c_63', 1, 1, '2016-12-21', 72, 1, '', 'IST_LIBRARY_1', 0),
(64, 'L_5', 'L_c_64', 1, 1, '2016-12-21', 72, 1, '', 'IST_LIBRARY_1', 0),
(65, 'L_5', 'L_c_65', 1, 1, '2016-12-21', 72, 1, '', 'IST_LIBRARY_1', 0),
(66, 'L_6', 'L_c_66', 1, 0, '2016-12-21', 430, 1, '', 'IST_LIBRARY_1', 0),
(67, 'L_6', 'L_c_67', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(68, 'L_6', 'L_c_68', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(69, 'L_6', 'L_c_69', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(70, 'L_6', 'L_c_70', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(71, 'L_6', 'L_c_71', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(72, 'L_6', 'L_c_72', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(73, 'L_6', 'L_c_73', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(74, 'L_6', 'L_c_74', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(75, 'L_6', 'L_c_75', 1, 1, '2016-12-21', 450, 1, '', 'IST_LIBRARY_1', 0),
(86, 'L_7', 'L_c_86', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(87, 'L_7', 'L_c_87', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(88, 'L_7', 'L_c_88', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(89, 'L_7', 'L_c_89', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(90, 'L_7', 'L_c_90', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(91, 'L_7', 'L_c_91', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(92, 'L_7', 'L_c_92', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(93, 'L_7', 'L_c_93', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(94, 'L_7', 'L_c_94', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(95, 'L_7', 'L_c_95', 1, 1, '2016-12-22', 187, 1, '', 'IST_LIBRARY_1', 0),
(116, 'L_8', 'L_c_96', 1, 0, '2017-12-23', 1200, 1, '', 'IST_LIBRARY_1', 0),
(117, 'L_8', 'L_c_97', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(118, 'L_8', 'L_c_98', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(119, 'L_8', 'L_c_99', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(120, 'L_8', 'L_c_100', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(121, 'L_8', 'L_c_101', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(122, 'L_8', 'L_c_102', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(123, 'L_8', 'L_c_103', 1, 1, '2017-12-23', 270, 1, '', 'IST_LIBRARY_1', 1),
(124, 'L_8', 'L_c_104', 1, 1, '2017-12-23', 100, 1, '', 'IST_LIBRARY_1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_id`, `category_name`) VALUES
(1, 'IST_LIBRARY_1', 'Computer'),
(2, 'IST_LIBRARY_2', 'Programming'),
(4, 'IST_LIBRARY_3', 'Programming Contest'),
(5, 'IST_LIBRARY_4', 'CSE Course'),
(6, 'IST_LIBRARY_5', 'Bangla Programming'),
(12, 'L_10', 'Microprocessor'),
(13, 'L_11', 'Test Category'),
(14, 'L_12', 'Database'),
(8, 'L_6', 'Science Fiction'),
(9, 'L_7', 'Novel'),
(10, 'L_8', 'Mathematics'),
(11, 'L_9', 'H.S.C Books');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `id` int(10) UNSIGNED NOT NULL,
  `issue_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_datetime` datetime NOT NULL,
  `issue_return_datetime` datetime DEFAULT NULL,
  `issue_deadline` datetime DEFAULT NULL,
  `issue_auto_expire_datetime` datetime DEFAULT NULL,
  `issue_book_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_book_copy_accession_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `issue_lend_user_code` varchar(15) CHARACTER SET latin1 NOT NULL,
  `issue_receive_user_code` varchar(15) CHARACTER SET latin1 NOT NULL,
  `issue_receive_admin_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `issue_fine_user_code` varchar(15) CHARACTER SET latin1 NOT NULL,
  `issue_fine_admin_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `issue_renew_user_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `issue_remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`id`, `issue_id`, `issue_datetime`, `issue_return_datetime`, `issue_deadline`, `issue_auto_expire_datetime`, `issue_book_id`, `issue_book_copy_accession_no`, `user_id`, `manager_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES
(13, 'L_1', '2017-12-25 21:28:10', '2017-12-25 21:30:41', '2018-01-09 16:30:00', NULL, 'IST_3', 'IST_c_37', 'IST_1', 'IST_LIBRARY_1', 3, 'OXXUQSAR', 'A0ReJJU5', '1RiQrnnY', 'ettli3ov', 'OiHOO$uU', 'jlZh%LR8', ''),
(14, 'L_2', '2017-12-25 21:29:18', NULL, '2018-01-09 16:30:00', NULL, 'L_4', 'L_c_53', 'IST_1', 'IST_LIBRARY_1', 1, 'nURgiDjQ', 'w7gx2&zq', 'M33GLxA5', 'jsJUC@QN', 'FXP#lRoL', 'D7IR9an1', ''),
(15, 'L_3', '2017-12-25 21:36:51', NULL, NULL, '2017-12-27 16:30:00', 'L_5', NULL, 'IST_1', NULL, 0, 'voL55Jky', '4RWPxr#$', 'P8EPV4yn', 'lm1kSQ$B', 'Hdcwvm@z', 'jBlbaWA5', '');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `log_entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `log_query` longtext COLLATE utf8_unicode_ci NOT NULL,
  `log_is_synced` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `log_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `log_entry_id`, `log_query`, `log_is_synced`, `log_datetime`) VALUES
(63, 'L_1', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_auto_expire_datetime`, `issue_book_id`, `user_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'L_1\', \'2017-12-25 20:26:29\', \'2017-12-27 16:30:00\', \'IST_LIBRARY_2\', \'IST_1\', 9, \'V$SUl77U\', \'UUzlCM$%\', \'S9CTpv$0\', \'rkOwHPNp\', \'oycuaIIN\', \'Ah5D2#%m\', \'\')', 1, '2017-12-25 20:26:29'),
(64, 'L_117', 'UPDATE `book` SET `book_id` = \'IST_LIBRARY_2\', `book_available` = 9 WHERE `book_id` = \'IST_LIBRARY_2\'', 1, '2017-12-25 20:26:39'),
(65, 'L_118', 'UPDATE `issue` SET `issue_id` = \'L_1\', `issue_status` = 0 WHERE `issue_id` = \'L_1\'', 1, '2017-12-25 20:26:39'),
(66, 'OL_66', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_auto_expire_datetime`, `issue_book_id`, `user_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'OL_2\', \'2017-12-25 20:27:44\', \'2017-12-27 16:30:00\', \'L_4\', \'IST_1\', 9, \'gJBtz7nO\', \'PmIg1%Q@\', \'V&o8pYUP\', \'6kwm9SaD\', \'EIfRds&0\', \'zdtUfpkh\', \'\')', 1, '2017-12-25 20:27:44'),
(67, 'L_120', 'UPDATE `book` SET `book_id` = \'L_4\', `book_available` = 8 WHERE `book_id` = \'L_4\'', 1, '2017-12-25 20:27:45'),
(68, 'L_121', 'UPDATE `issue` SET `issue_id` = \'OL_2\', `issue_status` = 0 WHERE `issue_id` = \'OL_2\'', 1, '2017-12-25 20:27:45'),
(69, 'OL_69', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_auto_expire_datetime`, `issue_book_id`, `user_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'OL_3\', \'2017-12-25 20:27:56\', \'2017-12-27 16:30:00\', \'L_7\', \'IST_1\', 9, \'tuUNvhLz\', \'8o0aA%nI\', \'G1uDRNd7\', \'SGlsD9WK\', \'JQtLotPF\', \'lNmU@hs#\', \'\')', 1, '2017-12-25 20:27:56'),
(70, 'L_123', 'UPDATE `book` SET `book_id` = \'L_7\', `book_available` = 9 WHERE `book_id` = \'L_7\'', 1, '2017-12-25 20:27:59'),
(71, 'L_124', 'UPDATE `issue` SET `issue_id` = \'OL_3\', `issue_status` = 0 WHERE `issue_id` = \'OL_3\'', 1, '2017-12-25 20:27:59'),
(72, 'L_125', 'UPDATE `book_copy` SET `book_copy_accession_no` = \'IST_c_26\', `book_copy_status` = 0 WHERE `book_copy_accession_no` = \'IST_c_26\'', 1, '2017-12-25 20:32:29'),
(73, 'L_126', 'UPDATE `issue` SET `manager_id` = \'IST_LIBRARY_1\', `issue_book_copy_accession_no` = \'IST_c_26\', `issue_status` = 1, `issue_datetime` = \'2017-12-25 20:32:29\', `issue_deadline` = \'2018-01-09 16:30:00\' WHERE `issue_id` = \'L_1\'', 1, '2017-12-25 20:32:29'),
(74, 'L_127', 'UPDATE `issue` SET `issue_id` = \'L_1\', `issue_status` = 3, `issue_return_datetime` = \'2017-12-25 20:34:00\' WHERE `issue_id` = \'L_1\'', 1, '2017-12-25 20:34:00'),
(75, 'L_128', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_deadline`, `issue_book_id`, `issue_book_copy_accession_no`, `user_id`, `manager_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'L_4\', \'2017-12-25 20:34:00\', \'2018-01-09 16:30:00\', \'IST_LIBRARY_2\', \'IST_c_26\', \'IST_1\', \'IST_LIBRARY_1\', 1, \'go2@5fhL\', \'TMrXK1RY\', \'Ca97ATgD\', \'KsO4w5OQ\', \'JGrgfgIO\', \'Rmv3nX4B\', \'\')', 1, '2017-12-25 20:34:00'),
(76, 'L_129', 'UPDATE `user` SET `user_name` = \'Md. Moyeenul Hasan Durjoy\', `user_dept` = \'CSE\', `user_session` = \'2017\', `user_roll` = \'1036\', `user_phone` = \'12355677888\', `user_email` = \'kmmuntasir@gmail.co\', `user_username` = \'durjoy\' WHERE `user_id` = \'L_7\'', 1, '2017-12-25 20:39:57'),
(77, 'L_130', 'UPDATE `user` SET `user_name` = \'Md. Moyeenul Hasan Durjoy\', `user_dept` = \'CSE\', `user_session` = \'2017\', `user_roll` = \'1036\', `user_phone` = \'12355677888\', `user_email` = \'kmmuntasir@gmail.com\', `user_username` = \'durjoy\' WHERE `user_id` = \'L_7\'', 1, '2017-12-25 20:40:02'),
(78, 'L_131', 'UPDATE `user` SET `user_name` = \'Md. Moyeenul Hasan Durjoy\', `user_dept` = \'CSE\', `user_session` = \'2017\', `user_roll` = \'1036\', `user_phone` = \'12355677888\', `user_email` = \'kmmuntasir@gmail.com\', `user_username` = \'durjoy\', `user_pass` = \'c4ca4238a0b923820dcc509a6f75849b\' WHERE `user_id` = \'L_7\'', 1, '2017-12-25 20:40:14'),
(79, 'OL_79', 'UPDATE `user` SET `user_library_code` = \'x&K&LCRqGq\' WHERE `user_id` = \'L_7\'', 1, '2017-12-25 20:40:58'),
(80, 'OL_80', 'UPDATE `user` SET `user_library_code` = \'yWd0ehWofG\' WHERE `user_id` = \'L_7\'', 1, '2017-12-25 20:41:09'),
(81, 'L_134', 'UPDATE `book` SET `book_id` = \'L_4\', `book_available` = 9 WHERE `book_id` = \'L_4\'', 1, '2017-12-25 20:54:29'),
(82, 'L_135', 'DELETE FROM `issue` WHERE `issue_id` = \'OL_2\'', 1, '2017-12-25 20:54:29'),
(83, 'L_136', 'UPDATE `book` SET `book_id` = \'L_7\', `book_available` = 10 WHERE `book_id` = \'L_7\'', 1, '2017-12-25 20:54:36'),
(84, 'L_137', 'DELETE FROM `issue` WHERE `issue_id` = \'OL_3\'', 1, '2017-12-25 20:54:36'),
(85, 'L_138', 'DELETE FROM `issue` WHERE `issue_id` = \'L_1\'', 1, '2017-12-25 20:54:58'),
(86, 'L_139', 'UPDATE `book` SET `book_id` = \'IST_LIBRARY_2\', `book_available` = 10 WHERE `book_id` = \'IST_LIBRARY_2\'', 1, '2017-12-25 20:55:34'),
(87, 'L_140', 'DELETE FROM `issue` WHERE `issue_id` = \'L_4\'', 1, '2017-12-25 20:55:34'),
(88, 'L_141', 'UPDATE `book` SET `book_available` = 14 WHERE `book_id` = \'IST_3\'', 1, '2017-12-25 21:28:10'),
(89, 'L_142', 'UPDATE `book_copy` SET `book_copy_status` = 0 WHERE `book_copy_accession_no` = \'IST_c_37\'', 1, '2017-12-25 21:28:10'),
(90, 'L_143', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_deadline`, `issue_book_id`, `issue_book_copy_accession_no`, `user_id`, `manager_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'L_1\', \'2017-12-25 21:28:10\', \'2018-01-09 16:30:00\', \'IST_3\', \'IST_c_37\', \'IST_1\', \'IST_LIBRARY_1\', 1, \'OXXUQSAR\', \'A0ReJJU5\', \'1RiQrnnY\', \'ettli3ov\', \'OiHOO$uU\', \'jlZh%LR8\', \'\')', 1, '2017-12-25 21:28:10'),
(91, 'L_144', 'UPDATE `book` SET `book_available` = 8 WHERE `book_id` = \'L_4\'', 1, '2017-12-25 21:29:18'),
(92, 'L_145', 'UPDATE `book_copy` SET `book_copy_status` = 0 WHERE `book_copy_accession_no` = \'L_c_53\'', 1, '2017-12-25 21:29:18'),
(93, 'L_146', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_deadline`, `issue_book_id`, `issue_book_copy_accession_no`, `user_id`, `manager_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'L_2\', \'2017-12-25 21:29:18\', \'2018-01-09 16:30:00\', \'L_4\', \'L_c_53\', \'IST_1\', \'IST_LIBRARY_1\', 1, \'nURgiDjQ\', \'w7gx2&zq\', \'M33GLxA5\', \'jsJUC@QN\', \'FXP#lRoL\', \'D7IR9an1\', \'\')', 1, '2017-12-25 21:29:18'),
(94, 'L_147', 'UPDATE `book` SET `book_id` = \'IST_3\', `book_available` = 15 WHERE `book_id` = \'IST_3\'', 1, '2017-12-25 21:30:41'),
(95, 'L_148', 'UPDATE `book_copy` SET `book_copy_accession_no` = \'IST_c_37\', `book_copy_status` = 1 WHERE `book_copy_accession_no` = \'IST_c_37\'', 1, '2017-12-25 21:30:41'),
(96, 'L_149', 'UPDATE `issue` SET `issue_id` = \'L_1\', `issue_status` = 3, `issue_return_datetime` = \'2017-12-25 21:30:41\' WHERE `issue_id` = \'L_1\'', 1, '2017-12-25 21:30:41'),
(97, 'L_150', 'INSERT INTO `issue` (`issue_id`, `issue_datetime`, `issue_auto_expire_datetime`, `issue_book_id`, `user_id`, `issue_status`, `issue_lend_user_code`, `issue_receive_user_code`, `issue_receive_admin_code`, `issue_fine_user_code`, `issue_fine_admin_code`, `issue_renew_user_code`, `issue_remarks`) VALUES (\'L_3\', \'2017-12-25 21:36:51\', \'2017-12-27 16:30:00\', \'L_5\', \'IST_1\', 9, \'voL55Jky\', \'4RWPxr#$\', \'P8EPV4yn\', \'lm1kSQ$B\', \'Hdcwvm@z\', \'jBlbaWA5\', \'\')', 1, '2017-12-25 21:36:51'),
(98, 'L_151', 'UPDATE `book` SET `book_id` = \'L_5\', `book_available` = 4 WHERE `book_id` = \'L_5\'', 1, '2017-12-25 21:36:55'),
(99, 'L_152', 'UPDATE `issue` SET `issue_id` = \'L_3\', `issue_status` = 0 WHERE `issue_id` = \'L_3\'', 1, '2017-12-25 21:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(10) UNSIGNED NOT NULL,
  `manager_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manager_user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `manager_pass` varchar(255) CHARACTER SET latin1 NOT NULL,
  `manager_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `manager_phone` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `manager_email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `is_admin` tinyint(2) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `manager_id`, `manager_user`, `manager_pass`, `manager_name`, `manager_phone`, `manager_email`, `is_admin`, `is_deleted`) VALUES
(1, 'IST_LIBRARY_1', 'munna_library', '827ccb0eea8a706c4c34a16891f84e7b', 'Muntasir Billah Munna', '01516180603', 'kmmuntasir@gmail.com', 1, 0),
(3, 'L_2', 'khalil', '827ccb0eea8a706c4c34a16891f84e7b', 'Khalilullah', '234567', 'khalil@mia.com', 0, 0),
(4, 'L_3', '', '202cb962ac59075b964b07152d234b70', 'Salma', '23455', 'sal@ma.com', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `id` int(10) UNSIGNED NOT NULL,
  `publication_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`id`, `publication_id`, `publication_name`) VALUES
(1, 'IST_LIBRARY_1', 'Schaum\'s Outlines'),
(2, 'IST_LIBRARY_2', 'TATA mCGRAW Hills'),
(3, 'IST_LIBRARY_3', 'Prentice-Hall India'),
(35, 'IST_LIBRARY_4', 'শিখা প্রকাশনী'),
(37, 'L_5', 'Gyankosh Prokashoni, Bangladesh'),
(38, 'L_6', 'Test Publisher'),
(39, 'L_7', 'Yale Publishers');

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `server_id` tinyint(3) UNSIGNED NOT NULL,
  `server_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `server_last_connection` datetime NOT NULL,
  `server_status` tinyint(1) NOT NULL,
  `server_sync_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`server_id`, `server_name`, `server_url`, `server_last_connection`, `server_status`, `server_sync_status`) VALUES
(1, 'remote', 'http://localhost/library.ist.edu.bd_online/index.php', '2017-12-25 20:24:09', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_username` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_pass` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_phone` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `user_email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_library_code` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `user_dept` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_roll` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_session` year(4) NOT NULL,
  `is_teacher` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `teacher_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `teacher_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_id`, `user_username`, `user_pass`, `user_name`, `user_phone`, `user_email`, `user_library_code`, `user_dept`, `user_roll`, `user_session`, `is_teacher`, `teacher_id`, `teacher_designation`, `is_deleted`) VALUES
(1, 'IST_1', 'munna', '202cb962ac59075b964b07152d234b70', 'Muntasir Billah', '1234567890', 'mun@na.com', '%Epv4Cz3OR', 'CSE', '1057', 2009, 0, 0, NULL, 0),
(2, 'IST_2', 'rubayet33', '81dc9bdb52d04dc20036dbd8313ed055', 'Rubayet Hossain', '0987654345678', 'rub@ayet.com', '123', 'CSE', '1014', 2009, 0, 0, NULL, 0),
(3, 'IST_3', 'muntasir', '81dc9bdb52d04dc20036dbd8313ed055', 'K. M. Muntasir Billah Munna', '01516180603', 'kmmuntasir@gmail.com', 'HF1EBAvrgB', 'CSE', '', 0000, 1, 21, 'Faculty Member', 0),
(6, 'L_5', 'rakib', '202cb962ac59075b964b07152d234b70', 'Md. Rakib Hossain', '12345678904845', 'rakib@gmail.com', 'E2971AAC8809C0E0232FAEC1924D1176', 'ECE', '', 0000, 1, 0, 'Faculty Member', 0),
(7, 'L_6', 'taniasultana', '202cb962ac59075b964b07152d234b70', 'Mrs. Tania Sultana', '0984323456787', 'tania@gmail.com', '943BF7D405B44375372A221F669A261A', 'CSE', '', 0000, 1, 0, 'Faculty Member', 0),
(8, 'L_7', 'durjoy', 'c4ca4238a0b923820dcc509a6f75849b', 'Md. Moyeenul Hasan Durjoy', '12355677888', 'kmmuntasir@gmail.com', 'yWd0ehWofG', 'CSE', '1036', 2017, 0, 0, NULL, 0),
(9, 'L_8', 'srafique', 'e5a93371cfc7eab4a88221dd1f6c1a3c', 'Prof. Dr. Shahida Rafique', '01819256950', 'srafique@univdhaka.edu', 'wNl5bpp', 'ECE', '', 0000, 1, 0, 'Professor', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`,`author_id`,`author_name`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`,`book_id`,`book_isbn`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `FK1_book_publication` (`publication_id`),
  ADD KEY `FK2_book_manager` (`manager_id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`id`,`book_author_id`),
  ADD KEY `FK1_book_author_author` (`author_id`),
  ADD KEY `FK2_book_author_book` (`book_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`,`book_category_id`),
  ADD KEY `FK1_book_category_category` (`category_id`),
  ADD KEY `FK2_book_category_book` (`book_id`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`book_copy_id`,`book_copy_accession_no`),
  ADD KEY `FK1_book_copy_book` (`book_id`),
  ADD KEY `FK2_book_copy_manager` (`book_copy_manager_id`),
  ADD KEY `book_copy_accession_no` (`book_copy_accession_no`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`,`category_id`,`category_name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id`,`issue_id`),
  ADD KEY `FK1_issue_book` (`issue_book_id`),
  ADD KEY `FK2_issue_book_copy` (`issue_book_copy_accession_no`),
  ADD KEY `FK3_issue_user` (`user_id`),
  ADD KEY `FK4_issue_manager` (`manager_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`,`log_entry_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`,`manager_id`,`manager_user`,`manager_phone`,`manager_email`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`,`publication_id`,`publication_name`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`server_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`user_id`,`user_username`,`user_phone`,`user_email`,`user_library_code`,`teacher_id`,`user_roll`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `book_author`
--
ALTER TABLE `book_author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `book_copy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `server`
--
ALTER TABLE `server`
  MODIFY `server_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK1_book_publication` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`publication_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_book_manager` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `FK1_book_author_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_book_author_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `FK1_book_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_book_category_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `FK1_book_copy_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_book_copy_manager` FOREIGN KEY (`book_copy_manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `FK1_issue_book` FOREIGN KEY (`issue_book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_issue_book_copy` FOREIGN KEY (`issue_book_copy_accession_no`) REFERENCES `book_copy` (`book_copy_accession_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK3_issue_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK4_issue_manager` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

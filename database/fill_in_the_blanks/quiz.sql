-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 07, 2019 at 01:26 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `fillintheblanks`
--

DROP TABLE IF EXISTS `fillintheblanks`;
CREATE TABLE IF NOT EXISTS `fillintheblanks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `question` longtext,
  `correctAnswer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fillintheblanks`
--

INSERT INTO `fillintheblanks` (`id`, `category`, `question`, `correctAnswer`) VALUES
(1, 1, '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 1'),
(2, 1, '2. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 2'),
(3, 1, '3. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 3'),
(4, 1, '4. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 4'),
(5, 1, '5. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 5'),
(6, 1, '6. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 6'),
(7, 1, '7. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 7'),
(8, 1, '8. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 8'),
(9, 1, '9. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 9'),
(10, 1, '10. Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 10'),
(11, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 11'),
(12, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 12'),
(13, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 13'),
(14, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 14'),
(15, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 15'),
(16, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 16'),
(17, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 17'),
(18, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 18'),
(19, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 19'),
(20, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 20'),
(21, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 21'),
(22, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 22'),
(23, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 23'),
(24, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 24'),
(25, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 25'),
(26, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 26'),
(27, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 27'),
(28, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 28'),
(29, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 29'),
(30, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 30'),
(31, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 31'),
(32, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 32'),
(33, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 33'),
(34, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 34'),
(35, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 35'),
(36, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 36'),
(37, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 37'),
(38, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 38'),
(39, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 39'),
(40, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 40'),
(41, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 41'),
(42, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 42'),
(43, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 43'),
(44, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 44'),
(45, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 45'),
(46, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 46'),
(47, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 47'),
(48, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 48'),
(49, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 49'),
(50, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 50'),
(51, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 51'),
(52, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 52'),
(53, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 53'),
(54, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 54'),
(55, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 55'),
(56, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 56'),
(57, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 57'),
(58, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 58'),
(59, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 59'),
(60, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 60'),
(61, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 61'),
(62, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 62'),
(63, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 63'),
(64, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 64'),
(65, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 65'),
(66, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 66'),
(67, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 67'),
(68, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 68'),
(69, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 69'),
(70, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 70'),
(71, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit question. Sed vehicula leo eu congue molestie.', 'Test 71');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

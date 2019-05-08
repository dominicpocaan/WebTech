-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 07, 2019 at 02:58 PM
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
-- Database: `websitequiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `answer`) VALUES
(2, 'answer0');

-- --------------------------------------------------------

--
-- Table structure for table `compare`
--

DROP TABLE IF EXISTS `compare`;
CREATE TABLE IF NOT EXISTS `compare` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compare`
--

INSERT INTO `compare` (`id`, `value`) VALUES
(33, 'incorrect'),
(32, 'incorrect'),
(31, 'correct'),
(30, 'incorrect'),
(29, 'incorrect'),
(28, 'correct'),
(27, 'correct'),
(26, 'incorrect'),
(25, 'correct'),
(24, 'incorrect'),
(23, 'incorrect'),
(22, 'correct');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`) VALUES
(1, 'answer0'),
(2, 'answer1'),
(3, 'answer0'),
(4, 'answer1'),
(5, 'answer1'),
(6, 'answer0'),
(7, 'answer1'),
(8, 'answer0'),
(9, 'answer0'),
(10, 'answer1'),
(11, ''),
(12, 'answer0'),
(13, 'answer2'),
(14, 'answer3');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2019 at 02:27 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi`
--
CREATE DATABASE IF NOT EXISTS `multi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `multi`;

-- --------------------------------------------------------

--
-- Table structure for table `multiple_choice`
--

DROP TABLE IF EXISTS `multiple_choice`;
CREATE TABLE IF NOT EXISTS `multiple_choice` (
  `question_id` int(15) NOT NULL,
  `question` varchar(150) NOT NULL,
  `a` varchar(40) NOT NULL,
  `b` varchar(40) NOT NULL,
  `c` varchar(40) NOT NULL,
  `d` varchar(40) NOT NULL,
  `ans` varchar(40) NOT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_UNIQUE` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `multiple_choice`
--

INSERT INTO `multiple_choice` (`question_id`, `question`, `a`, `b`, `c`, `d`, `ans`) VALUES
(1, 'HTML stands for?', 'Hyper Text Markup Language', 'High Text Markup Language', 'Hyper Tabular Markup Language', 'None of these', 'Hyper Text Markup Language'),
(2, 'Which of the following tag is used to mark a beginning of paragraph?', '<td>', '<br>', '<p>', '<tr>', '<p>'),
(3, 'Correct HTML tag for the largest heading is?', '<head>', '<h6>', '<heading>', '<h1>', '<h1>'),
(4, 'The attribute of <form> tag', 'Method', 'Action', 'both a % b', 'none of the above', 'both a % b'),
(5, 'www us based on which model', 'Local-server', 'Client-Server', '3-tier', 'none of the above', 'Client-Server'),
(6, 'Web pages starts with which of the following tag?', '<body>', '<title>', '<html>', '<form>', '<html>'),
(7, 'The attribute, which define the relationship between current document and href url is ?', 'rel', 'url', 'rev', 'all the above', 'rel'),
(8, '<base> tag is designed to appear only between', '<head>', '<title>', '<body>', '<form>', '<head>'),
(9, 'How can you open link in a new browser window?', '< a href = \"url\" target = \"new\">', '<a href = \"url\" target= \"_blank\">', '<a href = \"url\".new>', '<a href = \"url\" target =\"open\">', '<a href = \"url\" target= \"_blank\">'),
(10, 'Which of the tag is used to create a number list?', '<li>', '<ol>', '<li> and <ol>', '<none of the above>', '<li>'),
(11, 'Which of the following selector matches all elements of a type?', 'The Type Selector', 'The Universal Selector', 'The Descendant Selector', 'The Class Selector', 'The Type Selector'),
(12, 'Which of the following selector selects all paragraph elements whose lang attribute contains the word \"fr\"?', 'p[lang]', 'p[lang=\"fr\"]', 'p[lang~=\"fr\"]', 'p[lang|=\"fr\"]', 'p[lang~=\"fr\"]'),
(13, 'Which of the following defines a measurement in points?', 'in', 'mm', 'pc', 'pt', 'pt'),
(14, 'Which of the following property is used as a shorthand to specify a number of other background properties?', 'background-attachment', 'background', 'background-repeat', 'background-position', 'background'),
(15, 'Which of the following property is used as shorthand to specify a number of other font properties?', 'font-size', 'font', 'font-variant', 'font-weight', 'font'),
(16, 'Which of the following property of an anchor element signifies unvisited hyperlinks?', ':link', ':visited', ':hover', ':active', ':link'),
(17, 'Which of the following property specifies the color of a border?', ':border-color', ':border-style', ':border-width', ':border-bottom-color', ':border-color'),
(18, 'Which of the following property changes the color of left border?', ':border-top-color', ':border-left-color', ':border-right-color', ':border-bottom-color', ':border-left-color'),
(19, 'Which of the following property serves as shorthand for the marker properties?', 'list-style-type', 'list-style-position', 'list-style-image', 'list-style', 'list-style'),
(20, 'Which of the following property serves as shorthand for the padding properties?', 'padding', 'padding-top', 'padding-left', 'padding-right', 'padding');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

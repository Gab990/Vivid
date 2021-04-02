-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2021 at 01:04 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'Does this work?', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-28 13:48:36', 'no', 13),
(2, '\r\n        What about this?', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-28 13:48:52', 'no', 12),
(3, 'me too\r\n        ', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-01-28 01:49:15', 'no', 10),
(4, 'second comment\r\n        ', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-28 02:03:31', 'no', 12),
(5, 'hey\r\n        ', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-01-28 06:58:10', 'no', 9),
(6, 'hello\r\n        ', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-01-28 18:59:28', 'no', 7),
(7, 'It does work!\r\n        ', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-28 18:59:40', 'no', 6),
(8, 'dunno\r\n        ', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-01-28 18:59:55', 'no', 9),
(9, 'hola\r\n        ', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-28 19:00:26', 'no', 12),
(10, 'hi\r\n        ', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-28 20:08:06', 'no', 17),
(11, '\r\n    Hey, I\'m here', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-29 15:47:59', 'no', 18),
(12, 'Hey', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-01-31 15:06:22', 'no', 18),
(13, 'whatever\r\n        ', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-02-01 13:43:19', 'no', 18),
(14, '\r\n        dsdssdds', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-02-09 22:49:07', 'no', 21),
(15, '123', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-02-10 19:55:54', 'no', 23),
(16, 'haha\r\n        ', 'daniel_sebestyen', 'gabor_sebestyen_1', '2021-02-23 16:57:27', 'no', 28),
(17, 'me three\r\n        ', 'daniel_sebestyen', 'daniel_sebestyen', '2021-02-23 16:57:47', 'no', 10),
(18, 'comment\r\n        ', 'daniel_sebestyen', 'gabor_sebestyen_1', '2021-02-23 16:58:13', 'no', 11),
(19, '\r\n        2', 'tim_test', 'gabor_sebestyen_1', '2021-02-23 17:21:47', 'no', 28),
(20, '222\r\n        ', 'tim_test', 'gabor_sebestyen_1', '2021-02-23 17:21:52', 'no', 26),
(21, '\r\n        22', 'tim_test', 'andrea_sebestyen', '2021-02-23 17:22:00', 'no', 29),
(22, '\r\n        sggfsfgs', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-02-25 13:03:42', 'no', 6),
(23, 'adsdassadsad', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-02-25 13:05:51', 'no', 43),
(24, 'kjhkj', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-03-24 17:35:07', 'no', 50);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user_to`, `user_from`) VALUES
(2, 'gabor_sebestyen', 'daniel_sebestyen'),
(3, 'gabor_sebestyen', 'daniel_sebestyen'),
(4, 'gabor_sebestyen', 'daniel_sebestyen'),
(19, 'gab_sebestyen', 'gabor_sebestyen_1');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(14, 'daniel_sebestyen', 16),
(15, 'daniel_sebestyen', 13),
(16, 'daniel_sebestyen', 12),
(17, 'daniel_sebestyen', 10),
(18, 'andrea_sebestyen', 14),
(19, 'andrea_sebestyen', 15),
(21, 'gabor_sebestyen_1', 16),
(27, 'gabor_sebestyen_1', 13),
(29, 'gabor_sebestyen_1', 12),
(32, 'daniel_sebestyen', 19),
(33, 'daniel_sebestyen', 17),
(36, 'gabor_sebestyen_1', 9),
(37, 'gabor_sebestyen_1', 11),
(40, 'gabor_sebestyen_1', 24),
(42, 'gabor_sebestyen_1', 21),
(43, 'gabor_sebestyen_1', 27),
(44, 'gabor_sebestyen_1', 28),
(45, 'gabor_sebestyen_1', 10),
(46, 'andrea_sebestyen', 25),
(47, 'andrea_sebestyen', 23),
(48, 'andrea_sebestyen', 20),
(49, 'tim_test', 26),
(50, 'gabor_sebestyen_1', 23),
(51, 'gabor_sebestyen_1', 29),
(52, 'gabor_sebestyen_1', 39),
(53, 'daniel_sebestyen', 39),
(54, 'gabor_sebestyen_1', 6),
(55, 'gabor_sebestyen_1', 50);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey Dani!', '2021-02-10 13:41:38', 'yes', 'yes', 'no'),
(2, 'daniel_sebestyen', 'gabor_sebestyen_1', '123', '2021-02-10 13:41:49', 'yes', 'yes', 'no'),
(3, 'daniel_sebestyen', 'gabor_sebestyen_1', '3332', '2021-02-10 13:41:51', 'yes', 'yes', 'no'),
(4, 'daniel_sebestyen', 'gabor_sebestyen_1', 'dssdsdds', '2021-02-10 13:41:52', 'yes', 'yes', 'no'),
(5, 'daniel_sebestyen', 'gabor_sebestyen_1', 'asfafafsfa', '2021-02-10 13:41:55', 'yes', 'yes', 'no'),
(6, 'andrea_sebestyen', 'gabor_sebestyen_1', 'dsddssdd', '2021-02-10 13:42:06', 'yes', 'yes', 'no'),
(7, 'andrea_sebestyen', 'gabor_sebestyen_1', 'dsdsdsd', '2021-02-10 13:42:07', 'yes', 'yes', 'no'),
(8, 'gabor_sebestyen_1', 'daniel_sebestyen', 'sdssddsd', '2021-02-10 13:42:28', 'yes', 'yes', 'no'),
(9, 'gabor_sebestyen_1', 'daniel_sebestyen', 'sdsdsdsd', '2021-02-10 13:42:29', 'yes', 'yes', 'no'),
(10, 'gabor_sebestyen_1', 'daniel_sebestyen', 'sdsdsdds', '2021-02-10 13:42:31', 'yes', 'yes', 'no'),
(11, 'daniel_sebestyen', 'gabor_sebestyen_1', 'sdsdsaads', '2021-02-10 13:42:56', 'yes', 'yes', 'no'),
(12, 'daniel_sebestyen', 'gabor_sebestyen_1', '555443', '2021-02-10 13:42:59', 'yes', 'yes', 'no'),
(13, 'daniel_sebestyen', 'gabor_sebestyen_1', 'gdsadfa43sd', '2021-02-10 13:43:02', 'yes', 'yes', 'no'),
(14, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey', '2021-02-10 13:57:28', 'yes', 'yes', 'no'),
(15, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey', '2021-02-10 13:57:53', 'yes', 'yes', 'no'),
(16, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Message!!!!', '2021-02-10 14:05:10', 'yes', 'yes', 'no'),
(17, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Message!!!!', '2021-02-10 14:09:57', 'yes', 'yes', 'no'),
(18, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:10:06', 'yes', 'yes', 'no'),
(19, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:12:29', 'yes', 'yes', 'no'),
(20, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:12:50', 'yes', 'yes', 'no'),
(21, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:13:33', 'yes', 'yes', 'no'),
(22, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hello', '2021-02-10 19:00:27', 'yes', 'yes', 'no'),
(23, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hi', '2021-02-10 19:00:39', 'yes', 'yes', 'no'),
(24, 'gabor_sebestyen_1', 'daniel_sebestyen', 'henlo', '2021-02-10 19:01:04', 'yes', 'yes', 'no'),
(25, 'daniel_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-02-10 19:56:20', 'yes', 'yes', 'no'),
(26, 'gabor_sebestyen_1', 'daniel_sebestyen', 'hello', '2021-02-10 19:56:37', 'yes', 'yes', 'no'),
(27, 'andrea_sebestyen', 'gabor_sebestyen_1', 'Hello', '2021-02-15 18:39:31', 'yes', 'yes', 'no'),
(28, 'andrea_sebestyen', 'gabor_sebestyen_1', '111', '2021-02-15 18:39:53', 'yes', 'yes', 'no'),
(29, 'daniel_sebestyen', 'gabor_sebestyen_1', 'hg', '2021-02-15 18:40:13', 'yes', 'yes', 'no'),
(30, 'andrea_sebestyen', 'gabor_sebestyen_1', 'Hello, how are you doing?', '2021-02-15 18:41:13', 'yes', 'yes', 'no'),
(31, 'andrea_sebestyen', 'gabor_sebestyen_1', 'Hello, how are you doing?', '2021-02-15 18:41:19', 'yes', 'yes', 'no'),
(32, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey, how are you doing?', '2021-02-15 18:41:30', 'yes', 'yes', 'no'),
(33, 'daniel_sebestyen', 'andrea_sebestyen', 'hey', '2021-02-15 18:42:17', 'yes', 'yes', 'no'),
(34, 'daniel_sebestyen', 'andrea_sebestyen', 'hey', '2021-02-15 18:45:06', 'yes', 'yes', 'no'),
(35, 'gabor_sebestyen_1', 'andrea_sebestyen', 'fixed', '2021-02-15 18:45:12', 'yes', 'yes', 'no'),
(36, 'daniel_sebestyen', 'gabor_sebestyen_1', 'hola', '2021-02-16 11:42:59', 'yes', 'yes', 'no'),
(37, 'andrea_sebestyen', 'gabor_sebestyen_1', 'found you in the friends list', '2021-02-16 12:31:46', 'yes', 'yes', 'no'),
(38, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-02-16 13:44:57', 'yes', 'yes', 'no'),
(39, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hey there', '2021-02-16 13:47:35', 'yes', 'yes', 'no'),
(40, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hey there', '2021-02-16 13:48:35', 'yes', 'yes', 'no'),
(41, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hola', '2021-02-16 13:48:39', 'yes', 'yes', 'no'),
(42, 'daniel_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-02-16 16:17:19', 'yes', 'yes', 'no'),
(43, 'gabor_sebestyen_1', 'daniel_sebestyen', 'Hello!', '2021-02-17 10:57:13', 'yes', 'yes', 'no'),
(44, 'gabor_sebestyen_1', 'tim_test', 'Hello!', '2021-02-17 11:08:02', 'yes', 'yes', 'no'),
(45, 'gabor_sebestyen_1', 'bob_test', 'Hey, I\'m bobtest', '2021-02-17 11:08:51', 'yes', 'yes', 'no'),
(46, 'gabor_sebestyen_1', 'sarah_test', 'hey I\'m sarahtest', '2021-02-17 11:09:41', 'yes', 'yes', 'no'),
(47, 'gabor_sebestyen_1', 'jane_test', 'Hey, I\'m janetest', '2021-02-17 11:11:09', 'yes', 'yes', 'no'),
(48, 'gabor_sebestyen_1', 'frank_test', 'hello there, I\'m franktest', '2021-02-17 11:11:59', 'yes', 'yes', 'no'),
(49, 'gabor_sebestyen_1', 'james_test', 'hey, I\'m jamestest', '2021-02-17 12:18:47', 'yes', 'yes', 'no'),
(50, 'gabor_sebestyen_1', 'levy_test', 'hey, I\'m levytest', '2021-02-17 12:19:36', 'yes', 'yes', 'no'),
(51, 'gabor_sebestyen_1', 'daniel_sebestyen', 'hey', '2021-02-23 09:32:25', 'yes', 'yes', 'no'),
(52, 'gabor_sebestyen_1', 'daniel_sebestyen', 'hello', '2021-02-23 09:36:20', 'yes', 'yes', 'no'),
(53, 'sarah_test', 'gabor_sebestyen_1', 'Hey Sarah', '2021-02-24 16:06:30', 'no', 'no', 'no'),
(54, 'tim_test', 'gabor_sebestyen_1', 'hey', '2021-02-24 17:06:10', 'no', 'no', 'no'),
(55, 'gabor_sebestyen_1', 'daniel_sebestyen', 'hi', '2021-02-24 18:49:58', 'yes', 'yes', 'no'),
(56, 'gabor_sebestyen_1', 'daniel_sebestyen', 'he=yoo', '2021-02-24 18:50:59', 'yes', 'yes', 'no'),
(57, 'gabor_sebestyen_1', 'daniel_sebestyen', 'hola', '2021-02-24 18:53:17', 'yes', 'yes', 'no'),
(58, 'andrea_sebestyen', 'gabor_sebestyen_1', 'how are you?', '2021-02-24 18:56:23', 'yes', 'yes', 'no'),
(59, 'andrea_sebestyen', 'gabor_sebestyen_1', 'how are you?', '2021-02-24 18:59:05', 'yes', 'yes', 'no'),
(60, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-02-25 13:00:56', 'yes', 'yes', 'no'),
(61, 'gabor_sebestyen_1', 'daniel_sebestyen', 'bbblk;l', '2021-02-25 14:07:04', 'yes', 'yes', 'no'),
(62, 'levy_test', 'gabor_sebestyen_1', 'hey', '2021-03-02 10:56:10', 'no', 'no', 'no'),
(63, 'gabor_sebestyen_1', 'gabor_sebestyen_1', 'www.talkwithme?=lfhjkljdhgkjsgkhkdfghksfghk.', '2021-03-02 10:59:54', 'yes', 'yes', 'no'),
(64, 'gabor_sebestyen_1', 'daniel_sebestyen', 'Hello!!', '2021-03-10 19:56:47', 'yes', 'yes', 'no'),
(65, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-03-10 20:06:01', 'yes', 'yes', 'no'),
(66, 'andrea_sebestyen', 'gabor_sebestyen_1', 'Hello there', '2021-03-10 20:06:13', 'yes', 'yes', 'no'),
(67, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:23:51', 'yes', 'yes', 'no'),
(68, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:30:01', 'no', 'no', 'no'),
(69, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:31:09', 'no', 'no', 'no'),
(70, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:32:47', 'no', 'no', 'no'),
(71, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:32:49', 'no', 'no', 'no'),
(72, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:32:49', 'no', 'no', 'no'),
(73, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:32:57', 'no', 'no', 'no'),
(74, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:34:05', 'no', 'no', 'no'),
(75, 'frank_test', 'frank_test', 'You were called', '2021-03-16 15:45:26', 'no', 'no', 'no'),
(76, 'andrea_sebestyen', 'andrea_sebestyen', 'You were called', '2021-03-16 15:46:07', 'yes', 'yes', 'no'),
(77, 'andrea_sebestyen', 'andrea_sebestyen', 'You were called', '2021-03-16 15:47:08', 'yes', 'yes', 'no'),
(78, 'andrea_sebestyen', 'gabor_sebestyen_1', 'You were called', '2021-03-16 15:48:56', 'yes', 'yes', 'no'),
(79, 'andrea_sebestyen', 'gabor_sebestyen_1', 'You were called', '2021-03-16 15:49:18', 'yes', 'yes', 'no'),
(80, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-03-16 16:00:43', 'yes', 'yes', 'no'),
(81, 'andrea_sebestyen', 'gabor_sebestyen_1', '1', '2021-03-16 16:04:27', 'yes', 'yes', 'no'),
(82, 'andrea_sebestyen', 'gabor_sebestyen_1', 'www.google.co.uk', '2021-03-16 16:04:45', 'yes', 'yes', 'no'),
(83, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://www.google.co.uk', '2021-03-16 16:05:01', 'yes', 'yes', 'no'),
(84, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me', '2021-03-16 16:05:48', 'yes', 'yes', 'no'),
(85, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/', '2021-03-16 16:08:34', 'yes', 'yes', 'no'),
(86, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=andrea_sebestyen&username=gabor_sebestyen_1', '2021-03-16 16:10:57', 'yes', 'yes', 'no'),
(87, 'gabor_sebestyen_1', 'andrea_sebestyen', 'https://wooded-darkened-gauge.glitch.me/?room=gabor_sebestyen_1&username=gabor_sebestyen_1', '2021-03-16 16:13:04', 'yes', 'yes', 'no'),
(88, 'frank_test', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=frank_test&username=frank_test', '2021-03-16 16:19:18', 'no', 'no', 'no'),
(89, 'andrea_sebestyen', 'gabor_sebestyen_1', 'hi', '2021-03-16 16:35:33', 'yes', 'yes', 'no'),
(90, 'andrea_sebestyen', 'gabor_sebestyen_1', 'fd', '2021-03-16 16:35:40', 'yes', 'yes', 'no'),
(91, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=andrea_sebestyen&username=andrea_sebestyen', '2021-03-16 16:41:43', 'yes', 'yes', 'no'),
(92, 'gabor_sebestyen_1', 'gabor_sebestyen_1', 'hello ', '2021-03-18 17:09:12', 'yes', 'yes', 'no'),
(93, 'gabor_sebestyen_1', 'gabor_sebestyen_1', 'www.talkwithme?=lfhjkljdhgkjsgkhkdfghksfghk.', '2021-03-18 17:09:29', 'yes', 'yes', 'no'),
(94, 'gabor_sebestyen_1', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge', '2021-03-18 17:09:55', 'yes', 'yes', 'no'),
(95, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=andrea_sebestyen&username=andrea_sebestyen', '2021-03-19 09:42:03', 'yes', 'yes', 'no'),
(96, 'gabor_sebestyen_1', 'daniel_sebestyen', 'https://wooded-darkened-gauge.glitch.me/?room=gabor_sebestyen_1&username=gabor_sebestyen_1', '2021-03-19 09:50:11', 'yes', 'yes', 'no'),
(97, 'gabor_sebestyen_1', 'daniel_sebestyen', 'https://wooded-darkened-gauge.glitch.me/?room=gabor_sebestyen_1&username=gabor_sebestyen_1', '2021-03-19 09:51:18', 'yes', 'yes', 'no'),
(98, 'gabor_sebestyen_1', 'daniel_sebestyen', 'https://wooded-darkened-gauge.glitch.me/?room=gabor_sebestyen_1&username=gabor_sebestyen_1', '2021-03-19 09:51:52', 'yes', 'yes', 'no'),
(99, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=andrea_sebestyen&username=andrea_sebestyen', '2021-03-19 10:07:58', 'yes', 'yes', 'no'),
(100, 'andrea_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=andrea_sebestyen&username=andrea_sebestyen', '2021-03-23 10:25:13', 'no', 'no', 'no'),
(101, 'frank_test', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=frank_test&username=frank_test', '2021-03-23 11:13:55', 'no', 'no', 'no'),
(102, 'daniel_sebestyen', 'gabor_sebestyen_1', 'https://wooded-darkened-gauge.glitch.me/?room=daniel_sebestyen&username=daniel_sebestyen', '2021-03-24 17:36:17', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(1, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Gabor Sebestyen posted on your profile', 'post.php?id=28', '2021-02-23 16:55:04', 'no', 'yes'),
(2, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Gabor Sebestyen liked your post', 'post.php?id=10', '2021-02-23 16:56:44', 'no', 'yes'),
(3, 'gabor_sebestyen_1', 'daniel_sebestyen', 'Daniel Sebestyen commented on your post', 'post.php?id=28', '2021-02-23 16:57:27', 'yes', 'yes'),
(4, 'gabor_sebestyen_1', 'daniel_sebestyen', 'Daniel Sebestyen commented on a post you commented on', 'post.php?id=10', '2021-02-23 16:57:47', 'yes', 'yes'),
(5, 'gabor_sebestyen_1', 'daniel_sebestyen', 'Daniel Sebestyen commented on your post', 'post.php?id=11', '2021-02-23 16:58:13', 'no', 'yes'),
(6, 'gabor_sebestyen_1', 'andrea_sebestyen', 'Andrea Sebestyen liked your post', 'post.php?id=25', '2021-02-23 17:21:16', 'no', 'yes'),
(7, 'gabor_sebestyen_1', 'andrea_sebestyen', 'Andrea Sebestyen liked your post', 'post.php?id=23', '2021-02-23 17:21:17', 'no', 'yes'),
(8, 'gabor_sebestyen_1', 'andrea_sebestyen', 'Andrea Sebestyen liked your post', 'post.php?id=20', '2021-02-23 17:21:18', 'yes', 'yes'),
(9, 'gabor_sebestyen_1', 'andrea_sebestyen', 'Andrea Sebestyen posted on your profile', 'post.php?id=29', '2021-02-23 17:21:21', 'yes', 'yes'),
(10, 'gabor_sebestyen_1', 'tim_test', 'Tim Test commented on your post', 'post.php?id=28', '2021-02-23 17:21:47', 'yes', 'yes'),
(11, 'daniel_sebestyen', 'tim_test', 'Tim Test commented on your profile post', 'post.php?id=28', '2021-02-23 17:21:47', 'no', 'yes'),
(12, 'gabor_sebestyen_1', 'tim_test', 'Tim Test commented on your post', 'post.php?id=26', '2021-02-23 17:21:52', 'yes', 'yes'),
(13, 'daniel_sebestyen', 'tim_test', 'Tim Test commented on your profile post', 'post.php?id=26', '2021-02-23 17:21:52', 'no', 'yes'),
(14, 'gabor_sebestyen_1', 'tim_test', 'Tim Test liked your post', 'post.php?id=26', '2021-02-23 17:21:53', 'yes', 'yes'),
(15, 'andrea_sebestyen', 'tim_test', 'Tim Test commented on your post', 'post.php?id=29', '2021-02-23 17:22:00', 'no', 'yes'),
(16, 'gabor_sebestyen_1', 'tim_test', 'Tim Test commented on your profile post', 'post.php?id=29', '2021-02-23 17:22:00', 'yes', 'yes'),
(17, 'andrea_sebestyen', 'gabor_sebestyen_1', 'Gabor Sebestyen liked your post', 'post.php?id=29', '2021-02-24 16:03:02', 'no', 'yes'),
(18, 'gabor_sebestyen_1', 'daniel_sebestyen', 'Daniel Sebestyen liked your post', 'post.php?id=39', '2021-02-24 18:49:28', 'no', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image_uploaded` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`, `image_uploaded`) VALUES
(1, 'This is the first post', 'gabor_sebestyen_1', 'none', '2019-07-18 18:11:13', 'no', 'no', 0, ''),
(2, 'Hello', 'gabor_sebestyen_1', 'none', '2021-01-27 18:16:04', 'no', 'yes', 0, ''),
(3, 'Hello', 'gabor_sebestyen_1', 'none', '2021-01-27 18:16:26', 'no', 'no', 0, ''),
(4, 'How is it going?\n\nThis is a post too', 'gabor_sebestyen_1', 'none', '2021-01-27 18:17:33', 'no', 'no', 0, ''),
(5, 'This is another post', 'gabor_sebestyen_1', 'none', '2021-01-28 11:16:26', 'no', 'no', 0, ''),
(6, 'This post tests<br />\nline-breaks<br />\nlet\'s see if it works', 'gabor_sebestyen_1', 'none', '2021-01-28 11:16:46', 'no', 'no', 1, ''),
(7, 'This is a post from another account', 'daniel_sebestyen', 'none', '2021-01-28 11:19:49', 'no', 'no', 0, ''),
(8, 'This is a test post', 'daniel_sebestyen', 'none', '2021-01-28 11:35:52', 'no', 'no', 0, ''),
(9, 'Why is the weather so bad today?', 'daniel_sebestyen', 'none', '2021-01-28 11:36:02', 'no', 'no', 0, ''),
(10, 'I\'m bored', 'daniel_sebestyen', 'none', '2021-01-28 11:36:07', 'no', 'no', 2, ''),
(11, 'I\'m bored too', 'gabor_sebestyen_1', 'none', '2021-01-28 11:37:00', 'no', 'no', 1, ''),
(12, 'Check this out: https://www.youtube.com/watch?v=evCtzMqNJiU', 'gabor_sebestyen_1', 'none', '2021-01-28 11:37:18', 'no', 'yes', 2, ''),
(13, 'Testing how the infinite-loading feature works', 'gabor_sebestyen_1', 'none', '2021-01-28 11:56:58', 'no', 'no', 2, ''),
(14, 'Hello world!', 'andrea_sebestyen', 'none', '2021-01-28 13:15:06', 'no', 'no', 1, ''),
(15, 'How is it going?', 'andrea_sebestyen', 'none', '2021-01-28 13:15:11', 'no', 'no', 1, ''),
(16, 'Another post', 'gabor_sebestyen_1', 'none', '2021-01-28 19:00:39', 'no', 'no', 2, ''),
(17, 'Hello everyone', 'gabor_sebestyen_1', 'none', '2021-01-28 20:08:02', 'no', 'no', 1, ''),
(18, 'Hey, I just beat: daniel_sebestyen', 'gabor_sebestyen_1', 'none', '2021-01-29 15:47:38', 'no', 'yes', 0, ''),
(19, 'new post', 'gabor_sebestyen_1', 'none', '2021-01-31 15:06:33', 'no', 'yes', 1, ''),
(20, 'me', 'gabor_sebestyen_1', 'none', '2021-02-08 19:41:11', 'no', 'no', 1, ''),
(21, 'hey', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-08 19:41:27', 'no', 'no', 1, ''),
(22, 'y', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-08 20:54:35', 'no', 'yes', 0, ''),
(23, '123', 'gabor_sebestyen_1', 'none', '2021-02-10 19:55:49', 'no', 'yes', 2, ''),
(24, '1223', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-10 19:56:05', 'no', 'no', 1, ''),
(25, 'hey man', 'gabor_sebestyen_1', 'none', '2021-02-23 14:09:41', 'no', 'no', 1, ''),
(26, 'Hey Dani', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-23 16:50:40', 'no', 'no', 1, ''),
(27, '1', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-23 16:52:06', 'no', 'no', 1, ''),
(28, 'gg', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-23 16:55:04', 'no', 'no', 1, ''),
(29, '222', 'andrea_sebestyen', 'gabor_sebestyen_1', '2021-02-23 17:21:21', 'no', 'no', 1, ''),
(30, 'Check this out: <br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/0H-DNYXYBUI&ab_channel=GrayStillPlays\'></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-24 17:24:44', 'no', 'yes', 0, ''),
(31, 'or this one: <br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/vXbN3-UDXsY&ab_channel=CinemaSins\'></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-24 17:25:38', 'no', 'yes', 0, ''),
(32, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/0H-DNYXYBUI&ab_channel=GrayStillPlays\' frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-24 17:33:15', 'no', 'yes', 0, ''),
(33, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/0H-DNYXYBUI\' frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-24 17:40:45', 'no', 'yes', 0, ''),
(34, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/gCAYhUkKUjU\' frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-24 17:41:37', 'no', 'yes', 0, ''),
(35, 'Hey everyone, wanna go for a party', 'gabor_sebestyen_1', 'none', '2021-02-24 17:54:58', 'no', 'yes', 0, ''),
(36, 'am', 'gabor_sebestyen_1', 'none', '2021-02-24 17:55:19', 'no', 'yes', 0, ''),
(37, 'Yeah', 'gabor_sebestyen_1', 'none', '2021-02-24 18:22:44', 'no', 'yes', 0, ''),
(38, 'hey', 'gabor_sebestyen_1', 'none', '2021-02-24 18:28:12', 'no', 'yes', 0, ''),
(39, 'dang', 'gabor_sebestyen_1', 'none', '2021-02-24 18:29:31', 'no', 'no', 2, 'assets/images/posts/60369b0b4d078P1010276.JPG'),
(40, '1', 'gabor_sebestyen_1', 'none', '2021-02-24 18:49:08', 'no', 'yes', 0, ''),
(41, 'cxz\\', 'gabor_sebestyen_1', 'none', '2021-02-25 12:49:11', 'no', 'yes', 0, ''),
(42, 'asd', 'gabor_sebestyen_1', 'none', '2021-02-25 12:50:35', 'no', 'yes', 0, ''),
(43, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/x3J2tWUgIho\' frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-25 12:54:11', 'no', 'yes', 0, ''),
(44, 'who watch?v this', 'gabor_sebestyen_1', 'none', '2021-02-25 12:54:39', 'no', 'yes', 0, ''),
(45, '<br><iframe width=\'420\' height=\'315\' src=\'www.youtube.com/embed/\' frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-25 12:55:04', 'no', 'yes', 0, ''),
(46, 'dang <br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/tG20xxWt4nU\' frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe><br>', 'gabor_sebestyen_1', 'none', '2021-02-25 14:11:24', 'no', 'no', 0, ''),
(47, 'heyo', 'frank_test', 'none', '2021-02-25 14:12:16', 'no', 'no', 0, ''),
(48, 'ds', 'gabor_sebestyen_1', 'none', '2021-03-11 17:30:32', 'no', 'no', 0, ''),
(49, 'ds', 'gabor_sebestyen_1', 'none', '2021-03-11 17:36:22', 'no', 'no', 0, 'assets/images/posts/gabor_sebestyen_1604a55165b895Capture1.png'),
(50, 'hrey', 'gabor_sebestyen_1', 'none', '2021-03-11 17:54:18', 'no', 'no', 1, 'assets/images/posts/gabor_sebestyen_1604a594acae54Capture1.png'),
(51, 'kjhkjh', 'gabor_sebestyen_1', 'none', '2021-03-24 17:34:50', 'no', 'yes', 0, ''),
(52, 'kjhkjh', 'gabor_sebestyen_1', 'none', '2021-03-24 17:35:02', 'no', 'no', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Wanna', 1),
('Party', 1),
('Yeah', 1),
('Dang', 1),
('1', 1),
('Cxz', 1),
('Asd', 1),
('Watchv', 1),
('Heyo', 1),
('Ds', 2),
('Hrey', 1),
('Kjhkjh', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'Gabor', 'Sebestyen', 'gabor_sebestyen', 'gseb@gmail.com', 'fdfddfdfdfdf', '2021-01-21', 'assets/images/profile_pics/defaults/head_alizarin.png', 1, 1, 'no', ',gab_sebestyen,'),
(2, 'Gab', 'Sebestyen', 'gab_sebestyen', 'Gabseb@gmail.com', 'dc647eb65e6711e155375218212b3964', '2021-01-27', 'assets/images/profile_pics/defaults/head_alizarin.png', 0, 0, 'no', ','),
(3, 'Mickey', 'Mouse', 'mickey_mouse', 'Mickeymouse@gmail.com', 'd04c3ce567c9025db783cccd2f8957f3', '2021-01-27', 'assets/images/profile_pics/defaults/head_belize_hole.png', 0, 0, 'no', ','),
(4, 'Goofy', 'Guy', 'goofy_guy', 'Goofyguy@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2021-01-27', 'assets/images/profile_pics/defaults/head_red.png', 0, 0, 'no', ','),
(5, 'Test', 'Test', 'test_test', 'Testtest@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '2021-01-27', 'assets/images/profile_pics/defaults/head_red.png', 0, 0, 'yes', ','),
(6, 'Gabor', 'Sebestyen', 'gabor_sebestyen_1', 'Gsebestyen90@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-01-27', 'assets/images/profile_pics/gabor_sebestyen_1df911b7391eb8caf582e8ce3007ed45an.jpeg', 43, 20, 'no', ',daniel_sebestyen,andrea_sebestyen,levy_test,frank_test,james_test,'),
(7, 'Daniel', 'Sebestyen', 'daniel_sebestyen', 'Daniel@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-01-28', 'assets/images/profile_pics/daniel_sebestyen7df3e3993ae26dfae38bb9fdc294e977n.jpeg', 4, 3, 'no', ',gabor_sebestyen_1,andrea_sebestyen,'),
(8, 'Andrea', 'Sebestyen', 'andrea_sebestyen', 'Andrea@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-01-28', 'assets/images/profile_pics/defaults/head_emerald.png', 3, 3, 'no', ',daniel_sebestyen,gabor_sebestyen_1,'),
(9, 'Gabor2', 'Sebestyen2', 'gabor2_sebestyen2', 'Gseb2@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-01', 'assets/images/profile_pics/defaults/head_sun_flower.png', 0, 0, 'no', ','),
(10, 'Tim', 'Test', 'tim_test', 'Timtest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_pumpkin.png', 0, 0, 'yes', ','),
(11, 'Bob', 'Test', 'bob_test', 'Bobtest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_green_sea.png', 0, 0, 'no', ','),
(12, 'Sarah', 'Test', 'sarah_test', 'Sarahtest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_amethyst.png', 0, 0, 'no', ','),
(13, 'Jane', 'Test', 'jane_test', 'Janetest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_red.png', 0, 0, 'no', ','),
(14, 'Frank', 'Test', 'frank_test', 'Franktest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_belize_hole.png', 1, 0, 'no', ',gabor_sebestyen_1,'),
(15, 'James', 'Test', 'james_test', 'Jamestest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_pete_river.png', 0, 0, 'no', ',gabor_sebestyen_1,'),
(16, 'Levy', 'Test', 'levy_test', 'Levytest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-17', 'assets/images/profile_pics/defaults/head_sun_flower.png', 0, 0, 'no', ',gabor_sebestyen_1,'),
(17, 'Last', 'Test', 'last_test', 'Lasttest@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-04-01', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ',');

-- --------------------------------------------------------

--
-- Table structure for table `vr_room`
--

CREATE TABLE `vr_room` (
  `id` int(11) NOT NULL,
  `room_model` varchar(100) NOT NULL,
  `corner_model` varchar(100) NOT NULL,
  `corner2_model` varchar(100) NOT NULL,
  `skybox` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_closed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vr_room`
--

INSERT INTO `vr_room` (`id`, `room_model`, `corner_model`, `corner2_model`, `skybox`, `username`, `user_closed`) VALUES
(1, 'assets/models/Livingroomdone/Livingroomgood.glb', 'assets/models/Livingroom_assets/Livingroomlamp.gltf', 'assets/models/Livingroom_assets/Livingroomplant.gltf', 'assets/images/vr/skybox.png', 'last_test', 'no'),
(2, 'assets/models/Livingroomdone/Livingroomgood.glb', 'assets/models/Livingroom_assets/Livingroomlamp.gltf', 'assets/models/Livingroom_assets/Livingroomplant.gltf', 'assets/images/vr/skybox.png', 'gabor_sebestyen_1', 'no'),
(3, 'assets/models/Livingroomdone/Livingroomgood.glb', 'assets/models/Livingroom_assets/Livingroomlamp.gltf', 'assets/models/Livingroom_assets/Livingroomplant.gltf', 'assets/images/vr/skybox.png', 'daniel_sebestyen', 'no'),
(4, 'assets/models/Livingroomdone/Livingroomgood.glb', 'assets/models/Livingroom_assets/Livingroomlamp.gltf', 'assets/models/Livingroom_assets/Livingroomplant.gltf', 'assets/images/vr/skybox.png', 'andrea_sebestyen', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vr_room`
--
ALTER TABLE `vr_room`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vr_room`
--
ALTER TABLE `vr_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

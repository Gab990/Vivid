-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2021 at 05:22 PM
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
(15, '123', 'gabor_sebestyen_1', 'gabor_sebestyen_1', '2021-02-10 19:55:54', 'no', 23);

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
(4, 'gabor_sebestyen', 'daniel_sebestyen');

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
(39, 'gabor_sebestyen_1', 21);

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
(1, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey Dani!', '2021-02-10 13:41:38', 'yes', 'no', 'no'),
(2, 'daniel_sebestyen', 'gabor_sebestyen_1', '123', '2021-02-10 13:41:49', 'yes', 'no', 'no'),
(3, 'daniel_sebestyen', 'gabor_sebestyen_1', '3332', '2021-02-10 13:41:51', 'yes', 'no', 'no'),
(4, 'daniel_sebestyen', 'gabor_sebestyen_1', 'dssdsdds', '2021-02-10 13:41:52', 'yes', 'no', 'no'),
(5, 'daniel_sebestyen', 'gabor_sebestyen_1', 'asfafafsfa', '2021-02-10 13:41:55', 'yes', 'no', 'no'),
(6, 'andrea_sebestyen', 'gabor_sebestyen_1', 'dsddssdd', '2021-02-10 13:42:06', 'no', 'no', 'no'),
(7, 'andrea_sebestyen', 'gabor_sebestyen_1', 'dsdsdsd', '2021-02-10 13:42:07', 'no', 'no', 'no'),
(8, 'gabor_sebestyen_1', 'daniel_sebestyen', 'sdssddsd', '2021-02-10 13:42:28', 'yes', 'no', 'no'),
(9, 'gabor_sebestyen_1', 'daniel_sebestyen', 'sdsdsdsd', '2021-02-10 13:42:29', 'yes', 'no', 'no'),
(10, 'gabor_sebestyen_1', 'daniel_sebestyen', 'sdsdsdds', '2021-02-10 13:42:31', 'yes', 'no', 'no'),
(11, 'daniel_sebestyen', 'gabor_sebestyen_1', 'sdsdsaads', '2021-02-10 13:42:56', 'yes', 'no', 'no'),
(12, 'daniel_sebestyen', 'gabor_sebestyen_1', '555443', '2021-02-10 13:42:59', 'yes', 'no', 'no'),
(13, 'daniel_sebestyen', 'gabor_sebestyen_1', 'gdsadfa43sd', '2021-02-10 13:43:02', 'yes', 'no', 'no'),
(14, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey', '2021-02-10 13:57:28', 'yes', 'no', 'no'),
(15, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hey', '2021-02-10 13:57:53', 'yes', 'no', 'no'),
(16, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Message!!!!', '2021-02-10 14:05:10', 'yes', 'no', 'no'),
(17, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Message!!!!', '2021-02-10 14:09:57', 'yes', 'no', 'no'),
(18, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:10:06', 'yes', 'no', 'no'),
(19, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:12:29', 'yes', 'no', 'no'),
(20, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:12:50', 'yes', 'no', 'no'),
(21, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Wassup!?!?\r\n', '2021-02-10 14:13:33', 'yes', 'no', 'no'),
(22, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hello', '2021-02-10 19:00:27', 'yes', 'no', 'no'),
(23, 'daniel_sebestyen', 'gabor_sebestyen_1', 'Hi', '2021-02-10 19:00:39', 'yes', 'no', 'no'),
(24, 'gabor_sebestyen_1', 'daniel_sebestyen', 'henlo', '2021-02-10 19:01:04', 'yes', 'no', 'no'),
(25, 'daniel_sebestyen', 'gabor_sebestyen_1', 'hey', '2021-02-10 19:56:20', 'yes', 'no', 'no'),
(26, 'gabor_sebestyen_1', 'daniel_sebestyen', 'hello', '2021-02-10 19:56:37', 'no', 'no', 'no');

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
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(1, 'This is the first post', 'gabor_sebestyen_1', 'none', '2021-01-27 18:11:13', 'no', 'no', 0),
(2, 'Hello', 'gabor_sebestyen_1', 'none', '2021-01-27 18:16:04', 'no', 'yes', 0),
(3, 'Hello', 'gabor_sebestyen_1', 'none', '2021-01-27 18:16:26', 'no', 'no', 0),
(4, 'How is it going?\n\nThis is a post too', 'gabor_sebestyen_1', 'none', '2021-01-27 18:17:33', 'no', 'no', 0),
(5, 'This is another post', 'gabor_sebestyen_1', 'none', '2021-01-28 11:16:26', 'no', 'no', 0),
(6, 'This post tests<br />\nline-breaks<br />\nlet\'s see if it works', 'gabor_sebestyen_1', 'none', '2021-01-28 11:16:46', 'no', 'no', 0),
(7, 'This is a post from another account', 'daniel_sebestyen', 'none', '2021-01-28 11:19:49', 'no', 'no', 0),
(8, 'This is a test post', 'daniel_sebestyen', 'none', '2021-01-28 11:35:52', 'no', 'no', 0),
(9, 'Why is the weather so bad today?', 'daniel_sebestyen', 'none', '2021-01-28 11:36:02', 'no', 'no', 0),
(10, 'I\'m bored', 'daniel_sebestyen', 'none', '2021-01-28 11:36:07', 'no', 'no', 1),
(11, 'I\'m bored too', 'gabor_sebestyen_1', 'none', '2021-01-28 11:37:00', 'no', 'no', 1),
(12, 'Check this out: https://www.youtube.com/watch?v=evCtzMqNJiU', 'gabor_sebestyen_1', 'none', '2021-01-28 11:37:18', 'no', 'no', 2),
(13, 'Testing how the infinite-loading feature works', 'gabor_sebestyen_1', 'none', '2021-01-28 11:56:58', 'no', 'no', 2),
(14, 'Hello world!', 'andrea_sebestyen', 'none', '2021-01-28 13:15:06', 'no', 'no', 1),
(15, 'How is it going?', 'andrea_sebestyen', 'none', '2021-01-28 13:15:11', 'no', 'no', 1),
(16, 'Another post', 'gabor_sebestyen_1', 'none', '2021-01-28 19:00:39', 'no', 'no', 2),
(17, 'Hello everyone', 'gabor_sebestyen_1', 'none', '2021-01-28 20:08:02', 'no', 'no', 1),
(18, 'Hey, I just beat: daniel_sebestyen', 'gabor_sebestyen_1', 'none', '2021-01-29 15:47:38', 'no', 'no', 0),
(19, 'new post', 'gabor_sebestyen_1', 'none', '2021-01-31 15:06:33', 'no', 'no', 1),
(20, 'me', 'gabor_sebestyen_1', 'none', '2021-02-08 19:41:11', 'no', 'no', 0),
(21, 'hey', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-08 19:41:27', 'no', 'no', 1),
(22, 'y', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-08 20:54:35', 'no', 'yes', 0),
(23, '123', 'gabor_sebestyen_1', 'none', '2021-02-10 19:55:49', 'no', 'no', 0),
(24, '1223', 'gabor_sebestyen_1', 'daniel_sebestyen', '2021-02-10 19:56:05', 'no', 'no', 0);

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
(5, 'Test', 'Test', 'test_test', 'Testtest@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '2021-01-27', 'assets/images/profile_pics/defaults/head_red.png', 0, 0, 'no', ','),
(6, 'Gabor', 'Sebestyen', 'gabor_sebestyen_1', 'Gsebestyen90@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-01-27', 'assets/images/profile_pics/gabor_sebestyen_1f439eb16e63f8736144f06d094321600n.jpeg', 18, 8, 'no', ',daniel_sebestyen,andrea_sebestyen,'),
(7, 'Daniel', 'Sebestyen', 'daniel_sebestyen', 'Daniel@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-01-28', 'assets/images/profile_pics/daniel_sebestyen7df3e3993ae26dfae38bb9fdc294e977n.jpeg', 4, 2, 'no', ',gabor_sebestyen_1,andrea_sebestyen,'),
(8, 'Andrea', 'Sebestyen', 'andrea_sebestyen', 'Andrea@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-01-28', 'assets/images/profile_pics/defaults/head_emerald.png', 2, 2, 'no', ',daniel_sebestyen,gabor_sebestyen_1,'),
(9, 'Gabor2', 'Sebestyen2', 'gabor2_sebestyen2', 'Gseb2@gmail.com', '2c9341ca4cf3d87b9e4eb905d6a3ec45', '2021-02-01', 'assets/images/profile_pics/defaults/head_sun_flower.png', 0, 0, 'no', ',');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

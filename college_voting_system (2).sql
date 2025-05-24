-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 03:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college_voting_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$RZI44QOJe/n0vB9fN6alVOu8f3VWSQVzIWvnLlnGXC8hz6aGHpQbW'),
(2, 'admin1', 'pass123');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `voting_type` varchar(100) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `voting_type`, `last_updated`) VALUES
(15, 'Vivek ', 'Class Representative Voting', '2025-03-03 03:16:46'),
(26, 'Vishal Korde', 'Class Representative Voting', '2025-02-13 06:57:38'),
(27, 'Ritesh Mokle', 'Class Representative Voting', '2025-03-03 03:18:57'),
(28, 'Traditional Day YES', 'College Event Voting', '2025-03-03 03:19:19'),
(29, 'Traditional Day NO', 'College Event Voting', '2025-03-03 03:19:43'),
(30, 'Rudrax', 'Class Representative Voting', '2025-03-03 03:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `feedback`, `rating`, `created_at`) VALUES
(1, 1, 'Niceee', 5, '2025-02-01 18:41:22'),
(2, 16, 'Vivek you well project', 5, '2025-02-04 05:26:15'),
(3, 1, 'vvv', 3, '2025-02-09 18:13:27'),
(4, 1, 'llll', 5, '2025-02-09 18:23:40'),
(5, 1, 'Nice', 4, '2025-02-10 13:52:18'),
(6, 1, 'Well Project', 5, '2025-02-12 15:12:01'),
(7, 4, 'niceee', 5, '2025-02-13 05:42:13'),
(8, 34, 'Well done vivek', 5, '2025-02-13 05:50:03'),
(9, 35, 'WELL PROJECT', 5, '2025-02-13 06:47:33'),
(10, 37, 'Very NIcee', 5, '2025-03-03 03:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `user_id`, `username`, `login_time`, `ip_address`) VALUES
(2, 2, 'Vivek Vilas Pandit', '2025-01-21 17:02:47', '::1'),
(3, 3, 'Ritesh Mokle', '2025-01-21 17:04:08', '::1'),
(4, 1, 'Vivek Pandit', '2025-01-21 17:06:12', '::1'),
(5, 1, 'Vivek Pandit', '2025-01-21 17:10:22', '::1'),
(6, 1, 'Vivek Pandit', '2025-01-21 17:42:00', '::1'),
(7, 1, 'Vivek Pandit', '2025-01-21 17:57:50', '::1'),
(8, 4, 'Ritesh Mokle', '2025-01-22 07:57:28', '::1'),
(9, 5, 'kapil sir', '2025-01-22 08:02:25', '::1'),
(10, 1, 'Vivek Pandit', '2025-01-22 17:10:05', '::1'),
(11, 1, 'Vivek Pandit', '2025-01-22 17:26:23', '::1'),
(12, 1, 'Vivek Pandit', '2025-01-22 17:48:05', '::1'),
(13, 6, 'nana bhau', '2025-01-22 17:50:36', '::1'),
(14, 7, 'rushi', '2025-01-22 17:59:38', '::1'),
(15, 7, 'rushi', '2025-01-22 19:07:13', '::1'),
(16, 1, 'Vivek Pandit', '2025-01-23 14:37:24', '::1'),
(17, 1, 'Vivek Pandit', '2025-01-23 16:35:39', '::1'),
(18, 8, 'shubham thakre', '2025-01-23 17:48:48', '::1'),
(19, 1, 'Vivek Pandit', '2025-01-24 16:10:43', '::1'),
(20, 9, 'jeevan sapkal', '2025-01-24 16:21:51', '::1'),
(21, 1, 'Vivek Pandit', '2025-01-24 17:49:19', '::1'),
(22, 1, 'Vivek Pandit', '2025-01-25 17:41:37', '::1'),
(23, 1, 'Vivek Pandit', '2025-01-25 19:06:24', '::1'),
(24, 10, 'vipul dada', '2025-01-25 19:46:30', '::1'),
(25, 1, 'Vivek Pandit', '2025-01-26 06:37:22', '::1'),
(26, 1, 'Vivek Pandit', '2025-01-26 06:53:41', '::1'),
(27, 1, 'Vivek Pandit', '2025-01-26 07:05:30', '::1'),
(28, 1, 'Vivek Pandit', '2025-01-26 07:14:03', '::1'),
(29, 1, 'Vivek Pandit', '2025-01-26 07:35:08', '::1'),
(30, 11, 'jivan sapkal', '2025-01-26 08:27:44', '::1'),
(31, 12, 'tushar shirode', '2025-01-26 08:28:50', '::1'),
(32, 1, 'Vivek Pandit', '2025-01-26 08:33:12', '::1'),
(33, 14, 'shubham thakre', '2025-01-26 09:11:11', '::1'),
(34, 1, 'Vivek Pandit', '2025-01-27 16:09:36', '::1'),
(35, 1, 'Vivek Pandit', '2025-01-27 16:13:16', '::1'),
(36, 1, 'Vivek Pandit', '2025-01-27 16:37:25', '::1'),
(37, 1, 'Vivek Pandit', '2025-01-27 17:42:35', '::1'),
(38, 1, 'Vivek Pandit', '2025-01-27 17:57:58', '::1'),
(39, 1, 'Vivek Pandit', '2025-01-27 18:03:04', '::1'),
(40, 15, 'lala singh', '2025-01-27 18:12:02', '::1'),
(41, 16, 'vishal bhau korde', '2025-01-28 06:12:54', '::1'),
(42, 1, 'Vivek Pandit', '2025-01-28 06:24:56', '::1'),
(43, 18, 'prachi waghmare', '2025-01-28 06:50:32', '::1'),
(44, 19, 'rutuja magar', '2025-01-28 07:21:21', '::1'),
(45, 20, 'minal darekar', '2025-01-28 07:45:22', '::1'),
(46, 20, 'minal darekar', '2025-01-28 07:49:23', '::1'),
(47, 1, 'Vivek Pandit', '2025-01-28 10:47:39', '::1'),
(48, 6, 'nana bhau', '2025-01-28 10:50:00', '::1'),
(49, 1, 'Vivek Pandit', '2025-01-28 10:52:02', '::1'),
(50, 1, 'Vivek Pandit', '2025-01-28 10:53:03', '::1'),
(51, 1, 'Vivek Pandit', '2025-01-28 10:56:35', '::1'),
(52, 1, 'Vivek Pandit', '2025-01-28 11:00:34', '::1'),
(53, 21, 'Ramu bhau', '2025-01-28 11:05:00', '::1'),
(54, 1, 'Vivek Pandit', '2025-01-28 11:18:42', '::1'),
(55, 22, 'rutik kolge', '2025-01-29 03:35:16', '::1'),
(56, 1, 'Vivek Pandit', '2025-01-29 03:40:18', '::1'),
(57, 23, 'Ritesh Mokle', '2025-01-29 03:56:06', '::1'),
(58, 24, 'Rajashri Maam', '2025-01-29 07:55:28', '::1'),
(59, 1, 'Vivek Pandit', '2025-01-29 14:25:49', '::1'),
(60, 1, 'Vivek Pandit', '2025-01-30 16:56:08', '::1'),
(61, 26, 'Vivek Pandit Bhau', '2025-01-30 17:04:54', '::1'),
(62, 1, 'Vivek Pandit', '2025-01-30 17:22:48', '::1'),
(63, 28, 'Ritesh Mokle', '2025-01-30 18:04:53', '::1'),
(64, 1, 'Vivek Pandit', '2025-01-30 19:23:39', '::1'),
(65, 29, 'jeva sapkal', '2025-02-01 14:34:29', '::1'),
(66, 1, 'Vivek Pandit', '2025-02-01 14:48:56', '::1'),
(67, 1, 'Vivek Pandit', '2025-02-01 14:50:18', '::1'),
(68, 1, 'Vivek Pandit', '2025-02-01 14:58:57', '::1'),
(69, 1, 'Vivek Pandit', '2025-02-01 15:07:01', '::1'),
(70, 1, 'Vivek Pandit', '2025-02-01 15:09:16', '::1'),
(71, 1, 'Vivek Pandit', '2025-02-01 15:12:05', '::1'),
(72, 1, 'Vivek Pandit', '2025-02-01 15:19:53', '::1'),
(73, 1, 'Vivek Pandit', '2025-02-01 15:24:07', '::1'),
(74, 30, 'Kunal Devkar', '2025-02-01 15:26:27', '::1'),
(75, 1, 'Vivek Pandit', '2025-02-01 17:44:43', '::1'),
(76, 1, 'Vivek Pandit', '2025-02-01 17:59:08', '::1'),
(77, 31, 'omkar mukalvar', '2025-02-01 18:03:09', '::1'),
(78, 1, 'Vivek Pandit', '2025-02-01 18:49:57', '::1'),
(79, 1, 'Vivek Pandit', '2025-02-01 19:00:10', '::1'),
(80, 31, 'omkar mukalvar', '2025-02-01 19:01:06', '::1'),
(81, 32, 'teja dhole', '2025-02-01 19:04:58', '::1'),
(82, 1, 'Vivek Pandit', '2025-02-01 19:41:01', '::1'),
(83, 1, 'Vivek Pandit', '2025-02-01 20:26:08', '::1'),
(84, 1, 'Vivek Pandit', '2025-02-02 06:24:45', '::1'),
(85, 1, 'Vivek Pandit', '2025-02-02 06:50:44', '::1'),
(86, 1, 'Vivek Pandit', '2025-02-02 06:52:49', '::1'),
(87, 1, 'Vivek Pandit', '2025-02-02 17:26:57', '::1'),
(88, 1, 'Vivek Pandit', '2025-02-02 17:58:32', '::1'),
(89, 1, 'Vivek Pandit', '2025-02-03 18:54:01', '::1'),
(90, 1, 'Vivek Pandit', '2025-02-03 18:55:16', '::1'),
(91, 1, 'Vivek Pandit', '2025-02-03 19:29:36', '::1'),
(92, 1, 'Vivek Pandit', '2025-02-04 06:18:28', '::1'),
(93, 16, 'vishal bhau korde', '2025-02-04 06:24:32', '::1'),
(94, 16, 'vishal bhau korde', '2025-02-04 06:25:38', '::1'),
(95, 1, 'Vivek Pandit', '2025-02-04 08:06:47', '::1'),
(96, 1, 'Vivek Pandit', '2025-02-04 08:29:10', '::1'),
(97, 1, 'Vivek Pandit', '2025-02-09 15:46:07', '::1'),
(98, 1, 'Vivek Pandit', '2025-02-09 18:31:14', '::1'),
(99, 1, 'Vivek Pandit', '2025-02-09 18:47:27', '::1'),
(100, 1, 'Vivek Pandit', '2025-02-09 19:05:57', '::1'),
(101, 1, 'Vivek Pandit', '2025-02-10 14:46:31', '::1'),
(103, 1, 'Vivek Pandit', '2025-02-10 14:51:38', '::1'),
(104, 1, 'Vivek Pandit', '2025-02-12 16:03:03', '::1'),
(105, 1, 'Vivek Pandit', '2025-02-12 16:08:19', '::1'),
(106, 1, 'Vivek Pandit', '2025-02-12 16:11:15', '::1'),
(107, 1, 'Vivek Pandit', '2025-02-12 16:50:19', '::1'),
(108, 4, 'Ritesh Mokle', '2025-02-13 06:41:19', '::1'),
(109, 34, 'Pallavi Maam', '2025-02-13 06:48:25', '::1'),
(110, 34, 'Pallavi Maam', '2025-02-13 06:53:27', '::1'),
(111, 35, 'Vaishnavi More', '2025-02-13 07:46:32', '::1'),
(112, 4, 'Ritesh Mokle', '2025-02-13 07:56:20', '::1'),
(113, 34, 'Pallavi Maam', '2025-02-13 07:58:29', '::1'),
(114, 16, 'vishal bhau korde', '2025-02-13 07:59:41', '::1'),
(115, 4, 'Ritesh Mokle', '2025-02-13 08:00:42', '::1'),
(116, 1, 'Vivek Pandit', '2025-02-13 08:01:22', '::1'),
(117, 4, 'Ritesh Mokle', '2025-02-13 08:01:57', '::1'),
(118, 35, 'Vaishnavi More', '2025-02-13 08:03:30', '::1'),
(119, 36, 'Kuns Deva', '2025-02-23 09:19:23', '::1'),
(120, 1, 'Vivek Pandit', '2025-02-23 09:24:58', '::1'),
(121, 1, 'Vivek Pandit', '2025-02-23 09:39:43', '::1'),
(122, 1, 'Vivek Pandit', '2025-02-23 09:45:28', '::1'),
(123, 1, 'Vivek Pandit', '2025-03-02 16:06:36', '::1'),
(124, 1, 'Vivek Pandit', '2025-03-02 16:06:36', '::1'),
(125, 1, 'Vivek Pandit', '2025-03-02 16:06:36', '::1'),
(126, 1, 'Vivek Pandit', '2025-03-02 16:06:37', '::1'),
(127, 37, 'Tejaswini Maam', '2025-03-03 04:08:45', '::1'),
(128, 37, 'Tejaswini Maam', '2025-03-03 04:12:01', '::1'),
(129, 1, 'Vivek Pandit', '2025-03-03 04:17:30', '::1'),
(130, 1, 'Vivek Pandit', '2025-03-03 04:20:05', '::1'),
(131, 1, 'Vivek Pandit', '2025-03-03 04:31:20', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prn` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `prn`, `password`) VALUES
(1, 'Vivek Pandit', '2223000116', '$2y$10$18IFMCDDtQL9SywpgoSP7.fOgLrJfhxidGJOTGJaN5W.GAawEQawq'),
(2, 'Vivek Vilas Pandit', '2323000115', '$2y$10$x9Z40sRlq0aupfB7V7.fRuDwt5S/h23ljGv0ncTCKKLkDW5NkiMTq'),
(3, 'Ritesh Mokle', '34555564666', '$2y$10$OxEt.IjND2sCEJVKEGv29.uGxqYGCwkukbtOzaKmapimKdG1fk/R6'),
(4, 'Ritesh Mokle', '2223000331', '$2y$10$AK9X7mslZ2/EAKpbnChrdelmIhXCHZKXzAXPivYaO0/ITzSuZ/49G'),
(5, 'kapil sir', '2223011123', '$2y$10$xtVcdSAJFoBSK2lLOwM3FOFfPo6YXqK/FruMcnfMzCfQ5LvtVoslC'),
(6, 'nana bhau', '8390442495', '$2y$10$Pf43dDi9oVuWJhtiJJzX5etoA8RW2zduq/QqqbZq09KJnzm.zimEa'),
(7, 'rushi', '1234512345', '$2y$10$LcXUadIVlp2o5/hCLojkkeeh3IsVfBVkU70UZcFlFUS6TK1q6MYoi'),
(8, 'shubham thakre', '2223001019', '$2y$10$rLHwj27oMdAkqZZbVtDxxOhl.9uTyJwVtDoblIHw0dJkFI6ibesWq'),
(9, 'jeevan sapkal', '1920192019', '$2y$10$JMkxc/hCiufx79LdmaY5De.7CeKnXL2IySZe0gJDX7Z51vzFlc8o.'),
(10, 'vipul dada', '8080808080', '$2y$10$RGPYzYMzgU2AGWIYBAWBTebOGktnaIjDtuAukNsTfRAwJz9JAX4HS'),
(11, 'jivan sapkal', '9021690712', '$2y$10$s4UYsf59xQU3XqJjffsBK.EF6hESYXvQDk5dYxpigWqp19nBBnD3i'),
(12, 'tushar shirode', '9168333458', '$2y$10$S72vE2ZFtVXKYVZenmqg8uNT8CexrcTNQoWE2OU8zWVOtf4QQZ9tS'),
(14, 'shubham thakre', '2223001018', '$2y$10$NHBmh7LZ6jPmxpvpFSI0..GcqoitIB0M1l7YMbNfECfPB4Zm0fVsy'),
(15, 'lala singh', '1111222212', '$2y$10$mN/gezhH2KfFu5Tev5MnW.UGaAjr5P3gPuPYQIsoXDjnnVgH9SLC2'),
(16, 'vishal bhau korde', '2223006539', '$2y$10$YYBHENOr.bhCpJvibMAcK.vJEebWK2Aqzy0ne2uyHyvzgRUOVVyta'),
(18, 'prachi waghmare', '2223222322', '$2y$10$m3rWaETIQ.ZXaFKiEdhJq.G/bMQT5oYXaURM7F1InqT6v8tHUnJQq'),
(19, 'rutuja magar', '2223000978', '$2y$10$ysmOW0wdaYYmCZLyFKVxbudMJANc/zEEWeQFeCW0qqbpY27iyvZpu'),
(20, 'minal darekar', '9011901190', '$2y$10$2bfkAEVvqHimSzEzh7us3eZ02C.p7u17wkVdkfxOEv/gE70sUsHDe'),
(21, 'Ramu bhau', '1122334455', '$2y$10$q6VpzZBeVFKUBXuQMEqoA.oPelgXHXEDfDP.t7XHliF06GY0xBaFW'),
(22, 'rutik kolge', '2223006644', '$2y$10$MKUTPYAuWgOGLzVar6lM8.1Bkktjq2J2BzwyfJr6Q9Cr.UN2Cmci6'),
(23, 'Ritesh Mokle', '2223000332', '$2y$10$P3i8BbtSp2Bk.FbEETIpHeZbVNHXYQ5NEOnVXDypz2MPXcoQIgsYe'),
(24, 'Rajashri Maam', '0000000000', '$2y$10$FRSzdbFmCh7VrDH3a5VBmegWylxno45VCel2vO8Hbtp7nDYLW97B6'),
(26, 'Vivek Pandit Bhau', '2223000118', '$2y$10$hSsOhrcggiey7T1RdleAlO2KvqB2UCZbprYtxtm2RaGdcSXGCYjna'),
(27, 'Vivek Pandaaaaa', '1212121212', '$2y$10$l2A2DaQh86zTQ0duc3BmkuDHRFidcYsLJFHbxafpUEtS4Pp.kY3hq'),
(28, 'Ritesh Mokle', '0000000001', '$2y$10$jz9RChxXWVk6ax8j.2NDbu3XTgQuloKCTpEvP1pvsBvUwswVYg5qa'),
(29, 'jeva sapkal', '1122112211', '$2y$10$9waO3VcVR0HIm2lCDk4nRubbdXQnei.9myIxympv21YonWvtZ9zHy'),
(30, 'Kunal Devkar', '8669083744', '$2y$10$y5MxfWxHaKrc9yIF75Yede4yDOthsZMi4Ge/y6ahJ419iNra0CzGm'),
(31, 'omkar mukalvar', '8668421314', '$2y$10$HO9vLdJzfL5X3Zyc5qkc4uhAdsxDO5g4zyuSkagPKkpU0J2TL8ZQe'),
(32, 'teja dhole', '7875270084', '$2y$10$PuwM1uJrM1h1CvgwPA3QsOprcXG3BRuEUgUZwsFc/yYsXs7jUknvC'),
(34, 'Pallavi Maam', '7767862240', '$2y$10$AhXsjgfVrsUNY7O22Nvobu2dYWFsUBHKIrCbmjnT48.WtukqxmaWq'),
(35, 'Vaishnavi More', '8983106610', '$2y$10$gmNSw5Rnc3JMU0.JTjXal.PG/BWG9/ipLVrOJKzfXkn4BGguneaYe'),
(36, 'Kuns Deva', '2223000697', '$2y$10$8vdfVBISr0eeF.0kPcvxneoISGWpSn0acZqPONsukbg.HwPeDKCKG'),
(37, 'Tejaswini Maam', '8779327492', '$2y$10$RTRwTKC0SPuIJa6vgWYEuujlv1ZMoVmbcq8cGYs/BRQYe76r4LP3m');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `voting_type` varchar(100) NOT NULL,
  `vote_time` datetime DEFAULT current_timestamp(),
  `last_voted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `candidate_id`, `voting_type`, `vote_time`, `last_voted_at`) VALUES
(1, 1, 15, '', '2025-01-21 22:37:27', '2025-03-03 03:31:55'),
(2, 4, 26, '', '2025-01-22 12:28:15', '2025-02-13 07:00:54'),
(3, 5, 3, '', '2025-01-22 12:33:05', '2025-02-01 16:57:09'),
(4, 6, 10, '', '2025-01-22 22:20:45', '2025-02-01 16:57:09'),
(5, 7, 11, '', '2025-01-22 22:29:49', '2025-02-01 16:57:09'),
(6, 8, 10, '', '2025-01-23 22:19:21', '2025-02-01 16:57:09'),
(7, 9, 13, '', '2025-01-24 20:51:59', '2025-02-01 16:57:09'),
(8, 10, 14, '', '2025-01-26 00:16:50', '2025-02-01 16:57:09'),
(9, 11, 15, '', '2025-01-26 12:57:57', '2025-02-01 16:57:09'),
(10, 12, 17, '', '2025-01-26 12:58:57', '2025-02-01 16:57:09'),
(11, 14, 15, '', '2025-01-26 13:41:22', '2025-02-01 16:57:09'),
(12, 15, 17, '', '2025-01-27 22:42:12', '2025-02-01 16:57:09'),
(13, 16, 26, '', '2025-01-28 10:43:18', '2025-02-13 07:00:01'),
(14, 18, 17, '', '2025-01-28 11:21:32', '2025-02-01 16:57:09'),
(15, 19, 18, '', '2025-01-28 11:51:57', '2025-02-01 16:57:09'),
(16, 20, 15, '', '2025-01-28 12:16:28', '2025-02-01 16:57:09'),
(17, 21, 18, '', '2025-01-28 15:35:33', '2025-02-01 16:57:09'),
(18, 22, 17, '', '2025-01-29 08:05:46', '2025-02-01 16:57:09'),
(19, 23, 18, '', '2025-01-29 08:26:40', '2025-02-01 16:57:09'),
(20, 24, 18, '', '2025-01-29 12:26:45', '2025-02-01 16:57:09'),
(21, 28, 15, '', '2025-01-30 22:36:08', '2025-02-01 16:57:09'),
(22, 29, 15, '', '2025-02-01 19:04:44', '2025-02-01 16:57:09'),
(23, 30, 15, '', '2025-02-01 19:57:03', '2025-02-01 16:57:09'),
(24, 31, 15, '', '2025-02-01 22:33:24', '2025-02-01 18:01:17'),
(25, 32, 15, '', '2025-02-01 23:35:11', '2025-02-01 18:05:11'),
(26, 33, 15, '', '2025-02-10 19:20:07', '2025-02-10 13:50:07'),
(27, 34, 26, '', '2025-02-13 11:19:08', '2025-02-13 06:58:40'),
(28, 35, 26, '', '2025-02-13 12:16:45', '2025-02-13 07:03:38'),
(29, 36, 15, '', '2025-02-23 13:49:40', '2025-02-23 08:19:40'),
(30, 37, 15, '', '2025-03-03 08:42:44', '2025-03-03 03:12:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prn` (`prn`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD CONSTRAINT `login_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

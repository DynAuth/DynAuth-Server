-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 11 月 22 日 16:57
-- 服务器版本: 5.5.8
-- PHP 版本: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `dyauth`
--

-- --------------------------------------------------------

--
-- 表的结构 `activity_info`
--

CREATE TABLE IF NOT EXISTS `activity_info` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_type` varchar(20) NOT NULL,
  `activity_name` text,
  `activity_content` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `activity_info`
--

INSERT INTO `activity_info` (`activity_id`, `user_id`, `app_type`, `activity_name`, `activity_content`, `time`) VALUES
(1, 1, 'chat', 'MSN', 'Jackson', '2013-10-17 15:27:42'),
(2, 1, 'location', 'location', 'At home', '2013-10-17 15:42:49'),
(3, 1, 'location', 'location', 'Lab', '2013-10-18 00:25:41'),
(4, 1, 'social network', 'Facebook', 'JhonHan', '2013-10-18 00:26:10'),
(5, 1, 'social network', 'Twitter', '7', '2013-10-18 00:25:00'),
(6, 1, 'social network', 'Facebook', 'Leo', '2013-10-17 15:30:20'),
(7, 1, 'music', 'QQ music', 'A place near by', '2013-10-18 00:25:52'),
(8, 1, 'music', 'QQ music', 'Jay Chou', '2013-10-17 15:32:52'),
(9, 1, 'vedio', 'Qvod', 'The batman ', '2013-10-17 15:35:07'),
(10, 1, 'vedio', 'Qvod', '120min', '2013-10-17 15:35:46'),
(11, 1, 'vedio', 'Qvod', 'The catlady', '2013-10-18 00:26:01'),
(12, 1, 'game', 'TempleRun', '111', '2013-10-17 23:32:37'),
(13, 1, 'game', 'Asphalt6', NULL, '2013-10-17 23:31:39'),
(30, 0, 'location', 'location check', 'Yangzhou', '2013-10-18 00:26:22'),
(31, 123, 'location', 'location check', '', '2013-10-24 22:37:00');

-- --------------------------------------------------------

--
-- 表的结构 `answer_info`
--

CREATE TABLE IF NOT EXISTS `answer_info` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `third_party_name` text NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_content` text NOT NULL,
  `correct_answer` text NOT NULL,
  `correctness` tinyint(4) NOT NULL,
  `login_flag` tinyint(1) NOT NULL,
  `login_key` varchar(25) NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=303 ;

--
-- 转存表中的数据 `answer_info`
--

INSERT INTO `answer_info` (`answer_id`, `time`, `third_party_name`, `question_id`, `user_id`, `answer_content`, `correct_answer`, `correctness`, `login_flag`, `login_key`) VALUES
(124, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(125, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(126, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(127, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(128, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(129, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(130, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(131, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(132, '0000-00-00 00:00:00', 'Amazon', 11, 1, 'Jhon', 'Jhon', 1, 0, ''),
(133, '0000-00-00 00:00:00', 'Amazon', 11, 1, 'Jhond', 'Jhon', 0, 0, ''),
(134, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(135, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(136, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(137, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(138, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(139, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(140, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(141, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(142, '0000-00-00 00:00:00', 'Amazon', 2, 1, 'Jackson', 'Jackson', 1, 0, ''),
(143, '0000-00-00 00:00:00', 'Amazon', 2, 1, 'Jacks', 'Jackson', 0, 0, ''),
(144, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(145, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(146, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(147, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(148, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(149, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(150, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(151, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(152, '0000-00-00 00:00:00', 'Amazon', 8, 1, '1', 'The batman ', 0, 0, ''),
(153, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(154, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(155, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(156, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(157, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(158, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(159, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(160, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(161, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(162, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(163, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(164, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(165, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(166, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(167, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(168, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(169, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(170, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(171, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(172, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(173, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(174, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(175, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(176, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(177, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(178, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(179, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(180, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(181, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(182, '0000-00-00 00:00:00', 'Amazon', 8, 1, '', 'The batman ', 0, 0, ''),
(183, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(184, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(185, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(186, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(187, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(188, '0000-00-00 00:00:00', 'Amazon', 2, 1, 'Jackson', 'Jackson', 1, 0, ''),
(189, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(190, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(191, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(192, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '6', 0, 0, ''),
(193, '0000-00-00 00:00:00', 'Amazon', 12, 1, '6', '6', 1, 0, ''),
(194, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(195, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(196, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(197, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(198, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(199, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(200, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120min', '120min', 1, 0, ''),
(201, '0000-00-00 00:00:00', 'Amazon', 9, 1, '120mi', '120min', 0, 0, ''),
(202, '0000-00-00 00:00:00', 'Amazon', 9, 1, '', '120min', 0, 0, ''),
(203, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Jhon', 0, 0, ''),
(204, '0000-00-00 00:00:00', 'Amazon', 2, 1, '', 'Jackson', 0, 0, ''),
(205, '0000-00-00 00:00:00', 'Amazon', 5, 1, '', 'A place near by', 0, 0, ''),
(206, '0000-00-00 00:00:00', 'Amazon', 11, 1, '', 'Leo', 0, 0, ''),
(207, '0000-00-00 00:00:00', 'Amazon', 5, 1, '', 'A place near by', 0, 0, ''),
(208, '0000-00-00 00:00:00', 'Amazon', 5, 1, '', 'A place near by', 0, 0, ''),
(209, '0000-00-00 00:00:00', 'Amazon', 5, 1, '', 'A place near by', 0, 0, ''),
(210, '0000-00-00 00:00:00', 'Amazon', 5, 1, '', 'A place near by', 0, 0, ''),
(211, '0000-00-00 00:00:00', 'Amazon', 5, 1, '', 'A place near by', 0, 0, ''),
(212, '0000-00-00 00:00:00', 'Amazon', 12, 1, '', '7', 0, 0, ''),
(213, '0000-00-00 00:00:00', '', 5, 1, '111', 'A place near by', 0, 0, ''),
(214, '0000-00-00 00:00:00', 'amazon.com', 11, 1, '123123', 'JhonHan', 0, 0, ''),
(215, '0000-00-00 00:00:00', 'amazon.com', 14, 1, 'hehe', '111', 0, 0, ''),
(216, '0000-00-00 00:00:00', 'amazon.com', 12, 1, '12', '7', 0, 0, ''),
(217, '0000-00-00 00:00:00', 'amazon.com', 12, 1, '12', '7', 0, 0, ''),
(218, '0000-00-00 00:00:00', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(219, '0000-00-00 00:00:00', 'amazon.com', 2, 1, 'Jackson', 'Jackson', 1, 0, ''),
(220, '2013-10-28 23:10:31', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(221, '2013-10-28 23:12:01', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(222, '2013-10-29 18:09:32', 'amazon.com', 12, 1, '11', '7', 0, 1, ''),
(223, '2013-10-29 18:09:29', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(224, '2013-10-29 18:24:09', 'amazon.com', 14, 1, '111', '111', 1, 1, ''),
(225, '2013-10-29 18:25:09', 'amazon.com', 2, 1, 'Jackson', 'Jackson', 1, 0, ''),
(226, '2013-10-29 18:38:53', 'amazon.com', 12, 1, '11', '7', 0, 1, ''),
(227, '2013-10-29 18:38:54', 'amazon.com', 12, 1, '7', '7', 1, 1, ''),
(228, '2013-10-29 18:38:55', 'amazon.com', 12, 1, '7', '7', 1, 1, ''),
(229, '2013-10-29 18:38:56', 'amazon.com', 12, 1, '7', '7', 1, 1, ''),
(230, '2013-10-29 18:40:34', 'amazon.com', 7, 1, '', 'Jay Chou', 0, 0, ''),
(231, '2013-10-29 18:40:50', 'amazon.com', 14, 1, '111', '111', 1, 1, ''),
(232, '2013-10-29 18:41:32', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(233, '2013-10-29 18:42:39', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(234, '2013-10-29 18:43:30', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(235, '2013-10-29 18:44:12', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(236, '2013-10-29 18:45:13', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(237, '2013-10-29 18:48:04', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(238, '2013-10-29 18:53:58', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(239, '2013-10-29 18:55:00', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(240, '2013-10-29 19:01:45', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(241, '2013-10-29 19:01:46', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(242, '2013-10-29 19:01:52', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(243, '2013-10-29 19:04:11', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(244, '2013-10-29 19:04:44', 'amazon.com', 7, 1, '', 'Jay Chou', 0, 0, ''),
(245, '2013-10-29 19:04:48', 'amazon.com', 10, 1, '', 'The catlady', 0, 0, ''),
(246, '2013-10-29 19:04:53', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(247, '2013-10-29 19:06:27', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(248, '2013-10-29 19:07:05', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(249, '2013-10-29 19:07:06', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(250, '2013-10-29 19:07:07', 'amazon.com', 12, 1, '7', '7', 1, 0, ''),
(251, '2013-10-29 19:08:08', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(252, '2013-10-29 19:09:46', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(253, '2013-10-29 19:11:09', 'amazon.com', 11, 1, '', 'JhonHan', 0, 0, ''),
(254, '2013-10-29 19:11:21', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(255, '2013-10-29 19:12:12', 'amazon.com', 5, 1, '', 'A place near by', 0, 0, ''),
(256, '2013-10-29 19:12:17', 'amazon.com', 14, 1, '111', '111', 1, 0, ''),
(257, '2013-10-29 19:13:29', 'amazon.com', 14, 1, '111', '111', 1, 1, ''),
(258, '2013-10-29 19:14:00', 'amazon.com', 14, 1, '111', '111', 1, 1, ''),
(259, '2013-10-29 19:15:06', 'amazon.com', 12, 1, '7', '7', 1, 1, ''),
(260, '2013-10-29 19:15:49', 'amazon.com', 12, 1, '7', '7', 1, 1, ''),
(261, '2013-10-29 19:22:24', 'amazon.com', 12, 1, '', '7', 0, 0, ''),
(262, '2013-10-29 19:22:32', 'amazon.com', 12, 1, '7', '7', 1, 1, ''),
(263, '2013-11-04 22:08:55', 'amazon.com', 14, 1, '111', '111', 1, 1, '601300'),
(264, '2013-11-04 22:11:49', 'amazon.com', 14, 1, '111', '111', 1, 0, '680511'),
(265, '2013-11-22 11:36:40', 'amazon.com', 14, 1, '111', '111', 1, 0, '297969'),
(266, '2013-11-22 11:39:22', 'amazon.com', 12, 1, '7', '7', 1, 0, '60462'),
(267, '2013-11-22 11:40:16', 'amazon.com', 14, 1, '111', '111', 1, 0, '416091'),
(268, '2013-11-22 11:42:07', 'amazon.com', 14, 1, '111', '111', 1, 0, '894591'),
(269, '2013-11-22 11:42:55', 'amazon.com', 12, 1, '7', '7', 1, 0, '829579'),
(270, '2013-11-22 11:44:44', 'amazon.com', 12, 1, '7', '7', 1, 0, '636814'),
(271, '2013-11-22 11:47:15', 'amazon.com', 12, 1, '7', '7', 1, 0, '671719'),
(272, '2013-11-22 11:48:02', 'amazon.com', 14, 1, '111', '111', 1, 0, '846596'),
(273, '2013-11-22 11:48:51', 'amazon.com', 12, 1, '7', '7', 1, 0, '44931'),
(274, '2013-11-22 11:51:05', 'amazon.com', 14, 1, '111', '111', 1, 0, '188558'),
(275, '2013-11-22 11:52:25', 'amazon.com', 12, 1, '7', '7', 1, 0, '804601'),
(276, '2013-11-22 11:53:16', 'amazon.com', 12, 1, '7', '7', 1, 1, '456159'),
(277, '2013-11-22 12:57:22', 'amazon.com', 14, 1, '111', '111', 1, 0, '361639'),
(278, '2013-11-22 12:57:54', 'amazon.com', 8, 1, '', 'The batman ', 0, 0, '832563'),
(279, '2013-11-22 12:58:04', 'amazon.com', 12, 1, '7', '7', 1, 0, '832563'),
(280, '2013-11-22 12:58:43', 'amazon.com', 12, 1, '7', '7', 1, 0, '600369'),
(281, '2013-11-22 13:02:01', 'amazon.com', 12, 1, '7', '7', 1, 0, '61763'),
(282, '2013-11-22 13:15:22', 'amazon.com', 14, 1, '111', '111', 1, 0, '698209'),
(283, '2013-11-22 13:17:35', 'amazon.com', 5, 1, '', 'A place near by', 0, 0, '857761'),
(284, '2013-11-22 13:17:45', 'amazon.com', 11, 1, '', 'JhonHan', 0, 0, '857761'),
(285, '2013-11-22 13:18:04', 'amazon.com', 14, 1, '111', '111', 1, 0, '857761'),
(286, '2013-11-22 13:19:20', 'amazon.com', 14, 1, '111', '111', 1, 0, '418085'),
(287, '2013-11-22 13:21:03', 'amazon.com', 14, 1, '111', '111', 1, 0, '794850'),
(288, '2013-11-22 23:02:14', 'amazon.com', 12, 1, '5', '7', 0, 0, '607605'),
(289, '2013-11-22 23:03:04', 'amazon.com', 12, 1, '4', '7', 0, 0, '607605'),
(290, '2013-11-22 23:03:07', 'amazon.com', 12, 1, '1', '7', 0, 0, '607605'),
(291, '2013-11-22 23:03:09', 'amazon.com', 12, 1, '2', '7', 0, 0, '607605'),
(292, '2013-11-22 23:03:10', 'amazon.com', 12, 1, '3', '7', 0, 0, '607605'),
(293, '2013-11-22 23:03:12', 'amazon.com', 12, 1, '4', '7', 0, 0, '607605'),
(294, '2013-11-22 23:03:13', 'amazon.com', 12, 1, '6', '7', 0, 0, '607605'),
(295, '2013-11-22 23:03:15', 'amazon.com', 12, 1, '7', '7', 1, 0, '607605'),
(296, '2013-11-22 23:03:46', 'amazon.com', 12, 1, '', '7', 0, 0, '223053'),
(297, '2013-11-22 23:04:01', 'amazon.com', 12, 1, '7', '7', 1, 0, '223053'),
(298, '2013-11-22 23:04:47', 'amazon.com', 12, 1, '7', '7', 1, 0, '270722'),
(299, '2013-11-22 23:04:57', 'amazon.com', 2, 1, '', 'Jackson', 0, 0, '568542'),
(300, '2013-11-22 23:04:59', 'amazon.com', 2, 1, '', 'Jackson', 0, 0, '568542'),
(301, '2013-11-22 23:05:11', 'amazon.com', 12, 1, '7', '7', 1, 0, '568542'),
(302, '2013-11-22 23:06:03', 'amazon.com', 12, 1, '7', '7', 1, 0, '91431');

-- --------------------------------------------------------

--
-- 表的结构 `app_info`
--

CREATE TABLE IF NOT EXISTS `app_info` (
  `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` text NOT NULL,
  `app_type` varchar(20) NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `app_info`
--

INSERT INTO `app_info` (`app_id`, `app_name`, `app_type`) VALUES
(1, 'MSN', 'chat'),
(2, 'QQ', 'chat'),
(3, 'Skype', 'chat'),
(4, 'QQ Music', 'music'),
(5, 'Qvod', 'video'),
(6, 'YouTube', 'video'),
(7, 'Facebook', 'social network'),
(8, 'Twitter', 'social network'),
(9, 'TempleRun', 'game'),
(10, 'AngryBird', 'game'),
(11, 'Asphalt6', 'game'),
(12, 'WangYiNews', 'news'),
(13, 'TencentNews', 'news');

-- --------------------------------------------------------

--
-- 表的结构 `contact_info`
--

CREATE TABLE IF NOT EXISTS `contact_info` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `contact_info`
--


-- --------------------------------------------------------

--
-- 表的结构 `location_info`
--

CREATE TABLE IF NOT EXISTS `location_info` (
  `location_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `location_info`
--


-- --------------------------------------------------------

--
-- 表的结构 `mobile_info`
--

CREATE TABLE IF NOT EXISTS `mobile_info` (
  `mobile_info_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IMEI` char(15) NOT NULL,
  `cpu_info` text,
  `ip_address` text,
  `process` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`mobile_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `mobile_info`
--


-- --------------------------------------------------------

--
-- 表的结构 `question_info`
--

CREATE TABLE IF NOT EXISTS `question_info` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_type` varchar(20) NOT NULL,
  `mechanism_type` tinyint(4) NOT NULL,
  `question_content` text NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `question_info`
--

INSERT INTO `question_info` (`question_id`, `question_type`, `mechanism_type`, `question_content`) VALUES
(1, 'location', 1, 'where are you'),
(2, 'chat', 2, 'Who do you chat with'),
(3, 'chat', 2, 'What''s interesing state you read'),
(4, 'chat', 2, 'Who do you want to chat with most'),
(5, 'music', 2, 'What''s the music you listen to'),
(6, 'music', 2, 'What''s the playlist you play'),
(7, 'music', 2, 'What''s the name of the singer you listen to'),
(8, 'video', 2, 'What''s the name of the hero in the film'),
(9, 'video', 2, 'How long is the film you watch'),
(10, 'video', 2, 'What''s the character in the film you like most'),
(11, 'social network', 2, 'Whose state do you reply'),
(12, 'social network', 2, 'How many friends you chat with'),
(14, 'game', 2, 'What''s the highest score you get'),
(15, 'game', 2, 'How many times you experience to be able to kill the boss'),
(16, 'game', 2, 'What''s the name of the role you play in the game');

-- --------------------------------------------------------

--
-- 表的结构 `q_a_relation`
--

CREATE TABLE IF NOT EXISTS `q_a_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `q_a_relation`
--

INSERT INTO `q_a_relation` (`relation_id`, `question_id`, `activity_id`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 1, 3),
(4, 11, 4),
(5, 12, 5),
(6, 11, 6),
(7, 5, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10),
(11, 10, 11),
(14, 16, 13),
(15, 1, 30),
(16, 14, 12),
(17, 1, 31);

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IMEI` char(15) NOT NULL,
  `phone_num` text NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `user_info`
--

INSERT INTO `user_info` (`user_id`, `IMEI`, `phone_num`, `password`) VALUES
(1, '1', '71111301', '1'),
(2, '2', '71111302', '2'),
(3, '3', '71111303', '3');

-- --------------------------------------------------------

--
-- 表的结构 `website_relation`
--

CREATE TABLE IF NOT EXISTS `website_relation` (
  `website_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`website_relation_id`),
  UNIQUE KEY `website_relation_id` (`website_relation_id`),
  KEY `website_relation_id_2` (`website_relation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `website_relation`
--

INSERT INTO `website_relation` (`website_relation_id`, `user_id`, `domain`, `user_name`) VALUES
(1, 1, 'amazon.com', 'user1');

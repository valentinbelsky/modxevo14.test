-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Янв 08 2025 г., 09:42
-- Версия сервера: 8.0.35
-- Версия PHP: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `modxxx`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_active_users`
--

CREATE TABLE `fobw_active_users` (
  `sid` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `internalKey` int NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lasthit` int NOT NULL DEFAULT '0',
  `action` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data about last user action.';

--
-- Дамп данных таблицы `fobw_active_users`
--

INSERT INTO `fobw_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('b3j83mpc4cu888cr1vr11ldscu', 1, 'admin', 1736200275, '67', 1),
('iiln2lspckl5la02vvehotu0ho', 1, 'admin', 1736200705, '8', NULL),
('7tll0sa6gtteu4gbg4jqg8smah', 1, 'admin', 1736200712, '8', NULL),
('dovqtb5ib5ukns71s2c4tce2q5', 1, 'admin', 1736200955, '67', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_active_user_locks`
--

CREATE TABLE `fobw_active_user_locks` (
  `id` int NOT NULL,
  `sid` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `internalKey` int NOT NULL DEFAULT '0',
  `elementType` int NOT NULL DEFAULT '0',
  `elementId` int NOT NULL DEFAULT '0',
  `lasthit` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data about locked elements.';

--
-- Дамп данных таблицы `fobw_active_user_locks`
--

INSERT INTO `fobw_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
(835, 'b3j83mpc4cu888cr1vr11ldscu', 1, 3, 27, 1736119065);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_active_user_sessions`
--

CREATE TABLE `fobw_active_user_sessions` (
  `sid` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `internalKey` int NOT NULL DEFAULT '0',
  `lasthit` int NOT NULL DEFAULT '0',
  `ip` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data about valid user sessions.';

--
-- Дамп данных таблицы `fobw_active_user_sessions`
--

INSERT INTO `fobw_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('b3j83mpc4cu888cr1vr11ldscu', 1, 1736200275, '::1'),
('dovqtb5ib5ukns71s2c4tce2q5', 1, 1736200955, '::1');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_categories`
--

CREATE TABLE `fobw_categories` (
  `id` int NOT NULL,
  `category` varchar(45) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rank` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Categories to be used snippets,tv,chunks, etc';

--
-- Дамп данных таблицы `fobw_categories`
--

INSERT INTO `fobw_categories` (`id`, `category`, `rank`) VALUES
(1, 'SEO', 0),
(2, 'Templates', 0),
(3, 'Js', 0),
(4, 'Manager and Admin', 0),
(5, 'Navigation', 0),
(6, 'Content', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_documentgroup_names`
--

CREATE TABLE `fobw_documentgroup_names` (
  `id` int NOT NULL,
  `name` varchar(245) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `private_memgroup` tinyint DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint DEFAULT '0' COMMENT 'determines whether the document is private to web users'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for access permissions.';

--
-- Дамп данных таблицы `fobw_documentgroup_names`
--

INSERT INTO `fobw_documentgroup_names` (`id`, `name`, `private_memgroup`, `private_webgroup`) VALUES
(1, 'Site Admin Pages', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_document_groups`
--

CREATE TABLE `fobw_document_groups` (
  `id` int NOT NULL,
  `document_group` int NOT NULL DEFAULT '0',
  `document` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for access permissions.';

--
-- Дамп данных таблицы `fobw_document_groups`
--

INSERT INTO `fobw_document_groups` (`id`, `document_group`, `document`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_event_log`
--

CREATE TABLE `fobw_event_log` (
  `id` int NOT NULL,
  `eventid` int DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores event and error logs';

--
-- Дамп данных таблицы `fobw_event_log`
--

INSERT INTO `fobw_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(9, 0, 1736200698, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(10, 0, 1736200710, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(11, 0, 1736200720, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_jot_content`
--

CREATE TABLE `fobw_jot_content` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tagid` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `published` int NOT NULL DEFAULT '0',
  `uparent` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `flags` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secip` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sechash` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_general_ci,
  `customfields` mediumtext COLLATE utf8mb4_general_ci,
  `mode` int NOT NULL DEFAULT '1',
  `createdby` int NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedby` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `deletedon` int NOT NULL DEFAULT '0',
  `deletedby` int NOT NULL DEFAULT '0',
  `publishedon` int NOT NULL DEFAULT '0',
  `publishedby` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fobw_jot_content`
--

INSERT INTO `fobw_jot_content` (`id`, `title`, `tagid`, `published`, `uparent`, `parent`, `flags`, `secip`, `sechash`, `content`, `customfields`, `mode`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`) VALUES
(9, 'The first comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the first comment.', '<custom><name></name><email></email></custom>', 0, 0, 1160420310, 0, 0, 0, 0, 0, 0, 0),
(10, 'Second comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the second comment and uses an alternate row color. I also supplied a name, but i\'m not logged in.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420453, 0, 0, 0, 0, 0, 0, 0),
(11, 'No abuse', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Notice that I can\'t abuse <b>html</b>, ,  or [+placeholder+] tags.\r\n\r\nA new line also doesn\'t come unnoticed.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420681, 0, 0, 0, 0, 0, 0, 0),
(12, 'Posting when logged in', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'When you are logged in your own posts have a special color so you can easily spot them from the comment view. \r\n\r\nThe form also does not display any guest fields when logged in.', '<custom></custom>', 0, -1, 1160421310, 0, 0, 0, 0, 0, 0, 0),
(13, 'Managers', '', 1, 9, 0, '', '87.211.130.14', '91e230cf219e3ade10f32d6a41d0bd4d', 'Comments posted when only logged in as a manager user will use your manager name.\r\n\r\nModerators options are always shown when you are logged in as manager user.', '<custom></custom>', 0, 1, 1160421487, 0, 0, 0, 0, 0, 0, 0),
(14, 'Moderation', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'In this setup the Site Admins group is defined as being the moderator for this particular comment view. These users will have extra moderation options \r\n\r\nManager users, Moderators or Trusted users can post bad words like: dotNet.', '<custom></custom>', 0, -1, 1160422081, 0, 0, 0, 0, 0, 0, 0),
(15, 'I\'m untrusted', '', 0, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Untrusted users however can NOT post bad words like: dotNet. When they do the posts will be unpublished.', '<custom><name></name><email></email></custom>', 0, 0, 1160422167, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_jot_subscriptions`
--

CREATE TABLE `fobw_jot_subscriptions` (
  `id` mediumint NOT NULL,
  `uparent` mediumint NOT NULL DEFAULT '0',
  `tagid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `userid` mediumint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_manager_log`
--

CREATE TABLE `fobw_manager_log` (
  `id` int NOT NULL,
  `timestamp` int NOT NULL DEFAULT '0',
  `internalKey` int NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action` int NOT NULL DEFAULT '0',
  `itemid` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '0',
  `itemname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ip` varchar(46) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains a record of user interaction.';

--
-- Дамп данных таблицы `fobw_manager_log`
--

INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1, 1735394138, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2, 1735394138, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(3, 1735394146, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(4, 1735394159, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(5, 1735394688, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(6, 1735394704, 1, 'admin', 27, '2', 'Blog', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(7, 1735394713, 1, 'admin', 27, '6', 'Contact Us', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(8, 1735395037, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(9, 1735395372, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(10, 1735395405, 1, 'admin', 114, '', '-', 'View event log', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(11, 1735395409, 1, 'admin', 13, '', '-', 'Viewing logging', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(12, 1735395415, 1, 'admin', 53, '', '-', 'Viewing system info', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(13, 1735395452, 1, 'admin', 200, '', '-', 'Viewing phpInfo()', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(14, 1735396479, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(15, 1735396485, 1, 'admin', 27, '2', 'Blog', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(16, 1735396487, 1, 'admin', 27, '6', 'Contact Us', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(17, 1735396488, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(18, 1735396495, 1, 'admin', 75, '', '-', 'User/ role management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(19, 1735396498, 1, 'admin', 99, '', '-', 'Manage Web Users', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(20, 1735396523, 1, 'admin', 67, '', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(21, 1735396531, 1, 'admin', 106, '', '-', 'Viewing Modules', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(22, 1735396535, 1, 'admin', 107, '', 'Новый модуль', 'Create new module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(23, 1735396547, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(24, 1735396547, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(25, 1735396549, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(26, 1735396570, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(27, 1735396582, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(28, 1735396593, 1, 'admin', 30, '', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(29, 1735396600, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(30, 1735816587, 1, 'admin', 27, '1', 'Home', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(31, 1735816788, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(32, 1735816788, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(33, 1735816809, 1, 'admin', 27, '2', 'Blog', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(34, 1735816812, 1, 'admin', 27, '15', 'EVO Features', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(35, 1735816820, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(36, 1735816834, 1, 'admin', 5, '-', 'Категория каталога', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(37, 1735816834, 1, 'admin', 27, '50', 'Категория каталога', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(38, 1735816843, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(39, 1735816848, 1, 'admin', 5, '-', 'Карточка товара', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(40, 1735816848, 1, 'admin', 27, '51', 'Карточка товара', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(41, 1735816854, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(42, 1735816860, 1, 'admin', 5, '-', 'Информационная страница', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(43, 1735816860, 1, 'admin', 27, '52', 'Информационная страница', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(44, 1735816860, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(45, 1735816871, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(46, 1735816874, 1, 'admin', 5, '-', 'Каталог', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(47, 1735816874, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(48, 1735816886, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(49, 1735816916, 1, 'admin', 5, '-', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(50, 1735816916, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(51, 1735816924, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(52, 1735816932, 1, 'admin', 5, '-', 'Планшеты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(53, 1735816932, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(54, 1735816932, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(55, 1735816962, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(56, 1735816966, 1, 'admin', 5, '-', 'Ноутбуки', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(57, 1735816966, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(58, 1735816966, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(59, 1735816967, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(60, 1735816978, 1, 'admin', 5, '-', 'Наушники и аудиотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(61, 1735816978, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(62, 1735816978, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(63, 1735816985, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(64, 1735817000, 1, 'admin', 5, '-', 'Телевизоры и видеотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(65, 1735817001, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(66, 1735817001, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(67, 1735817007, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(68, 1735817011, 1, 'admin', 5, '-', 'Бытовая техника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(69, 1735817011, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(70, 1735817011, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(71, 1735817015, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(72, 1735817018, 1, 'admin', 5, '-', 'О компании', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(73, 1735817018, 1, 'admin', 27, '60', 'О компании', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(74, 1735817018, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(75, 1735817020, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(76, 1735817026, 1, 'admin', 5, '-', 'Услуги', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(77, 1735817026, 1, 'admin', 27, '61', 'Услуги', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(78, 1735817026, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(79, 1735817028, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(80, 1735817034, 1, 'admin', 5, '-', 'Покупателю', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(81, 1735817034, 1, 'admin', 27, '62', 'Покупателю', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(82, 1735817034, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(83, 1735817038, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(84, 1735817039, 1, 'admin', 5, '-', 'Доставка', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(85, 1735817039, 1, 'admin', 27, '63', 'Доставка', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(86, 1735817039, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(87, 1735817044, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(88, 1735817045, 1, 'admin', 5, '-', 'Оплата', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(89, 1735817045, 1, 'admin', 27, '64', 'Оплата', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(90, 1735817045, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(91, 1735817050, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(92, 1735817053, 1, 'admin', 5, '-', 'Контакты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(93, 1735817053, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(94, 1735817053, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(95, 1735817056, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(96, 1735817059, 1, 'admin', 5, '-', 'Ошибка 404', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(97, 1735817059, 1, 'admin', 27, '66', 'Ошибка 404', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(98, 1735817060, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(99, 1735817066, 1, 'admin', 5, '66', 'Ошибка 404', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(100, 1735817066, 1, 'admin', 27, '66', 'Ошибка 404', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(101, 1735817104, 1, 'admin', 27, '52', 'Информационная страница', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(102, 1735818101, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(103, 1735818142, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(104, 1735818147, 1, 'admin', 19, '', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(105, 1735818324, 1, 'admin', 20, '-', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(106, 1735818324, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(107, 1735818333, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(108, 1735818341, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(109, 1735818395, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(110, 1735818398, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(111, 1735818539, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(112, 1735818544, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(113, 1735818556, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(114, 1735818730, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(115, 1735818736, 1, 'admin', 16, '4', 'EVO startup - Bootstrap', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(116, 1735818991, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(117, 1735818992, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(118, 1735819007, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(119, 1735819007, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(120, 1735819012, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(121, 1735819016, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(122, 1735819018, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(123, 1735819018, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(124, 1735819137, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(125, 1735819137, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(126, 1735819159, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(127, 1735819161, 1, 'admin', 16, '4', 'EVO startup - Bootstrap', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(128, 1735819175, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(129, 1735819179, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(130, 1735819288, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(131, 1735819290, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(132, 1735819312, 1, 'admin', 79, '-', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(133, 1735819312, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(134, 1735819319, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(135, 1735819334, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(136, 1735819371, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(137, 1735819373, 1, 'admin', 16, '4', 'EVO startup - Bootstrap', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(138, 1735819411, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(139, 1735819415, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(140, 1735819482, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(141, 1735819482, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(142, 1735832133, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(143, 1735832133, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(144, 1735832149, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(145, 1735832153, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(146, 1735832153, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(147, 1735832160, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(148, 1735832164, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(149, 1735832168, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(150, 1735832280, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(151, 1735832280, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(152, 1735832317, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(153, 1735832317, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(154, 1735832343, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(155, 1735832343, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(156, 1735832392, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(157, 1735832392, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(158, 1735832695, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(159, 1735832695, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(160, 1735833127, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(161, 1735833127, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(162, 1735833133, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(163, 1735833137, 1, 'admin', 19, '', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(164, 1735833148, 1, 'admin', 20, '-', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(165, 1735833148, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(166, 1735833160, 1, 'admin', 19, '', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(167, 1735833162, 1, 'admin', 20, '-', 'Карточка товара', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(168, 1735833162, 1, 'admin', 16, '7', 'Карточка товара', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(169, 1735833173, 1, 'admin', 19, '', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(170, 1735833175, 1, 'admin', 20, '-', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(171, 1735833175, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(172, 1735833240, 1, 'admin', 27, '48', 'sitemap.xml', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(173, 1735833513, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(174, 1735833513, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(175, 1735833546, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(176, 1735833574, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(177, 1735833574, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(178, 1735833618, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(179, 1735833618, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(180, 1735833675, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(181, 1735833675, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(182, 1735833698, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(183, 1735833698, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(184, 1735833731, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(185, 1735833731, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(186, 1735833741, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(187, 1735833741, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(188, 1735833758, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(189, 1735833758, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(190, 1735833768, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(191, 1735833768, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(192, 1735833792, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(193, 1735833792, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(194, 1735833831, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(195, 1735833831, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(196, 1735833847, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(197, 1735833847, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(198, 1735833875, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(199, 1735833875, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(200, 1735833894, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(201, 1735833911, 1, 'admin', 6, '2', 'Blog', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(202, 1735833911, 1, 'admin', 3, '2', 'Blog', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(203, 1735833918, 1, 'admin', 6, '15', 'EVO Features', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(204, 1735833918, 1, 'admin', 3, '15', 'EVO Features', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(205, 1735833924, 1, 'admin', 64, '', '-', 'Removing deleted content', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(206, 1735833927, 1, 'admin', 27, '33', 'Getting Help', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(207, 1735833928, 1, 'admin', 27, '32', 'Design', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(208, 1735833934, 1, 'admin', 6, '33', 'Getting Help', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(209, 1735833934, 1, 'admin', 3, '33', 'Getting Help', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(210, 1735833938, 1, 'admin', 6, '32', 'Design', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(211, 1735833938, 1, 'admin', 3, '32', 'Design', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(212, 1735833939, 1, 'admin', 27, '6', 'Contact Us', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(213, 1735833942, 1, 'admin', 6, '6', 'Contact Us', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(214, 1735833942, 1, 'admin', 3, '6', 'Contact Us', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(215, 1735833944, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(216, 1735833956, 1, 'admin', 64, '', '-', 'Removing deleted content', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(217, 1735833970, 1, 'admin', 27, '8', 'Search Results', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(218, 1735833991, 1, 'admin', 6, '50', 'Категория каталога', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(219, 1735833991, 1, 'admin', 3, '50', 'Категория каталога', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(220, 1735833995, 1, 'admin', 6, '51', 'Карточка товара', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(221, 1735833995, 1, 'admin', 3, '51', 'Карточка товара', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(222, 1735833999, 1, 'admin', 6, '52', 'Информационная страница', 'Deleting resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(223, 1735833999, 1, 'admin', 3, '52', 'Информационная страница', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(224, 1735834001, 1, 'admin', 64, '', '-', 'Removing deleted content', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(225, 1735834033, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(226, 1735834040, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(227, 1735834520, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(228, 1735834520, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(229, 1735834669, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(230, 1735834669, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(231, 1735835040, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(232, 1735835040, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(233, 1735835202, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(234, 1735835202, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(235, 1735835318, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(236, 1735835318, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(237, 1735835557, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(238, 1735835557, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(239, 1735835952, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(240, 1735835970, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(241, 1735835970, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(242, 1735840971, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(243, 1735840971, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(244, 1735841141, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(245, 1735841141, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(246, 1735860525, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(247, 1735860525, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(248, 1735860559, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(249, 1735860559, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(250, 1735860631, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(251, 1735860631, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(252, 1735860745, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(253, 1735860745, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(254, 1735860921, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(255, 1735860921, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(256, 1735861277, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(257, 1735861277, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(258, 1735863022, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(259, 1735863022, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(260, 1735863956, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(261, 1735863956, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(262, 1735863959, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(263, 1735864013, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(264, 1735864013, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(265, 1735864019, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(266, 1735864026, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(267, 1735864034, 1, 'admin', 79, '-', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(268, 1735864034, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(269, 1735864434, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(270, 1735864434, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(271, 1735865098, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(272, 1735865098, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(273, 1735865183, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(274, 1735865213, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(275, 1735865213, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(276, 1735865259, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(277, 1735865259, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(278, 1735865322, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(279, 1735865322, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(280, 1735865389, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(281, 1735865389, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(282, 1735865457, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(283, 1735865458, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(284, 1735865656, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(285, 1735865656, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(286, 1735865949, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(287, 1735865949, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(288, 1735867413, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(289, 1735867413, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(290, 1735867415, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(291, 1735867608, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(292, 1735867608, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(293, 1735867772, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(294, 1735867772, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(295, 1735867775, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(296, 1735867949, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(297, 1735867949, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(298, 1735867956, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(299, 1735867968, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(300, 1735867983, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(301, 1735867986, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(302, 1735867986, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(303, 1735867990, 1, 'admin', 16, '7', 'Карточка товара', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(304, 1735867993, 1, 'admin', 20, '7', 'Карточка товара', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(305, 1735867993, 1, 'admin', 16, '7', 'Карточка товара', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(306, 1735867996, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(307, 1735867998, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(308, 1735867998, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(309, 1735867999, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(310, 1735867999, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(311, 1735868007, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(312, 1735877474, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(313, 1735877479, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(314, 1735877500, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(315, 1735877501, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(316, 1735877509, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(317, 1735877513, 1, 'admin', 79, '-', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(318, 1735877513, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(319, 1735877736, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(320, 1735877736, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(321, 1735877818, 1, 'admin', 19, '', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(322, 1735877828, 1, 'admin', 20, '-', 'Untitled template', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(323, 1735877828, 1, 'admin', 16, '9', 'Untitled template', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(324, 1735877851, 1, 'admin', 20, '9', 'categoryCollections', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(325, 1735877851, 1, 'admin', 16, '9', 'categoryCollections', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(326, 1735877857, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(327, 1735877857, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(328, 1735877873, 1, 'admin', 19, '', 'Новый шаблон', 'Creating a new template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(329, 1735877910, 1, 'admin', 20, '-', 'home_page_about', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(330, 1735877910, 1, 'admin', 16, '10', 'home_page_about', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(331, 1735877944, 1, 'admin', 20, '10', 'home_page_about', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(332, 1735877944, 1, 'admin', 16, '10', 'home_page_about', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(333, 1735877972, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(334, 1735877972, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(335, 1735877991, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(336, 1735877991, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(337, 1735877995, 1, 'admin', 20, '9', 'home_page_categories', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(338, 1735877995, 1, 'admin', 16, '9', 'home_page_categories', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(339, 1735878008, 1, 'admin', 20, '9', 'home_page_categories', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(340, 1735878008, 1, 'admin', 16, '9', 'home_page_categories', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(341, 1735878074, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(342, 1735878091, 1, 'admin', 20, '9', '11', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(343, 1735878091, 1, 'admin', 16, '9', '11', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(344, 1735878093, 1, 'admin', 79, '-', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(345, 1735878093, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(346, 1735878107, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(347, 1735878120, 1, 'admin', 20, '10', '231', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(348, 1735878120, 1, 'admin', 16, '10', '231', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(349, 1735878122, 1, 'admin', 79, '-', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(350, 1735878122, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(351, 1735878127, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(352, 1735878133, 1, 'admin', 21, '9', '11', 'Deleting template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(353, 1735878133, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(354, 1735878136, 1, 'admin', 21, '10', '231', 'Deleting template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(355, 1735878136, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(356, 1735878342, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(357, 1735878399, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(358, 1735878399, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(359, 1735878400, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(360, 1735878430, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(361, 1735878430, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(362, 1735878468, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(363, 1735878468, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(364, 1735878530, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(365, 1735878578, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(366, 1735878609, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(367, 1735878609, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(368, 1735878628, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(369, 1735878628, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(370, 1735878634, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(371, 1735878754, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(372, 1735878754, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(373, 1735878761, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(374, 1735878813, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(375, 1735878813, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(376, 1735878859, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(377, 1735878859, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(378, 1735879092, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(379, 1735879092, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(380, 1735879117, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(381, 1735879117, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(382, 1735879129, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(383, 1735879129, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(384, 1735879203, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(385, 1735879203, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(386, 1735879211, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(387, 1735879211, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(388, 1735879559, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(389, 1735879595, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(390, 1735879622, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(391, 1735879622, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(392, 1735879636, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(393, 1735879636, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(394, 1735879637, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(395, 1735879713, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(396, 1735879713, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(397, 1735879740, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(398, 1735879740, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(399, 1735879934, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(400, 1735879934, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(401, 1735880020, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(402, 1735880020, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(403, 1735880050, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(404, 1735880050, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(405, 1735880058, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(406, 1735880058, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(407, 1735880140, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(408, 1735880140, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(409, 1735880303, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(410, 1735880303, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(411, 1735904263, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(412, 1735904338, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(413, 1735904338, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(414, 1735905282, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(415, 1735905373, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(416, 1735905373, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(417, 1735906965, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(418, 1735906965, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(419, 1735906986, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(420, 1735907010, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(421, 1735907010, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(422, 1735907213, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(423, 1735907213, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(424, 1735907292, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(425, 1735907292, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(426, 1735907833, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(427, 1735907833, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(428, 1735908263, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(429, 1735908299, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(430, 1735908299, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(431, 1735908376, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(432, 1735908376, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(433, 1735915707, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(434, 1735915716, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(435, 1735915754, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(436, 1735915755, 1, 'admin', 5, '53', 'Каталог', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(437, 1735915755, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(438, 1735915758, 1, 'admin', 27, '60', 'О компании', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(439, 1735915762, 1, 'admin', 27, '60', 'О компании', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(440, 1735915762, 1, 'admin', 5, '60', 'О компании', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(441, 1735915763, 1, 'admin', 27, '60', 'О компании', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(442, 1735915769, 1, 'admin', 27, '61', 'Услуги', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(443, 1735915773, 1, 'admin', 27, '61', 'Услуги', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(444, 1735915774, 1, 'admin', 5, '61', 'Услуги', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(445, 1735915774, 1, 'admin', 27, '61', 'Услуги', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(446, 1735915781, 1, 'admin', 27, '62', 'Покупателю', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(447, 1735915786, 1, 'admin', 27, '62', 'Покупателю', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(448, 1735915787, 1, 'admin', 5, '62', 'Покупателю', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(449, 1735915787, 1, 'admin', 27, '62', 'Покупателю', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(450, 1735915789, 1, 'admin', 27, '63', 'Доставка', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(451, 1735915791, 1, 'admin', 27, '63', 'Доставка', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(452, 1735915792, 1, 'admin', 5, '63', 'Доставка', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(453, 1735915792, 1, 'admin', 27, '63', 'Доставка', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(454, 1735915793, 1, 'admin', 27, '64', 'Оплата', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(455, 1735915796, 1, 'admin', 27, '64', 'Оплата', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(456, 1735915797, 1, 'admin', 5, '64', 'Оплата', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(457, 1735915797, 1, 'admin', 27, '64', 'Оплата', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(458, 1735915801, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(459, 1735915804, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(460, 1735915805, 1, 'admin', 5, '65', 'Контакты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(461, 1735915805, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(462, 1735915812, 1, 'admin', 27, '66', 'Ошибка 404', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(463, 1735915815, 1, 'admin', 27, '66', 'Ошибка 404', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(464, 1735915816, 1, 'admin', 5, '66', 'Ошибка 404', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(465, 1735915816, 1, 'admin', 27, '66', 'Ошибка 404', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(466, 1735915844, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(467, 1735915847, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(468, 1735915849, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(469, 1735915849, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(470, 1735915850, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(471, 1735915854, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(472, 1735915855, 1, 'admin', 5, '55', 'Планшеты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(473, 1735915855, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(474, 1735915857, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(475, 1735915860, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(476, 1735915861, 1, 'admin', 5, '56', 'Ноутбуки', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(477, 1735915861, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(478, 1735915863, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(479, 1735915866, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(480, 1735915867, 1, 'admin', 5, '57', 'Наушники и аудиотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(481, 1735915867, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(482, 1735915868, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(483, 1735915871, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(484, 1735915871, 1, 'admin', 5, '58', 'Телевизоры и видеотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(485, 1735915871, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(486, 1735915873, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(487, 1735915875, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(488, 1735915876, 1, 'admin', 5, '59', 'Бытовая техника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(489, 1735915876, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(490, 1735915885, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(491, 1735915921, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(492, 1735915932, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(493, 1735915941, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(494, 1735915951, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(495, 1735915951, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(496, 1735916055, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(497, 1735916055, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(498, 1735916066, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(499, 1735916068, 1, 'admin', 79, '-', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(500, 1735916068, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(501, 1735916101, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(502, 1735916103, 1, 'admin', 79, '-', 'header_h1', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(503, 1735916103, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(504, 1735916111, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(505, 1735916113, 1, 'admin', 79, '-', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(506, 1735916113, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(507, 1735916119, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(508, 1735916119, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(509, 1735916156, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(510, 1735916158, 1, 'admin', 79, '-', 'catalog_header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(511, 1735916158, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(512, 1735916168, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(513, 1735916168, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(514, 1735916186, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(515, 1735916191, 1, 'admin', 79, '24', 'catalog_header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(516, 1735916191, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(517, 1735916201, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(518, 1735916314, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(519, 1735916314, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(520, 1735917175, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(521, 1735917175, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(522, 1735917184, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(523, 1735917184, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(524, 1735938108, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(525, 1735938146, 1, 'admin', 79, '22', 'header_h1', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(526, 1735938146, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(527, 1735938168, 1, 'admin', 79, '22', 'header_h1', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(528, 1735938168, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(529, 1735938183, 1, 'admin', 79, '22', 'header_h1', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(530, 1735938183, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(531, 1735938231, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(532, 1735938301, 1, 'admin', 79, '24', 'catalog_header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(533, 1735938301, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(534, 1735938435, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(535, 1735938454, 1, 'admin', 16, '7', 'Карточка товара', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(536, 1735938470, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(537, 1735938489, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(538, 1735938489, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(539, 1735938505, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(540, 1735938508, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(541, 1735938508, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(542, 1735938523, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(543, 1735938590, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(544, 1735938606, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(545, 1735938754, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(546, 1735938755, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(547, 1735939056, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(548, 1735939056, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(549, 1735939618, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(550, 1735939618, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(551, 1735939706, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(552, 1735939739, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(553, 1735939739, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(554, 1735939804, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(555, 1735939804, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(556, 1735939864, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(557, 1735939864, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(558, 1735940235, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(559, 1735940235, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(560, 1735940335, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(561, 1735940335, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(562, 1735940713, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(563, 1735940713, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(564, 1735940881, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(565, 1735940881, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(566, 1735941109, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(567, 1735941114, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(568, 1735941121, 1, 'admin', 79, '22', 'header_h1', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(569, 1735941121, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(570, 1735941142, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(571, 1735941159, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(572, 1735941184, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(573, 1735941211, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(574, 1735941211, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(575, 1735941214, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(576, 1735941278, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(577, 1735941278, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(578, 1735941373, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(579, 1735941373, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(580, 1735941374, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(581, 1735941560, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(582, 1735941560, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(583, 1735941561, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(584, 1735941604, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(585, 1735941604, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(586, 1735941694, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(587, 1735941694, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(588, 1735941855, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(589, 1735941855, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(590, 1735942018, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(591, 1735942018, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(592, 1735942110, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(593, 1735942110, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(594, 1735942155, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(595, 1735942155, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(596, 1735942294, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(597, 1735942294, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(598, 1735942315, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(599, 1735942315, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(600, 1735942316, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(601, 1735942340, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(602, 1735942340, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(603, 1735942462, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(604, 1735942462, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(605, 1735942730, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(606, 1735942730, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(607, 1735943009, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(608, 1735943009, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(609, 1735943020, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(610, 1735943020, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(611, 1735943109, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(612, 1735943114, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(613, 1735943117, 1, 'admin', 79, '-', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(614, 1735943117, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(615, 1735943138, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(616, 1735943138, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(617, 1735943187, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(618, 1735943188, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(619, 1735943190, 1, 'admin', 79, '-', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(620, 1735943190, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(621, 1735943212, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(622, 1735943213, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(623, 1735943241, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(624, 1735943242, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(625, 1735943250, 1, 'admin', 79, '-', 'catalog_pagination', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(626, 1735943250, 1, 'admin', 78, '27', 'catalog_pagination', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(627, 1735943270, 1, 'admin', 79, '27', 'catalog_pagination', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(628, 1735943270, 1, 'admin', 78, '27', 'catalog_pagination', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(629, 1735943286, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(630, 1735943289, 1, 'admin', 78, '27', 'catalog_pagination', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(631, 1735943330, 1, 'admin', 79, '23', 'catalog_content', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(632, 1735943330, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(633, 1735943346, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(634, 1735943356, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(635, 1735943356, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(636, 1735944592, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(637, 1735944602, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(638, 1735944618, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(639, 1735944675, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(640, 1735944675, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(641, 1735944683, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(642, 1735944816, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(643, 1735944816, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(644, 1735944857, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(645, 1735944889, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(646, 1735944889, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(647, 1735944917, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(648, 1735944923, 1, 'admin', 5, '65', 'Контакты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(649, 1735944923, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(650, 1735944972, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(651, 1735944972, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(652, 1735945018, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(653, 1735945025, 1, 'admin', 78, '24', 'catalog_header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(654, 1735945040, 1, 'admin', 79, '24', 'pagetitle', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(655, 1735945040, 1, 'admin', 78, '24', 'pagetitle', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(656, 1735945062, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(657, 1735945062, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(658, 1735945072, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(659, 1735945072, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(660, 1735945161, 1, 'admin', 79, '24', 'pagetitle', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(661, 1735945161, 1, 'admin', 78, '24', 'pagetitle', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(662, 1735945248, 1, 'admin', 20, '8', 'Информационная страница', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(663, 1735945248, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(664, 1735945509, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(665, 1735945550, 1, 'admin', 302, '-', 'meta_h1', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(666, 1735945550, 1, 'admin', 301, '5', 'meta_h1', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(667, 1735945568, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(668, 1735945577, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(669, 1735945579, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(670, 1735945594, 1, 'admin', 79, '22', 'header_h1', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(671, 1735945594, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(672, 1735945605, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(673, 1735945624, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(674, 1735945624, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(675, 1735945635, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(676, 1735945648, 1, 'admin', 5, '65', 'Контакты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(677, 1735945648, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(678, 1735945669, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(679, 1735945675, 1, 'admin', 302, '-', 'og_title', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(680, 1735945675, 1, 'admin', 301, '6', 'og_title', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(681, 1735945679, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(682, 1735945685, 1, 'admin', 302, '-', 'og_description', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(683, 1735945685, 1, 'admin', 301, '7', 'og_description', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(684, 1735945689, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(685, 1735945706, 1, 'admin', 302, '-', 'og_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(686, 1735945706, 1, 'admin', 301, '8', 'og_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(687, 1735945712, 1, 'admin', 302, '7', 'og_description', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(688, 1735945712, 1, 'admin', 301, '7', 'og_description', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(689, 1735945727, 1, 'admin', 27, '65', 'Контакты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(690, 1735945745, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(691, 1735945758, 1, 'admin', 302, '-', 'home_banner_desktop', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(692, 1735945758, 1, 'admin', 301, '9', 'home_banner_desktop', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(693, 1735945768, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(694, 1735945772, 1, 'admin', 302, '-', 'home_banner_mobile', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(695, 1735945773, 1, 'admin', 301, '10', 'home_banner_mobile', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(696, 1735945911, 1, 'admin', 302, '10', 'home_banner_mobile', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(697, 1735945911, 1, 'admin', 301, '10', 'home_banner_mobile', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(698, 1735945924, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(699, 1735945934, 1, 'admin', 302, '-', 'category_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(700, 1735945934, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(701, 1735945944, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(702, 1735945946, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(703, 1735945957, 1, 'admin', 302, '-', 'product_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(704, 1735945957, 1, 'admin', 301, '12', 'product_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(705, 1735945964, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(706, 1735945976, 1, 'admin', 302, '-', 'product_price', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(707, 1735945976, 1, 'admin', 301, '13', 'product_price', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(708, 1735992112, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(709, 1735992115, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(710, 1735992135, 1, 'admin', 5, '-', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(711, 1735992135, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(712, 1735992143, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(713, 1735992144, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(714, 1735992144, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(715, 1735992154, 1, 'admin', 94, '67', 'Копия Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Duplicate resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(716, 1735992154, 1, 'admin', 3, '68', 'Копия Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(717, 1735992155, 1, 'admin', 27, '68', 'Копия Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(718, 1735992164, 1, 'admin', 5, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(719, 1735992165, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(720, 1735992173, 1, 'admin', 94, '68', 'Копия Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Duplicate resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(721, 1735992173, 1, 'admin', 3, '69', 'Копия Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(722, 1735992176, 1, 'admin', 27, '69', 'Копия Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(723, 1735992184, 1, 'admin', 5, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(724, 1735992185, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(725, 1735992191, 1, 'admin', 94, '69', 'Копия Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Duplicate resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(726, 1735992191, 1, 'admin', 3, '70', 'Копия Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(727, 1735992193, 1, 'admin', 27, '70', 'Копия Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(728, 1735992202, 1, 'admin', 5, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(729, 1735992202, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(730, 1735992214, 1, 'admin', 94, '70', 'Копия Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Duplicate resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(731, 1735992214, 1, 'admin', 3, '71', 'Копия Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(732, 1735992216, 1, 'admin', 27, '71', 'Копия Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(733, 1735992220, 1, 'admin', 5, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(734, 1735992220, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(735, 1735992234, 1, 'admin', 94, '71', 'Копия Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Duplicate resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(736, 1735992234, 1, 'admin', 3, '72', 'Копия Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(737, 1735992235, 1, 'admin', 27, '72', 'Копия Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(738, 1735992238, 1, 'admin', 5, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(739, 1735992238, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(740, 1735992253, 1, 'admin', 94, '72', 'Копия Смартфон Realme C25S 4/64 ГБ, синий', 'Duplicate resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(741, 1735992253, 1, 'admin', 3, '73', 'Копия Смартфон Realme C25S 4/64 ГБ, синий', 'Viewing data for resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(742, 1735992254, 1, 'admin', 27, '73', 'Копия Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(743, 1735992258, 1, 'admin', 5, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(744, 1735992258, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(745, 1735992297, 1, 'admin', 5, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(746, 1735992297, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(747, 1735992301, 1, 'admin', 5, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(748, 1735992301, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(749, 1735992305, 1, 'admin', 5, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(750, 1735992305, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(751, 1735992310, 1, 'admin', 5, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(752, 1735992310, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(753, 1735992315, 1, 'admin', 5, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(754, 1735992315, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(755, 1735992320, 1, 'admin', 5, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(756, 1735992320, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(757, 1735992363, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(758, 1735992363, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(759, 1735992372, 1, 'admin', 5, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(760, 1735992373, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(761, 1735992381, 1, 'admin', 5, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(762, 1735992382, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(763, 1735992389, 1, 'admin', 5, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(764, 1735992389, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(765, 1735992397, 1, 'admin', 5, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(766, 1735992397, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(767, 1735992407, 1, 'admin', 5, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(768, 1735992407, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(769, 1735992415, 1, 'admin', 5, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(770, 1735992415, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(771, 1735992427, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(772, 1735992467, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(773, 1735992490, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(774, 1735992510, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(775, 1735992531, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(776, 1735992568, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(777, 1735992586, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(778, 1735992749, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(779, 1735992749, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(780, 1735992764, 1, 'admin', 5, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(781, 1735992764, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(782, 1735992775, 1, 'admin', 5, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(783, 1735992775, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(784, 1735992786, 1, 'admin', 5, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(785, 1735992786, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(786, 1735992802, 1, 'admin', 5, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(787, 1735992802, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(788, 1735992812, 1, 'admin', 5, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(789, 1735992812, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(790, 1735992820, 1, 'admin', 5, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(791, 1735992820, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(792, 1735992969, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(793, 1735992984, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(794, 1735992996, 1, 'admin', 78, '24', 'pagetitle', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(795, 1735993005, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(796, 1735993007, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(797, 1735993149, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(798, 1735993152, 1, 'admin', 301, '6', 'og_title', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(799, 1735993156, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(800, 1735993518, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(801, 1735993518, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(802, 1735993570, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(803, 1735993570, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(804, 1735993899, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(805, 1735993900, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(806, 1735994142, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(807, 1735994142, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(808, 1735994173, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(809, 1735994179, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(810, 1735994179, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(811, 1735994381, 1, 'admin', 53, '', '-', 'Viewing system info', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(812, 1735994390, 1, 'admin', 13, '', '-', 'Viewing logging', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(813, 1735994394, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(814, 1735994586, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(815, 1735994586, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(816, 1735994630, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(817, 1735994630, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(818, 1735994656, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(819, 1735994656, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(820, 1735994747, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(821, 1735994748, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(822, 1736077344, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(823, 1736077344, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(824, 1736077393, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(825, 1736077393, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(826, 1736077430, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(827, 1736077430, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(828, 1736077444, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(829, 1736077444, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(830, 1736077461, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(831, 1736077461, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(832, 1736077533, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(833, 1736077533, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(834, 1736077570, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(835, 1736077570, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(836, 1736077576, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(837, 1736077576, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(838, 1736077587, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(839, 1736077589, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(840, 1736077635, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(841, 1736077635, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(842, 1736077644, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(843, 1736077644, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(844, 1736077646, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(845, 1736077646, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(846, 1736077713, 1, 'admin', 22, '3', 'if', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(847, 1736078123, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(848, 1736078123, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(849, 1736078143, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(850, 1736078143, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(851, 1736078163, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(852, 1736078164, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(853, 1736078176, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(854, 1736078176, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(855, 1736078182, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(856, 1736078204, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(857, 1736078210, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(858, 1736078210, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(859, 1736078228, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(860, 1736078228, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(861, 1736078244, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(862, 1736078244, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(863, 1736078267, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(864, 1736078267, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(865, 1736078273, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(866, 1736078273, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(867, 1736078283, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(868, 1736078283, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(869, 1736078286, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(870, 1736078287, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(871, 1736078299, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(872, 1736078299, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(873, 1736078325, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(874, 1736078325, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(875, 1736078338, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(876, 1736078338, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(877, 1736078382, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(878, 1736078382, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(879, 1736078389, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(880, 1736078389, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(881, 1736078582, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(882, 1736078582, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(883, 1736078622, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(884, 1736078622, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(885, 1736078670, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(886, 1736078670, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(887, 1736078706, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(888, 1736078706, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(889, 1736078852, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(890, 1736078854, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(891, 1736078860, 1, 'admin', 16, '8', 'Информационная страница', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(892, 1736078875, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(893, 1736078875, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(894, 1736078923, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(895, 1736078923, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(896, 1736078965, 1, 'admin', 16, '7', 'Карточка товара', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(897, 1736078978, 1, 'admin', 20, '7', 'Карточка товара', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(898, 1736078978, 1, 'admin', 16, '7', 'Карточка товара', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(899, 1736078986, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(900, 1736079011, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(901, 1736079011, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(902, 1736079033, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(903, 1736079033, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(904, 1736079204, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(905, 1736079223, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(906, 1736079241, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(907, 1736079241, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(908, 1736079279, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(909, 1736079279, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(910, 1736079286, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(911, 1736079286, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(912, 1736079306, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(913, 1736079306, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(914, 1736079319, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(915, 1736079319, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(916, 1736079357, 1, 'admin', 112, '1', 'Extras', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(917, 1736079636, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(918, 1736079765, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(919, 1736079765, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(920, 1736079788, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(921, 1736079834, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(922, 1736079834, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(923, 1736079899, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(924, 1736079899, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(925, 1736080054, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(926, 1736080054, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(927, 1736080193, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(928, 1736080193, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(929, 1736080224, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(930, 1736080231, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(931, 1736083133, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(932, 1736083162, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(933, 1736083162, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(934, 1736083207, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(935, 1736083207, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(936, 1736083211, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(937, 1736083217, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(938, 1736083217, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(939, 1736083259, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(940, 1736083259, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(941, 1736083324, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(942, 1736083324, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(943, 1736083350, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(944, 1736083377, 1, 'admin', 302, '-', 'home_banners', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(945, 1736083377, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(946, 1736083520, 1, 'admin', 302, '14', 'home_banners', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(947, 1736083520, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(948, 1736083524, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(949, 1736083674, 1, 'admin', 302, '14', 'home_banners', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(950, 1736083674, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(951, 1736083678, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(952, 1736083696, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(953, 1736083708, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(954, 1736083735, 1, 'admin', 302, '14', 'home_banners', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(955, 1736083735, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(956, 1736083737, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(957, 1736083752, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(958, 1736083796, 1, 'admin', 302, '14', 'home_banners', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(959, 1736083796, 1, 'admin', 301, '14', 'home_banners', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(960, 1736083826, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(961, 1736083826, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(962, 1736084674, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(963, 1736084919, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(964, 1736085115, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(965, 1736085137, 1, 'admin', 303, '10', 'home_banner_mobile', 'Delete Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(966, 1736085137, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(967, 1736085142, 1, 'admin', 303, '9', 'home_banner_desktop', 'Delete Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(968, 1736085142, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(969, 1736085161, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(970, 1736085189, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(971, 1736085189, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(972, 1736085256, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(973, 1736085384, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(974, 1736085384, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(975, 1736085413, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(976, 1736085440, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(977, 1736085440, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(978, 1736085499, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(979, 1736085499, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(980, 1736085548, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(981, 1736085548, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(982, 1736085760, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(983, 1736085760, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(984, 1736086329, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(985, 1736086329, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(986, 1736086421, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(987, 1736086421, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(988, 1736086600, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(989, 1736086600, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(990, 1736086641, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(991, 1736086641, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(992, 1736086663, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(993, 1736086683, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(994, 1736086683, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(995, 1736086690, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(996, 1736086694, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(997, 1736086694, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(998, 1736086808, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(999, 1736086808, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1000, 1736086839, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1001, 1736086839, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1002, 1736086871, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1003, 1736086871, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1004, 1736086912, 1, 'admin', 79, '16', 'head', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1005, 1736086912, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1006, 1736086949, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1007, 1736086949, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1008, 1736086976, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1009, 1736086976, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1010, 1736086992, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1011, 1736086992, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1012, 1736087051, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1013, 1736087051, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1014, 1736087075, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1015, 1736087075, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1016, 1736089172, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1017, 1736089172, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1018, 1736089251, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1019, 1736089251, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1020, 1736089282, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1021, 1736089282, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1022, 1736089571, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1023, 1736089571, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1024, 1736089590, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1025, 1736089590, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1026, 1736089650, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1027, 1736089650, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1028, 1736089745, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1029, 1736089745, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1030, 1736089795, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1031, 1736089795, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1032, 1736089867, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1033, 1736089867, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1034, 1736089900, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1035, 1736089900, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1036, 1736090034, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1037, 1736090034, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1038, 1736090056, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1039, 1736090056, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1040, 1736090132, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1041, 1736090132, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1042, 1736090184, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1043, 1736090184, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1044, 1736090278, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1045, 1736090278, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1046, 1736090543, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1047, 1736090543, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1048, 1736090667, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1049, 1736090667, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1050, 1736090710, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1051, 1736090710, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1052, 1736090754, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1053, 1736090754, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1054, 1736090781, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1055, 1736090781, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1056, 1736090882, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1057, 1736090882, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1058, 1736091241, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1059, 1736091241, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1060, 1736091290, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1061, 1736091290, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1062, 1736091546, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1063, 1736091546, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1064, 1736091648, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1065, 1736091648, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1066, 1736091683, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1067, 1736091683, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1068, 1736091725, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1069, 1736091725, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1070, 1736091772, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1071, 1736091773, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1072, 1736091845, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1073, 1736091845, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1074, 1736091926, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1075, 1736091926, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1076, 1736091967, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1077, 1736091967, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1078, 1736097610, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1079, 1736097610, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1080, 1736097620, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1081, 1736097620, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1082, 1736097641, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1083, 1736097641, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1084, 1736097662, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1085, 1736097662, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1086, 1736097740, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1087, 1736097741, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1088, 1736097835, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1089, 1736097835, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1090, 1736097963, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1091, 1736097963, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1092, 1736098053, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1093, 1736098054, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1094, 1736098054, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1095, 1736098196, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1096, 1736098196, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1097, 1736098274, 1, 'admin', 79, '18', 'banner', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1098, 1736098274, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1099, 1736098283, 1, 'admin', 22, '4', 'DocLister', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1100, 1736098406, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1101, 1736098423, 1, 'admin', 20, '5', 'Главная', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1102, 1736098423, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1103, 1736098432, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1104, 1736098490, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1105, 1736098500, 1, 'admin', 79, '-', 'Untitled chunk', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1106, 1736098500, 1, 'admin', 78, '28', 'Untitled chunk', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1107, 1736098511, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1108, 1736098511, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1109, 1736098541, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1110, 1736098541, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1111, 1736098553, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1112, 1736098554, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1113, 1736098554, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1114, 1736098569, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1115, 1736098569, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1116, 1736098585, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1117, 1736098585, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1118, 1736098617, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1119, 1736098618, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1120, 1736098658, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1121, 1736098676, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1122, 1736098676, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1123, 1736098784, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1124, 1736098786, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1125, 1736098898, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1126, 1736098898, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1127, 1736098931, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1128, 1736098931, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1129, 1736098936, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1130, 1736098936, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1131, 1736098954, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1132, 1736098954, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1133, 1736098965, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1134, 1736098965, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1135, 1736098993, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1136, 1736098993, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1137, 1736099013, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1138, 1736099013, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1139, 1736099026, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1140, 1736099026, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1141, 1736099047, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1142, 1736099047, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1143, 1736099215, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1144, 1736099215, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1145, 1736099222, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1146, 1736099222, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1147, 1736099308, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1148, 1736099308, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1149, 1736099390, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1150, 1736099390, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1151, 1736099404, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1152, 1736099555, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1153, 1736099555, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1154, 1736099569, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1155, 1736099583, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1156, 1736099583, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1157, 1736099589, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1158, 1736099589, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1159, 1736099591, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1160, 1736099591, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1161, 1736099609, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1162, 1736099609, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1163, 1736099631, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1164, 1736099631, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1165, 1736099686, 1, 'admin', 301, '5', 'meta_h1', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1166, 1736099794, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1167, 1736099794, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1168, 1736099814, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1169, 1736099814, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1170, 1736099852, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1171, 1736099852, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1172, 1736099856, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1173, 1736099856, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1174, 1736099873, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1175, 1736099873, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1176, 1736099885, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1177, 1736099885, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1178, 1736099893, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1179, 1736099893, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1180, 1736099919, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1181, 1736099919, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1182, 1736099936, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1183, 1736099937, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1184, 1736099963, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1185, 1736100016, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1186, 1736100033, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1187, 1736100033, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1188, 1736100071, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1189, 1736100071, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1190, 1736100089, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1191, 1736100089, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1192, 1736100100, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1193, 1736100100, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1194, 1736100107, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1195, 1736100107, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1196, 1736100140, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1197, 1736100140, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1198, 1736100147, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1199, 1736100147, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1200, 1736100165, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1201, 1736100165, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1202, 1736100166, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1203, 1736100166, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1204, 1736100171, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1205, 1736100171, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1206, 1736100205, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1207, 1736100273, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1208, 1736100273, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1209, 1736100280, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1210, 1736100280, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1211, 1736100349, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1212, 1736100349, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1213, 1736100438, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1214, 1736100438, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1215, 1736100480, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1216, 1736100480, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1217, 1736100483, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1218, 1736100483, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1219, 1736100500, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1220, 1736100502, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1221, 1736100522, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1222, 1736100522, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1223, 1736100527, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1224, 1736100527, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1225, 1736101114, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1226, 1736101114, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1227, 1736101118, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1228, 1736101118, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1229, 1736101125, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1230, 1736101125, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1231, 1736101177, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1232, 1736101178, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1233, 1736101200, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1234, 1736101200, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1235, 1736101237, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1236, 1736101237, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1237, 1736101282, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1238, 1736101282, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1239, 1736101410, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1240, 1736101410, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1241, 1736101422, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1242, 1736101422, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1243, 1736101443, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1244, 1736101443, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1245, 1736101461, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1246, 1736101461, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1247, 1736101467, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1248, 1736101467, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1249, 1736101544, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1250, 1736101544, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1251, 1736101561, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1252, 1736101561, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1253, 1736101571, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1254, 1736101571, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1255, 1736101592, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1256, 1736101622, 1, 'admin', 302, '11', 'category_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1257, 1736101622, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1258, 1736101645, 1, 'admin', 302, '11', 'category_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1259, 1736101645, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1260, 1736101669, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1261, 1736101783, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1262, 1736101788, 1, 'admin', 302, '11', 'category_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1263, 1736101788, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1264, 1736101802, 1, 'admin', 302, '11', 'category_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1265, 1736101802, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1266, 1736101824, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1267, 1736101848, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1268, 1736101849, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1269, 1736101883, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1270, 1736101883, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1271, 1736101892, 1, 'admin', 20, '6', 'Категория каталога', 'Saving template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1272, 1736101892, 1, 'admin', 16, '6', 'Категория каталога', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1273, 1736101989, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1274, 1736101989, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1275, 1736102022, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1276, 1736102022, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1277, 1736102032, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1278, 1736102032, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1279, 1736102048, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1280, 1736102048, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1281, 1736102067, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1282, 1736102067, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1283, 1736102085, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1284, 1736102086, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1285, 1736102093, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1286, 1736102093, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1287, 1736102106, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1288, 1736102107, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1289, 1736102115, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1290, 1736102115, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1291, 1736102124, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1292, 1736102124, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1293, 1736102186, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1294, 1736102186, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1295, 1736102489, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1296, 1736102490, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1297, 1736102524, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1298, 1736102524, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1299, 1736102561, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1300, 1736102561, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1301, 1736102597, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1302, 1736102597, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1303, 1736102600, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1304, 1736102610, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1305, 1736102610, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1306, 1736102614, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1307, 1736102614, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1308, 1736102629, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1309, 1736102640, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1310, 1736102651, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1311, 1736102668, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1312, 1736102668, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1313, 1736102677, 1, 'admin', 79, '19', 'home_page_categories', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1314, 1736102677, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1315, 1736102712, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1316, 1736102712, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1317, 1736102713, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1318, 1736102731, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1319, 1736102732, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1320, 1736102749, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1321, 1736102750, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1322, 1736102755, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1323, 1736102755, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1324, 1736102779, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1325, 1736102779, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1326, 1736102797, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1327, 1736102797, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1328, 1736102860, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1329, 1736102860, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1330, 1736102871, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1331, 1736102871, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1332, 1736102930, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1333, 1736102942, 1, 'admin', 5, '55', 'Планшеты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1334, 1736102942, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1335, 1736103159, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1336, 1736103200, 1, 'admin', 5, '56', 'Ноутбуки', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1337, 1736103200, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1338, 1736103201, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1339, 1736103208, 1, 'admin', 5, '57', 'Наушники и аудиотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1340, 1736103208, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1341, 1736103209, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1342, 1736103232, 1, 'admin', 5, '58', 'Телевизоры и видеотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1343, 1736103232, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1344, 1736103233, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1345, 1736103245, 1, 'admin', 5, '59', 'Бытовая техника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1346, 1736103245, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1347, 1736103288, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1348, 1736103294, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1349, 1736103294, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1350, 1736110939, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1351, 1736110939, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1352, 1736110952, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1353, 1736110952, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1354, 1736110962, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1355, 1736110962, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1356, 1736110985, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1357, 1736110999, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1358, 1736111032, 1, 'admin', 79, '28', 'tplCategory', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1359, 1736111032, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1360, 1736111322, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1361, 1736111378, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1362, 1736111378, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1363, 1736111380, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1364, 1736111387, 1, 'admin', 5, '55', 'Планшеты', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1365, 1736111387, 1, 'admin', 27, '55', 'Планшеты', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1366, 1736111389, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1367, 1736111396, 1, 'admin', 5, '56', 'Ноутбуки', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1368, 1736111396, 1, 'admin', 27, '56', 'Ноутбуки', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1369, 1736111398, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1370, 1736111404, 1, 'admin', 5, '57', 'Наушники и аудиотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1371, 1736111404, 1, 'admin', 27, '57', 'Наушники и аудиотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1372, 1736111406, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1373, 1736111413, 1, 'admin', 5, '58', 'Телевизоры и видеотехника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1374, 1736111414, 1, 'admin', 27, '58', 'Телевизоры и видеотехника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1375, 1736111416, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1376, 1736111421, 1, 'admin', 5, '59', 'Бытовая техника', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1377, 1736111421, 1, 'admin', 27, '59', 'Бытовая техника', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1378, 1736111727, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1379, 1736111742, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1380, 1736111747, 1, 'admin', 78, '24', 'pagetitle', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1381, 1736111770, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1382, 1736112026, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1383, 1736112042, 1, 'admin', 22, '1', 'DLCrumbs', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1384, 1736112049, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1385, 1736112050, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1386, 1736112072, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1387, 1736112072, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1388, 1736112143, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1389, 1736112171, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1390, 1736112171, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1391, 1736112214, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1392, 1736112214, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1393, 1736112421, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1394, 1736112421, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1395, 1736112549, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1396, 1736112549, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1397, 1736112588, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1398, 1736112588, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1399, 1736112648, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1400, 1736112648, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1401, 1736112713, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1402, 1736112713, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1403, 1736112764, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1404, 1736112764, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1405, 1736112784, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1406, 1736112784, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1407, 1736112827, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1408, 1736112827, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1409, 1736112856, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1410, 1736112856, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1411, 1736112938, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1412, 1736112938, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1413, 1736112956, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1414, 1736112956, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1415, 1736112974, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1416, 1736112974, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1417, 1736112983, 1, 'admin', 22, '1', 'DLCrumbs', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1418, 1736113094, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1419, 1736113094, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1420, 1736113112, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1421, 1736113112, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1422, 1736113123, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1423, 1736113123, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1424, 1736113197, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1425, 1736113197, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1426, 1736113305, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1427, 1736113305, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1428, 1736113327, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1429, 1736113327, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1430, 1736113552, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1431, 1736113552, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1432, 1736113604, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1433, 1736113604, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1434, 1736113637, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1435, 1736113637, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1436, 1736113663, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1437, 1736113663, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1438, 1736113720, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1439, 1736113720, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1440, 1736113782, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1441, 1736113782, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1442, 1736113833, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1443, 1736113833, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1444, 1736113893, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1445, 1736113893, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1446, 1736113937, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1447, 1736113937, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1448, 1736113959, 1, 'admin', 79, '21', 'breadcrumbs', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1449, 1736113959, 1, 'admin', 78, '21', 'breadcrumbs', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1450, 1736114065, 1, 'admin', 78, '23', 'catalog_content', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1451, 1736114074, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1452, 1736114115, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1453, 1736114115, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1454, 1736114146, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1455, 1736114146, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1456, 1736114243, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1457, 1736114243, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1458, 1736114321, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1459, 1736114321, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1460, 1736114351, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1461, 1736114351, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1462, 1736114415, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1463, 1736114416, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1464, 1736114610, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1465, 1736114610, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1466, 1736114641, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1467, 1736114641, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1468, 1736114680, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1469, 1736114680, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1470, 1736114702, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1471, 1736114702, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1472, 1736114724, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1473, 1736114724, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1474, 1736114752, 1, 'admin', 27, '53', 'Каталог', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1475, 1736114766, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1476, 1736114766, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1477, 1736115007, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1478, 1736115007, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1479, 1736115039, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1480, 1736115039, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1481, 1736115055, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1482, 1736115055, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1483, 1736115092, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1484, 1736115092, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1485, 1736115149, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1486, 1736115149, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1487, 1736115163, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1488, 1736115163, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1489, 1736115219, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1490, 1736115219, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1491, 1736115233, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1492, 1736115233, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1493, 1736115250, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1494, 1736115250, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1495, 1736115266, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1496, 1736115266, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1497, 1736115284, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1498, 1736115284, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1499, 1736115298, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1500, 1736115298, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1501, 1736115310, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1502, 1736115310, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1503, 1736115425, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1504, 1736115425, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1505, 1736115565, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1506, 1736115565, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1507, 1736115580, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1508, 1736115580, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1509, 1736115650, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1510, 1736115650, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1511, 1736115659, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1512, 1736115659, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1513, 1736115735, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1514, 1736115735, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1515, 1736115857, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1516, 1736115857, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1517, 1736115917, 1, 'admin', 79, '25', 'sidebar_menu', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1518, 1736115917, 1, 'admin', 78, '25', 'sidebar_menu', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1519, 1736115933, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1520, 1736115950, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1521, 1736115950, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1522, 1736116102, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1523, 1736116131, 1, 'admin', 79, '-', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1524, 1736116131, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1525, 1736116182, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1526, 1736116182, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1527, 1736116185, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1528, 1736116185, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1529, 1736116246, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1530, 1736116246, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1531, 1736116465, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1532, 1736116465, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1533, 1736116474, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1534, 1736116474, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1535, 1736116515, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1536, 1736116515, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1537, 1736116548, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1538, 1736116602, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1539, 1736116602, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1540, 1736116605, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1541, 1736116605, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1542, 1736116657, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1543, 1736116657, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1544, 1736116677, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1545, 1736116678, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1546, 1736116701, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1547, 1736116701, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1548, 1736116771, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1549, 1736116771, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1550, 1736116860, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1551, 1736116860, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1552, 1736117246, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1553, 1736117246, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1554, 1736117254, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1555, 1736117254, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1556, 1736117285, 1, 'admin', 78, '27', 'catalog_pagination', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1557, 1736117331, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1558, 1736117331, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1559, 1736117345, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1560, 1736117345, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1561, 1736117353, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1562, 1736117354, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1563, 1736117359, 1, 'admin', 79, '26', 'catalog_products', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1564, 1736117359, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1565, 1736117376, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1566, 1736117384, 1, 'admin', 80, '27', 'catalog_pagination', 'Deleting Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1567, 1736117384, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1568, 1736117429, 1, 'admin', 78, '22', 'header_h1', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1569, 1736117450, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1570, 1736117512, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1571, 1736117512, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1572, 1736117570, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1573, 1736117570, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1574, 1736117592, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1575, 1736117592, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1576, 1736118299, 1, 'admin', 79, '29', 'ListProducts', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1577, 1736118299, 1, 'admin', 78, '29', 'ListProducts', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1578, 1736118457, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1579, 1736118501, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1580, 1736118501, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1581, 1736118504, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1582, 1736118516, 1, 'admin', 5, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1583, 1736118516, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1584, 1736118517, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1585, 1736118526, 1, 'admin', 5, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1586, 1736118526, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1587, 1736118527, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1588, 1736118538, 1, 'admin', 5, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1589, 1736118538, 1, 'admin', 27, '70', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1590, 1736118539, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1591, 1736118552, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1592, 1736118659, 1, 'admin', 5, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1593, 1736118659, 1, 'admin', 27, '72', 'Смартфон Realme C25S 4/64 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1594, 1736118668, 1, 'admin', 5, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1595, 1736118668, 1, 'admin', 27, '71', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1596, 1736118671, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1597, 1736118677, 1, 'admin', 5, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1598, 1736118677, 1, 'admin', 27, '73', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1599, 1736118720, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1600, 1736118720, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1601, 1736118730, 1, 'admin', 5, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1602, 1736118730, 1, 'admin', 27, '68', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1603, 1736118739, 1, 'admin', 5, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1604, 1736118739, 1, 'admin', 27, '69', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1605, 1736118763, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1606, 1736118764, 1, 'admin', 5, '54', 'Смартфоны', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1607, 1736118764, 1, 'admin', 27, '54', 'Смартфоны', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1608, 1736118860, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1609, 1736118861, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1610, 1736118875, 1, 'admin', 5, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1611, 1736118875, 1, 'admin', 27, '67', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1612, 1736118940, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1613, 1736119076, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1614, 1736119078, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1615, 1736119171, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1616, 1736119171, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1617, 1736119216, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1618, 1736119216, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1619, 1736119368, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1620, 1736119368, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1621, 1736119390, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1622, 1736119391, 1, 'admin', 77, '', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1623, 1736119393, 1, 'admin', 79, '-', 'ListCatalogFooter', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1624, 1736119393, 1, 'admin', 78, '30', 'ListCatalogFooter', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1625, 1736119445, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1626, 1736119445, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1627, 1736119489, 1, 'admin', 79, '30', 'ListCatalogFooter', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1628, 1736119490, 1, 'admin', 78, '30', 'ListCatalogFooter', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1629, 1736119507, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1630, 1736119507, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1631, 1736119535, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1632, 1736119535, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1633, 1736119559, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1634, 1736119559, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1635, 1736119606, 1, 'admin', 79, '30', 'ListCatalogFooter', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1636, 1736119606, 1, 'admin', 78, '30', 'ListCatalogFooter', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1637, 1736119640, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1638, 1736119640, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1639, 1736119688, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1640, 1736119688, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1641, 1736119703, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1642, 1736119703, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1643, 1736119718, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1644, 1736119734, 1, 'admin', 80, '30', 'ListCatalogFooter', 'Deleting Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1645, 1736119734, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1646, 1736119739, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1647, 1736119741, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1648, 1736119747, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1649, 1736119747, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1650, 1736119787, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1651, 1736119787, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1652, 1736119948, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1653, 1736119948, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1654, 1736119971, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1655, 1736119971, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1656, 1736120009, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1657, 1736120009, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1658, 1736120089, 1, 'admin', 27, '62', 'Покупателю', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1659, 1736120096, 1, 'admin', 5, '62', 'Покупателю', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1660, 1736120096, 1, 'admin', 27, '62', 'Покупателю', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1661, 1736120416, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1662, 1736120433, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1663, 1736120482, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1664, 1736120572, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1665, 1736120601, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1666, 1736120638, 1, 'admin', 112, '1', 'Extras', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1667, 1736120642, 1, 'admin', 112, '2', 'Doc Manager', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1668, 1736120648, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1669, 1736120662, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1670, 1736120706, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1671, 1736121801, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1672, 1736121812, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1673, 1736121860, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1674, 1736121899, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1675, 1736121903, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1676, 1736121932, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1677, 1736121964, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1678, 1736122083, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1679, 1736122087, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1680, 1736122108, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1681, 1736122167, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1682, 1736122167, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1683, 1736122191, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1684, 1736122275, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1685, 1736122283, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1686, 1736122369, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1687, 1736122381, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1688, 1736122397, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1689, 1736122412, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1690, 1736122412, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1691, 1736122560, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1692, 1736122569, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1693, 1736122611, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1694, 1736122611, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1695, 1736122614, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1696, 1736122621, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1697, 1736122629, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1698, 1736122912, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1699, 1736123015, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1700, 1736123025, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1701, 1736123025, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1702, 1736123036, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1703, 1736123059, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1704, 1736123273, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1705, 1736123542, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1706, 1736123551, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1707, 1736123653, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1708, 1736123673, 1, 'admin', 301, '11', 'category_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1709, 1736123689, 1, 'admin', 78, '26', 'catalog_products', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1710, 1736123719, 1, 'admin', 78, '16', 'head', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1711, 1736123749, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1712, 1736123749, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1713, 1736123815, 1, 'admin', 78, '19', 'home_page_categories', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1714, 1736123909, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1715, 1736123910, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1716, 1736124092, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1717, 1736124092, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1718, 1736124142, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1719, 1736124142, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1720, 1736124459, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1721, 1736124483, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1722, 1736124681, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1723, 1736124689, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1724, 1736124689, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1725, 1736124893, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1726, 1736125002, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1727, 1736125002, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1728, 1736125026, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1729, 1736125026, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1730, 1736125042, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1731, 1736125042, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1732, 1736125053, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1733, 1736125053, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1734, 1736125085, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1735, 1736125085, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1736, 1736125267, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1737, 1736125267, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1738, 1736125374, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1739, 1736125374, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1740, 1736125630, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1741, 1736125630, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1742, 1736125681, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1743, 1736125681, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1744, 1736125720, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1745, 1736125720, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1746, 1736125750, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1747, 1736125767, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1748, 1736125767, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1749, 1736125838, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1750, 1736125838, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1751, 1736125858, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1752, 1736125858, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1753, 1736125886, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1754, 1736125887, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1755, 1736125901, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1756, 1736125901, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1757, 1736125948, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1758, 1736125948, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1759, 1736125968, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1760, 1736125968, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1761, 1736125983, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1762, 1736125983, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1763, 1736126013, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1764, 1736126013, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1765, 1736126065, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1766, 1736126065, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1767, 1736126201, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1768, 1736126201, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1769, 1736126247, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1770, 1736126247, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1771, 1736126280, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1772, 1736126281, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1773, 1736126292, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1774, 1736126292, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1775, 1736126296, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1776, 1736126296, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1777, 1736126307, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1778, 1736126307, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1779, 1736126326, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1780, 1736126326, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1781, 1736126353, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1782, 1736126353, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1783, 1736126420, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1784, 1736126420, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1785, 1736126439, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1786, 1736126439, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1787, 1736126442, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1788, 1736126442, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1789, 1736126485, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1790, 1736126485, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1791, 1736126648, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1792, 1736126705, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1793, 1736126749, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1794, 1736126825, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1795, 1736126830, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1796, 1736126851, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1797, 1736126857, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1798, 1736126868, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1799, 1736126869, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1800, 1736126890, 1, 'admin', 78, '28', 'tplCategory', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1801, 1736126914, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1802, 1736127032, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1803, 1736127075, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1804, 1736127075, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1805, 1736127098, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1806, 1736127098, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1807, 1736127140, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1808, 1736127140, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1809, 1736127160, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1810, 1736127160, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1811, 1736127224, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1812, 1736127224, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1813, 1736127292, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1814, 1736127292, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1815, 1736127405, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1816, 1736127405, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1817, 1736127493, 1, 'admin', 23, '', 'Новый сниппет', 'Creating a new Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1818, 1736127530, 1, 'admin', 24, '-', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1819, 1736127531, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1820, 1736127538, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1821, 1736127538, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1822, 1736127684, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1823, 1736127684, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1824, 1736127704, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1825, 1736127704, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1826, 1736127737, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1827, 1736127737, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1828, 1736127788, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1829, 1736127788, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1830, 1736128029, 1, 'admin', 26, '', 'ClientSettings', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1831, 1736128030, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1832, 1736128070, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1833, 1736128109, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1834, 1736128115, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1835, 1736128120, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1836, 1736128170, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1837, 1736128173, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1838, 1736128185, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1839, 1736128185, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1840, 1736128200, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1841, 1736128200, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1842, 1736128225, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1843, 1736128225, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1844, 1736128258, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1845, 1736128258, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1846, 1736128269, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1847, 1736128269, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1848, 1736128286, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1849, 1736128286, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1850, 1736128331, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1851, 1736128424, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1852, 1736128424, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1853, 1736128448, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1854, 1736128448, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1855, 1736128461, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1856, 1736128461, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1857, 1736128474, 1, 'admin', 22, '1', 'DLCrumbs', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1858, 1736128536, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1859, 1736128536, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1860, 1736128549, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1861, 1736128549, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1862, 1736128583, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1863, 1736128595, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1864, 1736128663, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1865, 1736128663, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1866, 1736128695, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1867, 1736128695, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1868, 1736128741, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1869, 1736128741, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1870, 1736128777, 1, 'admin', 24, '37', 'getPhonesFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1871, 1736128777, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1872, 1736128795, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1873, 1736128795, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1874, 1736170174, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1875, 1736170482, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1876, 1736170544, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1877, 1736170553, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1878, 1736170566, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1879, 1736170566, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1880, 1736170576, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1881, 1736170583, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1882, 1736170670, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1883, 1736170680, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1884, 1736170680, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1885, 1736170786, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1886, 1736170786, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1887, 1736170802, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1888, 1736170818, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1889, 1736170866, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1890, 1736170866, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1891, 1736170891, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1892, 1736170891, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1893, 1736170901, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1894, 1736170913, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1895, 1736170981, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1896, 1736171145, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1897, 1736171195, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1898, 1736171504, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1899, 1736171504, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1900, 1736171530, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1901, 1736171530, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1902, 1736171557, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1903, 1736171604, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1904, 1736171611, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1905, 1736171840, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1906, 1736171872, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1907, 1736171872, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1908, 1736172003, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1909, 1736172003, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1910, 1736172021, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1911, 1736172063, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1912, 1736172116, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1913, 1736172116, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1914, 1736172149, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1915, 1736172149, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1916, 1736172225, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1917, 1736172225, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1918, 1736172272, 1, 'admin', 22, '34', 'multiTV', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1919, 1736172400, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1920, 1736172400, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1921, 1736172439, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1922, 1736172439, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1923, 1736172451, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1924, 1736172451, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1925, 1736172745, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1926, 1736173127, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1927, 1736173129, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1928, 1736173135, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1929, 1736173144, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1930, 1736173155, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1931, 1736173155, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1932, 1736173180, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1933, 1736173180, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1934, 1736173250, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1935, 1736173250, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1936, 1736173320, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1937, 1736173320, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1938, 1736173361, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1939, 1736173363, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1940, 1736173366, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1941, 1736173366, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1942, 1736173427, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1943, 1736173427, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1944, 1736173462, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1945, 1736173462, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1946, 1736173493, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1947, 1736173493, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1948, 1736173522, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1949, 1736173522, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1950, 1736173784, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1951, 1736173784, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1952, 1736173829, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1953, 1736173829, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1954, 1736173847, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1955, 1736173847, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1956, 1736173892, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1957, 1736173921, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1958, 1736174086, 1, 'admin', 67, '-', '-', 'Removing locks', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1959, 1736174117, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1960, 1736174117, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1961, 1736174218, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1962, 1736174218, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1963, 1736174231, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1964, 1736174231, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1965, 1736174251, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1966, 1736174251, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1967, 1736174267, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1968, 1736174267, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1969, 1736174280, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1970, 1736174280, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1971, 1736174293, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1972, 1736174293, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1973, 1736174307, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1974, 1736174307, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1975, 1736174822, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1976, 1736174822, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1977, 1736174833, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1978, 1736174833, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1979, 1736175449, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1980, 1736175459, 1, 'admin', 302, '-', 'footer_phones', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1981, 1736175459, 1, 'admin', 301, '15', 'footer_phones', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1982, 1736175469, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1983, 1736175469, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1984, 1736175483, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1985, 1736175491, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1986, 1736175491, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1987, 1736175516, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1988, 1736175516, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1989, 1736175564, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1990, 1736175564, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1991, 1736175587, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1992, 1736175587, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1993, 1736175604, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1994, 1736175626, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1995, 1736175627, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1996, 1736175638, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1997, 1736175638, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1998, 1736175661, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(1999, 1736175661, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2000, 1736175770, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2001, 1736175770, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2002, 1736175848, 1, 'admin', 300, '', 'Новый параметр (TV)', 'Create Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2003, 1736175860, 1, 'admin', 302, '-', 'footer_phones123', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2004, 1736175860, 1, 'admin', 301, '16', 'footer_phones123', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2005, 1736175872, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2006, 1736175882, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2007, 1736175882, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2008, 1736175894, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2009, 1736175901, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2010, 1736175901, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2011, 1736175916, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2012, 1736175917, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2013, 1736176068, 1, 'admin', 78, '18', 'banner', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2014, 1736176088, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2015, 1736176088, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2016, 1736176102, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2017, 1736176102, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2018, 1736176196, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2019, 1736176196, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2020, 1736176275, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2021, 1736176275, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2022, 1736176295, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2023, 1736176295, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2024, 1736176340, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2025, 1736176340, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2026, 1736176428, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2027, 1736176428, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2028, 1736176448, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2029, 1736176448, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2030, 1736176454, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2031, 1736176454, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2032, 1736176522, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2033, 1736176523, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2034, 1736176554, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2035, 1736176554, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2036, 1736176597, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2037, 1736176597, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2038, 1736176603, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2039, 1736176603, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2040, 1736176659, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2041, 1736176659, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2042, 1736176684, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2043, 1736176684, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2044, 1736176713, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2045, 1736176713, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2046, 1736176728, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2047, 1736176743, 1, 'admin', 303, '15', 'footer_phones', 'Delete Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2048, 1736176743, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2049, 1736176748, 1, 'admin', 303, '16', 'footer_phones123', 'Delete Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2050, 1736176748, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2051, 1736176829, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2052, 1736176885, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2053, 1736176885, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2054, 1736176890, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2055, 1736176894, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2056, 1736176894, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2057, 1736176985, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2058, 1736176996, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2059, 1736176996, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2060, 1736177019, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2061, 1736177019, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2062, 1736177067, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2063, 1736177070, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2064, 1736177104, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2065, 1736177104, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2066, 1736177366, 1, 'admin', 22, '34', 'multiTV', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2067, 1736177372, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2068, 1736177519, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2069, 1736177600, 1, 'admin', 23, '', 'Новый сниппет', 'Creating a new Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2070, 1736177648, 1, 'admin', 24, '-', 'getPhonesFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2071, 1736177648, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2072, 1736177687, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2073, 1736177687, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2074, 1736177717, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2075, 1736177732, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2076, 1736177747, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2077, 1736177758, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2078, 1736177777, 1, 'admin', 24, '38', 'getPhonesFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2079, 1736177777, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2080, 1736177785, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2081, 1736177798, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2082, 1736177808, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2083, 1736177808, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2084, 1736177866, 1, 'admin', 24, '38', 'getPhonesFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2085, 1736177866, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2086, 1736177891, 1, 'admin', 24, '38', 'getPhonesFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2087, 1736177891, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2088, 1736177906, 1, 'admin', 24, '38', 'getPhonesFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2089, 1736177906, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2090, 1736177909, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2091, 1736177909, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2092, 1736177917, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2093, 1736177922, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2094, 1736177984, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2095, 1736177988, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2096, 1736178007, 1, 'admin', 24, '38', 'getPhonesFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2097, 1736178007, 1, 'admin', 22, '38', 'getPhonesFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2098, 1736178028, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2099, 1736178029, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2100, 1736178034, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2101, 1736178065, 1, 'admin', 23, '', 'Новый сниппет', 'Creating a new Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2102, 1736178146, 1, 'admin', 24, '-', 'getEmailsFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2103, 1736178146, 1, 'admin', 22, '39', 'getEmailsFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2104, 1736178216, 1, 'admin', 24, '39', 'getEmailsFooterFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2105, 1736178216, 1, 'admin', 22, '39', 'getEmailsFooterFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2106, 1736178218, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2107, 1736178218, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2108, 1736178239, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2109, 1736178239, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2110, 1736178252, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2111, 1736178261, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2112, 1736178307, 1, 'admin', 22, '37', 'getPhonesFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2113, 1736178321, 1, 'admin', 24, '37', 'getPhonesHeaderFromSettings', 'Saving Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2114, 1736178321, 1, 'admin', 22, '37', 'getPhonesHeaderFromSettings', 'Editing Snippet', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2115, 1736178328, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2116, 1736178332, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2117, 1736178332, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2118, 1736178338, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2119, 1736178340, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2120, 1736178351, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2121, 1736178379, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2122, 1736178379, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2123, 1736178382, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2124, 1736186067, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2125, 1736186067, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2126, 1736186121, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2127, 1736186121, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2128, 1736186173, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2129, 1736186174, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2130, 1736186208, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2131, 1736186208, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2132, 1736186441, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2133, 1736186461, 1, 'admin', 79, '17', 'footer', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2134, 1736186461, 1, 'admin', 78, '17', 'footer', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');
INSERT INTO `fobw_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(2135, 1736186553, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2136, 1736186560, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2137, 1736186560, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2138, 1736186675, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2139, 1736186675, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2140, 1736186755, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2141, 1736186755, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2142, 1736186812, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2143, 1736186812, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2144, 1736186881, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2145, 1736186881, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2146, 1736186905, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2147, 1736186905, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2148, 1736186922, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2149, 1736186922, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2150, 1736186940, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2151, 1736186940, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2152, 1736186946, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2153, 1736186946, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2154, 1736187096, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2155, 1736187096, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2156, 1736187357, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2157, 1736187357, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2158, 1736187621, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2159, 1736187621, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2160, 1736187636, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2161, 1736187636, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2162, 1736187770, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2163, 1736187770, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2164, 1736187913, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2165, 1736187913, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2166, 1736188204, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2167, 1736188204, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2168, 1736188376, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2169, 1736188390, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2170, 1736188475, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2171, 1736188475, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2172, 1736188478, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2173, 1736198961, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2174, 1736198995, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2175, 1736198995, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2176, 1736199083, 1, 'admin', 79, '20', 'home_page_about', 'Saving Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2177, 1736199083, 1, 'admin', 78, '20', 'home_page_about', 'Editing Chunk (HTML Snippet)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2178, 1736199108, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2179, 1736199110, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2180, 1736199244, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2181, 1736199340, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2182, 1736199542, 1, 'admin', 30, '', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2183, 1736199657, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2184, 1736199698, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2185, 1736199730, 1, 'admin', 30, '', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2186, 1736199733, 1, 'admin', 17, '', '-', 'Editing settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2187, 1736199742, 1, 'admin', 30, '', '-', 'Saving settings', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2188, 1736199746, 1, 'admin', 10, '', '-', 'Viewing/ composing messages', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2189, 1736199758, 1, 'admin', 114, '', '-', 'View event log', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2190, 1736199764, 1, 'admin', 116, '', '-', 'Delete event log', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2191, 1736199764, 1, 'admin', 114, '', '-', 'View event log', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2192, 1736199783, 1, 'admin', 114, '', '-', 'View event log', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2193, 1736199790, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2194, 1736199858, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2195, 1736199891, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2196, 1736199903, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2197, 1736199921, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2198, 1736199938, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2199, 1736199947, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2200, 1736199963, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2201, 1736199990, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2202, 1736199995, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2203, 1736199999, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2204, 1736200042, 1, 'admin', 301, '7', 'og_description', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2205, 1736200144, 1, 'admin', 302, '7', 'og_description', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2206, 1736200144, 1, 'admin', 301, '7', 'og_description', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2207, 1736200147, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2208, 1736200169, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2209, 1736200175, 1, 'admin', 301, '8', 'og_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2210, 1736200180, 1, 'admin', 302, '8', 'og_image', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2211, 1736200180, 1, 'admin', 301, '8', 'og_image', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2212, 1736200184, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2213, 1736200186, 1, 'admin', 301, '6', 'og_title', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2214, 1736200190, 1, 'admin', 302, '6', 'og_title', 'Save Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2215, 1736200190, 1, 'admin', 301, '6', 'og_title', 'Edit Template Variable', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2216, 1736200196, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2217, 1736200206, 1, 'admin', 112, '3', 'ClientSettings', 'Execute module', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2218, 1736200208, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2219, 1736200210, 1, 'admin', 26, '', '-', 'Refreshing site', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2220, 1736200215, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2221, 1736200227, 1, 'admin', 76, '', '-', 'Element management', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2222, 1736200229, 1, 'admin', 16, '5', 'Главная', 'Editing template', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2223, 1736200697, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2224, 1736200705, 1, 'admin', 8, '', '-', 'Logged out', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2225, 1736200709, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2226, 1736200712, 1, 'admin', 8, '', '-', 'Logged out', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2227, 1736200720, 1, 'admin', 58, '-', 'MODX', 'Logged in', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2228, 1736200948, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
(2229, 1736200950, 1, 'admin', 27, '4', 'Profile', 'Editing resource', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_manager_users`
--

CREATE TABLE `fobw_manager_users` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains login information for backend users.';

--
-- Дамп данных таблицы `fobw_manager_users`
--

INSERT INTO `fobw_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$P$BcTB5eywTo0jYhdEDwY6zmVTAQz3.h1');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_membergroup_access`
--

CREATE TABLE `fobw_membergroup_access` (
  `id` int NOT NULL,
  `membergroup` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_membergroup_names`
--

CREATE TABLE `fobw_membergroup_names` (
  `id` int NOT NULL,
  `name` varchar(245) COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_member_groups`
--

CREATE TABLE `fobw_member_groups` (
  `id` int NOT NULL,
  `user_group` int NOT NULL DEFAULT '0',
  `member` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_content`
--

CREATE TABLE `fobw_site_content` (
  `id` int NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'document',
  `contentType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `longtitle` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `alias` varchar(245) COLLATE utf8mb4_general_ci DEFAULT '',
  `link_attributes` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int NOT NULL DEFAULT '0',
  `pub_date` int NOT NULL DEFAULT '0',
  `unpub_date` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `isfolder` int NOT NULL DEFAULT '0',
  `introtext` text COLLATE utf8mb4_general_ci COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext COLLATE utf8mb4_general_ci,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int NOT NULL DEFAULT '0',
  `menuindex` int NOT NULL DEFAULT '0',
  `searchable` int NOT NULL DEFAULT '1',
  `cacheable` int NOT NULL DEFAULT '1',
  `createdby` int NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedby` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `deletedon` int NOT NULL DEFAULT '0',
  `deletedby` int NOT NULL DEFAULT '0',
  `publishedon` int NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the site document tree.';

--
-- Дамп данных таблицы `fobw_site_content`
--

INSERT INTO `fobw_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная', 'Главная', 'Описание для главной', 'index', '', 1, 0, 0, 0, 0, '', '', 1, 5, 0, 1, 1, 1, 1144904400, 1, 1736176894, 0, 0, 0, 0, 0, 'Home', 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Profile', 'User profile', '', 'profile', '', 1, 0, 0, 0, 1, '', '[!FormLister?\n&formid=`login`\n&controller=`Login`\n&loginField=`email`\n&redirectTo=`49`\n&defaults=`{\"rememberme\":1}`\n&formControls=`rememberme`\n&rules=`{\n \"email\":{\n       \"required\":\"Enter your Email\",\n                \"email\":\"You should enter correct Email\"\n  },\n    \"password\":{\n        \"required\":\"Enter your password\"\n  }\n}`\n&formTpl=`@CODE:\n\n<p>In order to comment on blog entries, you must be a registered user of [(site_name)]. If you haven\'t already registered, you can <a href=\"[~5~]\">request an account</a>.</p>\n\n<form class=\"form-horizontal\" method=\"post\" action=\"[(site_url)][~[*id*]~]\">\n    [+form.messages+]\n <input type=\"hidden\" name=\"formid\" value=\"login\">\n   <div class=\"form-group [+email.classname+] row\">\n        <div class=\"col-sm-12\">\n         <label for=\"email\">Email:</label>\n           <input class=\"form-control\" name=\"email\" value=\"[+email.value+]\" id=\"email\" placeholder=\"Email\">\n        </div>\n    </div>\n    <div class=\"form-group [+password.classname+]\">\n     <div class=\"col-sm-12\">\n         <label for=\"password\">Password:</label>\n         <input type=\"password\" class=\"form-control\" name=\"password\" id=\"password\" placeholder=\"Password\" value=\"[+password.value+]\">\n      </div>\n    </div>\n    <div class=\"form-group\">\n        <div class=\"col-sm-12\">\n         <div class=\"checkbox\">\n              <label>\n                   <input type=\"checkbox\" name=\"rememberme\" value=\"1\" [+c.rememberme.1+]> Remember me\n              </label>\n          </div>\n        </div>\n    </div>\n    <div class=\"form-group\">\n        <div class=\"col-sm-8 col-xs-8 sign-in-block\">\n           <a href=\"[~37~]\">Forgot Password</a>\n        </div>\n        <div class=\"col-sm-4 col-xs-4 login-button\">\n            <button type=\"submit\" class=\"btn btn-primary pull-right\"><i class=\"glyphicon glyphicon-log-in\"></i> Login</button>\n      </div>\n    </div>\n    \n</form>\n`\n&skipTpl=`@CODE:\n    <div class=\"text-center\">Hello!</div>\n   <div class=\"text-center\">\n       <a class=\"btn btn-primary\" href=\"[~49~]\"> Edit profile</a> \n       <a class=\"btn btn-primary\" href=\"?logout\"> Logout</a>\n </div>`\n&errorTpl=`@CODE:<p>[+message+]</p>`\n&messagesOuterTpl=`@CODE:\n  <div class=\"text-danger\">[+messages+]</div>`\n&errorClass=` has-error` \n&requiredClass=` has-warning`\n!]', 0, 4, 6, 0, 1, 1, 1144904400, 1, 1533412259, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(7, 'document', 'text/html', '404 - Document Not Found', 'Uh oh ... it\'s a 404! (Page Not Found)', '', 'doc-not-found', '', 1, 0, 0, 0, 0, '', '<p>Looks like you tried to go somewhere that does not exist... perhaps you <a>need to login</a> or you\'d like one of the following pages instead:</p>\n<p>[[DLMenu? &amp;parents=`0`]]</p>\n<h3>Want to find it the old fashioned way? Use the site search at the top of this site to find what you seek.</h3>', 1, 4, 9, 0, 1, 1, 1144904400, 1, 1507728168, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(8, 'document', 'text/html', 'Search Results', 'Your Search Results', '', 'search-results', '', 1, 0, 0, 0, 0, '', '[!AjaxSearch? &showInputForm=`0` &ajaxSearch=`0`!]', 0, 4, 7, 0, 1, 1, 1144904400, 1, 1507728119, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 1, 1),
(11, 'document', 'application/rss+xml', 'RSS Feed', '[(site_name)] RSS Feed', '', 'feed.rss', '', 1, 0, 0, 0, 0, '', '<!--<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">-->\n\n<channel>\n  <title>[(site_name)]</title>\n  <link>[(site_url)]</link>\n  <description>Evolution CMS demo site Feed</description>\n  [[DocLister? \n    &parents=`2`  \n    &display=`20`\n &summary=`notags,len:350` \n    &urlScheme=`full`  \n    &tpl=`@CODE:<item>\n            <title>[+e.title+]</title>\n            <link>[+url+]</link>\n           <description><! [CDATA[ [+summary+] ] ]></description>\n            <pubDate>[+date+]</pubDate>\n           <guid isPermaLink=\"false\">[+url+]</guid>\n         <dc:creator>[+author+]</dc:creator>\n       </item>`\n  ]]\n</channel>\n</rss>', 0, 0, 8, 0, 1, 1, 1144904400, 1, 1507728107, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(67, 'document', 'text/html', 'Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий', '', '', 'smartfon-xiaomi-redmi-note-10s-6-128-gb-sinij', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992135, 1, 1736118875, 0, 0, 0, 1735992135, 1, '', 0, 0, 0, 0, 0, 1),
(68, 'document', 'text/html', 'Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой', '', '', 'smartfon-xiaomi-redmi-9a-2-32-gb-goluboj', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992154, 1, 1736118730, 0, 0, 0, 1735992297, 1, '', 0, 0, 0, 0, 0, 1),
(69, 'document', 'text/html', 'Смартфон Poco POCO M5 4/64 ГБ, желтый', '', '', 'smartfon-poco-poco-m5-4-64-gb-zheltyj', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992173, 1, 1736118739, 0, 0, 0, 1735992301, 1, '', 0, 0, 0, 0, 0, 1),
(48, 'document', 'text/xml', 'sitemap.xml', '', '', 'sitemap.xml', '', 1, 0, 0, 0, 0, '', '[[DLSitemap]]', 0, 0, 10, 1, 1, 1, 1507726985, 1, 1507727020, 0, 0, 0, 1507726985, 1, '', 0, 0, 0, 0, 1, 1),
(73, 'document', 'text/html', 'Смартфон Apple iPhone 12 256 ГБ, фиолетовый', '', '', 'smartfon-apple-iphone-12-256-gb-fioletovyj', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992253, 1, 1736118677, 0, 0, 0, 1735992320, 1, '', 0, 0, 0, 0, 0, 1),
(72, 'document', 'text/html', 'Смартфон Realme C25S 4/64 ГБ, синий', '', '', 'smartfon-realme-c25s-4-64-gb-sinij', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992234, 1, 1736118659, 0, 0, 0, 1735992315, 1, '', 0, 0, 0, 0, 0, 1),
(71, 'document', 'text/html', 'Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) RED', '', '', 'smartfon-apple-iphone-13-512-gb-product-red', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992214, 1, 1736118668, 0, 0, 0, 1735992310, 1, '', 0, 0, 0, 0, 0, 1),
(70, 'document', 'text/html', 'Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый', '', '', 'smartfon-xiaomi-redmi-note-10-4-64-gb-seryj', '', 1, 0, 0, 54, 0, '', '', 1, 7, 0, 1, 1, 1, 1735992191, 1, 1736118538, 0, 0, 0, 1735992305, 1, '', 0, 0, 0, 0, 0, 1),
(53, 'document', 'text/html', 'Каталог', '', '', 'katalog', '', 1, 0, 0, 0, 1, '', '', 1, 8, 14, 1, 1, 1, 1735816874, 1, 1735915755, 0, 0, 0, 1735816874, 1, '', 0, 0, 0, 0, 0, 1),
(54, 'document', 'text/html', 'Смартфоны', '23424', '', 'smartfony', '', 1, 0, 0, 53, 1, '', '<section class=\"seo-text\">\r\n<h2>Контент для SEO-продвижения</h2>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, est harum tempora accusantium eos tenetur obcaecati beatae quis veritatis nihil, quibusdam ullam sit ducimus praesentium tempore voluptates? Natus, numquam corrupti.</p>\r\n</section>', 1, 6, 0, 1, 1, 1, 1735816916, 1, 1736118764, 0, 0, 0, 1735816916, 1, '', 0, 0, 0, 0, 0, 1),
(56, 'document', 'text/html', 'Ноутбуки', '', '', 'noutbuki', '', 1, 0, 0, 53, 0, '', '', 1, 6, 2, 1, 1, 1, 1735816966, 1, 1736111396, 0, 0, 0, 1735816966, 1, '', 0, 0, 0, 0, 0, 1),
(55, 'document', 'text/html', 'Планшеты', '', '', 'planshety', '', 1, 0, 0, 53, 0, '', '', 1, 6, 1, 1, 1, 1, 1735816932, 1, 1736111387, 0, 0, 0, 1735816932, 1, '', 0, 0, 0, 0, 0, 1),
(57, 'document', 'text/html', 'Наушники и аудиотехника', '', '', 'naushniki-i-audiotehnika', '', 1, 0, 0, 53, 0, '', '', 1, 6, 3, 1, 1, 1, 1735816978, 1, 1736111404, 0, 0, 0, 1735816978, 1, '', 0, 0, 0, 0, 0, 1),
(58, 'document', 'text/html', 'Телевизоры и видеотехника', '', '', 'televizory-i-videotehnika', '', 1, 0, 0, 53, 0, '', '', 1, 6, 4, 1, 1, 1, 1735817000, 1, 1736111413, 0, 0, 0, 1735817000, 1, '', 0, 0, 0, 0, 0, 1),
(59, 'document', 'text/html', 'Бытовая техника', '', '', 'bytovaya-tehnika', '', 1, 0, 0, 53, 0, '', '', 1, 6, 5, 1, 1, 1, 1735817011, 1, 1736111421, 0, 0, 0, 1735817011, 1, '', 0, 0, 0, 0, 0, 1),
(60, 'document', 'text/html', 'О компании', '', '', 'o-kompanii', '', 1, 0, 0, 0, 0, '', '', 1, 8, 15, 1, 1, 1, 1735817018, 1, 1735915762, 0, 0, 0, 1735817018, 1, '', 0, 0, 0, 0, 0, 1),
(61, 'document', 'text/html', 'Услуги', '', '', 'uslugi', '', 1, 0, 0, 0, 0, '', '', 1, 8, 16, 1, 1, 1, 1735817026, 1, 1735915774, 0, 0, 0, 1735817026, 1, '', 0, 0, 0, 0, 0, 1),
(62, 'document', 'text/html', 'Покупателю', '', '', 'pokupatelyu', '', 1, 0, 0, 0, 1, '', '<p>[!FirstChildRedirect!]</p>', 1, 8, 17, 1, 1, 1, 1735817033, 1, 1736120096, 0, 0, 0, 1735817033, 1, '', 0, 0, 0, 0, 0, 1),
(63, 'document', 'text/html', 'Доставка', '', '', 'dostavka', '', 1, 0, 0, 62, 0, '', '', 1, 8, 0, 1, 1, 1, 1735817039, 1, 1735915792, 0, 0, 0, 1735817039, 1, '', 0, 0, 0, 0, 0, 1),
(64, 'document', 'text/html', 'Оплата', '', '', 'oplata', '', 1, 0, 0, 62, 0, '', '', 1, 8, 1, 1, 1, 1, 1735817045, 1, 1735915797, 0, 0, 0, 1735817045, 1, '', 0, 0, 0, 0, 0, 1),
(65, 'document', 'text/html', 'Контакты', '', '', 'kontakty', '', 1, 0, 0, 0, 0, '', '<section class=\"seo-text\">\r\n<h2>Контент для SEO-продвижения</h2>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, est harum tempora accusantium eos tenetur obcaecati beatae quis veritatis nihil, quibusdam ullam sit ducimus praesentium tempore voluptates? Natus, numquam corrupti.</p>\r\n</section>', 1, 8, 19, 1, 1, 1, 1735817053, 1, 1735945648, 0, 0, 0, 1735817053, 1, '', 0, 0, 0, 0, 0, 1),
(66, 'document', 'text/html', 'Ошибка 404', '', '', '404', '', 1, 0, 0, 0, 0, '', '', 1, 8, 20, 1, 1, 1, 1735817059, 1, 1735915816, 0, 0, 0, 1735817059, 1, '', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_htmlsnippets`
--

CREATE TABLE `fobw_site_htmlsnippets` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Chunk',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'none',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext COLLATE utf8mb4_general_ci,
  `locked` tinyint NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `disabled` tinyint NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the site chunks.';

--
-- Дамп данных таблицы `fobw_site_htmlsnippets`
--

INSERT INTO `fobw_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'header', 'sample header scripts', 2, 'none', 2, 0, '<header class=\"header\">\r\n    <div class=\"header-wrap\">\r\n        <div class=\"header-top\">\r\n            <nav class=\"menu\">\r\n                <ul>\r\n					[!DocLister?\r\n        				&documents=`[(client_header_menu)]`\r\n        				&tpl=`@CODE<li><a href=\"/[~[+id+]~]\">[+pagetitle+]</a></li>`\r\n        				&sortby=`menuindex`\r\n						&order=`ASC`\r\n    				!]\r\n                </ul>\r\n            </nav>\r\n			\r\n            <div class=\"phones\">\r\n				[!getPhonesHeaderFromSettings!]\r\n            </div>\r\n\r\n        </div>\r\n\r\n        <div class=\"header-bottom\">\r\n			<div class=\"mobile-menu\">\r\n				<img src=\"assets/images/toggle.svg\">\r\n			</div>\r\n            <div class=\"branding\">\r\n\r\n                <a href=\"/\">\r\n				<img src=\"[(client_logo)]\" alt=\"Логотип сайта\">\r\n\r\n                <div class=\"site-info\">\r\n                    <p class=\"site-title\">[(client_site_name)]</p>\r\n                    <p class=\"site-description\">[(client_site_description)]</p>\r\n                </div>\r\n				</a>\r\n            </div>\r\n\r\n            <div class=\"search-bar\">\r\n                <input type=\"text\" placeholder=\"Поиск по каталогу...\">\r\n                <button><img src=\"assets/images/search.svg\" alt=\"Логотип сайта\"></button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</header>', 0, 0, 1736186208, 0),
(2, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 3, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nif ($modx->db->getValue($modx->db->select(\'count(id)\', $modx->getFullTableName(\'site_tmplvars\'), \"name=\'documentTags\'\"))) {\r\n	mm_widget_tags(\'documentTags\', \' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n}\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\nmm_createTab(\'SEO\', \'seo\', \'\', \'\', \'\', \'\');\r\nmm_moveFieldsToTab(\'meta_title,meta_keywords,meta_description,seo_override,meta_noindex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');\r\nmm_widget_tags(\'meta_keywords\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n\r\n\r\n//mm_createTab(\'Images\', \'photos\', \'\', \'\', \'\', \'850\');\r\n//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');\r\n\r\n//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');\r\n\r\n//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');\r\n\r\n//mm_hideTabs(\'settings, access\', \'2\');\r\n', 0, 0, 0, 0),
(3, 'AjaxSearch_tplInput', 'Input-Form for AjaxSearch', 0, 'none', 1, 0, '[+as.showInputForm:is=`1`:then=`\n<form id=\"[+as.formId+]\" action=\"[+as.formAction+]\" method=\"post\">\n    [+as.showAsId:is=`1`:then=`<input type=\"hidden\" name=\"[+as.asName+]\" value=\"[+as.asId+]\" />`+]\n    <input type=\"hidden\" name=\"advsearch\" value=\"[+as.advSearch+]\" />\n   <div class=\"input-group\">\n       <input id=\"[+as.inputId+]\" class=\"form-control cleardefault\" type=\"text\" name=\"search\" value=\"[+as.inputValue+]\"[+as.inputOptions+] />\n      [+as.liveSearch:is=`0`:then=`\n     <span class=\"input-group-btn\">\n          <button class=\"btn btn-primary\" type=\"submit\"><i class=\"fa fa-search\"></i></button>   \n      </span>\n       `:else=`\n      <div class=\"input-group-addon\"><i class=\"fa fa-search\"></i></div>\n     `+]     \n  </div>\n</form>\n`+]\n[+as.showIntro:is=`1`:then=`\n<p class=\"ajaxSearch_intro\" id=\"ajaxSearch_intro\">[+as.introMessage+]</p>\n`+]', 0, 0, 0, 0),
(4, 'AjaxSearch_tplAjaxResult', 'Result Tpl for AjaxSearch', 0, 'none', 1, 0, '<div class=\"[+as.resultClass+]\">\n  <strong><a class=\"[+as.resultLinkClass+]\" href=\"[+as.resultLink+]\" title=\"[+as.longtitle+]\">[+as.pagetitle+]</a></strong>\n[+as.descriptionShow:is=`1`:then=`\n  <small><span class=\"[+as.descriptionClass+]\">[+as.description+]</span></small>\n`+]\n[+as.extractShow:is=`1`:then=`\n  <div class=\"[+as.extractClass+]\"><p>[+as.extract+]</p></div>\n`+]\n[+as.breadcrumbsShow:is=`1`:then=`\n  <span class=\"[+as.breadcrumbsClass+]\">[+as.breadcrumbs+]</span>\n`+]\n</div>', 0, 0, 0, 0),
(6, 'AjaxSearch_tplAjaxGrpResult', 'Grp Result Tpl for AjaxSearch', 0, 'none', 1, 0, '[+as.grpResultsDef:is=`1`:then=`\n<div id=\"[+as.grpResultId+]\" class=\"AS_ajax_grpResult\">\n[+as.headerGrpResult+]\n[+as.listResults+]\n[+as.footerGrpResult+]\n</div>\n`:else=`\n<div class=\"AS_ajax_grpResultName\">[+as.grpResultNameShow:is=`1`:then=`[+as.grpResultName+]`+]\n<span class=\"ajaxSearch_grpResultsDisplayed\">[+as.grpResultsDisplayedText+]</span></div>\n`+]', 0, 0, 0, 0),
(8, 'AjaxSearch_tplAjaxResults', 'Results Tpl for AjaxSearch', 0, 'none', 1, 0, '<div id=\"search_results\" class=\"modal fade\" tabindex=\"-1\" role=\"dialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n        <h3 class=\"modal-title\">Search Results</h3>\n      </div>\n      <div class=\"modal-body\">\n        [+as.noResults:is=`1`:then=`\n       <div class=\"[+as.noResultClass+]\">\n            [+as.noResultText+]\n         </div>\n      `:else=`\n      <p class=\"AS_ajax_resultsInfos\">[+as.resultsFoundText+]<span class=\"AS_ajax_resultsDisplayed\">[+as.resultsDisplayedText+]</span></p>\n      [+as.listGrpResults+]\n     `+]\n       [+as.moreResults:is=`1`:then=`\n          <div class=\"[+as.moreClass+]\">\n            <a href=\"[+as.moreLink+]\" title=\"[+as.moreTitle+]\">[+as.moreText+]</a>\n          </div>\n      `+]\n       [+as.showCmt:is=`1`:then=`\n        [+as.comment+]\n        `+]\n      </div>\n      <div class=\"modal-footer\">\n        <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Close</button>\n      </div>\n    </div><!-- /.modal-content -->\n  </div><!-- /.modal-dialog -->\n</div><!-- /.modal -->\n<script>$(\'#search_results\').modal(\'show\')</script>', 0, 0, 0, 0),
(9, 'Comments_tplForm', 'Comments (Jot) Form-Template', 0, 'none', 1, 0, '<a name=\"jf[+jot.link.id+]\"></a>\n<h2>[+form.edit:is=`1`:then=`Edit comment`:else=`Write a comment`+]</h2>\n<div class=\"jot-list\">\n<ul>\n    <li>Required fields are marked with <b>*</b>.</li>\n</ul>\n</div>\n[+form.error:isnt=`0`:then=`\n<div class=\"jot-err\">\n[+form.error:select=`\n&-3=You are trying to re-submit the same post. You have probably clicked the submit button more than once.\n&-2=Your comment has been rejected.\n&-1=Your comment has been saved, it will first be reviewed before it is published.\n&1=You are trying to re-submit the same post. You have probably clicked the submit button more than once.\n&2=The security code you entered was incorrect.\n&3=You can only post once each [+jot.postdelay+] seconds.\n&4=Your comment has been rejected.\n&5=[+form.errormsg:ifempty=`You didn\'t enter all the required fields`+]\n`+]\n</div>\n`:strip+]\n[+form.confirm:isnt=`0`:then=`\n<div class=\"jot-cfm\">\n[+form.confirm:select=`\n&1=Your comment has been published.\n&2=Your comment has been saved, it will first be reviewed before it is published.\n&3=Comment saved.\n`+]\n</div>\n`:strip+]\n<form method=\"post\" action=\"[+form.action:esc+]#jf[+jot.link.id+]\" class=\"jot-form\">\n    <fieldset>\n    <input name=\"JotForm\" type=\"hidden\" value=\"[+jot.id+]\" />\n   <input name=\"JotNow\" type=\"hidden\" value=\"[+jot.seed+]\" />\n  <input name=\"parent\" type=\"hidden\" value=\"[+form.field.parent+]\" />\n \n  [+form.moderation:is=`1`:then=`\n       <div class=\"jot-row\">\n           <b>Created on:</b> [+form.field.createdon:date=`%a %B %d, %Y at %H:%M`+]<br />\n            <b>Created by:</b> [+form.field.createdby:userinfo=`username`:ifempty=`[+jot.guestname+]`+]<br />\n         <b>IP address:</b> [+form.field.secip+]<br />\n         <b>Published:</b> [+form.field.published:select=`0=No&1=Yes`+]<br />\n          [+form.field.publishedon:gt=`0`:then=`\n                <b>Published on:</b> [+form.field.publishedon:date=`%a %B %d, %Y at %H:%M`+]<br />\n                <b>Published by:</b> [+form.field.publishedby:userinfo=`username`:ifempty=` - `+]<br />\n           `+]\n           [+form.field.editedon:gt=`0`:then=`\n               <b>Edited on:</b> [+form.field.editedon:date=`%a %B %d, %Y at %H:%M`+]<br />\n              <b>Edited by:</b> [+form.field.editedby:userinfo=`username`:ifempty=` -`+]<br />\n          `+]\n       </div>\n    `:strip+]\n \n  [+form.guest:is=`1`:then=`\n        <div class=\"form-group\">\n            <label for=\"name[+jot.id+]\">Name:</label>\n           <input tabindex=\"[+jot.seed:math=`?+1`+]\" name=\"name\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.custom.name:esc+]\" id=\"name[+jot.id+]\" />\n      </div>\n        <div class=\"form-group\">\n            <label for=\"email[+jot.id+]\">Email:</label>\n         <input tabindex=\"[+jot.seed:math=`?+2`+]\" name=\"email\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.custom.email:esc+]\" id=\"email[+jot.id+]\"/>\n        </div>\n    `:strip+]\n <div class=\"form-group\">\n        <label for=\"title[+jot.id+]\">Subject:</label>\n       <input tabindex=\"[+jot.seed:math=`?+3`+]\" name=\"title\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.title:esc+]\" id=\"title[+jot.id+]\"/>\n   </div>\n    <div class=\"form-group\">\n        <label for=\"content[+jot.id+]\">Comment: *</label>\n       <textarea tabindex=\"[+jot.seed:math=`?+4`+]\" name=\"content\" class=\"form-control\" rows=\"8\" id=\"content[+jot.id+]\">[+form.field.content:esc+]</textarea>\n  </div>\n    \n[+jot.captcha:is=`1`:then=`\n <div style=\"width:150px;margin-top: 5px;margin-bottom: 5px;\">\n       <a href=\"[+jot.link.current:esc+]\">\n         <img src=\"[(modx_manager_url)]includes/veriword.php?rand=[+jot.seed+]\" width=\"148\" height=\"60\" alt=\"If you have trouble reading the code, click on the code itself to generate a new random code.\" style=\"border: 1px solid #003399\" />\n     </a>\n  </div>\n    <div class=\"form-group\">\n        <label for=\"vericode[+jot.id+]\">Help prevent spam - enter security code above:</label>\n      <input type=\"text\" name=\"vericode\" style=\"width:150px;\" size=\"20\" id=\"vericode[+jot.id+]\" />\n    </div>\n`:strip+]\n\n   <input tabindex=\"[+jot.seed:math=`?+5`+]\" name=\"submit\" class=\"btn btn-primary\" type=\"submit\" value=\"[+form.edit:is=`1`:then=`Save Comment`:else=`Post Comment`+]\" />\n   [+form.edit:is=`1`:then=`\n     <input tabindex=\"[+jot.seed:math=`?+5`+]\" name=\"submit\" class=\"btn btn-default\" type=\"submit\" value=\"Cancel\" onclick=\"history.go(-1);return false;\" />\n    `+] \n  </fieldset>\n</form>', 0, 0, 0, 0),
(13, 'Comments', 'Comments (JotX) showing beneath a blog entry.', 2, 'none', 1, 0, '<div id=\"commentsAnchor\">\n[[ifsnippet? &name=`JotX`]]    \n[!JotX? &customfields=`name,email` &subscribe=`1` &pagination=`4` &badwords=`dotNet` &canmoderate=`Site Admins` &tplForm=`Comments_tplForm` &tplComments=`Comments_tplComments`!]\n</div>', 0, 1507723259, 1509825745, 0),
(14, 'ContactForm', 'eForm-template for showing contact-form', 2, 'none', 1, 0, '<form id=\"EmailForm\">\n  <input type=\"hidden\" name=\"formid\" value=\"ContactForm\">\n <p>[+form.messages+]</p>\n  <div class=\"form-group [+name.classname+]\">\n     <label for=\"cfName\">Your name:</label>\n      <input type=\"text\" class=\"form-control\" name=\"name\" id=\"cfName\" value=\"[+name.value+]\" placeholder=\"Your Name\"/>\n      <div class=\"invalid-feedback\">[+name.error+]</div>\n  </div>\n    <div class=\"form-group [+email.classname+]\">\n        <label for=\"cfEmail\">Your Email Address:</label>\n        <input type=\"text\" class=\"form-control\" name=\"email\" id=\"cfEmail\" value=\"[+email.value+]\" placeholder=\"Email Address\"/>\n       <div class=\"invalid-feedback\">[+email.error+]</div>\n </div>\n    \n  <div class=\"form-group [+subject.classname+]\">\n      <label for=\"cfRegarding\">Regarding:</label>\n     <select class=\"form-control\" name=\"subject\" id=\"cfRegarding\">\n           <option value=\"General Inquiries\" [+s.subject.General Inquiries+] >General Inquiries</option>\n           <option value=\"Press\" [+s.subject.Press+] >Press or Interview Request</option>\n          <option value=\"Partnering\" [+s.subject.Partnering+] >Partnering Opportunities</option>\n      </select>\n     <div class=\"invalid-feedback\">[+subject.error+]</div>\n   </div>\n    \n  <div class=\"form-group [+message.classname+]\">\n      <label for=\"cfMessage\">Message:</label>\n     <textarea name=\"message\" id=\"cfMessage\" class=\"form-control\">[+message.value+]</textarea>\n       <div class=\"invalid-feedback\">[+message.error+]</div>\n   </div>\n    \n  <div class=\"form-group\">\n        <input type=\"submit\" name=\"contact\" id=\"submit\" class=\"btn btn-primary\" value=\"Send This Message\" />\n    </div>\n\n</form>', 0, 1507723259, 1507816800, 0),
(15, 'ContactFormReport', 'eForm-template for sending form-data by mail', 0, 'none', 1, 0, '<p>This is a response sent by <b>[+name+]</b> using the feedback form on the website. The details of the message follow below:</p>\n\n\n<p>Name: [+name+]</p>\n<p>Email: [+email+]</p>\n<p>Regarding: [+subject+]</p>\n<p>comments:<br />[+message+]</p>\n\n<p>You can use this link to reply: <a href=\"mailto:[+email+]?subject=RE: [+subject+]\">[+email+]</a></p>\n', 0, 1507723259, 0, 0),
(16, 'head', '', 2, 'none', 0, 0, '<head>\r\n    <base href=\"[(site_url)]\">\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n\r\n    <!-- SEO -->\r\n    <title>[*pagetitle*] | [(site_name)]</title>\r\n    <meta name=\"description\" content=\"[*description*]\">\r\n    <meta name=\"keywords\" content=\"[*keywords*]\">\r\n    \r\n    <!-- Open Graph -->\r\n	<meta property=\"og:title\" content=\"[!if? &is=`[*og_title*]:=:` &then=`[*pagetitle*]` &else=`[*og_title*]`!]\">\r\n	<meta property=\"og:description\" content=\"[!if? &is=`[*og_description*]:=:` &then=`[*description*]` &else=`[*og_description*]`!]\">\r\n	<meta property=\"og:image\" content=\"[!if? &is=`[*og_image*]:=:` &then=`[(site_url)][*image*]` &else=`[(site_url)][*og_image*]`!]\">\r\n	<meta property=\"og:type\" content=\"website\">\r\n    <meta property=\"og:url\" content=\"[(site_url)][~[*id*]~]\">\r\n\r\n    <!-- Favicon -->\r\n    <link rel=\"icon\" type=\"image/x-icon\" href=\"favicon.ico\">\r\n    <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"favicon.ico\">\r\n    \r\n    <!-- CSS -->\r\n    <link rel=\"stylesheet\" href=\"assets/templates/qmedia/css/qmedia.css\">\r\n    \r\n    <!-- JavaScript -->\r\n    <script src=\"assets/templates/qmedia/js/qmedia.js\"></script>\r\n	\r\n	<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n	<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n	<link href=\"https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Mulish:ital,wght@0,200..1000;1,200..1000&display=swap\" rel=\"stylesheet\">\r\n	\r\n	\r\n	<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css\"/>\r\n	\r\n    \r\n    <!-- Analytics -->\r\n    [(google_analytics)]\r\n    [(yandex_metrika)]\r\n</head>\r\n', 0, 1735819312, 1736086912, 0),
(17, 'footer', '', 2, 'none', 0, 0, '<footer class=\"footer\">\r\n    <!-- Первый блок -->\r\n	<div class=\"footer-main-wrap\">\r\n    <div class=\"footer-block footer-logo\">\r\n		<div class=\"branding\">\r\n			<a href=\"/\">\r\n			<img src=\"assets/images/logo.svg\" alt=\"Логотип сайта\">\r\n            <div class=\"site-info\">\r\n                <p class=\"site-title footer-color\">[(client_site_name)]</p>\r\n                <p class=\"site-description footer-color\">[(client_site_description)]</p>\r\n            </div>\r\n			</a>\r\n        </div>\r\n        <div class=\"footer-address\">\r\n            <p>[(client_footer_company_info)]</p>\r\n        </div>\r\n\r\n    </div>\r\n    <div class=\"footer-wrap\">\r\n        <!-- Второй блок -->\r\n        <div class=\"footer-block footer-links\">\r\n            <h3 class=\"footer-heading\">Каталог</h3>\r\n				<ul class=\"footer-menu\">\r\n			[!DocLister?\r\n				&parents=`53`\r\n				&sortby=`menuindex`\r\n				&order=`ASC`\r\n				&maxDepth=`1`\r\n				&tpl=`@CODE<li><a href=\"/[~[+id+]~]\">[+pagetitle+]</a></li>`!]\r\n			</ul>\r\n        </div>\r\n\r\n        <!-- Третий блок -->\r\n        <div class=\"footer-block footer-links\">\r\n            <h3 class=\"footer-heading\">Информация</h3>\r\n            <ul class=\"footer-menu\">\r\n				[!DocLister?\r\n        				&documents=`[(client_footer_info_menu)]`\r\n        				&tpl=`@CODE<li><a href=\"/[~[+id+]~]\">[+pagetitle+]</a></li>`\r\n        				&sortby=`menuindex`\r\n						&order=`ASC`\r\n    				!]\r\n            </ul>\r\n        </div>\r\n\r\n        <!-- Четвёртый блок -->\r\n        <div class=\"footer-block footer-contacts\">\r\n            <h3 class=\"footer-heading\">Контакты</h3>\r\n            <ul class=\"footer-phones\">	\r\n				[!getPhonesFooterFromSettings!]\r\n				[!getEmailsFooterFromSettings!]\r\n            </ul>\r\n        </div>\r\n    </div>\r\n\r\n</div>\r\n</footer>', 0, 1735864034, 1736186461, 0),
(18, 'banner', '', 2, 'none', 0, 0, '<section class=\"banner\">\r\n	<div class=\"swiper mySwiper\">\r\n    [[multiTV? \r\n		&tvName=`home_banners` \r\n		&docid=`[*id*]` \r\n		&display=`all` \r\n		&offset=`0` \r\n		&orderBy=``\r\n	]]\r\n    <div class=\"swiper-button-next\"></div>\r\n    <div class=\"swiper-button-prev\"></div>\r\n  </div>\r\n</section>\r\n', 0, 1735877513, 1736098274, 0),
(19, 'home_page_categories', '', 2, 'none', 0, 0, '<section class=\"categories\">\r\n    <div class=\"category-grid\">	\r\n		[!DocLister? \r\n			&parents=`53`\r\n    		&tvList=`category_image`\r\n    		&sortBy=`menuindex`\r\n    		&sortDir=`ASC`\r\n			&tpl=`tplCategory`\r\n		!]	\r\n	</div>\r\n</section>', 0, 1735878093, 1736102677, 0),
(20, 'home_page_about', '', 2, 'none', 0, 0, '<section class=\"contact-section\">\r\n    <div class=\"contact-wrapper\">\r\n		\r\n		<!-- Правая колонка: текст -->\r\n        <div class=\"text-container\">\r\n            <h3>Qmedia Market – Интернет-магазин полезных вещей</h3>\r\n			<div class=\"wrap-text-about\">\r\n				<p>Qmedia Market — магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов. Работаем с проверенными производителями с 2007 года. Доставляем товары точно в срок.</p>\r\n			<p>Покупка товара проста только на первый взгляд. Нужно думать о том, как оформить доставку, кто соберет шкаф или установит кондиционер. В нашем магазине эти услуги уже продуманы. Думайте только о подборе товаров в каталоге. Для этого предлагаем комплексный подход — наша команда выполнит все задачи!</p>\r\n			</div>\r\n            \r\n        </div>\r\n		\r\n		\r\n		\r\n		\r\n		\r\n		\r\n		\r\n		[!FormLister?\r\n&formid=`basic`\r\n&protectSubmit=`0`\r\n&rules=`\r\n{\r\n    \"name\":{\r\n        \"required\":\"Обязательно введите имя\",\r\n        \"matches\":{\r\n            \"params\":\"\\/^[\\\\pL\\\\s\\\\-\']++$\\/uD\",\r\n            \"message\":\"Введите имя правильно\"\r\n        }\r\n    },\r\n    \"email\":{\r\n        \"email\":\"Введите email правильно\"\r\n    },\r\n    \"phone\":{\r\n        \"required\":\"Обязательно введите номер телефона\",\r\n        \"phone\":\"Введите номер правильно\"\r\n    },\r\n}`\r\n&formTpl=`@CODE:\r\n<div class=\"form-container row\">\r\n    <div class=\"col-md-8 col-md-offset-2\">\r\n        <div class=\"well\">\r\n            <form class=\"contact-form\" method=\"post\">\r\n                <input type=\"hidden\" name=\"formid\" value=\"basic\">\r\n                <div class=\"wrap form-group[+name.errorClass+][+name.requiredClass+]\">\r\n                    <label for=\"name\" class=\"col-sm-2 control-label\">Имя *</label>\r\n                    <div class=\"col-sm-10\">\r\n                        <input type=\"text\" class=\"form-control\" id=\"name\" placeholder=\"Екатерина\" name=\"name\" value=\"[+name.value+]\">\r\n                        [+name.error+]\r\n                    </div>\r\n                </div>\r\n                \r\n                <div class=\"wrap form-group[+phone.errorClass+][+phone.requiredClass+]\">\r\n                    <label for=\"phone\" class=\"col-sm-2 control-label\">Телефон *</label>\r\n                    <div class=\"col-sm-10\">\r\n                        <input type=\"text\" class=\"form-control\" id=\"phone\" placeholder=\"+375 __ __ __ __\" name=\"phone\" value=\"[+phone.value+]\">\r\n                        [+phone.error+]\r\n                    </div>\r\n                </div>\r\n				\r\n				\r\n				<div class=\"wrap form-group[+email.errorClass+]\">\r\n                    <label for=\"email\" class=\"col-sm-2 control-label\">Email *</label>\r\n                    <div class=\"col-sm-10\">\r\n                        <input type=\"text\" class=\"form-control\" id=\"email\" placeholder=\"katya@mail.by\" name=\"email\" value=\"[+email.value+]\">\r\n                        [+email.error+]\r\n                    </div>\r\n					\r\n                </div>\r\n\r\n				<div>[+form.messages+]</div>\r\n                \r\n                <div class=\"form-group\">\r\n                    <div class=\"col-sm-offset-2 col-sm-10\">\r\n                        <button type=\"submit\" class=\"btn btn-primary\"><i class=\"glyphicon glyphicon-envelope\"></i> Отправить</button>\r\n                    </div>\r\n                </div>\r\n            </form>\r\n        </div>\r\n    </div>\r\n</div>`\r\n&to=`[(client_form_to)]`\r\n&from=`[(client_form_from)]`\r\n&ccSender=`1`\r\n&ccSenderField=`email`\r\n&ccSenderTpl=`@CODE:Спасибо за обращение, [+name.value+]`\r\n&reportTpl=`@CODE:\r\n<p>Посетитель сайта: [(client_site_name)] оставил заявку</p>\r\n<p>Имя: [+name.value+]</p>\r\n<p>Email: <a href=\"mailto:[+email.value+]\">[+email.value+]</a></p>\r\n<p>Телефон: [+phone.value+]</p>\r\n`\r\n&errorClass=` has-error`\r\n&requiredClass=` has-warning`\r\n&subject=`Новое сообщение`\r\n&messagesOuterTpl=`@CODE:<div class=\"alert alert-danger\" role=\"alert\">[+messages+]</div>`\r\n&errorTpl=`@CODE:<span class=\"help-block\">[+message+]</span>`\r\n!]\r\n		\r\n		\r\n		\r\n        \r\n\r\n        \r\n    </div>\r\n</section>', 0, 1735878122, 1736199083, 0),
(21, 'breadcrumbs', '', 2, 'none', 0, 0, '[!DLCrumbs? \r\n	&showCurrent=`1`\r\n	&tpl=`@CODE:<li class=\"breadcrumb-item\" itemprop=\"itemListElement\" itemscope itemtype=\"http://schema.org/ListItem\"><meta itemprop=\"position\" content=\"[+iteration+]\" /><a href=\"[+url+]\" title=\"[+e.title+]\"  itemprop=\"item\"><span itemprop=\"name\">[+title+]</span></a></li>`\r\n	&tplCurrent=`@CODE:<li class=\"breadcrumb-item active\" aria-current=\"page\" itemprop=\"itemListElement\" itemscope itemtype=\"http://schema.org/ListItem\"><meta itemprop=\"position\" content=\"[+iteration+]\" /><span itemprop=\"name\">[+title+]</span></li>`\r\n	&ownerTpl=`@CODE:<nav aria-label=\"breadcrumb\"><ol class=\"breadcrumb\" itemscope itemtype=\"http://schema.org/BreadcrumbList\">[+crumbs.wrap+]</ol></nav>`\r\n!]	', 0, 1735916068, 1736113959, 0),
(22, 'header_h1', '', 2, 'none', 0, 0, '<h1>[*meta_h1*]</h1>', 0, 1735916103, 1735945594, 0),
(23, 'catalog_content', '', 2, 'none', 0, 0, '<!-- <div class=\"catalo\">\r\n	\r\n	<div>\r\n		\r\n		{{catalog_SEO}}\r\n	</div>\r\n</div> -->\r\n\r\n<div class=\"container\">\r\n        <!-- Left Sidebar (Menu) -->\r\n        {{sidebar_menu}}\r\n\r\n        <!-- Main Content (Products and Pagination) -->\r\n        <div class=\"category-main-content\">\r\n            <!-- Products Section -->\r\n			{{catalog_products}}\r\n		\r\n\r\n            <!-- Pagination Section -->\r\n            {{catalog_pagination}}\r\n\r\n            <!-- SEO Text Section -->\r\n			[*content*]\r\n            \r\n        </div>\r\n    </div>', 0, 1735916113, 1735943330, 0),
(24, 'pagetitle', '', 2, 'none', 0, 0, '<div class=\"page-header\">\r\n	{{breadcrumbs}}\r\n	{{header_h1}}\r\n</div>', 0, 1735916158, 1735945161, 0),
(28, 'tplCategory', '', 2, 'none', 0, 0, '<div class=\"category-tile\">\r\n	<img src=\"[[phpthumb? &input=`[+tv.category_image+]` &options=`w=200,h=200,zc=B,far=C`]]\" alt=\"[+title+]\">\r\n	<span>[+title+]</span>	\r\n</div>', 0, 1736098500, 1736111032, 0),
(25, 'sidebar_menu', '', 2, 'none', 0, 0, '<aside class=\"sidebar\">\r\n    <a href=\"/katalog\" class=\"back-to-catalog\"><img src=\"assets/images/arrow-back.svg\" width=\"20px\" height=\"20px\">\r\n        <span>Каталог</span></a>\r\n[!DLMenu?\r\n	&parents=`53`\r\n	&maxDepth=`1`\r\n	&outerTpl=@CODE:<ul>[+wrap+]</ul>\r\n	&rowTpl=@CODE:<li><a href=\"[+url+]\">[+title+]</a></li>\r\n	&rowHereTpl=@CODE:<li class=\"active\"><span>[+title+]</span></li>\r\n	&sortby=`menuindex`\r\n	&sortdir=`ASC`\r\n!]\r\n</aside>', 0, 1735943117, 1736115917, 0),
(29, 'ListProducts', '', 2, 'none', 0, 0, '<div class=\"product-item\"><img src=\"[[phpthumb? &input=`[+tv.product_image+]` &options=`w=400,h=400,zc=B,far=C,f=webp`]]\" alt=\"[+pagetitle+]\">\r\n	<div class=\"product-preview-info\">\r\n		<span>[+tv.product_price+] р.</span>\r\n		<a href=\"/[~[+id+]~]\">\r\n			<span>[+pagetitle+]</span>\r\n		</a>\r\n	</div>\r\n</div>\r\n', 0, 1736116131, 1736118299, 0),
(26, 'catalog_products', '', 2, 'none', 0, 0, '<section class=\"products\">\r\n    <div class=\"product-grid\">\r\n        [!DocLister? \r\n&display=`5` \r\n&tpl=`ListProducts` \r\n&tvList=`product_image,product_price`\r\n&sortBy=`menuindex`\r\n&paginate=`pages`\r\n&id=`list`\r\n&TplNextP=`` \r\n&TplPrevP=`` \r\n&TplPage=`@CODE: <li><a href=\"[+link+]\">[+num+]</a></li>` \r\n&TplCurrentPage=`@CODE: <li class=\"active\"><a href=\"[+link+]\">[+num+]</a></li>`\r\n&TplWrapPaginate=`@CODE: <section class=\"pagination\"><ul>[+wrap+]</ul></section>`\r\n!]\r\n    </div>\r\n</section>\r\n\r\n[+list.pages+]', 0, 1735943190, 1736117359, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_modules`
--

CREATE TABLE `fobw_site_modules` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `guid` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint NOT NULL DEFAULT '0',
  `properties` text COLLATE utf8mb4_general_ci,
  `modulecode` mediumtext COLLATE utf8mb4_general_ci COMMENT 'module boot up code'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Site Modules';

--
-- Дамп данных таблицы `fobw_site_modules`
--

INSERT INTO `fobw_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Extras', '<strong>0.1.4</strong> first repository for Evolution CMS', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '[]', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.1.4\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');'),
(2, 'Doc Manager', '<strong>1.1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '[]', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
(3, 'ClientSettings', '<strong>2.2.1</strong> Customizable set of fields for user settings', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'clsee234523g354f542t5t', 1, '{\"prefix\":[{\"label\":\"Prefix for settings\",\"type\":\"text\",\"value\":\"client_\",\"default\":\"client_\",\"desc\":\"\"}],\"config_path\":[{\"label\":\"Path to configuration files\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', '\n\nrequire_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\nif (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (!function_exists(\'renderFormElement\')) {\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.commands.inc.php\';\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.inc.php\';\n}\n\nif (isset($_REQUEST[\'stay\'])) {\n    $_SESSION[\'stay\'] = $_REQUEST[\'stay\'];\n} else if (isset($_SESSION[\'stay\'])) {\n    $_REQUEST[\'stay\'] = $_SESSION[\'stay\'];\n}\n\n(new ClientSettings($params))->processRequest();\n');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_module_access`
--

CREATE TABLE `fobw_site_module_access` (
  `id` int UNSIGNED NOT NULL,
  `module` int NOT NULL DEFAULT '0',
  `usergroup` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Module users group access permission';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_module_depobj`
--

CREATE TABLE `fobw_site_module_depobj` (
  `id` int NOT NULL,
  `module` int NOT NULL DEFAULT '0',
  `resource` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Module Dependencies';

--
-- Дамп данных таблицы `fobw_site_module_depobj`
--

INSERT INTO `fobw_site_module_depobj` (`id`, `module`, `resource`, `type`) VALUES
(1, 3, 15, 30);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_plugins`
--

CREATE TABLE `fobw_site_plugins` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Plugin',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext COLLATE utf8mb4_general_ci,
  `locked` tinyint NOT NULL DEFAULT '0',
  `properties` text COLLATE utf8mb4_general_ci COMMENT 'Default Properties',
  `disabled` tinyint NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the site plugins.';

--
-- Дамп данных таблицы `fobw_site_plugins`
--

INSERT INTO `fobw_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1, 'CodeMirror', '<strong>1.7</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)', 0, 4, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\r\n *\r\n * @category    plugin\r\n * @version     1.7\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;true &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution/issues/\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  08-01-2018\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 0, '', 0, 0),
(2, 'OutdatedExtrasCheck', '<strong>1.4.7</strong> Check for Outdated critical extras not compatible with EVO 1.4.6', 0, 4, 0, '/**\r\n * OutdatedExtrasCheck\r\n *\r\n * Check for Outdated critical extras not compatible with EVO 1.4.6\r\n *\r\n * @category	plugin\r\n * @version     1.4.7\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Author: Nicola Lambathakis\r\n * @internal    @events OnManagerWelcomeHome\r\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\r\n', 0, '{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(3, 'TinyMCE4', '<strong>4.9.12</strong> Javascript rich text editor', 0, 4, 0, '\n/**\n * TinyMCE4\n *\n * Javascript rich text editor\n *\n * @category    plugin\n * @version     4.9.12\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal    @properties &styleFormats=Custom Style Formats <b>RAW</b><br/><br/><ul><li>leave empty to use below block/inline formats</li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2</i></li><li>Also accepts full JSON-config as per TinyMCE4 docs / configure / content-formating / style_formats</li></ul>;textarea; &styleFormats_inline=Custom Style Formats <b>INLINE</b><br/><br/><ul><li>will wrap selected text with span-tag + css-class</li><li>simple-format only</li></ul>;textarea;InlineTitle,cssClass1|InlineTitle2,cssClass2 &styleFormats_block=Custom Style Formats <b>BLOCK</b><br/><br/><ul><li>will add css-class to selected block-element</li><li>simple-format only</li></ul>;textarea;BlockTitle,cssClass3|BlockTitle2,cssClass4 &customParams=Custom Parameters<br/><b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to \"introtext\";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled &paste_as_text=<b>Force Paste as Text</b>;list;enabled,disabled;disabled\n * @internal    @events OnLoadWebDocument,OnParseDocument,OnWebPagePrerender,OnLoadWebPageCache,OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender\n * @internal    @modx_category Manager and Admin\n * @internal    @legacy_names TinyMCE Rich Text Editor\n * @internal    @installset base\n * @logo        /assets/plugins/tinymce4/tinymce/logo.png\n * @reportissues https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Plugin docs https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Official TinyMCE4-docs https://www.tinymce.com/docs/\n * @author      Deesen\n * @lastupdate  2018-01-17\n */\nif (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");\n', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 0, '', 0, 0),
(4, 'Quick Manager+', '<strong>1.5.13</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '\r\n/**\r\n * Quick Manager+\r\n * \r\n * Enables QuickManager+ front end content editing support\r\n *\r\n * @category 	plugin\r\n * @version 	1.5.13\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\r\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons  \r\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @legacy_names QM+,QuickEdit\r\n * @internal    @installset base, sample\r\n * @internal    @disabled 1\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\r\n * @link        http://www.maagit.fi/modx/quickmanager-plus\r\n * @author      Mikko Lammi\r\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\r\n * @lastupdate  22/06/2022 \r\n */\r\n\r\n// In manager\r\nif (!$modx->checkSession()) return;\r\n\r\n$show = TRUE;\r\n\r\nif (!empty($disabled)) {\r\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\r\n    if (in_array($modx->documentIdentifier, $arr)) {\r\n        $show = FALSE;\r\n    }\r\n}\r\n\r\nif ($show) {\r\n    // Replace [*#tv*] with QM+ edit TV button placeholders\r\n    if ($tvbuttons == \'true\') {\r\n        if ($modx->event->name == \'OnParseDocument\') {\r\n             $output = &$modx->documentOutput;\r\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\r\n             $modx->documentOutput = $output;\r\n         }\r\n     }\r\n    include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\r\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs ?? \'\', $hidesections ?? \'\', $addbutton, $tpltype, $tplid, $custombutton ?? \'\', $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\n}\r\n', 0, '{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}', 1, '', 0, 0),
(5, 'ElementsInTree', '<strong>1.5.11</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n', 0, '{\"adminRoleOnly\":[{\"label\":\"Administrators only\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"treeButtonsInTab\":[{\"label\":\"Tree buttons in tab\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}]}', 1, '', 0, 0),
(6, 'Forgot Manager Login', '<strong>1.1.7</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '[]', 0, '', 0, 0),
(7, 'ManagerManager', '<strong>0.6.4</strong> Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.', 0, 4, 0, '\n/**\n * ManagerManager\n *\n * Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.4\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  22/01/2018\n */\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');\n', 0, '{\"remove_deprecated_tv_types_pref\":[{\"label\":\"Remove deprecated TV types\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"config_chunk\":[{\"label\":\"Configuration Chunk\",\"type\":\"text\",\"value\":\"mm_rules\",\"default\":\"mm_rules\",\"desc\":\"\"}]}', 0, '', 0, 0),
(8, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(9, 'FileSource', '<strong>0.1.1</strong> Save snippet and plugins to file', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';', 0, '[]', 0, '', 0, 0),
(10, 'Updater', '<strong>0.8.8</strong> show message about outdated CMS version', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';', 0, '{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evocms-community\\/evolution\",\"default\":\"evocms-community\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"1.4.x\",\"default\":\"1.4.x\",\"desc\":\"\"}],\"commitCount\":[{\"label\":\"Commits count\",\"type\":\"text\",\"value\":\"20\",\"default\":\"20\",\"desc\":\"\"}],\"stableOnly\":[{\"label\":\"Offer upgrade to stable version only:\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}]}', 0, '', 0, 0),
(12, 'evoAjax', '', 0, 1, 0, 'switch($_GET[\'q\']){     \n case \'feedbackajaxform\':\n        echo $modx->runSnippet(\'FormLister\', array(\n         \'formid\' => \'ContactForm\',\n            \'to\' => $modx->config[\'emailsender\'],\n         \'parseMailerParams\'=> \'1\',\n            \'replyTo\'=> \'@CODE:[+user.email.value+]\',\n         \'subjectTpl\' => \'@CODE:[+subject.value+], from: \' . $modx->config[\'site_name\'] ,\n            \'ccSender\'=>\'1\',\n          \'errorClass\'=> \' has-error\',\n          \'requiredClass\'=> \' has-warning\',\n         \'rules\'=> \'{\n                   \"name\":{\n                    \"required\":\"Enter your Name\"\n                  },\n                \"email\":{\n                       \"required\":\"Enter email\",\n                     \"email\":\"Incorrect email\"\n                 },\n                \"message\":{\n                 \"required\":\"Enter message\"\n                }\n            }\',\n           \'formControls\'=>\'subject\',\n            \'messagesTpl\' => \'@CODE:<div class=\"form-messages alert alert-danger\">[+required+]<br>[+errors+]</div>\',\n            \'errorTpl\'=>\'@CODE: [+message+]\',\n            \'successTpl\'=> \'@CODE: \n                 <div class=\"alert alert-success mt-3\">\n                  <h3>Thanks!</h3>\n                  <p>your message has been sent.</p>\n                </div>\',\n            \'formTpl\' => \'ContactForm\', \n           \'reportTpl\'=>\'ContactFormReport\',\n            \'ccSenderTpl\'=>\'ContactFormReport\',  \n          ));\n           die();\n        break;\n}\n', 0, '{}', 0, ' ', 1507815395, 1507816656),
(13, 'userHelper', '<strong>1.21.1</strong> addition to FormLister', 0, 6, 0, 'require MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n', 0, '{\"model\":[{\"label\":\"Model\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}],\"trackWebUserActivity\":[{\"label\":\"Track web user activity\",\"type\":\"list\",\"value\":\"No\",\"options\":\"No,Yes\",\"default\":\"No\",\"desc\":\"\"}]}', 1, '', 0, 0),
(15, 'ClientSettings', '<strong>2.2.1</strong> Creates menu item for user module ClientSettings', 0, 4, 0, '\n\nif ($modx->event->name == \'OnManagerMenuPrerender\') {\n    require_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\n    $cs   = new ClientSettings($params);\n    $mid  = $cs->getModuleId();\n    $lang = $cs->loadLang();\n    $tabs = $cs->loadStructure();\n\n    if (!empty($tabs)) {\n        $menuparams = [\'client_settings\', \'main\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, 100, \'\'];\n\n        if (count($tabs) > 1) {\n            $menuparams[3] = \'javscript:;\';\n            $menuparams[5] = \'return false;\';\n            $sort = 0;\n\n            $params[\'menu\'][\'client_settings_main\'] = [\'client_settings_main\', \'client_settings\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, $sort, \'\'];\n\n            foreach ($tabs as $alias => $item) {\n                if ($alias != \'default\') {\n                    $params[\'menu\'][\'client_settings_\' . $alias] = [\'client_settings_\' . $alias, \'client_settings\', \'<i class=\"fa \' . (isset($item[\'menu\'][\'icon\']) ? $item[\'menu\'][\'icon\'] : \'fa-cog\') . \'\"></i>\' . $item[\'menu\'][\'caption\'], \'index.php?a=112&id=\' . $mid . \'&type=\' . $alias, $item[\'menu\'][\'caption\'], \'\', \'\', \'main\', 0, $sort += 10, \'\'];\n                }\n            }\n        }\n\n        $params[\'menu\'][\'client_settings\'] = $menuparams;\n        $modx->event->output(serialize($params[\'menu\']));\n    }\n\n    return;\n}\n\n', 0, '', 0, 'clsee234523g354f542t5t', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_plugin_events`
--

CREATE TABLE `fobw_site_plugin_events` (
  `pluginid` int NOT NULL,
  `evtid` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0' COMMENT 'determines plugin run order'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Links to system events';

--
-- Дамп данных таблицы `fobw_site_plugin_events`
--

INSERT INTO `fobw_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 24, 0),
(1, 30, 0),
(1, 77, 0),
(1, 39, 0),
(1, 95, 0),
(1, 45, 0),
(1, 51, 0),
(2, 117, 0),
(3, 90, 0),
(3, 101, 0),
(3, 21, 0),
(3, 102, 0),
(3, 95, 1),
(3, 94, 0),
(3, 3, 0),
(4, 29, 0),
(4, 32, 0),
(4, 13, 0),
(4, 102, 1),
(4, 3, 1),
(5, 28, 0),
(5, 26, 0),
(5, 121, 0),
(5, 125, 0),
(5, 126, 0),
(5, 79, 0),
(5, 81, 0),
(5, 43, 0),
(5, 41, 0),
(5, 49, 0),
(5, 47, 0),
(5, 55, 0),
(5, 53, 0),
(5, 61, 0),
(5, 59, 0),
(6, 84, 0),
(6, 85, 0),
(6, 105, 0),
(7, 31, 0),
(7, 120, 0),
(7, 29, 1),
(7, 30, 1),
(7, 32, 1),
(7, 39, 1),
(7, 57, 0),
(8, 112, 0),
(9, 40, 0),
(9, 46, 0),
(9, 38, 0),
(9, 39, 2),
(9, 44, 0),
(9, 45, 1),
(10, 117, 1),
(10, 134, 0),
(10, 74, 0),
(12, 133, 1),
(13, 134, 1),
(13, 83, 0),
(13, 4, 0),
(13, 97, 0),
(13, 7, 0),
(15, 129, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_snippets`
--

CREATE TABLE `fobw_site_snippets` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Snippet',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext COLLATE utf8mb4_general_ci,
  `locked` tinyint NOT NULL DEFAULT '0',
  `properties` text COLLATE utf8mb4_general_ci COMMENT 'Default Properties',
  `moduleguid` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `disabled` tinyint NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the site snippets.';

--
-- Дамп данных таблицы `fobw_site_snippets`
--

INSERT INTO `fobw_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'DLCrumbs', '<strong>1.2</strong> DLCrumbs', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n', 0, '', '', 0, 0, 0),
(2, 'DLSitemap', '<strong>1.0.2</strong> Snippet to build XML sitemap', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n', 0, '', '', 0, 0, 0),
(3, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';', 0, '', '', 0, 0, 0),
(4, 'DocLister', '<strong>2.7.8</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n', 0, '', '', 0, 0, 0),
(5, 'FormLister', '<strong>1.21.1</strong> Form processor', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n', 0, '', '', 0, 0, 0),
(6, 'DLMenu', '<strong>1.4.2</strong> Snippet to build menu with DocLister', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n', 0, '', '', 0, 0, 0),
(7, 'phpthumb', '<strong>1.4.5</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\r\n', 0, '', '', 0, 0, 0),
(8, 'summary', '<strong>2.0.2</strong> Truncates the string to the specified length', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';', 0, '', '', 0, 0, 0),
(9, 'DocInfo', '<strong>0.4.1</strong> Take any field from any document (fewer requests than GetField)', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\r\n', 0, '', '', 0, 0, 0),
(24, 'ifsnippet', '', 0, 1, 0, '\nif (!isset($modx->snippetCache[$name])) {\n return \'<p class=\"bg-danger\">For work \'.$name.\' in demo site you need install <b>\'.$name.\'</b> from <a href=\"\'.MODX_MANAGER_URL.\'#?a=112&id=2\">Extras</a> module</p>\';\n}', 0, '{}', ' ', 1509819147, 1509826185, 0),
(23, 'prepareBlog', '', 0, 1, 0, '\nif (!empty($data[\'image\'])){\n  $data[\'blog-image\'] = \'<img src=\"\'.$modx->runSnippet(\'phpthumb\', array(\'input\'=>$data[\'image\'], \'options\'=>\'w=600,h=280,zc=1\')).\'\" alt=\"\'.$data[\'pagetitle\'].\'\">\';\n}else{\n    $data[\'blog-image\'] = \'\';\n}\nreturn $data;', 0, '{}', ' ', 1507723822, 1509819933, 0),
(25, 'DLPrevNext', '<strong>1.2</strong> DLPrevNext', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLPrevNext.php\';\n', 0, '', '', 0, 0, 0),
(26, 'DLBeforeAfter', '<strong>1</strong> Navigation between post and upcoming events relative to the current date.', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLBeforeAfter.php\';', 0, '', '', 0, 0, 0),
(27, 'DLTemplate', '<strong>1</strong> DLTemplate', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLTemplate.php\';', 0, '', '', 0, 0, 0),
(28, 'DLGlossary', '<strong>0.1</strong> Filtering documents by the first character', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLGlossary.php\';', 0, '', '', 0, 0, 0),
(29, 'DDocInfo', '<strong>1</strong> DDocInfo', 0, 6, 0, '$id = isset($id) ? (int)$id : $modx->documentObject[\'id\'];\n$field = isset($field) ? (string)$field : \'id\';\nif($field == \'id\'){\n    $out = $id;\n}else{\n    if($modx->documentObject[\'id\'] == $id){\n        $out = isset($modx->documentObject[$field]) ? $modx->documentObject[$field] : \'\';\n        if(is_array($out)){\n           $out = isset($out[1]) ? $out[1] : \'\';\n        }\n    }else{\n        $out = $modx->doc->edit($id)->get($field);\n    }\n}\nreturn (string)$out;', 0, '', '', 0, 0, 0),
(30, 'DLValuelist', '<strong>1.1</strong> DLValuelist', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLValuelist.php\';', 0, '', '', 0, 0, 0),
(31, 'DLReflectFilter', '<strong>2</strong> Filtering documents by dates provided by DLReflect snippet', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflectFilter.php\';', 0, '', '', 0, 0, 0),
(32, 'DLFirstChar', '<strong>1</strong> Grouping documents by the first character', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLFirstChar.php\';', 0, '', '', 0, 0, 0),
(33, 'DLReflect', '<strong>2</strong> Building a list of dates to filter documents', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflect.php\';', 0, '', '', 0, 0, 0),
(34, 'multiTV', '<strong>2.0.16</strong> Custom Template Variabe containing a sortable multi item list or a datatable', 0, 6, 0, 'return require MODX_BASE_PATH . \'assets/tvs/multitv/multitv.snippet.php\';\n', 0, '', '', 0, 0, 0),
(35, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/firstchildredirect/snippet.firstchildredirect.php\';', 0, '', '', 0, 0, 0),
(36, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its \"ultimate\" non-root parent', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/ultimateparent/snippet.ultimateparent.php\';', 0, '', '', 0, 0, 0),
(37, 'getPhonesHeaderFromSettings', '', 0, 0, 0, '\r\n$phoneData = $modx->getConfig(\'client_header_phones\');\r\n\r\nif (empty($phoneData)) {\r\n    return \"Нет данных о телефонах.\";\r\n}\r\n\r\n$phones = json_decode($phoneData, true);\r\n\r\nif (json_last_error() !== JSON_ERROR_NONE || !is_array($phones)) {\r\n    return \"Ошибка в формате данных о телефонах.\";\r\n}\r\n\r\n\r\nforeach ($phones as $label => $number) {\r\n    $output .= \"<a href=\'tel:{$number[\'header_phones\']}\'><img src=\'assets/images/phone.svg\'  alt=\'Номер телефона\' width=\'20px\' height=\'20px\'>{$number[\'header_phones\']}</a>\";\r\n}\r\n\r\n\r\nreturn $output;', 0, '{}', ' ', 1736127530, 1736178321, 0),
(38, 'getPhonesFooterFromSettings', '', 0, 0, 0, '\r\n$phoneData = $modx->getConfig(\'client_footer_phones\');\r\n\r\nif (empty($phoneData)) {\r\n    return \"Нет данных о телефонах.\";\r\n}\r\n\r\n$phones = json_decode($phoneData, true);\r\n\r\nif (json_last_error() !== JSON_ERROR_NONE || !is_array($phones)) {\r\n    return \"Ошибка в формате данных о телефонах.\";\r\n}\r\n\r\n\r\nforeach ($phones as $label => $number) {\r\n    $output .= \"<li><a href=\'tel:{$number[\'footer_phones\']}\'><img src=\'assets/images/phone-white.svg\'  alt=\'Номер телефона\' width=\'20px\' height=\'20px\'>{$number[\'footer_phones\']}</a></li>\";\r\n}\r\n\r\n\r\nreturn $output;', 0, '{}', ' ', 1736177648, 1736178007, 0),
(39, 'getEmailsFooterFromSettings', '', 0, 0, 0, '\r\n$emailData = $modx->getConfig(\'client_footer_emails\');\r\n\r\nif (empty($emailData)) {\r\n    return \"Нет данных о email.\";\r\n}\r\n\r\n$emails = json_decode($emailData, true);\r\n\r\nif (json_last_error() !== JSON_ERROR_NONE || !is_array($emails)) {\r\n    return \"Ошибка в формате данных о email.\";\r\n}\r\n\r\n\r\nforeach ($emails as $label => $email) {\r\n    $output .= \"<li><a href=\'mailto:{$email[\'footer_email\']}\'><img src=\'assets/images/at-sign.svg\'  alt=\'Email\' width=\'20px\' height=\'20px\'>{$email[\'footer_email\']}</a></li>\";\r\n}\r\n\r\n\r\nreturn $output;', 0, '{}', ' ', 1736178146, 1736178216, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_templates`
--

CREATE TABLE `fobw_site_templates` (
  `id` int NOT NULL,
  `templatename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `templatealias` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Template',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext COLLATE utf8mb4_general_ci,
  `locked` tinyint NOT NULL DEFAULT '0',
  `selectable` tinyint NOT NULL DEFAULT '1',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains the site templates.';

--
-- Дамп данных таблицы `fobw_site_templates`
--

INSERT INTO `fobw_site_templates` (`id`, `templatename`, `templatealias`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(3, 'Minimal Template', NULL, 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0, 1, 0, 0),
(4, 'EVO startup - Bootstrap', '', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang=\"[(lang_code)]\">\n <head>\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" /> \n     <title>[*meta_title*]</title>\n       [*meta_noindex*]\n       <meta name=\"keywords\" content=\"[*meta_keywords*]\" />\n       <meta name=\"description\" content=\"[*meta_description*]\" />\n        <base href=\"[(site_url)]\"/>\n\n       <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n      <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n\n       <link href=\"[(site_url)][[if? &is=[(site_start)]:!=:[*id*] &then=`[~[*id*]~]`]]\" rel=\"canonical\">\n     <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:400,700\" rel=\"stylesheet\" type=\"text/css\">  \n      <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\">\n      <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css\">\n\n      <style> \n          html, body{background:#eee; font-family:\'Open Sans\',sans-serif; line-height:1.8; font-size:14px;}\n           a:focus{outline:none; outline-offset:0;}\n          h1{margin-top:15px;}\n\n            .logo{float:left;}\n            .logo img{ margin-top:10px; display:block; max-width:256px;}\n          \n          .dropdown-menu{border-radius:0; border:0;}\n            .dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n           .navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n          .navbar{min-height:0; background:#fff; margin-bottom:0;}\n          .navbar.nav{margin-left:0;}\n           .navbar.nav ul{padding-left:0;}\n           .navbar-nav{margin:0;}\n            .navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n          .navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n            .nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n         .nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n          .navbar{border:none; border-radius:0;}\n            #navbar{padding:0;}\n           ul.nav > li > a:hover{background-color:#f5f5f5;}\n\n            .affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n         .affix + .affspacer{display:block; height:50px;}\n\n            .box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n            .container {max-width:970px; margin:0 12px;}\n          .top .col-sm-12{padding-left:0; padding-right:0;}\n\n           #ajaxSearch_input,\n            #username,\n            #password{width:100%!important;}\n          #forgotpsswd{clear:both;}\n         input.button[type=\"submit\"]{display:block;}\n         label.checkbox{display:inline-block; margin-left:10px;}\n           label, legend{font-weight:400;}\n           #ajaxSearch_form { position:relative; }\n           #searchClose { display:none !important; }\n         #indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n         h2{font-size:22px;}\n           .bread{padding:1em 0 0 0;}\n            .mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n         section.main .container{background-color:#fff; padding-bottom:20px;}\n          footer.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n          section.main .content ul{list-style:none; margin:0 0 1em 0; padding:0;}\n           section.main .content ul li{padding-left:1em;}\n            section.main .content ul li:before{content:\'\\2022\'; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n            .breadcrumb {padding: 0px 0px;margin-bottom: 0px;list-style: none;background-color:#fff;border-radius: 0px;}    \n\n            .footer{text-align:center;}\n           .footer .text-right{text-align:center;}\n\n         /* JOT */\n         .jot-comment{padding:5px 10px;}\n           .jot-row-author{background-color:#dddddd;}\n            .jot-row-alt{background-color:#f9f9f9;}\n           .jot-row{background-color:#eeeeee;}\n           .jot-row-up{border:1px solid #333!important;}\n         .jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n         .jot-extra{font-size:75%;}\n            .jot-poster{font-size:inherit!important;}\n\n           .dl_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n           .dl_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n           .pagination b, .pagination a {padding: 5px;}    \n\n            div.errors{ color:#F00; }\n         #EmailForm .invalidValue{ background: #FFDFDF; border:1px solid #F00; }\n           #EmailForm .requiredValue{ background: #FFFFDF; border:1px solid #F00; }    \n\n            /* Larger than mobile */\n          @media (min-width:320px) {\n\n          }\n\n           /* Larger than phablet */\n         @media (min-width:480px) {\n\n          }\n\n           /* Larger than tablet */\n          @media (min-width:768px) {\n\n              .container{margin:0 auto;}\n                .logo{padding-left:15px;}\n             .logo img{ margin-top:10px; display:block; max-width:256px;}\n\n                .navbar{background:transparent;}\n              .navbar.affix{background:#eee;}\n               .navbar-collapse.collapse.in{border-bottom:0;}\n\n              .footer{text-align:left;}\n             .footer .text-right{text-align:right;}\n\n              .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n         }\n     </style>\n\n        <script src=\"https://code.jquery.com/jquery-2.2.3.min.js\"></script>\n </head>\n   <body>\n        <section class=\"top\">\n           <div class=\"container\">\n             <div class=\"row\">\n                   <div class=\"col-sm-12\" itemscope itemtype=\"http://schema.org/Organization\">\n\n                     <a class=\"logo\" href=\"[~[(site_start)]~]\" title=\"[(site_name)]\" itemprop=\"url\">\n                           <img src=\"[(site_url)]manager/media/style/default/images/misc/login-logo.png\" itemprop=\"logo\" alt=\"[(site_name)]\" />\n                        </a>\n\n                        <div class=\"clearfix\"></div>\n\n                      <nav class=\"navbar\" role=\"navigation\" data-spy=\"affix\" data-offset-top=\"100\">\n\n                           <div class=\"navbar-header\">\n                             <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\n                                  <span class=\"sr-only\">Toggle navigation</span>\n                                  <span class=\"icon-bar\"></span>\n                                  <span class=\"icon-bar\"></span>\n                                  <span class=\"icon-bar\"></span>\n                              </button>\n                         </div>\n                            <div id=\"navbar\" class=\"navbar-collapse collapse\">\n\n                              [[DLMenu? \n                                &parents=`0` \n                             &maxDepth=`2` \n                                &outerClass=`nav navbar-nav`\n                              &hereClass=`active`\n                               &innerTpl=`@CODE:<ul class=\"dropdown-menu\">[+wrap+]</ul>`\n                               &parentRowTpl=`@CODE:<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" title=\"[+title+]\">[+title+] <b class=\"caret\"></b></a>[+wrap+]</li>`\n                              ]]\n\n                          </div>\n                        </nav>\n                        <div class=\"affspacer\"></div>\n\n                 </div>\n                </div>\n            </div>\n        </section>\n\n      <section class=\"main\">\n          <div class=\"container\">\n\n               <div class=\"row\">\n                   <div class=\"col-sm-12\">\n                     <div class=\"bread\">\n                         [[if? &is=`[*id*]:!=:[(site_start)]` &then=`\n                              [[DLCrumbs? &showCurrent=`1`]]\n                            `]]\n                       </div>\n                    </div>\n                </div>\n\n              <div class=\"row content\">\n\n                 <div class=\"col-sm-8\">\n                      <h1>[*#longtitle*]</h1>\n                       [*#content*]\n                      \n                      [[if? &is=`[*parent*]:=:2` &then=`@TPL:Comments`]]\n                    </div>\n\n                  <aside class=\"col-sm-4\">\n                        <div class=\"search\">\n                            <h2>Search</h2>\n                           [[ifsnippet? &name=`AjaxSearch`]]\n                         [!AjaxSearch? \n                            &ajaxSearch=`1` \n                          &addJscript=`0` \n                          &showIntro=`0` \n                           &ajaxMax=`5` \n                         &extract=`1`\n                          &jscript=`jquery`\n                         &tplInput=`AjaxSearch_tplInput`\n                           &tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n                           &tplAjaxResults=`AjaxSearch_tplAjaxResults`\n                           &tplAjaxResult=`AjaxSearch_tplAjaxResult`\n                         &showResults=`1`\n                          &liveSearch=`0`\n                           !]\n                        </div>\n\n                      <h2>News:</h2>\n                        [[DocLister? \n                     &parents=`2` \n                     &display=`2`\n                      &total=`20` \n                      &tpl=`@CODE:<strong><a href=\"[+url+]\" title=\"[+e.title+]\">[+e.title+]</a></strong><br />\n                      [+longtitle+]<br /><br />`\n                        ]]\n\n                      <div>\n                         <h2>Most Recent:</h2>\n\n                           <ul>\n                              [[DocLister? \n                             &showInMenuOnly=`1` \n                              &parents=`0`\n                              &display=`5`\n                              &tpl=`@CODE:<li><a href=\"[+url+]\" title=\"[+pagetitle+]\">[+pagetitle+]</a> <span class=\"date\">[+date+]</span></li>`\n                              ]]\n                            </ul>\n\n                       </div>\n                        \n                  </aside>\n              </div>\n            </div>\n\n      </section>\n\n      <footer class=\"footer\">\n         <div class=\"container\">\n             <div class=\"row\">\n                   <div class=\"col-sm-6\">\n                      <a href=\"https://evo.im\" title=\"Learn more about EVO\">EVO</a> Starter-Template &copy;2006-[[$_SERVER[\'REQUEST_TIME\']:dateFormat=`Y` ]]\n                  </div>\n                    <div class=\"col-sm-6 text-right\">\n                       Built with <a href=\"http://www.getbootstrap.com\" target=\"_blank\">Bootstrap</a> framework.\n                 </div>\n                </div>\n            </div>\n        </footer>\n\n       <div class=\"container mem\">\n         <small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n      </div>\n\n      <!-- Scripts\n–––––––––––––––––––––––––––––––––––––––––––––––––– -->    \n\n        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script>\n     <!--[if lt IE 9]>\n<script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n<script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n<![endif]-->\n\n   </body>\n</html>', 0, 1, 0, 1509819347),
(5, 'Главная', NULL, '', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang=\"ru\">\r\n\r\n<head>\r\n  {{head}}\r\n</head>\r\n\r\n<body>\r\n  {{header}}\r\n	<main class=\"main-content\">\r\n		<div style=\"display:none;\">{{pagetitle}}</div>\r\n    {{banner}}\r\n	\r\n	{{home_page_categories}}\r\n		\r\n	{{home_page_about}}\r\n		\r\n		<div>\r\n			[*content*]\r\n		</div>\r\n		\r\n  </main>\r\n  {{footer}}\r\n</body>\r\n\r\n  <!-- Swiper JS -->\r\n  <script src=\"https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js\"></script>\r\n\r\n  <!-- Initialize Swiper -->\r\n  <script>\r\n    var swiper = new Swiper(\".mySwiper\", {\r\n		loop: true,\r\n      navigation: {\r\n        nextEl: \".swiper-button-next\",\r\n        prevEl: \".swiper-button-prev\",\r\n      },\r\n    });\r\n  </script>\r\n\r\n</html>\r\n', 0, 1, 1735818324, 1736098423),
(6, 'Категория каталога', NULL, '', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang=\"ru\">\r\n\r\n<head>\r\n  {{head}}\r\n</head>\r\n\r\n<body>\r\n  {{header}}\r\n  \r\n	<main>\r\n		{{pagetitle}}\r\n		{{catalog_content}}\r\n  	</main>\r\n  	</main>\r\n	\r\n  {{footer}}\r\n</body>\r\n\r\n</html>\r\n', 0, 1, 1735833148, 1736101892),
(7, 'Карточка товара', NULL, '', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang=\"ru\">\r\n\r\n<head>\r\n  {{head}}\r\n</head>\r\n\r\n<body>\r\n  {{header}}\r\n  \r\n	<main>\r\n		{{pagetitle}}\r\n		<div class=\"content\">\r\n			[*content*]\r\n		</div>\r\n  	</main>\r\n  {{footer}}\r\n</body>\r\n\r\n</html>\r\n', 0, 1, 1735833162, 1736078978),
(8, 'Информационная страница', NULL, '', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang=\"ru\">\r\n\r\n<head>\r\n  {{head}}\r\n</head>\r\n\r\n<body>\r\n  {{header}}\r\n  \r\n	<main>\r\n		{{pagetitle}}\r\n		<div class=\"content\">\r\n			[*content*]\r\n		</div>\r\n  	</main>\r\n  {{footer}}\r\n</body>\r\n\r\n</html>\r\n', 0, 1, 1735833175, 1735945248);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_tmplvars`
--

CREATE TABLE `fobw_site_tmplvars` (
  `id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `caption` varchar(80) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint NOT NULL DEFAULT '0',
  `elements` text COLLATE utf8mb4_general_ci,
  `rank` int NOT NULL DEFAULT '0',
  `display` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COLLATE utf8mb4_general_ci COMMENT 'Display Control Properties',
  `default_text` text COLLATE utf8mb4_general_ci,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Site Template Variables';

--
-- Дамп данных таблицы `fobw_site_tmplvars`
--

INSERT INTO `fobw_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`) VALUES
(1, 'text', 'meta_title', 'Meta title', 'Meta title', 0, 1, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]', 0, 0),
(2, 'checkbox', 'meta_noindex', 'Allow page indexing', 'Meta robots', 0, 1, 0, 'No==<meta name=\"robots\" content=\"noindex, nofollow\">', 0, '', '', '', 0, 0),
(3, 'text', 'meta_keywords', 'Meta keywords', 'Meta keywords', 0, 1, 0, '', 0, '', '', '[*pagetitle*]', 0, 0),
(4, 'textarea', 'meta_description', 'Meta description', 'Meta description', 0, 1, 0, '', 0, '', '', '[*introtext*]', 0, 0),
(5, 'text', 'meta_h1', 'meta_h1', '', 0, 0, 0, '', 0, '', '', '', 1735945550, 1735945550),
(6, 'text', 'og_title', 'og_title', '', 0, 1, 0, '', 0, '', '', '', 1735945675, 1736200190),
(7, 'textarea', 'og_description', 'og_description', '', 0, 1, 0, '', 0, '', '', '', 1735945685, 1736200144),
(8, 'image', 'og_image', 'og_image', '', 0, 1, 0, '', 0, '', '', '', 1735945706, 1736200180),
(11, 'image', 'category_image', 'category_image', '', 0, 0, 0, '', 0, '', '&alttext=qwe&align=none', '', 1735945934, 1736101802),
(12, 'image', 'product_image', 'product_image', '', 0, 0, 0, '', 0, '', '', '', 1735945957, 1735945957),
(13, 'image', 'product_price', 'product_price', '', 0, 0, 0, '', 0, '', '', '', 1735945976, 1735945976),
(14, 'custom_tv:multitv', 'home_banners', 'home_banners', '', 0, 0, 0, '', 0, '', '&align=none', '', 1736083377, 1736083796);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_tmplvar_access`
--

CREATE TABLE `fobw_site_tmplvar_access` (
  `id` int NOT NULL,
  `tmplvarid` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for template variable access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_tmplvar_contentvalues`
--

CREATE TABLE `fobw_site_tmplvar_contentvalues` (
  `id` int NOT NULL,
  `tmplvarid` int NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext COLLATE utf8mb4_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Site Template Variables Content Values Link Table';

--
-- Дамп данных таблицы `fobw_site_tmplvar_contentvalues`
--

INSERT INTO `fobw_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(6, 13, 67, '1500'),
(5, 5, 65, 'Контакты H1'),
(4, 5, 54, 'Смартфоны H1'),
(7, 13, 68, '2000'),
(8, 13, 69, '1500'),
(9, 13, 70, '1700'),
(10, 13, 71, '5000'),
(11, 13, 72, '1200'),
(12, 13, 73, '3500'),
(13, 12, 67, 'assets/images/ph-1.png'),
(14, 12, 68, 'assets/images/ph-2.png'),
(15, 12, 69, 'assets/images/ph-3.png'),
(16, 12, 70, 'assets/images/ph-4.png'),
(17, 12, 71, 'assets/images/ph-5.png'),
(18, 12, 72, 'assets/images/ph-6.png'),
(19, 12, 73, 'assets/images/ph-7.png'),
(21, 7, 54, 'йцу'),
(24, 6, 54, '123123'),
(25, 8, 54, 'assets/images/phone-01.png'),
(29, 11, 54, 'assets/images/0-1.png'),
(30, 11, 55, 'assets/images/0-2.png'),
(28, 14, 1, '{\"fieldValue\":[{\"home_banner_desktop\":\"assets/images/home_banner_1_desktop.png\",\"home_banner_mobile\":\"assets/images/home_banner_1_mobile.png\"},{\"home_banner_desktop\":\"assets/images/home_banner_2_desktop.png\",\"home_banner_mobile\":\"assets/images/home_banner_2_mobile.png\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
(31, 11, 56, 'assets/images/0-3.png'),
(32, 11, 57, 'assets/images/0-4.png'),
(33, 11, 58, 'assets/images/0-5.png'),
(34, 11, 59, 'assets/images/0-6.png');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_site_tmplvar_templates`
--

CREATE TABLE `fobw_site_tmplvar_templates` (
  `tmplvarid` int NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `fobw_site_tmplvar_templates`
--

INSERT INTO `fobw_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(5, 4, 0),
(5, 3, 0),
(5, 5, 0),
(5, 8, 0),
(5, 7, 0),
(5, 6, 0),
(6, 7, 0),
(6, 6, 0),
(6, 8, 0),
(6, 4, 0),
(6, 3, 0),
(6, 5, 0),
(7, 7, 0),
(8, 7, 0),
(8, 6, 0),
(8, 8, 0),
(8, 4, 0),
(8, 3, 0),
(8, 5, 0),
(7, 6, 0),
(7, 8, 0),
(7, 4, 0),
(7, 3, 0),
(7, 5, 0),
(11, 6, 0),
(12, 7, 0),
(13, 7, 0),
(14, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_system_eventnames`
--

CREATE TABLE `fobw_system_eventnames` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `service` tinyint NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='System Event Names.';

--
-- Дамп данных таблицы `fobw_system_eventnames`
--

INSERT INTO `fobw_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(20, 'OnMakePageCacheKey', 4, ''),
(21, 'OnLoadWebPageCache', 4, ''),
(22, 'OnBeforeSaveWebPageCache', 4, ''),
(23, 'OnChunkFormPrerender', 1, 'Chunks'),
(24, 'OnChunkFormRender', 1, 'Chunks'),
(25, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(26, 'OnChunkFormSave', 1, 'Chunks'),
(27, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(28, 'OnChunkFormDelete', 1, 'Chunks'),
(29, 'OnDocFormPrerender', 1, 'Documents'),
(30, 'OnDocFormRender', 1, 'Documents'),
(31, 'OnBeforeDocFormSave', 1, 'Documents'),
(32, 'OnDocFormSave', 1, 'Documents'),
(33, 'OnBeforeDocFormDelete', 1, 'Documents'),
(34, 'OnDocFormDelete', 1, 'Documents'),
(35, 'OnDocFormUnDelete', 1, 'Documents'),
(36, 'onBeforeMoveDocument', 1, 'Documents'),
(37, 'onAfterMoveDocument', 1, 'Documents'),
(38, 'OnPluginFormPrerender', 1, 'Plugins'),
(39, 'OnPluginFormRender', 1, 'Plugins'),
(40, 'OnBeforePluginFormSave', 1, 'Plugins'),
(41, 'OnPluginFormSave', 1, 'Plugins'),
(42, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(43, 'OnPluginFormDelete', 1, 'Plugins'),
(44, 'OnSnipFormPrerender', 1, 'Snippets'),
(45, 'OnSnipFormRender', 1, 'Snippets'),
(46, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(47, 'OnSnipFormSave', 1, 'Snippets'),
(48, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(49, 'OnSnipFormDelete', 1, 'Snippets'),
(50, 'OnTempFormPrerender', 1, 'Templates'),
(51, 'OnTempFormRender', 1, 'Templates'),
(52, 'OnBeforeTempFormSave', 1, 'Templates'),
(53, 'OnTempFormSave', 1, 'Templates'),
(54, 'OnBeforeTempFormDelete', 1, 'Templates'),
(55, 'OnTempFormDelete', 1, 'Templates'),
(56, 'OnTVFormPrerender', 1, 'Template Variables'),
(57, 'OnTVFormRender', 1, 'Template Variables'),
(58, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(59, 'OnTVFormSave', 1, 'Template Variables'),
(60, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(61, 'OnTVFormDelete', 1, 'Template Variables'),
(62, 'OnUserFormPrerender', 1, 'Users'),
(63, 'OnUserFormRender', 1, 'Users'),
(64, 'OnBeforeUserFormSave', 1, 'Users'),
(65, 'OnUserFormSave', 1, 'Users'),
(66, 'OnBeforeUserFormDelete', 1, 'Users'),
(67, 'OnUserFormDelete', 1, 'Users'),
(68, 'OnWUsrFormPrerender', 1, 'Web Users'),
(69, 'OnWUsrFormRender', 1, 'Web Users'),
(70, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(71, 'OnWUsrFormSave', 1, 'Web Users'),
(72, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(73, 'OnWUsrFormDelete', 1, 'Web Users'),
(74, 'OnSiteRefresh', 1, ''),
(75, 'OnFileManagerUpload', 1, ''),
(76, 'OnModFormPrerender', 1, 'Modules'),
(77, 'OnModFormRender', 1, 'Modules'),
(78, 'OnBeforeModFormDelete', 1, 'Modules'),
(79, 'OnModFormDelete', 1, 'Modules'),
(80, 'OnBeforeModFormSave', 1, 'Modules'),
(81, 'OnModFormSave', 1, 'Modules'),
(82, 'OnBeforeWebLogin', 3, ''),
(83, 'OnWebAuthentication', 3, ''),
(84, 'OnBeforeManagerLogin', 2, ''),
(85, 'OnManagerAuthentication', 2, ''),
(86, 'OnLoadSettings', 1, 'System Settings'),
(87, 'OnSiteSettingsRender', 1, 'System Settings'),
(88, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(89, 'OnUserSettingsRender', 1, 'System Settings'),
(90, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(91, 'OnSecuritySettingsRender', 1, 'System Settings'),
(92, 'OnFileManagerSettingsRender', 1, 'System Settings'),
(93, 'OnMiscSettingsRender', 1, 'System Settings'),
(94, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(95, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(96, 'OnManagerPageInit', 2, ''),
(97, 'OnWebPageInit', 5, ''),
(98, 'OnLoadDocumentObject', 5, ''),
(99, 'OnBeforeLoadDocumentObject', 5, ''),
(100, 'OnAfterLoadDocumentObject', 5, ''),
(101, 'OnLoadWebDocument', 5, ''),
(102, 'OnParseDocument', 5, ''),
(103, 'OnParseProperties', 5, ''),
(104, 'OnBeforeParseParams', 5, ''),
(105, 'OnManagerLoginFormRender', 2, ''),
(106, 'OnWebPageComplete', 5, ''),
(107, 'OnLogPageHit', 5, ''),
(108, 'OnBeforeManagerPageInit', 2, ''),
(109, 'OnBeforeEmptyTrash', 1, 'Documents'),
(110, 'OnEmptyTrash', 1, 'Documents'),
(111, 'OnManagerLoginFormPrerender', 2, ''),
(112, 'OnStripAlias', 1, 'Documents'),
(113, 'OnMakeDocUrl', 5, ''),
(114, 'OnBeforeLoadExtension', 5, ''),
(115, 'OnCreateDocGroup', 1, 'Documents'),
(116, 'OnManagerWelcomePrerender', 2, ''),
(117, 'OnManagerWelcomeHome', 2, ''),
(118, 'OnManagerWelcomeRender', 2, ''),
(119, 'OnBeforeDocDuplicate', 1, 'Documents'),
(120, 'OnDocDuplicate', 1, 'Documents'),
(121, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(122, 'OnManagerPreFrameLoader', 2, ''),
(123, 'OnManagerFrameLoader', 2, ''),
(124, 'OnManagerTreeInit', 2, ''),
(125, 'OnManagerTreePrerender', 2, ''),
(126, 'OnManagerTreeRender', 2, ''),
(127, 'OnManagerNodePrerender', 2, ''),
(128, 'OnManagerNodeRender', 2, ''),
(129, 'OnManagerMenuPrerender', 2, ''),
(130, 'OnManagerTopPrerender', 2, ''),
(131, 'OnDocFormTemplateRender', 1, 'Documents'),
(132, 'OnBeforeMinifyCss', 1, ''),
(133, 'OnPageUnauthorized', 1, ''),
(134, 'OnPageNotFound', 1, ''),
(135, 'OnFileBrowserUpload', 1, 'File Browser Events'),
(136, 'OnBeforeFileBrowserUpload', 1, 'File Browser Events'),
(137, 'OnFileBrowserDelete', 1, 'File Browser Events'),
(138, 'OnBeforeFileBrowserDelete', 1, 'File Browser Events'),
(139, 'OnFileBrowserInit', 1, 'File Browser Events'),
(140, 'OnFileBrowserMove', 1, 'File Browser Events'),
(141, 'OnBeforeFileBrowserMove', 1, 'File Browser Events'),
(142, 'OnFileBrowserCopy', 1, 'File Browser Events'),
(143, 'OnBeforeFileBrowserCopy', 1, 'File Browser Events'),
(144, 'OnBeforeFileBrowserRename', 1, 'File Browser Events'),
(145, 'OnFileBrowserRename', 1, 'File Browser Events'),
(146, 'OnLogEvent', 1, ''),
(147, 'OnBeforeMailSend', 1, ''),
(148, 'OnBeforeClientSettingsSave', 6, 'ClientSettings'),
(149, 'OnClientSettingsSave', 6, 'ClientSettings');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_system_settings`
--

CREATE TABLE `fobw_system_settings` (
  `setting_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `setting_value` text COLLATE utf8mb4_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `fobw_system_settings`
--

INSERT INTO `fobw_system_settings` (`setting_name`, `setting_value`) VALUES
('settings_version', '1.4.35'),
('manager_theme', 'default'),
('server_offset_time', '0'),
('manager_language', 'russian-UTF8'),
('lang_code', 'ru'),
('modx_charset', 'UTF-8'),
('site_name', 'My Evolution Site'),
('site_start', '1'),
('error_page', '7'),
('unauthorized_page', '4'),
('site_status', '1'),
('auto_template_logic', 'sibling'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('friendly_urls', '1'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('cache_type', '2'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('emailsender', 'valikbelsky@yandex.ru'),
('use_editor', '1'),
('use_browser', '1'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('upload_maxsize', '10485760'),
('manager_layout', '4'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '600'),
('manager_direction', 'ltr'),
('xhtml_urls', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '0'),
('remember_last_tab', '1'),
('enable_bindings', '1'),
('seostrict', '1'),
('number_of_results', '30'),
('theme_refresher', ''),
('show_picker', '0'),
('show_newresource_btn', '0'),
('show_fullscreen_btn', '0'),
('email_sender_method', '1'),
('site_id', '6770035147ba1'),
('a', '30'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('site_unavailable_message', 'В настоящее время сайт недоступен.'),
('siteunavailable_message_default', 'russian-UTF8'),
('chunk_processor', ''),
('enable_at_syntax', '0'),
('enable_filter', '0'),
('cache_default', '1'),
('search_default', '1'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('docid_incrmnt_method', '0'),
('enable_cache', '1'),
('disable_chunk_cache', '0'),
('disable_snippet_cache', '0'),
('disable_plugins_cache', '0'),
('minifyphp_incache', '0'),
('server_protocol', 'http'),
('rss_url_news', 'https://github.com/evocms-community/evolution/releases.atom'),
('track_visitors', '0'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('make_folders', '0'),
('aliaslistingfolder', '0'),
('allow_duplicate_alias', '0'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('email_method', 'smtp'),
('smtp_auth', '1'),
('smtp_secure', 'ssl'),
('smtp_host', 'smtp.yandex.com'),
('smtp_port', '465'),
('smtp_username', 'valikbelsky@yandex.ru'),
('reload_emailsubject', ''),
('emailsubject', 'Данные для авторизации'),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', '<!doctype html>\r\n<html>\r\nHello [+uid+]\r\n\r\nHere are your login details for [+sname+] Content Manager:\r\n\r\nUsername: [+uid+]\r\nPassword: [+pwd+]\r\n\r\nOnce you log into the Content Manager ([+surl+]), you can change your password.\r\n\r\nRegards,\r\nSite Administrator\r\n</html>'),
('system_email_signup_default', '<!doctype html>\r\n<html>\r\nHello [+uid+]\r\n\r\nHere are your login details for [+sname+] Content Manager:\r\n\r\nUsername: [+uid+]\r\nPassword: [+pwd+]\r\n\r\nOnce you log into the Content Manager ([+surl+]), you can change your password.\r\n\r\nRegards,\r\nSite Administrator\r\n</html>'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Hello [+uid+]\r\n\r\nHere are your login details for [+sname+]:\r\n\r\nUsername: [+uid+]\r\nPassword: [+pwd+]\r\n\r\nOnce you log into [+sname+] ([+surl+]), you can change your password.\r\n\r\nRegards,\r\nSite Administrator'),
('system_email_websignup_default', 'Hello [+uid+]\r\n\r\nHere are your login details for [+sname+]:\r\n\r\nUsername: [+uid+]\r\nPassword: [+pwd+]\r\n\r\nOnce you log into [+sname+] ([+surl+]), you can change your password.\r\n\r\nRegards,\r\nSite Administrator'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Hello [+uid+]\r\n\r\nTo activate your new password click the following link:\r\n\r\n[+surl+]\r\n\r\nIf successful you can use the following password to login:\r\n\r\nPassword:[+pwd+]\r\n\r\nIf you did not request this email then please ignore it.\r\n\r\nRegards,\r\nSite Administrator'),
('system_email_webreminder_default', 'Hello [+uid+]\r\n\r\nTo activate your new password click the following link:\r\n\r\n[+surl+]\r\n\r\nIf successful you can use the following password to login:\r\n\r\nPassword:[+pwd+]\r\n\r\nIf you did not request this email then please ignore it.\r\n\r\nRegards,\r\nSite Administrator'),
('manager_theme_mode', '3'),
('login_logo', ''),
('login_bg', ''),
('login_form_position', 'left'),
('login_form_style', 'dark'),
('manager_menu_position', 'top'),
('tree_page_click', '27'),
('use_breadcrumbs', '0'),
('global_tabs', '1'),
('group_tvs', '0'),
('resource_tree_node_name', 'pagetitle'),
('session_timeout', '15'),
('tree_show_protected', '0'),
('datepicker_offset', '-10'),
('number_of_logs', '100'),
('number_of_messages', '40'),
('which_editor', 'TinyMCE4'),
('tinymce4_theme', 'custom'),
('tinymce4_skin', 'lightgray'),
('tinymce4_skintheme', 'inlite'),
('tinymce4_template_docs', ''),
('tinymce4_template_chunks', ''),
('tinymce4_entermode', 'p'),
('tinymce4_element_format', 'xhtml'),
('tinymce4_schema', 'html5'),
('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
('tinymce4_custom_buttons3', ''),
('tinymce4_custom_buttons4', ''),
('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
('allow_eval', 'with_scan'),
('safe_functions_at_eval', 'time,date,strtotime'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('validate_referer', '1'),
('rss_url_security', 'https://github.com/extras-evolution/security-fix/releases.atom'),
('error_reporting', '1'),
('send_errormail', '0'),
('reload_captcha_words', ''),
('captcha_words', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('filemanager_path', '/Applications/MAMP/htdocs/modxxx.test/'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('which_browser', 'mcpuk'),
('rb_webuser', '0'),
('rb_base_dir', '/Applications/MAMP/htdocs/modxxx.test/assets/'),
('rb_base_url', 'assets/'),
('clean_uploaded_filename', '1'),
('strip_image_paths', '1'),
('maxImageWidth', '2600'),
('maxImageHeight', '2200'),
('clientResize', '0'),
('noThumbnailsRecreation', '0'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('sys_files_checksum', 'a:4:{s:47:\"/Applications/MAMP/htdocs/modxxx.test/index.php\";s:32:\"f9f579ff8f867b90d4a4643ff79ef90c\";s:47:\"/Applications/MAMP/htdocs/modxxx.test/.htaccess\";s:32:\"098f16224a9e9d680c959a877601616d\";s:55:\"/Applications/MAMP/htdocs/modxxx.test/manager/index.php\";s:32:\"bb667738d2d80c29198903030ec6e657\";s:69:\"/Applications/MAMP/htdocs/modxxx.test/manager/includes/config.inc.php\";s:32:\"987222a56c4175650ed2d1cfbb199033\";}'),
('client_field_text', 'This is default value for this field'),
('client_field_textarea', ''),
('client_field_textareamini', ''),
('client_field_richtext', ''),
('client_field_dropdown', '1'),
('client_field_listbox', ''),
('client_field_listbox_multiple', ''),
('client_field_option', '3'),
('client_field_checkbox', '2||4||5'),
('client_field_image', ''),
('client_field_file', ''),
('client_field_url', ''),
('client_field_email', ''),
('client_field_number', ''),
('client_field_date', ''),
('client_multidemo', '[]'),
('client_custom', '#000000'),
('client_site_name', 'Qmedia Market'),
('client_logo', 'assets/images/logo.svg'),
('client_site_description', 'Интернет-магазин полезных вещей'),
('client_header_menu', '60,61,63,64,65'),
('client_header_phones', '[{\"header_phones\":\"+375 (29) 111-22-33\"},{\"header_phones\":\"+375 (29) 111-22-44\"}]'),
('client_footer_company_info', 'Юр. адрес: 220 123, г. Минск, ул. Старовиленская 100−4а Свидетельство о гос. регистрации номер 0191397 (выдано Минским горисполкомом 14.10.2022)'),
('client_footer_info_menu', '60,61,63,64,65'),
('client_footer_phones', '[{\"footer_phones\":\"+375 (29) 111-22-33\"},{\"footer_phones\":\"+375 (29) 111-22-55\"}]'),
('client_footer_emails', '[{\"footer_email\":\"info@qmedia.by\"}]'),
('client_form_from', 'valikbelsky@yandex.ru'),
('client_form_to', 'valikbelsky@gmail.com, valentinbelsky@live.com'),
('smtppw', 'dGtld3Nwd3B2cWVlYm51bg%%W4qQvU9');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_user_attributes`
--

CREATE TABLE `fobw_user_attributes` (
  `id` int NOT NULL,
  `internalKey` int NOT NULL DEFAULT '0',
  `fullname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `role` int NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `phone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobilephone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `blocked` int NOT NULL DEFAULT '0',
  `blockeduntil` int NOT NULL DEFAULT '0',
  `blockedafter` int NOT NULL DEFAULT '0',
  `logincount` int NOT NULL DEFAULT '0',
  `lastlogin` int NOT NULL DEFAULT '0',
  `thislogin` int NOT NULL DEFAULT '0',
  `failedlogincount` int NOT NULL DEFAULT '0',
  `sessionid` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `dob` int NOT NULL DEFAULT '0',
  `gender` int NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `street` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `state` varchar(25) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zip` varchar(25) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fax` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text COLLATE utf8mb4_general_ci,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `verified` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains information about the backend users.';

--
-- Дамп данных таблицы `fobw_user_attributes`
--

INSERT INTO `fobw_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`, `verified`) VALUES
(1, 1, 'Admin', 1, 'valentinbelsky@live.com', '', '', 0, 0, 0, 4, 1736200709, 1736200720, 0, 'dovqtb5ib5ukns71s2c4tce2q5', 0, 0, '', '', '', '', '', '', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_user_messages`
--

CREATE TABLE `fobw_user_messages` (
  `id` int NOT NULL,
  `type` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `subject` varchar(60) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_general_ci,
  `sender` int NOT NULL DEFAULT '0',
  `recipient` int NOT NULL DEFAULT '0',
  `private` tinyint NOT NULL DEFAULT '0',
  `postdate` int NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains messages for the Content Manager messaging system.';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_user_roles`
--

CREATE TABLE `fobw_user_roles` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `frames` int NOT NULL DEFAULT '0',
  `home` int NOT NULL DEFAULT '0',
  `view_document` int NOT NULL DEFAULT '0',
  `new_document` int NOT NULL DEFAULT '0',
  `save_document` int NOT NULL DEFAULT '0',
  `publish_document` int NOT NULL DEFAULT '0',
  `delete_document` int NOT NULL DEFAULT '0',
  `empty_trash` int NOT NULL DEFAULT '0',
  `action_ok` int NOT NULL DEFAULT '0',
  `logout` int NOT NULL DEFAULT '0',
  `help` int NOT NULL DEFAULT '0',
  `messages` int NOT NULL DEFAULT '0',
  `new_user` int NOT NULL DEFAULT '0',
  `edit_user` int NOT NULL DEFAULT '0',
  `logs` int NOT NULL DEFAULT '0',
  `edit_parser` int NOT NULL DEFAULT '0',
  `save_parser` int NOT NULL DEFAULT '0',
  `edit_template` int NOT NULL DEFAULT '0',
  `settings` int NOT NULL DEFAULT '0',
  `credits` int NOT NULL DEFAULT '0',
  `new_template` int NOT NULL DEFAULT '0',
  `save_template` int NOT NULL DEFAULT '0',
  `delete_template` int NOT NULL DEFAULT '0',
  `edit_snippet` int NOT NULL DEFAULT '0',
  `new_snippet` int NOT NULL DEFAULT '0',
  `save_snippet` int NOT NULL DEFAULT '0',
  `delete_snippet` int NOT NULL DEFAULT '0',
  `edit_chunk` int NOT NULL DEFAULT '0',
  `new_chunk` int NOT NULL DEFAULT '0',
  `save_chunk` int NOT NULL DEFAULT '0',
  `delete_chunk` int NOT NULL DEFAULT '0',
  `empty_cache` int NOT NULL DEFAULT '0',
  `edit_document` int NOT NULL DEFAULT '0',
  `change_password` int NOT NULL DEFAULT '0',
  `error_dialog` int NOT NULL DEFAULT '0',
  `about` int NOT NULL DEFAULT '0',
  `category_manager` int NOT NULL DEFAULT '0',
  `file_manager` int NOT NULL DEFAULT '0',
  `assets_files` int NOT NULL DEFAULT '0',
  `assets_images` int NOT NULL DEFAULT '0',
  `save_user` int NOT NULL DEFAULT '0',
  `delete_user` int NOT NULL DEFAULT '0',
  `save_password` int NOT NULL DEFAULT '0',
  `edit_role` int NOT NULL DEFAULT '0',
  `save_role` int NOT NULL DEFAULT '0',
  `delete_role` int NOT NULL DEFAULT '0',
  `new_role` int NOT NULL DEFAULT '0',
  `access_permissions` int NOT NULL DEFAULT '0',
  `bk_manager` int NOT NULL DEFAULT '0',
  `new_plugin` int NOT NULL DEFAULT '0',
  `edit_plugin` int NOT NULL DEFAULT '0',
  `save_plugin` int NOT NULL DEFAULT '0',
  `delete_plugin` int NOT NULL DEFAULT '0',
  `new_module` int NOT NULL DEFAULT '0',
  `edit_module` int NOT NULL DEFAULT '0',
  `save_module` int NOT NULL DEFAULT '0',
  `delete_module` int NOT NULL DEFAULT '0',
  `exec_module` int NOT NULL DEFAULT '0',
  `view_eventlog` int NOT NULL DEFAULT '0',
  `delete_eventlog` int NOT NULL DEFAULT '0',
  `new_web_user` int NOT NULL DEFAULT '0',
  `edit_web_user` int NOT NULL DEFAULT '0',
  `save_web_user` int NOT NULL DEFAULT '0',
  `delete_web_user` int NOT NULL DEFAULT '0',
  `web_access_permissions` int NOT NULL DEFAULT '0',
  `view_unpublished` int NOT NULL DEFAULT '0',
  `import_static` int NOT NULL DEFAULT '0',
  `export_static` int NOT NULL DEFAULT '0',
  `remove_locks` int NOT NULL DEFAULT '0',
  `display_locks` int NOT NULL DEFAULT '0',
  `change_resourcetype` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains information describing the user roles.';

--
-- Дамп данных таблицы `fobw_user_roles`
--

INSERT INTO `fobw_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `category_manager`, `file_manager`, `assets_files`, `assets_images`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`, `display_locks`, `change_resourcetype`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_user_settings`
--

CREATE TABLE `fobw_user_settings` (
  `user` int NOT NULL,
  `setting_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `setting_value` text COLLATE utf8mb4_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_webgroup_access`
--

CREATE TABLE `fobw_webgroup_access` (
  `id` int NOT NULL,
  `webgroup` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `fobw_webgroup_access`
--

INSERT INTO `fobw_webgroup_access` (`id`, `webgroup`, `documentgroup`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_webgroup_names`
--

CREATE TABLE `fobw_webgroup_names` (
  `id` int NOT NULL,
  `name` varchar(245) COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `fobw_webgroup_names`
--

INSERT INTO `fobw_webgroup_names` (`id`, `name`) VALUES
(1, 'Site Admins'),
(2, 'Registered Users');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_web_groups`
--

CREATE TABLE `fobw_web_groups` (
  `id` int NOT NULL,
  `webgroup` int NOT NULL DEFAULT '0',
  `webuser` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `fobw_web_groups`
--

INSERT INTO `fobw_web_groups` (`id`, `webgroup`, `webuser`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_web_users`
--

CREATE TABLE `fobw_web_users` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `cachepwd` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fobw_web_users`
--

INSERT INTO `fobw_web_users` (`id`, `username`, `password`, `cachepwd`) VALUES
(1, 'siteadmin', '5f4dcc3b5aa765d61d8327deb882cf99', '');

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_web_user_attributes`
--

CREATE TABLE `fobw_web_user_attributes` (
  `id` int NOT NULL,
  `internalKey` int NOT NULL DEFAULT '0',
  `fullname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `role` int NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `phone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobilephone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `blocked` int NOT NULL DEFAULT '0',
  `blockeduntil` int NOT NULL DEFAULT '0',
  `blockedafter` int NOT NULL DEFAULT '0',
  `logincount` int NOT NULL DEFAULT '0',
  `lastlogin` int NOT NULL DEFAULT '0',
  `thislogin` int NOT NULL DEFAULT '0',
  `failedlogincount` int NOT NULL DEFAULT '0',
  `sessionid` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `dob` int NOT NULL DEFAULT '0',
  `gender` int NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `street` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `state` varchar(25) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zip` varchar(25) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fax` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text COLLATE utf8mb4_general_ci,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `verified` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains information for web users.';

--
-- Дамп данных таблицы `fobw_web_user_attributes`
--

INSERT INTO `fobw_web_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`, `verified`) VALUES
(1, 1, 'Site Admin', 0, 'you@example.com', '', '', 0, 0, 0, 25, 1129049624, 1129063123, 0, 'f426f3209310abfddf2ee00e929774b4', 0, 0, '', '', '', '', '', '', '', '', 1735394129, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fobw_web_user_settings`
--

CREATE TABLE `fobw_web_user_settings` (
  `webuser` int NOT NULL,
  `setting_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `setting_value` text COLLATE utf8mb4_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Contains web user settings.';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `fobw_active_users`
--
ALTER TABLE `fobw_active_users`
  ADD PRIMARY KEY (`sid`,`username`);

--
-- Индексы таблицы `fobw_active_user_locks`
--
ALTER TABLE `fobw_active_user_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`);

--
-- Индексы таблицы `fobw_active_user_sessions`
--
ALTER TABLE `fobw_active_user_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `fobw_categories`
--
ALTER TABLE `fobw_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_documentgroup_names`
--
ALTER TABLE `fobw_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `fobw_document_groups`
--
ALTER TABLE `fobw_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  ADD KEY `document` (`document`);

--
-- Индексы таблицы `fobw_event_log`
--
ALTER TABLE `fobw_event_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `fobw_jot_content`
--
ALTER TABLE `fobw_jot_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `secip` (`secip`),
  ADD KEY `tagidx` (`tagid`),
  ADD KEY `uparent` (`uparent`);

--
-- Индексы таблицы `fobw_jot_subscriptions`
--
ALTER TABLE `fobw_jot_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uparent` (`uparent`),
  ADD KEY `tagid` (`tagid`),
  ADD KEY `userid` (`userid`);

--
-- Индексы таблицы `fobw_manager_log`
--
ALTER TABLE `fobw_manager_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_manager_users`
--
ALTER TABLE `fobw_manager_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `fobw_membergroup_access`
--
ALTER TABLE `fobw_membergroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_membergroup_names`
--
ALTER TABLE `fobw_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `fobw_member_groups`
--
ALTER TABLE `fobw_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_member` (`user_group`,`member`);

--
-- Индексы таблицы `fobw_site_content`
--
ALTER TABLE `fobw_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `aliasidx` (`alias`),
  ADD KEY `typeidx` (`type`);
ALTER TABLE `fobw_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`);

--
-- Индексы таблицы `fobw_site_htmlsnippets`
--
ALTER TABLE `fobw_site_htmlsnippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_modules`
--
ALTER TABLE `fobw_site_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_module_access`
--
ALTER TABLE `fobw_site_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_module_depobj`
--
ALTER TABLE `fobw_site_module_depobj`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_plugins`
--
ALTER TABLE `fobw_site_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_plugin_events`
--
ALTER TABLE `fobw_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`evtid`);

--
-- Индексы таблицы `fobw_site_snippets`
--
ALTER TABLE `fobw_site_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_templates`
--
ALTER TABLE `fobw_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_tmplvars`
--
ALTER TABLE `fobw_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_rank` (`rank`);

--
-- Индексы таблицы `fobw_site_tmplvar_access`
--
ALTER TABLE `fobw_site_tmplvar_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_site_tmplvar_contentvalues`
--
ALTER TABLE `fobw_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  ADD KEY `idx_id` (`contentid`);
ALTER TABLE `fobw_site_tmplvar_contentvalues` ADD FULLTEXT KEY `value_ft_idx` (`value`);

--
-- Индексы таблицы `fobw_site_tmplvar_templates`
--
ALTER TABLE `fobw_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `fobw_system_eventnames`
--
ALTER TABLE `fobw_system_eventnames`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `fobw_system_settings`
--
ALTER TABLE `fobw_system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Индексы таблицы `fobw_user_attributes`
--
ALTER TABLE `fobw_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `fobw_user_messages`
--
ALTER TABLE `fobw_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_user_roles`
--
ALTER TABLE `fobw_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_user_settings`
--
ALTER TABLE `fobw_user_settings`
  ADD PRIMARY KEY (`user`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`);

--
-- Индексы таблицы `fobw_webgroup_access`
--
ALTER TABLE `fobw_webgroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fobw_webgroup_names`
--
ALTER TABLE `fobw_webgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `fobw_web_groups`
--
ALTER TABLE `fobw_web_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`);

--
-- Индексы таблицы `fobw_web_users`
--
ALTER TABLE `fobw_web_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `fobw_web_user_attributes`
--
ALTER TABLE `fobw_web_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `fobw_web_user_settings`
--
ALTER TABLE `fobw_web_user_settings`
  ADD PRIMARY KEY (`webuser`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `webuserid` (`webuser`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `fobw_active_user_locks`
--
ALTER TABLE `fobw_active_user_locks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102;

--
-- AUTO_INCREMENT для таблицы `fobw_categories`
--
ALTER TABLE `fobw_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `fobw_documentgroup_names`
--
ALTER TABLE `fobw_documentgroup_names`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_document_groups`
--
ALTER TABLE `fobw_document_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_event_log`
--
ALTER TABLE `fobw_event_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `fobw_jot_content`
--
ALTER TABLE `fobw_jot_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `fobw_jot_subscriptions`
--
ALTER TABLE `fobw_jot_subscriptions`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_manager_log`
--
ALTER TABLE `fobw_manager_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2230;

--
-- AUTO_INCREMENT для таблицы `fobw_manager_users`
--
ALTER TABLE `fobw_manager_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_membergroup_access`
--
ALTER TABLE `fobw_membergroup_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_membergroup_names`
--
ALTER TABLE `fobw_membergroup_names`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_member_groups`
--
ALTER TABLE `fobw_member_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_site_content`
--
ALTER TABLE `fobw_site_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `fobw_site_htmlsnippets`
--
ALTER TABLE `fobw_site_htmlsnippets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `fobw_site_modules`
--
ALTER TABLE `fobw_site_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `fobw_site_module_access`
--
ALTER TABLE `fobw_site_module_access`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_site_module_depobj`
--
ALTER TABLE `fobw_site_module_depobj`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_site_plugins`
--
ALTER TABLE `fobw_site_plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `fobw_site_snippets`
--
ALTER TABLE `fobw_site_snippets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `fobw_site_templates`
--
ALTER TABLE `fobw_site_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `fobw_site_tmplvars`
--
ALTER TABLE `fobw_site_tmplvars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `fobw_site_tmplvar_access`
--
ALTER TABLE `fobw_site_tmplvar_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_site_tmplvar_contentvalues`
--
ALTER TABLE `fobw_site_tmplvar_contentvalues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `fobw_system_eventnames`
--
ALTER TABLE `fobw_system_eventnames`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT для таблицы `fobw_user_attributes`
--
ALTER TABLE `fobw_user_attributes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_user_messages`
--
ALTER TABLE `fobw_user_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fobw_user_roles`
--
ALTER TABLE `fobw_user_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `fobw_webgroup_access`
--
ALTER TABLE `fobw_webgroup_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_webgroup_names`
--
ALTER TABLE `fobw_webgroup_names`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `fobw_web_groups`
--
ALTER TABLE `fobw_web_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_web_users`
--
ALTER TABLE `fobw_web_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fobw_web_user_attributes`
--
ALTER TABLE `fobw_web_user_attributes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

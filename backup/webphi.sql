-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 01, 2020 lúc 01:34 PM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webphi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_address`
--

DROP TABLE IF EXISTS `mt_address`;
CREATE TABLE IF NOT EXISTS `mt_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_address`
--

INSERT INTO `mt_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'Tuan', 'Pham Minh', '', 'abcde', '', 'ho chi minh', '', 230, 4269, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_api`
--

DROP TABLE IF EXISTS `mt_api`;
CREATE TABLE IF NOT EXISTS `mt_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_api`
--

INSERT INTO `mt_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', '252UH9YxueBhCyQgpHVUeSBTKU7tvtdkXoLmS3sUkJEJ9lqKwTd9txsA9AEkPGWfH6R1HbkngWjbXTzxU0Ro8y9GFUDH7vhaqIhiotVN2H67MWyNp6xj5bTe0woAxwwt2mUO7cm74hR3KgrZVDxgFHTqFW8fiItLW11uPoW5BOBd90nIIdcP0A3jLgxiOyhakF1XdzROyheVBTdn0hf00R5e9mV1UNXTZm7ishYPzsttQXign6OErRgRlbYtHD53', 1, '2019-07-14 21:12:55', '2019-07-14 21:12:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_api_ip`
--

DROP TABLE IF EXISTS `mt_api_ip`;
CREATE TABLE IF NOT EXISTS `mt_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_api_ip`
--

INSERT INTO `mt_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '::1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_api_session`
--

DROP TABLE IF EXISTS `mt_api_session`;
CREATE TABLE IF NOT EXISTS `mt_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_api_session`
--

INSERT INTO `mt_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, 'b26cc8df3617ea90b9a4b4b4aa', '::1', '2019-07-14 21:36:10', '2019-07-14 21:36:10'),
(2, 1, '2500c4ae13b6b48d7289dcd775', '::1', '2019-07-29 00:52:31', '2019-07-29 00:52:31'),
(3, 1, '99e85f43c370fe43d9a858701e', '::1', '2019-07-29 00:56:31', '2019-07-29 00:56:31'),
(4, 1, '2a959751971ab9be40a28d0c19', '::1', '2019-07-30 21:30:23', '2019-07-30 21:30:23'),
(5, 1, 'f27bfb45b3f960f60d5bd88c8f', '::1', '2019-07-31 01:02:21', '2019-07-31 01:02:21'),
(6, 1, '84af17ece06b0a3977a664d29d', '::1', '2019-08-03 10:51:34', '2019-08-03 10:51:34'),
(7, 1, 'e55a4a3231afa0306bb2a0d258', '::1', '2019-08-06 21:16:26', '2019-08-06 21:16:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_attribute`
--

DROP TABLE IF EXISTS `mt_attribute`;
CREATE TABLE IF NOT EXISTS `mt_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_attribute`
--

INSERT INTO `mt_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_attribute_description`
--

DROP TABLE IF EXISTS `mt_attribute_description`;
CREATE TABLE IF NOT EXISTS `mt_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_attribute_description`
--

INSERT INTO `mt_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_attribute_group`
--

DROP TABLE IF EXISTS `mt_attribute_group`;
CREATE TABLE IF NOT EXISTS `mt_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_attribute_group`
--

INSERT INTO `mt_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_attribute_group_description`
--

DROP TABLE IF EXISTS `mt_attribute_group_description`;
CREATE TABLE IF NOT EXISTS `mt_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_attribute_group_description`
--

INSERT INTO `mt_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_banner`
--

DROP TABLE IF EXISTS `mt_banner`;
CREATE TABLE IF NOT EXISTS `mt_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_banner`
--

INSERT INTO `mt_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_banner_image`
--

DROP TABLE IF EXISTS `mt_banner_image`;
CREATE TABLE IF NOT EXISTS `mt_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_banner_image`
--

INSERT INTO `mt_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(99, 7, 2, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(100, 6, 2, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(101, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(102, 8, 2, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(103, 8, 2, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(104, 8, 2, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(105, 8, 2, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(106, 8, 2, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(107, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(108, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(109, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(110, 7, 2, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(111, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(112, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_author`
--

DROP TABLE IF EXISTS `mt_bm_author`;
CREATE TABLE IF NOT EXISTS `mt_bm_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author_group_id` int(11) NOT NULL,
  `custom` int(1) DEFAULT 0,
  `setting` text NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_author`
--

INSERT INTO `mt_bm_author` (`author_id`, `user_id`, `author_group_id`, `custom`, `setting`) VALUES
(1, 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_author_description`
--

DROP TABLE IF EXISTS `mt_bm_author_description`;
CREATE TABLE IF NOT EXISTS `mt_bm_author_description` (
  `author_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `author_description_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`author_description_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_author_description`
--

INSERT INTO `mt_bm_author_description` (`author_id`, `language_id`, `name`, `description`, `short_description`, `meta_title`, `meta_description`, `meta_keyword`, `author_description_id`) VALUES
(1, 1, 'Author', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', 'Author', '', '', 3),
(1, 2, 'Author', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', 'Author', '', '', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_author_group`
--

DROP TABLE IF EXISTS `mt_bm_author_group`;
CREATE TABLE IF NOT EXISTS `mt_bm_author_group` (
  `author_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`author_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_author_group`
--

INSERT INTO `mt_bm_author_group` (`author_group_id`, `name`, `permission`) VALUES
(1, 'admin', '[\"add_posts\",\"edit_posts\",\"delete_posts\",\"edit_others_posts\",\"delete_others_posts\",\"add_reviews\",\"edit_reviews\",\"delete_reviews\",\"add_others_reviews\",\"edit_others_reviews\",\"delete_others_reviews\",\"add_authors\",\"edit_authors\",\"delete_authors\",\"add_author_groups\",\"edit_author_groups\",\"delete_author_groups\",\"add_categories\",\"edit_categories\",\"delete_categories\",\"change_post_author\"]'),
(2, 'editor', '[\"add_posts\",\"edit_posts\",\"delete_posts\",\"edit_others_posts\",\"delete_others_posts\",\"add_reviews\",\"edit_reviews\",\"delete_reviews\",\"add_others_reviews\",\"edit_others_reviews\",\"delete_others_reviews\",\"add_authors\",\"edit_authors\",\"delete_authors\",\"add_author_groups\",\"edit_author_groups\",\"delete_author_groups\",\"add_categories\",\"edit_categories\",\"delete_categories\",\"change_post_author\"]'),
(3, 'author', '[\"add_posts\",\"edit_posts\",\"add_reviews\",\"edit_reviews\",\"delete_reviews\"]'),
(4, 'moderator', '[\"add_reviews\",\"edit_reviews\",\"delete_reviews\",\"add_others_reviews\",\"edit_others_reviews\",\"delete_others_reviews\"]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_category`
--

DROP TABLE IF EXISTS `mt_bm_category`;
CREATE TABLE IF NOT EXISTS `mt_bm_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `limit_access_user` int(1) NOT NULL DEFAULT 0,
  `limit_users` text DEFAULT NULL,
  `limit_access_user_group` int(1) NOT NULL DEFAULT 0,
  `limit_user_groups` text DEFAULT NULL,
  `custom` int(1) DEFAULT 0,
  `setting` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_category`
--

INSERT INTO `mt_bm_category` (`category_id`, `parent_id`, `sort_order`, `image`, `status`, `limit_access_user`, `limit_users`, `limit_access_user_group`, `limit_user_groups`, `custom`, `setting`, `date_added`, `date_modified`) VALUES
(1, 0, 1, 'catalog/d_blog_module/category/Photo_blog_17.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-09 11:28:15', '2016-04-18 18:16:48'),
(2, 1, 1, 'catalog/d_blog_module/category/Photo_blog_16.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-14 11:48:47', '2016-04-15 08:30:35'),
(3, 1, 1, 'catalog/d_blog_module/category/Photo_blog_13.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-14 11:49:10', '2016-04-15 08:29:54'),
(4, 1, 1, 'catalog/d_blog_module/category/Photo_blog_14.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-14 13:33:15', '2016-04-15 08:30:54'),
(5, 1, 1, 'catalog/d_blog_module/category/Photo_blog_11.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-14 13:34:30', '2016-04-14 13:56:13'),
(6, 1, 1, 'catalog/d_blog_module/category/Photo_blog_15.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-14 13:50:33', '2016-04-15 08:31:08'),
(7, 1, 1, 'catalog/d_blog_module/category/Photo_blog_12.jpg', 1, 0, NULL, 0, NULL, 0, '', '2016-04-14 13:52:36', '2016-04-15 08:30:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_category_description`
--

DROP TABLE IF EXISTS `mt_bm_category_description`;
CREATE TABLE IF NOT EXISTS `mt_bm_category_description` (
  `category_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  PRIMARY KEY (`category_description_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_category_description`
--

INSERT INTO `mt_bm_category_description` (`category_description_id`, `category_id`, `language_id`, `title`, `short_description`, `description`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 1, 1, 'Blog', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Jeans', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(2, 2, 1, 'Jeans', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Jeans', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(3, 3, 1, 'Bags', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Bags', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(4, 4, 1, 'Shoes', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Shoes', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(5, 5, 1, 'Accessories', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Tincidunt dissentiet adversarium eu mei. Per assum soluta iudicabit no, ne mei congue alterum theophrastus, eam ei tale accusamus laboramus. Elit platonem vix ex. Nostrum instructior eam ea, ius posse deserunt sapientem ad, iriure gubergren eu mei. Modus meliore pertinacia usu te, eos viris cetero laoreet cu. Quo laudem apeirian euripidis cu.&lt;br&gt;&lt;/p&gt;', 'Accessories', '', 'Tincidunt dissentiet adversarium eu mei. Per assum soluta iudicabit no, ne mei congue alterum theophrastus, eam ei tale accusamus laboramus. Elit platonem vix ex. Nostrum instructior eam ea, ius posse deserunt sapientem ad, iriure gubergren eu mei. Modus meliore pertinacia usu te, eos viris cetero laoreet cu. Quo laudem apeirian euripidis cu.'),
(6, 6, 1, 'Sport', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.&lt;br&gt;&lt;/p&gt;', 'Sport', '', 'Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.'),
(7, 7, 1, 'Beauty', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.&lt;br&gt;&lt;/p&gt;', 'Beauty', '', 'Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.'),
(8, 1, 2, 'Blog', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Jeans', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(9, 2, 2, 'Jeans', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Jeans', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(10, 3, 2, 'Bags', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Bags', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(11, 4, 2, 'Shoes', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.&lt;br&gt;&lt;/p&gt;', 'Shoes', '', 'Lorem ipsum dolor sit amet, an eleifend intellegat cum, ei amet tota modus nec. Vix ut veniam placerat, an nam amet legere consequat, vix nulla labores ne. Eam invidunt imperdiet persecuti ne, et mel aperiri feugait, in alterum facilisi mel. Et ullum scripserit usu, has ullum offendit ut. An feugait expetendis has.'),
(12, 5, 2, 'Accessories', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Tincidunt dissentiet adversarium eu mei. Per assum soluta iudicabit no, ne mei congue alterum theophrastus, eam ei tale accusamus laboramus. Elit platonem vix ex. Nostrum instructior eam ea, ius posse deserunt sapientem ad, iriure gubergren eu mei. Modus meliore pertinacia usu te, eos viris cetero laoreet cu. Quo laudem apeirian euripidis cu.&lt;br&gt;&lt;/p&gt;', 'Accessories', '', 'Tincidunt dissentiet adversarium eu mei. Per assum soluta iudicabit no, ne mei congue alterum theophrastus, eam ei tale accusamus laboramus. Elit platonem vix ex. Nostrum instructior eam ea, ius posse deserunt sapientem ad, iriure gubergren eu mei. Modus meliore pertinacia usu te, eos viris cetero laoreet cu. Quo laudem apeirian euripidis cu.'),
(13, 6, 2, 'Sport', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.&lt;br&gt;&lt;/p&gt;', 'Sport', '', 'Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.'),
(14, 7, 2, 'Beauty', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.&lt;br&gt;&lt;/p&gt;', 'Beauty', '', 'Exerci conceptam an pri. Mei id dicant commune legendos, ullum augue prodesset vim id. Nam sale euismod ut, eos ut agam meis comprehensam, an mel harum tamquam intellegam. In eius putent facilis nec, pro probo temporibus ei, falli fuisset sea ad. No his doming erroribus, ex alii atomorum neglegentur est, ea eam erat illum.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_category_path`
--

DROP TABLE IF EXISTS `mt_bm_category_path`;
CREATE TABLE IF NOT EXISTS `mt_bm_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_category_path`
--

INSERT INTO `mt_bm_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(2, 1, 0),
(2, 2, 1),
(3, 1, 0),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(4, 1, 0),
(5, 1, 0),
(6, 1, 0),
(6, 6, 1),
(7, 7, 1),
(7, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_category_to_layout`
--

DROP TABLE IF EXISTS `mt_bm_category_to_layout`;
CREATE TABLE IF NOT EXISTS `mt_bm_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_category_to_layout`
--

INSERT INTO `mt_bm_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(3, 0, 0),
(2, 0, 0),
(4, 0, 0),
(5, 0, 0),
(7, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_category_to_store`
--

DROP TABLE IF EXISTS `mt_bm_category_to_store`;
CREATE TABLE IF NOT EXISTS `mt_bm_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_category_to_store`
--

INSERT INTO `mt_bm_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post`
--

DROP TABLE IF EXISTS `mt_bm_post`;
CREATE TABLE IF NOT EXISTS `mt_bm_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `review_display` int(1) DEFAULT 0,
  `images_review` int(1) DEFAULT 0,
  `viewed` int(11) DEFAULT 1,
  `status` int(1) DEFAULT 1,
  `limit_access_user` int(1) NOT NULL DEFAULT 0,
  `limit_users` text DEFAULT NULL,
  `limit_access_user_group` int(1) NOT NULL DEFAULT 0,
  `limit_user_groups` text DEFAULT NULL,
  `custom` int(1) DEFAULT 0,
  `setting` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_published` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post`
--

INSERT INTO `mt_bm_post` (`post_id`, `user_id`, `image`, `image_title`, `image_alt`, `review_display`, `images_review`, `viewed`, `status`, `limit_access_user`, `limit_users`, `limit_access_user_group`, `limit_user_groups`, `custom`, `setting`, `date_added`, `date_published`, `date_modified`) VALUES
(1, 1, 'catalog/d_blog_module/post/Photo_blog_6.jpg', NULL, NULL, 0, 0, 184, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:00:05', '2016-04-24 00:00:00', '2016-04-27 19:09:25'),
(2, 1, 'catalog/d_blog_module/post/Photo_blog_3.jpg', NULL, NULL, 0, 0, 22, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:15:37', '2016-04-23 00:00:00', '2016-04-27 19:08:17'),
(3, 1, 'catalog/d_blog_module/post/Photo_blog_8.jpg', NULL, NULL, 0, 0, 15, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:24:30', '2016-04-23 00:00:00', '2016-04-27 19:10:06'),
(4, 1, 'catalog/d_blog_module/post/Photo_blog_2.jpg', NULL, NULL, 0, 0, 17, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:27:08', '2016-04-23 00:00:00', '2016-04-27 19:08:54'),
(5, 1, 'catalog/d_blog_module/post/Photo_blog_1.jpg', NULL, NULL, 0, 0, 46, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:32:03', '2016-04-26 00:00:00', '2016-04-27 19:08:33'),
(6, 1, 'catalog/d_blog_module/post/Photo_blog_4.jpg', NULL, NULL, 0, 0, 19, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:35:22', '2016-04-24 00:00:00', '2016-04-27 19:10:21'),
(7, 1, 'catalog/d_blog_module/post/Photo_blog_5.jpg', NULL, NULL, 0, 0, 10, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:37:01', '2016-04-12 00:00:00', '2016-04-27 19:09:17'),
(8, 1, 'catalog/d_blog_module/post/Photo_blog_10.jpg', NULL, NULL, 0, 0, 14, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:38:46', '2016-04-23 00:00:00', '2016-04-27 18:29:00'),
(9, 1, 'catalog/d_blog_module/post/Photo_blog_7.jpg', NULL, NULL, 0, 0, 125, 1, 0, NULL, 0, NULL, 0, '', '2016-04-13 11:40:51', '2016-04-22 00:00:00', '2016-04-27 19:09:53'),
(10, 1, 'catalog/d_blog_module/post/Photo_blog_9.jpg', NULL, NULL, 1, 0, 148, 1, 0, NULL, 0, NULL, 0, '', '2016-04-17 11:42:08', '2016-03-16 00:00:00', '2016-04-27 19:08:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_description`
--

DROP TABLE IF EXISTS `mt_bm_post_description`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_description` (
  `post_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`post_description_id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post_description`
--

INSERT INTO `mt_bm_post_description` (`post_description_id`, `post_id`, `language_id`, `title`, `short_description`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `tag`) VALUES
(127, 9, 1, 'Shopping day', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shopping day', '', '', 'vocation,look,summer'),
(125, 1, 1, 'My latest adventure', 'Vivamus efficitur libero quis arcu gravida, porttitor fermentum sapien suscipit. Nullam mattis, felis ut vehicula malesuada, nulla velit maximus velit, imperdiet tempus felis urna consequat mauris. Fusce et sollicitudin felis. In pulvinar ante eu arcu placerat mattis. Nunc quis aliquet augue.', '		\r\n&lt;p&gt;The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are included in this HTML so as to not miss any possible Elements when designing a site.&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h1&gt;Heading 1&lt;/h1&gt;\r\n&lt;h2&gt;Heading 2&lt;/h2&gt;\r\n&lt;h3&gt;Heading 3&lt;/h3&gt;\r\n&lt;h4&gt;Heading 4&lt;/h4&gt;\r\n&lt;h5&gt;Heading 5&lt;/h5&gt;\r\n&lt;h6&gt;Heading 6&lt;/h6&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;paragraph&quot;&gt;Paragraph&lt;/h2&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, &lt;a href=&quot;#&quot; title=&quot;test link&quot;&gt;test link&lt;/a&gt; adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, &lt;em&gt;emphasis&lt;/em&gt; consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.&lt;/p&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;list_types&quot;&gt;List Types&lt;/h2&gt;\r\n&lt;h3&gt;Definition List&lt;/h3&gt;\r\n&lt;dl&gt;\r\n&lt;dt&gt;Definition List Title&lt;/dt&gt;\r\n&lt;dd&gt;This is a definition list division.&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n&lt;h3&gt;Ordered List&lt;/h3&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;List Item 1&lt;/li&gt;\r\n&lt;li&gt;List Item 2&lt;/li&gt;\r\n&lt;li&gt;List Item 3&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;h3&gt;Unordered List&lt;/h3&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;List Item 1&lt;/li&gt;\r\n&lt;li&gt;List Item 2&lt;/li&gt;\r\n&lt;li&gt;List Item 3&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;form_elements&quot;&gt;Forms&lt;/h2&gt;\r\n&lt;fieldset&gt;\r\n&lt;legend&gt;Legend&lt;/legend&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus.&lt;/p&gt;\r\n\r\n&lt;h2&gt;&lt;br&gt;&lt;/h2&gt;&lt;h2&gt;Image&lt;/h2&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;https://opencart.dreamvention.com/220/d_blog_module/image/cache/catalog/d_blog_module/post/Photo_blog_3-1400x875.jpg&quot; class=&quot;img-responsive&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;/fieldset&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;tables&quot;&gt;Tables&lt;/h2&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n&lt;tbody&gt;&lt;tr&gt;\r\n&lt;th&gt;Table Header 1&lt;/th&gt;\r\n&lt;th&gt;Table Header 2&lt;/th&gt;\r\n&lt;th&gt;Table Header 3&lt;/th&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;Division 1&lt;/td&gt;\r\n&lt;td&gt;Division 2&lt;/td&gt;\r\n&lt;td&gt;Division 3&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr class=&quot;even&quot;&gt;\r\n&lt;td&gt;Division 1&lt;/td&gt;\r\n&lt;td&gt;Division 2&lt;/td&gt;\r\n&lt;td&gt;Division 3&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;Division 1&lt;/td&gt;\r\n&lt;td&gt;Division 2&lt;/td&gt;\r\n&lt;td&gt;Division 3&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;&lt;/table&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;misc&quot;&gt;Misc Stuff – abbr, acronym, pre, code, sub, sup, etc.&lt;/h2&gt;\r\n&lt;p&gt;Lorem &lt;sup&gt;superscript&lt;/sup&gt; dolor &lt;sub&gt;subscript&lt;/sub&gt; amet, consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. &lt;cite&gt;cite&lt;/cite&gt;. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. &lt;acronym title=&quot;National Basketball Association&quot;&gt;NBA&lt;/acronym&gt; Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.  &lt;abbr title=&quot;Avenue&quot;&gt;AVE&lt;/abbr&gt;&lt;/p&gt;\r\n&lt;pre&gt;&lt;p&gt;\r\nLorem ipsum dolor sit amet,\r\n consectetuer adipiscing elit.\r\n Nullam dignissim convallis est.\r\n Quisque aliquam. Donec faucibus. \r\nNunc iaculis suscipit dui. \r\nNam sit amet sem. \r\nAliquam libero nisi, imperdiet at,\r\n tincidunt nec, gravida vehicula,\r\n nisl. \r\nPraesent mattis, massa quis \r\nluctus fermentum, turpis mi \r\nvolutpat justo, eu volutpat \r\nenim diam eget metus. \r\nMaecenas ornare tortor. \r\nDonec sed tellus eget sapien\r\n fringilla nonummy. \r\n&lt;acronym title=&quot;National Basketball Association&quot;&gt;NBA&lt;/acronym&gt; \r\nMauris a ante. Suspendisse\r\n quam sem, consequat at, \r\ncommodo vitae, feugiat in, \r\nnunc. Morbi imperdiet augue\r\n quis tellus.  \r\n&lt;abbr title=&quot;Avenue&quot;&gt;AVE&lt;/abbr&gt;&lt;/p&gt;&lt;/pre&gt;\r\n&lt;blockquote&gt;&lt;p&gt;\r\n	“This stylesheet is going to help so freaking much.” &lt;br&gt;-Blockquote\r\n&lt;/p&gt;&lt;/blockquote&gt;\r\n&lt;p&gt;&lt;br&gt;\r\n&lt;!-- End of Sample Content --&gt;&lt;/p&gt;\r\n', 'My latest adventure', '', '', 'summer,sale,day off'),
(120, 10, 1, 'Amazing day', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Amazing day', '', '', 'vocation,holiday,day off,look'),
(121, 2, 1, 'Big sale this summer', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Big sale this summer', '', 'big-sale-this-summer', 'look'),
(122, 5, 1, 'Fashion in city', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Fashion in city', '', '', '	vocation,summer,day off'),
(123, 4, 1, 'Favorite look', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Favorite look', '', '', '	photo,day off,look'),
(114, 8, 1, 'Favorite photo', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Favorite photo', '', '', 'day off,vocation,look'),
(124, 7, 1, 'Fragments of life', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Fragments of life', '', '', 'look,photo'),
(129, 6, 1, 'Photography', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Photography', '', '', 'shopping,dresses,look'),
(128, 3, 1, 'Spring mood', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Spring mood', '', '', '	vocation, dresses,summer'),
(130, 9, 2, 'Shopping day', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shopping day', '', '', 'vocation,look,summer'),
(131, 10, 2, 'Amazing day', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Amazing day', '', '', 'vocation,holiday,day off,look'),
(132, 2, 2, 'Big sale this summer', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Big sale this summer', '', 'big-sale-this-summer', 'look'),
(133, 1, 2, 'My latest adventure', 'Vivamus efficitur libero quis arcu gravida, porttitor fermentum sapien suscipit. Nullam mattis, felis ut vehicula malesuada, nulla velit maximus velit, imperdiet tempus felis urna consequat mauris. Fusce et sollicitudin felis. In pulvinar ante eu arcu placerat mattis. Nunc quis aliquet augue.', '		\r\n&lt;p&gt;The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are included in this HTML so as to not miss any possible Elements when designing a site.&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h1&gt;Heading 1&lt;/h1&gt;\r\n&lt;h2&gt;Heading 2&lt;/h2&gt;\r\n&lt;h3&gt;Heading 3&lt;/h3&gt;\r\n&lt;h4&gt;Heading 4&lt;/h4&gt;\r\n&lt;h5&gt;Heading 5&lt;/h5&gt;\r\n&lt;h6&gt;Heading 6&lt;/h6&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;paragraph&quot;&gt;Paragraph&lt;/h2&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, &lt;a href=&quot;#&quot; title=&quot;test link&quot;&gt;test link&lt;/a&gt; adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, &lt;em&gt;emphasis&lt;/em&gt; consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.&lt;/p&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;list_types&quot;&gt;List Types&lt;/h2&gt;\r\n&lt;h3&gt;Definition List&lt;/h3&gt;\r\n&lt;dl&gt;\r\n&lt;dt&gt;Definition List Title&lt;/dt&gt;\r\n&lt;dd&gt;This is a definition list division.&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n&lt;h3&gt;Ordered List&lt;/h3&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;List Item 1&lt;/li&gt;\r\n&lt;li&gt;List Item 2&lt;/li&gt;\r\n&lt;li&gt;List Item 3&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;h3&gt;Unordered List&lt;/h3&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;List Item 1&lt;/li&gt;\r\n&lt;li&gt;List Item 2&lt;/li&gt;\r\n&lt;li&gt;List Item 3&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;form_elements&quot;&gt;Forms&lt;/h2&gt;\r\n&lt;fieldset&gt;\r\n&lt;legend&gt;Legend&lt;/legend&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus.&lt;/p&gt;\r\n\r\n&lt;h2&gt;&lt;br&gt;&lt;/h2&gt;&lt;h2&gt;Image&lt;/h2&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. Donec faucibus. Nunc iaculis suscipit dui.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;https://opencart.dreamvention.com/220/d_blog_module/image/cache/catalog/d_blog_module/post/Photo_blog_3-1400x875.jpg&quot; class=&quot;img-responsive&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;/fieldset&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;tables&quot;&gt;Tables&lt;/h2&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n&lt;tbody&gt;&lt;tr&gt;\r\n&lt;th&gt;Table Header 1&lt;/th&gt;\r\n&lt;th&gt;Table Header 2&lt;/th&gt;\r\n&lt;th&gt;Table Header 3&lt;/th&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;Division 1&lt;/td&gt;\r\n&lt;td&gt;Division 2&lt;/td&gt;\r\n&lt;td&gt;Division 3&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr class=&quot;even&quot;&gt;\r\n&lt;td&gt;Division 1&lt;/td&gt;\r\n&lt;td&gt;Division 2&lt;/td&gt;\r\n&lt;td&gt;Division 3&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;Division 1&lt;/td&gt;\r\n&lt;td&gt;Division 2&lt;/td&gt;\r\n&lt;td&gt;Division 3&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;&lt;/table&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;hr&gt;\r\n&lt;h2 id=&quot;misc&quot;&gt;Misc Stuff – abbr, acronym, pre, code, sub, sup, etc.&lt;/h2&gt;\r\n&lt;p&gt;Lorem &lt;sup&gt;superscript&lt;/sup&gt; dolor &lt;sub&gt;subscript&lt;/sub&gt; amet, consectetuer adipiscing elit. Nullam dignissim convallis est. Quisque aliquam. &lt;cite&gt;cite&lt;/cite&gt;. Nunc iaculis suscipit dui. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. &lt;acronym title=&quot;National Basketball Association&quot;&gt;NBA&lt;/acronym&gt; Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.  &lt;abbr title=&quot;Avenue&quot;&gt;AVE&lt;/abbr&gt;&lt;/p&gt;\r\n&lt;pre&gt;&lt;p&gt;\r\nLorem ipsum dolor sit amet,\r\n consectetuer adipiscing elit.\r\n Nullam dignissim convallis est.\r\n Quisque aliquam. Donec faucibus. \r\nNunc iaculis suscipit dui. \r\nNam sit amet sem. \r\nAliquam libero nisi, imperdiet at,\r\n tincidunt nec, gravida vehicula,\r\n nisl. \r\nPraesent mattis, massa quis \r\nluctus fermentum, turpis mi \r\nvolutpat justo, eu volutpat \r\nenim diam eget metus. \r\nMaecenas ornare tortor. \r\nDonec sed tellus eget sapien\r\n fringilla nonummy. \r\n&lt;acronym title=&quot;National Basketball Association&quot;&gt;NBA&lt;/acronym&gt; \r\nMauris a ante. Suspendisse\r\n quam sem, consequat at, \r\ncommodo vitae, feugiat in, \r\nnunc. Morbi imperdiet augue\r\n quis tellus.  \r\n&lt;abbr title=&quot;Avenue&quot;&gt;AVE&lt;/abbr&gt;&lt;/p&gt;&lt;/pre&gt;\r\n&lt;blockquote&gt;&lt;p&gt;\r\n	“This stylesheet is going to help so freaking much.” &lt;br&gt;-Blockquote\r\n&lt;/p&gt;&lt;/blockquote&gt;\r\n&lt;p&gt;&lt;br&gt;\r\n&lt;!-- End of Sample Content --&gt;&lt;/p&gt;\r\n', 'My latest adventure', '', '', 'summer,sale,day off'),
(134, 5, 2, 'Fashion in city', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Fashion in city', '', '', '	vocation,summer,day off'),
(135, 4, 2, 'Favorite look', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Favorite look', '', '', '	photo,day off,look'),
(136, 8, 2, 'Favorite photo', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Favorite photo', '', '', 'day off,vocation,look'),
(137, 7, 2, 'Fragments of life', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Fragments of life', '', '', 'look,photo'),
(138, 6, 2, 'Photography', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Photography', '', '', 'shopping,dresses,look'),
(139, 3, 2, 'Spring mood', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.', '&lt;p&gt;Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea. Zril delenit vis ut. His suavitate rationibus in, tale discere ceteros eu nec. Vel ut utamur laoreet vituperata, in discere contentiones definitionem ius.&lt;/p&gt;&lt;p&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Spring mood', '', '', '	vocation, dresses,summer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_related`
--

DROP TABLE IF EXISTS `mt_bm_post_related`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_related` (
  `post_id` int(11) NOT NULL,
  `post_related_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`post_related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post_related`
--

INSERT INTO `mt_bm_post_related` (`post_id`, `post_related_id`) VALUES
(1, 3),
(1, 7),
(1, 10),
(2, 7),
(2, 9),
(3, 1),
(3, 10),
(4, 5),
(4, 7),
(5, 3),
(5, 8),
(6, 2),
(6, 9),
(6, 10),
(7, 1),
(7, 4),
(8, 4),
(8, 5),
(8, 6),
(9, 4),
(9, 5),
(9, 7),
(10, 2),
(10, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_to_category`
--

DROP TABLE IF EXISTS `mt_bm_post_to_category`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_to_category` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post_to_category`
--

INSERT INTO `mt_bm_post_to_category` (`post_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(5, 2),
(6, 2),
(1, 3),
(2, 3),
(3, 3),
(3, 4),
(6, 4),
(8, 4),
(9, 5),
(10, 5),
(7, 6),
(3, 7),
(4, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_to_layout`
--

DROP TABLE IF EXISTS `mt_bm_post_to_layout`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_to_layout` (
  `post_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post_to_layout`
--

INSERT INTO `mt_bm_post_to_layout` (`post_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_to_product`
--

DROP TABLE IF EXISTS `mt_bm_post_to_product`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_to_product` (
  `post_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post_to_product`
--

INSERT INTO `mt_bm_post_to_product` (`post_id`, `product_id`) VALUES
(3, 28),
(5, 28),
(7, 28),
(8, 28),
(1, 30),
(2, 30),
(4, 30),
(6, 30),
(10, 30),
(1, 41),
(2, 41),
(3, 41),
(4, 41),
(6, 41),
(7, 41),
(9, 41),
(8, 42),
(9, 42),
(10, 42),
(5, 47),
(6, 47),
(7, 47);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_to_store`
--

DROP TABLE IF EXISTS `mt_bm_post_to_store`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_to_store` (
  `post_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_post_to_store`
--

INSERT INTO `mt_bm_post_to_store` (`post_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_post_video`
--

DROP TABLE IF EXISTS `mt_bm_post_video`;
CREATE TABLE IF NOT EXISTS `mt_bm_post_video` (
  `post_id` int(11) NOT NULL,
  `video` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`video`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_review`
--

DROP TABLE IF EXISTS `mt_bm_review`;
CREATE TABLE IF NOT EXISTS `mt_bm_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `reply_to_review_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `guest_email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rating` int(11) NOT NULL,
  `status` int(1) DEFAULT 1,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_bm_review`
--

INSERT INTO `mt_bm_review` (`review_id`, `post_id`, `reply_to_review_id`, `language_id`, `customer_id`, `guest_email`, `image`, `author`, `description`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 0, 0, '', '', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 5, 1, '2016-04-14 14:40:46', '2016-04-27 23:02:07'),
(2, 1, 1, 0, 0, '', '', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 5, 1, '2016-04-22 09:08:10', '2016-04-27 23:02:03'),
(3, 1, 0, 0, 0, '', '', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 5, 1, '2016-04-22 09:08:42', '2016-04-27 23:01:59'),
(4, 10, 0, 0, 0, '', '', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 4, 1, '2016-04-24 22:37:11', '2016-04-27 23:01:34'),
(5, 10, 4, 0, 0, '', 'catalog/logo.png', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 5, 1, '2016-04-24 23:34:22', '2016-04-27 23:01:39'),
(6, 9, 0, 0, 0, '', 'catalog/logo.png', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 4, 1, '2016-04-27 01:04:57', '2016-04-27 23:01:43'),
(7, 10, 5, 0, 0, '', 'catalog/logo.png', 'admin', 'Lorem ipsum dolor sit amet, justo aliquid reformidans ea vel, vim porro dictas et, ut elit partem invidunt vis. Saepe melius complectitur eum ea', 5, 1, '2016-04-27 02:38:21', '2016-04-27 23:01:48'),
(8, 10, 0, 0, 0, '', '', 'Antony', 'Aliquip veniam delectus, Marfa eiusmod Pinterest in do umami readymade swag. Selfies iPhone Kickstarter, drinking vinegar jean shorts fixie consequat flexitarian four loko.', 4, 1, '2016-04-27 02:48:57', '2016-04-27 23:01:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_bm_review_to_image`
--

DROP TABLE IF EXISTS `mt_bm_review_to_image`;
CREATE TABLE IF NOT EXISTS `mt_bm_review_to_image` (
  `review_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`review_id`,`image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_cart`
--

DROP TABLE IF EXISTS `mt_cart`;
CREATE TABLE IF NOT EXISTS `mt_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_cart`
--

INSERT INTO `mt_cart` (`cart_id`, `api_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(10, 0, 1, '8951f962d21a785fbfb1db07aa', 40, 0, '[]', 42, '2019-08-19 01:28:12'),
(11, 0, 1, '8951f962d21a785fbfb1db07aa', 47, 0, '{\"225\":\"2011-04-22\"}', 2, '2019-11-03 12:59:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_category`
--

DROP TABLE IF EXISTS `mt_category`;
CREATE TABLE IF NOT EXISTS `mt_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_category`
--

INSERT INTO `mt_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16'),
(60, '', 0, 0, 1, 0, 1, '2019-08-26 21:56:00', '2019-08-26 21:56:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_category_description`
--

DROP TABLE IF EXISTS `mt_category_description`;
CREATE TABLE IF NOT EXISTS `mt_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_category_description`
--

INSERT INTO `mt_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', 'Monitors', '', ''),
(33, 1, 'Cameras', '', 'Cameras', '', ''),
(32, 1, 'Web Cameras', '', 'Web Cameras', '', ''),
(31, 1, 'Scanners', '', 'Scanners', '', ''),
(30, 1, 'Printers', '', 'Printers', '', ''),
(29, 1, 'Mice and Trackballs', '', 'Mice and Trackballs', '', ''),
(27, 1, 'Mac', '', 'Mac', '', ''),
(26, 1, 'PC', '', 'PC', '', ''),
(17, 1, 'Software', '', 'Software', '', ''),
(25, 1, 'Components', '', 'Components', '', ''),
(24, 1, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', ''),
(35, 1, 'test 1', '', 'test 1', '', ''),
(36, 1, 'test 2', '', 'test 2', '', ''),
(37, 1, 'test 5', '', 'test 5', '', ''),
(38, 1, 'test 4', '', 'test 4', '', ''),
(39, 1, 'test 6', '', 'test 6', '', ''),
(40, 1, 'test 7', '', 'test 7', '', ''),
(41, 1, 'test 8', '', 'test 8', '', ''),
(42, 1, 'test 9', '', 'test 9', '', ''),
(43, 1, 'test 11', '', 'test 11', '', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', ''),
(44, 1, 'test 12', '', 'test 12', '', ''),
(45, 1, 'Windows', '', 'Windows', '', ''),
(46, 1, 'Macs', '', 'Macs', '', ''),
(47, 1, 'test 15', '', 'test 15', '', ''),
(48, 1, 'test 16', '', 'test 16', '', ''),
(49, 1, 'test 17', '', 'test 17', '', ''),
(50, 1, 'test 18', '', 'test 18', '', ''),
(51, 1, 'test 19', '', 'test 19', '', ''),
(52, 1, 'test 20', '', 'test 20', '', ''),
(53, 1, 'test 21', '', 'test 21', '', ''),
(54, 1, 'test 22', '', 'test 22', '', ''),
(55, 1, 'test 23', '', 'test 23', '', ''),
(56, 1, 'test 24', '', 'test 24', '', ''),
(57, 1, 'Tablets', '', 'Tablets', '', ''),
(58, 1, 'test 25', '', 'test 25', '', ''),
(28, 2, 'Monitors', '', 'Monitors', '', ''),
(33, 2, 'Cameras', '', 'Cameras', '', ''),
(32, 2, 'Web Cameras', '', 'Web Cameras', '', ''),
(31, 2, 'Scanners', '', 'Scanners', '', ''),
(30, 2, 'Printers', '', 'Printers', '', ''),
(29, 2, 'Mice and Trackballs', '', 'Mice and Trackballs', '', ''),
(27, 2, 'Mac', '', 'Mac', '', ''),
(26, 2, 'PC', '', 'PC', '', ''),
(17, 2, 'Software', '', 'Software', '', ''),
(25, 2, 'Components', '', 'Components', '', ''),
(24, 2, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', ''),
(20, 2, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', ''),
(35, 2, 'test 1', '', 'test 1', '', ''),
(36, 2, 'test 2', '', 'test 2', '', ''),
(37, 2, 'test 5', '', 'test 5', '', ''),
(38, 2, 'test 4', '', 'test 4', '', ''),
(39, 2, 'test 6', '', 'test 6', '', ''),
(40, 2, 'test 7', '', 'test 7', '', ''),
(41, 2, 'test 8', '', 'test 8', '', ''),
(42, 2, 'test 9', '', 'test 9', '', ''),
(43, 2, 'test 11', '', 'test 11', '', ''),
(34, 2, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', ''),
(18, 2, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', ''),
(44, 2, 'test 12', '', 'test 12', '', ''),
(45, 2, 'Windows', '', 'Windows', '', ''),
(46, 2, 'Macs', '', 'Macs', '', ''),
(47, 2, 'test 15', '', 'test 15', '', ''),
(48, 2, 'test 16', '', 'test 16', '', ''),
(49, 2, 'test 17', '', 'test 17', '', ''),
(50, 2, 'test 18', '', 'test 18', '', ''),
(51, 2, 'test 19', '', 'test 19', '', ''),
(52, 2, 'test 20', '', 'test 20', '', ''),
(53, 2, 'test 21', '', 'test 21', '', ''),
(54, 2, 'test 22', '', 'test 22', '', ''),
(55, 2, 'test 23', '', 'test 23', '', ''),
(56, 2, 'test 24', '', 'test 24', '', ''),
(57, 2, 'Tablets', '', 'Tablets', '', ''),
(58, 2, 'test 25', '', 'test 25', '', ''),
(60, 2, 'Sản phẩm nổi bật', '', 'Sản phẩm nổi bật', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_category_filter`
--

DROP TABLE IF EXISTS `mt_category_filter`;
CREATE TABLE IF NOT EXISTS `mt_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_category_path`
--

DROP TABLE IF EXISTS `mt_category_path`;
CREATE TABLE IF NOT EXISTS `mt_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_category_path`
--

INSERT INTO `mt_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0),
(60, 60, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_category_to_layout`
--

DROP TABLE IF EXISTS `mt_category_to_layout`;
CREATE TABLE IF NOT EXISTS `mt_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_category_to_layout`
--

INSERT INTO `mt_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(60, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_category_to_store`
--

DROP TABLE IF EXISTS `mt_category_to_store`;
CREATE TABLE IF NOT EXISTS `mt_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_category_to_store`
--

INSERT INTO `mt_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(60, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_country`
--

DROP TABLE IF EXISTS `mt_country`;
CREATE TABLE IF NOT EXISTS `mt_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_country`
--

INSERT INTO `mt_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(230, 'Việt Nam', 'VN', 'VNM', '', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_coupon`
--

DROP TABLE IF EXISTS `mt_coupon`;
CREATE TABLE IF NOT EXISTS `mt_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_coupon`
--

INSERT INTO `mt_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_coupon_category`
--

DROP TABLE IF EXISTS `mt_coupon_category`;
CREATE TABLE IF NOT EXISTS `mt_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_coupon_history`
--

DROP TABLE IF EXISTS `mt_coupon_history`;
CREATE TABLE IF NOT EXISTS `mt_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_coupon_product`
--

DROP TABLE IF EXISTS `mt_coupon_product`;
CREATE TABLE IF NOT EXISTS `mt_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_currency`
--

DROP TABLE IF EXISTS `mt_currency`;
CREATE TABLE IF NOT EXISTS `mt_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_currency`
--

INSERT INTO `mt_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'Việt Nam Đồng', 'VND', '', 'VNĐ', '0', 1.00000000, 1, '2019-07-15 14:21:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer`
--

DROP TABLE IF EXISTS `mt_customer`;
CREATE TABLE IF NOT EXISTS `mt_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text DEFAULT NULL,
  `wishlist` text DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_customer`
--

INSERT INTO `mt_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `safe`, `token`, `code`, `date_added`, `image`) VALUES
(1, 1, 0, 2, 'Tuan', 'Pham Minh', 'minhtuan9922@gmail.com', '0123456789', '', '0326d8053b954b3a004cc5e902d6d6b601e2bb43', 'aYkSWwW7I', NULL, NULL, 0, 1, '', '::1', 1, 0, '', '', '2019-08-18 23:34:38', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_activity`
--

DROP TABLE IF EXISTS `mt_customer_activity`;
CREATE TABLE IF NOT EXISTS `mt_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_affiliate`
--

DROP TABLE IF EXISTS `mt_customer_affiliate`;
CREATE TABLE IF NOT EXISTS `mt_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_approval`
--

DROP TABLE IF EXISTS `mt_customer_approval`;
CREATE TABLE IF NOT EXISTS `mt_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_group`
--

DROP TABLE IF EXISTS `mt_customer_group`;
CREATE TABLE IF NOT EXISTS `mt_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_customer_group`
--

INSERT INTO `mt_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_group_description`
--

DROP TABLE IF EXISTS `mt_customer_group_description`;
CREATE TABLE IF NOT EXISTS `mt_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_customer_group_description`
--

INSERT INTO `mt_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_history`
--

DROP TABLE IF EXISTS `mt_customer_history`;
CREATE TABLE IF NOT EXISTS `mt_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_ip`
--

DROP TABLE IF EXISTS `mt_customer_ip`;
CREATE TABLE IF NOT EXISTS `mt_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_customer_ip`
--

INSERT INTO `mt_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '::1', '2019-08-19 00:55:59'),
(2, 1, '127.0.0.1', '2019-09-14 12:58:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_login`
--

DROP TABLE IF EXISTS `mt_customer_login`;
CREATE TABLE IF NOT EXISTS `mt_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_online`
--

DROP TABLE IF EXISTS `mt_customer_online`;
CREATE TABLE IF NOT EXISTS `mt_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_reward`
--

DROP TABLE IF EXISTS `mt_customer_reward`;
CREATE TABLE IF NOT EXISTS `mt_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_search`
--

DROP TABLE IF EXISTS `mt_customer_search`;
CREATE TABLE IF NOT EXISTS `mt_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_transaction`
--

DROP TABLE IF EXISTS `mt_customer_transaction`;
CREATE TABLE IF NOT EXISTS `mt_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_customer_wishlist`
--

DROP TABLE IF EXISTS `mt_customer_wishlist`;
CREATE TABLE IF NOT EXISTS `mt_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_custom_field`
--

DROP TABLE IF EXISTS `mt_custom_field`;
CREATE TABLE IF NOT EXISTS `mt_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_custom_field_customer_group`
--

DROP TABLE IF EXISTS `mt_custom_field_customer_group`;
CREATE TABLE IF NOT EXISTS `mt_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_custom_field_description`
--

DROP TABLE IF EXISTS `mt_custom_field_description`;
CREATE TABLE IF NOT EXISTS `mt_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_custom_field_value`
--

DROP TABLE IF EXISTS `mt_custom_field_value`;
CREATE TABLE IF NOT EXISTS `mt_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_custom_field_value_description`
--

DROP TABLE IF EXISTS `mt_custom_field_value_description`;
CREATE TABLE IF NOT EXISTS `mt_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_download`
--

DROP TABLE IF EXISTS `mt_download`;
CREATE TABLE IF NOT EXISTS `mt_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_download_description`
--

DROP TABLE IF EXISTS `mt_download_description`;
CREATE TABLE IF NOT EXISTS `mt_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_event`
--

DROP TABLE IF EXISTS `mt_event`;
CREATE TABLE IF NOT EXISTS `mt_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_event`
--

INSERT INTO `mt_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0),
(197, 'd_blog_module', 'catalog/model/design/layout/getLayout/after', 'extension/event/d_blog_module/model_design_layout_getLayout_after', 1, 0),
(196, 'd_blog_module', 'admin/model/localisation/language/deleteLanguage/after', 'extension/event/d_blog_module/model_localisation_language_deleteLanguage_after', 1, 0),
(192, 'd_blog_module', 'catalog/view/common/header/before', 'extension/event/d_blog_module/view_common_header_before', 1, 0),
(193, 'd_blog_module', 'catalog/view/common/menu/before', 'extension/event/d_blog_module/view_common_menu_before', 1, 0),
(194, 'd_blog_module', 'catalog/model/extension/module/d_visual_designer/getOptions/after', 'extension/event/d_blog_module/controller_after_d_visual_designer_menu', 1, 0),
(195, 'd_blog_module', 'admin/model/localisation/language/addLanguage/after', 'extension/event/d_blog_module/model_localisation_language_addLanguage_after', 1, 0),
(191, 'd_blog_module', 'admin/view/setting/setting/before', 'extension/event/d_blog_module/view_setting_setting_captcha_before', 1, 0),
(190, 'd_blog_module', 'admin/view/common/column_left/before', 'extension/event/d_blog_module/view_common_column_left_before', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_extension`
--

DROP TABLE IF EXISTS `mt_extension`;
CREATE TABLE IF NOT EXISTS `mt_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_extension`
--

INSERT INTO `mt_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(43, 'module', 'latest'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google'),
(44, 'module', 'd_blog_module'),
(45, 'shipping', 'free');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_extension_install`
--

DROP TABLE IF EXISTS `mt_extension_install`;
CREATE TABLE IF NOT EXISTS `mt_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_extension_install`
--

INSERT INTO `mt_extension_install` (`extension_install_id`, `extension_download_id`, `filename`, `date_added`) VALUES
(1, 0, 'dblogmodulecompiledoc3v3.1.5.ocmod.zip', '2019-08-18 00:33:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_extension_path`
--

DROP TABLE IF EXISTS `mt_extension_path`;
CREATE TABLE IF NOT EXISTS `mt_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_path_id`)
) ENGINE=MyISAM AUTO_INCREMENT=649 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_extension_path`
--

INSERT INTO `mt_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(1, 1, 'admin/language/english', '2019-08-18 00:33:29'),
(2, 1, 'catalog/language/english', '2019-08-18 00:33:29'),
(3, 1, 'image/catalog/d_blog_module', '2019-08-18 00:33:29'),
(4, 1, 'image/catalog/d_visual_designer', '2019-08-18 00:33:29'),
(5, 1, 'system/config/d_ajax_search', '2019-08-18 00:33:29'),
(6, 1, 'system/config/d_blog_module.php', '2019-08-18 00:33:29'),
(7, 1, 'system/config/d_blog_module_demo', '2019-08-18 00:33:29'),
(8, 1, 'system/config/d_blog_module_layout', '2019-08-18 00:33:29'),
(9, 1, 'system/config/d_event_manager.php', '2019-08-18 00:33:29'),
(10, 1, 'system/config/d_visual_designer', '2019-08-18 00:33:29'),
(11, 1, 'system/config/d_visual_designer_route', '2019-08-18 00:33:29'),
(12, 1, 'system/library/d_shopunity', '2019-08-18 00:33:29'),
(13, 1, 'system/library/d_simple_html_dom.php', '2019-08-18 00:33:29'),
(14, 1, 'admin/controller/extension/d_ajax_search', '2019-08-18 00:33:29'),
(15, 1, 'admin/controller/extension/d_blog_module', '2019-08-18 00:33:29'),
(16, 1, 'admin/controller/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(17, 1, 'admin/controller/extension/event', '2019-08-18 00:33:29'),
(18, 1, 'admin/language/english/extension', '2019-08-18 00:33:29'),
(19, 1, 'admin/model/extension/d_admin_style', '2019-08-18 00:33:29'),
(20, 1, 'admin/model/extension/d_blog_module', '2019-08-18 00:33:29'),
(21, 1, 'admin/model/extension/d_opencart_patch', '2019-08-18 00:33:29'),
(22, 1, 'admin/model/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(23, 1, 'admin/model/extension/module', '2019-08-18 00:33:29'),
(24, 1, 'admin/view/image/d_admin_style', '2019-08-18 00:33:29'),
(25, 1, 'admin/view/image/d_blog_module', '2019-08-18 00:33:29'),
(26, 1, 'admin/view/javascript/d_admin_style', '2019-08-18 00:33:29'),
(27, 1, 'admin/view/javascript/d_bootstrap_bootbox', '2019-08-18 00:33:29'),
(28, 1, 'admin/view/javascript/d_bootstrap_colorpicker', '2019-08-18 00:33:29'),
(29, 1, 'admin/view/javascript/d_bootstrap_rating', '2019-08-18 00:33:29'),
(30, 1, 'admin/view/javascript/d_bootstrap_switch', '2019-08-18 00:33:29'),
(31, 1, 'admin/view/javascript/d_fileinput', '2019-08-18 00:33:29'),
(32, 1, 'admin/view/javascript/d_rubaxa_sortable', '2019-08-18 00:33:29'),
(33, 1, 'admin/view/javascript/d_tinysort', '2019-08-18 00:33:29'),
(34, 1, 'admin/view/stylesheet/d_admin_style', '2019-08-18 00:33:29'),
(35, 1, 'admin/view/stylesheet/d_bootstrap_extra', '2019-08-18 00:33:29'),
(36, 1, 'catalog/controller/extension/d_blog_module', '2019-08-18 00:33:29'),
(37, 1, 'catalog/controller/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(38, 1, 'catalog/controller/extension/event', '2019-08-18 00:33:29'),
(39, 1, 'catalog/language/english/extension', '2019-08-18 00:33:29'),
(40, 1, 'catalog/model/extension/d_blog_module', '2019-08-18 00:33:29'),
(41, 1, 'catalog/model/extension/d_opencart_patch', '2019-08-18 00:33:29'),
(42, 1, 'catalog/model/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(43, 1, 'catalog/view/javascript/d_blog_module', '2019-08-18 00:33:29'),
(44, 1, 'catalog/view/javascript/d_bootstrap_bootbox', '2019-08-18 00:33:29'),
(45, 1, 'catalog/view/javascript/d_bootstrap_colorpicker', '2019-08-18 00:33:29'),
(46, 1, 'catalog/view/javascript/d_bootstrap_rating', '2019-08-18 00:33:29'),
(47, 1, 'catalog/view/javascript/d_bootstrap_switch', '2019-08-18 00:33:29'),
(48, 1, 'catalog/view/javascript/d_fileinput', '2019-08-18 00:33:29'),
(49, 1, 'catalog/view/javascript/d_rubaxa_sortable', '2019-08-18 00:33:29'),
(50, 1, 'catalog/view/javascript/d_tinysort', '2019-08-18 00:33:29'),
(51, 1, 'image/catalog/d_blog_module/category', '2019-08-18 00:33:29'),
(52, 1, 'image/catalog/d_blog_module/no_profile_image.png', '2019-08-18 00:33:29'),
(53, 1, 'image/catalog/d_blog_module/post', '2019-08-18 00:33:29'),
(54, 1, 'image/catalog/d_blog_module/review', '2019-08-18 00:33:29'),
(55, 1, 'image/catalog/d_visual_designer/blog_post.svg', '2019-08-18 00:33:29'),
(56, 1, 'system/config/d_ajax_search/blog.php', '2019-08-18 00:33:29'),
(57, 1, 'system/config/d_blog_module_demo/d_blog_module.php', '2019-08-18 00:33:29'),
(58, 1, 'system/config/d_blog_module_demo/d_blog_module.sql', '2019-08-18 00:33:29'),
(59, 1, 'system/config/d_blog_module_layout/grid.php', '2019-08-18 00:33:29'),
(60, 1, 'system/config/d_visual_designer/blog_post.php', '2019-08-18 00:33:29'),
(61, 1, 'system/config/d_visual_designer_route/d_blog_module_author.php', '2019-08-18 00:33:29'),
(62, 1, 'system/config/d_visual_designer_route/d_blog_module_category.php', '2019-08-18 00:33:29'),
(63, 1, 'system/config/d_visual_designer_route/d_blog_module_post.php', '2019-08-18 00:33:29'),
(64, 1, 'system/library/d_shopunity/extension', '2019-08-18 00:33:29'),
(65, 1, 'system/library/d_shopunity/install', '2019-08-18 00:33:29'),
(66, 1, 'system/library/d_shopunity/readme', '2019-08-18 00:33:29'),
(67, 1, 'admin/controller/extension/d_ajax_search/blog.php', '2019-08-18 00:33:29'),
(68, 1, 'admin/controller/extension/d_blog_module/author.php', '2019-08-18 00:33:29'),
(69, 1, 'admin/controller/extension/d_blog_module/author_group.php', '2019-08-18 00:33:29'),
(70, 1, 'admin/controller/extension/d_blog_module/category.php', '2019-08-18 00:33:29'),
(71, 1, 'admin/controller/extension/d_blog_module/post.php', '2019-08-18 00:33:29'),
(72, 1, 'admin/controller/extension/d_blog_module/review.php', '2019-08-18 00:33:29'),
(73, 1, 'admin/controller/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:29'),
(74, 1, 'admin/controller/extension/event/d_blog_module.php', '2019-08-18 00:33:29'),
(75, 1, 'admin/controller/extension/module/d_blog_module.php', '2019-08-18 00:33:29'),
(76, 1, 'admin/language/en-gb/extension/d_admin_style', '2019-08-18 00:33:29'),
(77, 1, 'admin/language/en-gb/extension/d_blog_module', '2019-08-18 00:33:29'),
(78, 1, 'admin/language/en-gb/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(79, 1, 'admin/language/en-gb/extension/event', '2019-08-18 00:33:29'),
(80, 1, 'admin/language/english/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(81, 1, 'admin/model/extension/d_admin_style/style.php', '2019-08-18 00:33:29'),
(82, 1, 'admin/model/extension/d_blog_module/author.php', '2019-08-18 00:33:29'),
(83, 1, 'admin/model/extension/d_blog_module/author_group.php', '2019-08-18 00:33:29'),
(84, 1, 'admin/model/extension/d_blog_module/category.php', '2019-08-18 00:33:29'),
(85, 1, 'admin/model/extension/d_blog_module/post.php', '2019-08-18 00:33:29'),
(86, 1, 'admin/model/extension/d_blog_module/review.php', '2019-08-18 00:33:29'),
(87, 1, 'admin/model/extension/d_opencart_patch/cache.php', '2019-08-18 00:33:29'),
(88, 1, 'admin/model/extension/d_opencart_patch/event.php', '2019-08-18 00:33:29'),
(89, 1, 'admin/model/extension/d_opencart_patch/extension.php', '2019-08-18 00:33:29'),
(90, 1, 'admin/model/extension/d_opencart_patch/load.php', '2019-08-18 00:33:29'),
(91, 1, 'admin/model/extension/d_opencart_patch/modification.php', '2019-08-18 00:33:29'),
(92, 1, 'admin/model/extension/d_opencart_patch/module.php', '2019-08-18 00:33:29'),
(93, 1, 'admin/model/extension/d_opencart_patch/setting.php', '2019-08-18 00:33:29'),
(94, 1, 'admin/model/extension/d_opencart_patch/store.php', '2019-08-18 00:33:29'),
(95, 1, 'admin/model/extension/d_opencart_patch/url.php', '2019-08-18 00:33:29'),
(96, 1, 'admin/model/extension/d_opencart_patch/user.php', '2019-08-18 00:33:29'),
(97, 1, 'admin/model/extension/d_opencart_patch/vqmod.php', '2019-08-18 00:33:29'),
(98, 1, 'admin/model/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:29'),
(99, 1, 'admin/model/extension/module/d_blog_module.php', '2019-08-18 00:33:29'),
(100, 1, 'admin/model/extension/module/d_event_manager.php', '2019-08-18 00:33:29'),
(101, 1, 'admin/model/extension/module/d_twig_manager.php', '2019-08-18 00:33:29'),
(102, 1, 'admin/view/image/d_admin_style/checkmark.png', '2019-08-18 00:33:29'),
(103, 1, 'admin/view/image/d_admin_style/checkmark.svg', '2019-08-18 00:33:29'),
(104, 1, 'admin/view/image/d_blog_module/awesome_layout_d_blog_module.svg', '2019-08-18 00:33:29'),
(105, 1, 'admin/view/image/d_blog_module/bg.svg', '2019-08-18 00:33:29'),
(106, 1, 'admin/view/image/d_blog_module/dozens_d_blog_module.svg', '2019-08-18 00:33:29'),
(107, 1, 'admin/view/image/d_blog_module/fullstack_d_blog_module.svg', '2019-08-18 00:33:29'),
(108, 1, 'admin/view/image/d_blog_module/main_icon_d_blog_module.svg', '2019-08-18 00:33:29'),
(109, 1, 'admin/view/image/d_blog_module/powerful_d_blog_module.svg', '2019-08-18 00:33:29'),
(110, 1, 'admin/view/image/d_blog_module/welcome.jpg', '2019-08-18 00:33:29'),
(111, 1, 'admin/view/image/d_blog_module/welcome.png', '2019-08-18 00:33:29'),
(112, 1, 'admin/view/javascript/d_admin_style/gulp', '2019-08-18 00:33:29'),
(113, 1, 'admin/view/javascript/d_bootstrap_bootbox/bootbox.js', '2019-08-18 00:33:29'),
(114, 1, 'admin/view/javascript/d_bootstrap_bootbox/bootbox.min.js', '2019-08-18 00:33:29'),
(115, 1, 'admin/view/javascript/d_bootstrap_colorpicker/css', '2019-08-18 00:33:29'),
(116, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img', '2019-08-18 00:33:29'),
(117, 1, 'admin/view/javascript/d_bootstrap_colorpicker/js', '2019-08-18 00:33:29'),
(118, 1, 'admin/view/javascript/d_bootstrap_rating/bootstrap-rating.css', '2019-08-18 00:33:29'),
(119, 1, 'admin/view/javascript/d_bootstrap_rating/bootstrap-rating.js', '2019-08-18 00:33:29'),
(120, 1, 'admin/view/javascript/d_bootstrap_rating/bootstrap-rating.min.js', '2019-08-18 00:33:29'),
(121, 1, 'admin/view/javascript/d_bootstrap_switch/css', '2019-08-18 00:33:29'),
(122, 1, 'admin/view/javascript/d_bootstrap_switch/js', '2019-08-18 00:33:29'),
(123, 1, 'admin/view/javascript/d_fileinput/CHANGE.md', '2019-08-18 00:33:29'),
(124, 1, 'admin/view/javascript/d_fileinput/LICENSE.md', '2019-08-18 00:33:29'),
(125, 1, 'admin/view/javascript/d_fileinput/bower.json', '2019-08-18 00:33:29'),
(126, 1, 'admin/view/javascript/d_fileinput/canvas-to-blob.js', '2019-08-18 00:33:29'),
(127, 1, 'admin/view/javascript/d_fileinput/composer.json', '2019-08-18 00:33:29'),
(128, 1, 'admin/view/javascript/d_fileinput/css', '2019-08-18 00:33:29'),
(129, 1, 'admin/view/javascript/d_fileinput/examples', '2019-08-18 00:33:29'),
(130, 1, 'admin/view/javascript/d_fileinput/fileinput.css', '2019-08-18 00:33:29'),
(131, 1, 'admin/view/javascript/d_fileinput/fileinput.js', '2019-08-18 00:33:29'),
(132, 1, 'admin/view/javascript/d_fileinput/img', '2019-08-18 00:33:29'),
(133, 1, 'admin/view/javascript/d_fileinput/js', '2019-08-18 00:33:29'),
(134, 1, 'admin/view/javascript/d_fileinput/nuget', '2019-08-18 00:33:29'),
(135, 1, 'admin/view/javascript/d_fileinput/package.json', '2019-08-18 00:33:29'),
(136, 1, 'admin/view/javascript/d_fileinput/sass', '2019-08-18 00:33:29'),
(137, 1, 'admin/view/javascript/d_fileinput/themes', '2019-08-18 00:33:29'),
(138, 1, 'admin/view/javascript/d_rubaxa_sortable/jquery.binding.js', '2019-08-18 00:33:29'),
(139, 1, 'admin/view/javascript/d_rubaxa_sortable/knockout-sortable.js', '2019-08-18 00:33:29'),
(140, 1, 'admin/view/javascript/d_rubaxa_sortable/ng-sortable.js', '2019-08-18 00:33:29'),
(141, 1, 'admin/view/javascript/d_rubaxa_sortable/react-sortable-mixin.js', '2019-08-18 00:33:29'),
(142, 1, 'admin/view/javascript/d_rubaxa_sortable/sortable.css', '2019-08-18 00:33:29'),
(143, 1, 'admin/view/javascript/d_rubaxa_sortable/sortable.js', '2019-08-18 00:33:29'),
(144, 1, 'admin/view/javascript/d_rubaxa_sortable/sortable.min.js', '2019-08-18 00:33:29'),
(145, 1, 'admin/view/javascript/d_tinysort/jquery.tinysort.js', '2019-08-18 00:33:29'),
(146, 1, 'admin/view/javascript/d_tinysort/jquery.tinysort.min.js', '2019-08-18 00:33:29'),
(147, 1, 'admin/view/javascript/d_tinysort/tinysort.charorder.js', '2019-08-18 00:33:29'),
(148, 1, 'admin/view/javascript/d_tinysort/tinysort.charorder.min.js', '2019-08-18 00:33:29'),
(149, 1, 'admin/view/javascript/d_tinysort/tinysort.js', '2019-08-18 00:33:29'),
(150, 1, 'admin/view/javascript/d_tinysort/tinysort.min.js', '2019-08-18 00:33:29'),
(151, 1, 'admin/view/stylesheet/d_admin_style/core', '2019-08-18 00:33:29'),
(152, 1, 'admin/view/stylesheet/d_admin_style/themes', '2019-08-18 00:33:29'),
(153, 1, 'admin/view/stylesheet/d_bootstrap_extra/bootstrap.css', '2019-08-18 00:33:29'),
(154, 1, 'admin/view/template/extension/d_admin_style', '2019-08-18 00:33:29'),
(155, 1, 'admin/view/template/extension/d_blog_module', '2019-08-18 00:33:29'),
(156, 1, 'admin/view/template/extension/d_visual_designer', '2019-08-18 00:33:29'),
(157, 1, 'admin/view/template/extension/event', '2019-08-18 00:33:29'),
(158, 1, 'catalog/controller/extension/d_blog_module/author.php', '2019-08-18 00:33:29'),
(159, 1, 'catalog/controller/extension/d_blog_module/category.php', '2019-08-18 00:33:29'),
(160, 1, 'catalog/controller/extension/d_blog_module/post.php', '2019-08-18 00:33:29'),
(161, 1, 'catalog/controller/extension/d_blog_module/review.php', '2019-08-18 00:33:29'),
(162, 1, 'catalog/controller/extension/d_blog_module/search.php', '2019-08-18 00:33:29'),
(163, 1, 'catalog/controller/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:29'),
(164, 1, 'catalog/controller/extension/event/d_blog_module.php', '2019-08-18 00:33:29'),
(165, 1, 'catalog/language/en-gb/extension/d_blog_module', '2019-08-18 00:33:29'),
(166, 1, 'catalog/language/en-gb/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(167, 1, 'catalog/language/en-gb/extension/event', '2019-08-18 00:33:29'),
(168, 1, 'catalog/language/english/extension/d_visual_designer_module', '2019-08-18 00:33:29'),
(169, 1, 'catalog/model/extension/d_blog_module/author.php', '2019-08-18 00:33:29'),
(170, 1, 'catalog/model/extension/d_blog_module/category.php', '2019-08-18 00:33:29'),
(171, 1, 'catalog/model/extension/d_blog_module/post.php', '2019-08-18 00:33:29'),
(172, 1, 'catalog/model/extension/d_blog_module/review.php', '2019-08-18 00:33:29'),
(173, 1, 'catalog/model/extension/d_opencart_patch/load.php', '2019-08-18 00:33:29'),
(174, 1, 'catalog/model/extension/d_opencart_patch/user.php', '2019-08-18 00:33:29'),
(175, 1, 'catalog/model/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:29'),
(176, 1, 'catalog/model/extension/module/d_blog_module.php', '2019-08-18 00:33:29'),
(177, 1, 'catalog/view/javascript/d_blog_module/gulpfile.js', '2019-08-18 00:33:29'),
(178, 1, 'catalog/view/javascript/d_bootstrap_bootbox/bootbox.js', '2019-08-18 00:33:29'),
(179, 1, 'catalog/view/javascript/d_bootstrap_bootbox/bootbox.min.js', '2019-08-18 00:33:29'),
(180, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/css', '2019-08-18 00:33:29'),
(181, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img', '2019-08-18 00:33:29'),
(182, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/js', '2019-08-18 00:33:29'),
(183, 1, 'catalog/view/javascript/d_bootstrap_rating/bootstrap-rating.css', '2019-08-18 00:33:29'),
(184, 1, 'catalog/view/javascript/d_bootstrap_rating/bootstrap-rating.js', '2019-08-18 00:33:29'),
(185, 1, 'catalog/view/javascript/d_bootstrap_rating/bootstrap-rating.min.js', '2019-08-18 00:33:29'),
(186, 1, 'catalog/view/javascript/d_bootstrap_switch/css', '2019-08-18 00:33:29'),
(187, 1, 'catalog/view/javascript/d_bootstrap_switch/js', '2019-08-18 00:33:29'),
(188, 1, 'catalog/view/javascript/d_fileinput/CHANGE.md', '2019-08-18 00:33:29'),
(189, 1, 'catalog/view/javascript/d_fileinput/LICENSE.md', '2019-08-18 00:33:29'),
(190, 1, 'catalog/view/javascript/d_fileinput/bower.json', '2019-08-18 00:33:29'),
(191, 1, 'catalog/view/javascript/d_fileinput/canvas-to-blob.js', '2019-08-18 00:33:29'),
(192, 1, 'catalog/view/javascript/d_fileinput/composer.json', '2019-08-18 00:33:29'),
(193, 1, 'catalog/view/javascript/d_fileinput/css', '2019-08-18 00:33:29'),
(194, 1, 'catalog/view/javascript/d_fileinput/examples', '2019-08-18 00:33:29'),
(195, 1, 'catalog/view/javascript/d_fileinput/fileinput.css', '2019-08-18 00:33:29'),
(196, 1, 'catalog/view/javascript/d_fileinput/fileinput.js', '2019-08-18 00:33:29'),
(197, 1, 'catalog/view/javascript/d_fileinput/img', '2019-08-18 00:33:29'),
(198, 1, 'catalog/view/javascript/d_fileinput/js', '2019-08-18 00:33:29'),
(199, 1, 'catalog/view/javascript/d_fileinput/nuget', '2019-08-18 00:33:29'),
(200, 1, 'catalog/view/javascript/d_fileinput/package.json', '2019-08-18 00:33:29'),
(201, 1, 'catalog/view/javascript/d_fileinput/sass', '2019-08-18 00:33:29'),
(202, 1, 'catalog/view/javascript/d_fileinput/themes', '2019-08-18 00:33:29'),
(203, 1, 'catalog/view/javascript/d_rubaxa_sortable/jquery.binding.js', '2019-08-18 00:33:29'),
(204, 1, 'catalog/view/javascript/d_rubaxa_sortable/knockout-sortable.js', '2019-08-18 00:33:29'),
(205, 1, 'catalog/view/javascript/d_rubaxa_sortable/ng-sortable.js', '2019-08-18 00:33:29'),
(206, 1, 'catalog/view/javascript/d_rubaxa_sortable/react-sortable-mixin.js', '2019-08-18 00:33:29'),
(207, 1, 'catalog/view/javascript/d_rubaxa_sortable/sortable.css', '2019-08-18 00:33:29'),
(208, 1, 'catalog/view/javascript/d_rubaxa_sortable/sortable.js', '2019-08-18 00:33:29'),
(209, 1, 'catalog/view/javascript/d_rubaxa_sortable/sortable.min.js', '2019-08-18 00:33:29'),
(210, 1, 'catalog/view/javascript/d_tinysort/jquery.tinysort.js', '2019-08-18 00:33:29'),
(211, 1, 'catalog/view/javascript/d_tinysort/jquery.tinysort.min.js', '2019-08-18 00:33:29'),
(212, 1, 'catalog/view/javascript/d_tinysort/tinysort.charorder.js', '2019-08-18 00:33:29'),
(213, 1, 'catalog/view/javascript/d_tinysort/tinysort.charorder.min.js', '2019-08-18 00:33:29'),
(214, 1, 'catalog/view/javascript/d_tinysort/tinysort.js', '2019-08-18 00:33:29'),
(215, 1, 'catalog/view/javascript/d_tinysort/tinysort.min.js', '2019-08-18 00:33:29'),
(216, 1, 'catalog/view/theme/default/javascript', '2019-08-18 00:33:29'),
(217, 1, 'image/catalog/d_blog_module/category/Photo_blog_11.jpg', '2019-08-18 00:33:29'),
(218, 1, 'image/catalog/d_blog_module/category/Photo_blog_12.jpg', '2019-08-18 00:33:29'),
(219, 1, 'image/catalog/d_blog_module/category/Photo_blog_13.jpg', '2019-08-18 00:33:29'),
(220, 1, 'image/catalog/d_blog_module/category/Photo_blog_14.jpg', '2019-08-18 00:33:29'),
(221, 1, 'image/catalog/d_blog_module/category/Photo_blog_15.jpg', '2019-08-18 00:33:29'),
(222, 1, 'image/catalog/d_blog_module/category/Photo_blog_16.jpg', '2019-08-18 00:33:29'),
(223, 1, 'image/catalog/d_blog_module/category/Photo_blog_17.jpg', '2019-08-18 00:33:29'),
(224, 1, 'image/catalog/d_blog_module/category/blog.jpg', '2019-08-18 00:33:29'),
(225, 1, 'image/catalog/d_blog_module/post/Photo_blog_1.jpg', '2019-08-18 00:33:29'),
(226, 1, 'image/catalog/d_blog_module/post/Photo_blog_10.jpg', '2019-08-18 00:33:29'),
(227, 1, 'image/catalog/d_blog_module/post/Photo_blog_2.jpg', '2019-08-18 00:33:29'),
(228, 1, 'image/catalog/d_blog_module/post/Photo_blog_3.jpg', '2019-08-18 00:33:29'),
(229, 1, 'image/catalog/d_blog_module/post/Photo_blog_4.jpg', '2019-08-18 00:33:29'),
(230, 1, 'image/catalog/d_blog_module/post/Photo_blog_5.jpg', '2019-08-18 00:33:29'),
(231, 1, 'image/catalog/d_blog_module/post/Photo_blog_6.jpg', '2019-08-18 00:33:29'),
(232, 1, 'image/catalog/d_blog_module/post/Photo_blog_7.jpg', '2019-08-18 00:33:29'),
(233, 1, 'image/catalog/d_blog_module/post/Photo_blog_8.jpg', '2019-08-18 00:33:29'),
(234, 1, 'image/catalog/d_blog_module/post/Photo_blog_9.jpg', '2019-08-18 00:33:29'),
(235, 1, 'image/catalog/d_blog_module/post/post-1.jpg', '2019-08-18 00:33:29'),
(236, 1, 'image/catalog/d_blog_module/review/index.html', '2019-08-18 00:33:29'),
(237, 1, 'system/library/d_shopunity/extension/d_admin_style.json', '2019-08-18 00:33:29'),
(238, 1, 'system/library/d_shopunity/extension/d_blog_module.json', '2019-08-18 00:33:29'),
(239, 1, 'system/library/d_shopunity/extension/d_bootstrap_bootbox.json', '2019-08-18 00:33:29'),
(240, 1, 'system/library/d_shopunity/extension/d_bootstrap_colorpicker.json', '2019-08-18 00:33:29'),
(241, 1, 'system/library/d_shopunity/extension/d_bootstrap_extra.json', '2019-08-18 00:33:29'),
(242, 1, 'system/library/d_shopunity/extension/d_bootstrap_rating.json', '2019-08-18 00:33:29'),
(243, 1, 'system/library/d_shopunity/extension/d_bootstrap_switch.json', '2019-08-18 00:33:29'),
(244, 1, 'system/library/d_shopunity/extension/d_event_manager.json', '2019-08-18 00:33:29'),
(245, 1, 'system/library/d_shopunity/extension/d_fileinput.json', '2019-08-18 00:33:29'),
(246, 1, 'system/library/d_shopunity/extension/d_opencart_patch.json', '2019-08-18 00:33:29'),
(247, 1, 'system/library/d_shopunity/extension/d_rubaxa_sortable.json', '2019-08-18 00:33:29'),
(248, 1, 'system/library/d_shopunity/extension/d_simple_html_dom.json', '2019-08-18 00:33:29'),
(249, 1, 'system/library/d_shopunity/extension/d_tinysort.json', '2019-08-18 00:33:29'),
(250, 1, 'system/library/d_shopunity/extension/d_twig_manager.json', '2019-08-18 00:33:29'),
(251, 1, 'system/library/d_shopunity/extension/d_twig_partial.json', '2019-08-18 00:33:29'),
(252, 1, 'system/library/d_shopunity/install/d_opencart_patch.xml', '2019-08-18 00:33:29'),
(253, 1, 'system/library/d_shopunity/install/d_twig_manager.xml', '2019-08-18 00:33:29'),
(254, 1, 'system/library/d_shopunity/readme/d_opencart_patch.md', '2019-08-18 00:33:29'),
(255, 1, 'admin/language/en-gb/extension/d_admin_style/style.php', '2019-08-18 00:33:29'),
(256, 1, 'admin/language/en-gb/extension/d_blog_module/author.php', '2019-08-18 00:33:29'),
(257, 1, 'admin/language/en-gb/extension/d_blog_module/author_group.php', '2019-08-18 00:33:29'),
(258, 1, 'admin/language/en-gb/extension/d_blog_module/category.php', '2019-08-18 00:33:29'),
(259, 1, 'admin/language/en-gb/extension/d_blog_module/post.php', '2019-08-18 00:33:29'),
(260, 1, 'admin/language/en-gb/extension/d_blog_module/review.php', '2019-08-18 00:33:29'),
(261, 1, 'admin/language/en-gb/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:29'),
(262, 1, 'admin/language/en-gb/extension/event/d_blog_module.php', '2019-08-18 00:33:29'),
(263, 1, 'admin/language/en-gb/extension/module/d_blog_module.php', '2019-08-18 00:33:29'),
(264, 1, 'admin/language/english/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:29'),
(265, 1, 'admin/view/javascript/d_admin_style/gulp/gulpfile.js', '2019-08-18 00:33:29'),
(266, 1, 'admin/view/javascript/d_admin_style/gulp/package-lock.json', '2019-08-18 00:33:29'),
(267, 1, 'admin/view/javascript/d_admin_style/gulp/package.json', '2019-08-18 00:33:29'),
(268, 1, 'admin/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.css', '2019-08-18 00:33:29'),
(269, 1, 'admin/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.css.map', '2019-08-18 00:33:29'),
(270, 1, 'admin/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.min.css', '2019-08-18 00:33:29'),
(271, 1, 'admin/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.min.css.map', '2019-08-18 00:33:30'),
(272, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker', '2019-08-18 00:33:30'),
(273, 1, 'admin/view/javascript/d_bootstrap_colorpicker/js/bootstrap-colorpicker.js', '2019-08-18 00:33:30'),
(274, 1, 'admin/view/javascript/d_bootstrap_colorpicker/js/bootstrap-colorpicker.min.js', '2019-08-18 00:33:30'),
(275, 1, 'admin/view/javascript/d_bootstrap_switch/css/bootstrap-switch.css', '2019-08-18 00:33:30'),
(276, 1, 'admin/view/javascript/d_bootstrap_switch/css/bootstrap-switch.min.css', '2019-08-18 00:33:30'),
(277, 1, 'admin/view/javascript/d_bootstrap_switch/js/bootstrap-switch.js', '2019-08-18 00:33:30'),
(278, 1, 'admin/view/javascript/d_bootstrap_switch/js/bootstrap-switch.min.js', '2019-08-18 00:33:30'),
(279, 1, 'admin/view/javascript/d_fileinput/css/fileinput-rtl.css', '2019-08-18 00:33:30'),
(280, 1, 'admin/view/javascript/d_fileinput/css/fileinput-rtl.min.css', '2019-08-18 00:33:30'),
(281, 1, 'admin/view/javascript/d_fileinput/css/fileinput.css', '2019-08-18 00:33:30'),
(282, 1, 'admin/view/javascript/d_fileinput/css/fileinput.min.css', '2019-08-18 00:33:30'),
(283, 1, 'admin/view/javascript/d_fileinput/examples/index.html', '2019-08-18 00:33:30'),
(284, 1, 'admin/view/javascript/d_fileinput/img/loading-sm.gif', '2019-08-18 00:33:30'),
(285, 1, 'admin/view/javascript/d_fileinput/img/loading.gif', '2019-08-18 00:33:30'),
(286, 1, 'admin/view/javascript/d_fileinput/js/fileinput.js', '2019-08-18 00:33:30'),
(287, 1, 'admin/view/javascript/d_fileinput/js/fileinput.min.js', '2019-08-18 00:33:30'),
(288, 1, 'admin/view/javascript/d_fileinput/js/locales', '2019-08-18 00:33:30'),
(289, 1, 'admin/view/javascript/d_fileinput/js/plugins', '2019-08-18 00:33:30'),
(290, 1, 'admin/view/javascript/d_fileinput/nuget/Package.nuspec', '2019-08-18 00:33:30'),
(291, 1, 'admin/view/javascript/d_fileinput/nuget/build.bat', '2019-08-18 00:33:30'),
(292, 1, 'admin/view/javascript/d_fileinput/sass/fileinput.scss', '2019-08-18 00:33:30'),
(293, 1, 'admin/view/javascript/d_fileinput/themes/explorer', '2019-08-18 00:33:30'),
(294, 1, 'admin/view/javascript/d_fileinput/themes/explorer-fa', '2019-08-18 00:33:30'),
(295, 1, 'admin/view/javascript/d_fileinput/themes/fa', '2019-08-18 00:33:30'),
(296, 1, 'admin/view/javascript/d_fileinput/themes/gly', '2019-08-18 00:33:30'),
(297, 1, 'admin/view/stylesheet/d_admin_style/core/_blog.scss', '2019-08-18 00:33:30'),
(298, 1, 'admin/view/stylesheet/d_admin_style/core/_common.scss', '2019-08-18 00:33:30'),
(299, 1, 'admin/view/stylesheet/d_admin_style/core/_compatible.scss', '2019-08-18 00:33:30'),
(300, 1, 'admin/view/stylesheet/d_admin_style/core/_notification.scss', '2019-08-18 00:33:30'),
(301, 1, 'admin/view/stylesheet/d_admin_style/core/_tables.scss', '2019-08-18 00:33:30'),
(302, 1, 'admin/view/stylesheet/d_admin_style/core/core.css', '2019-08-18 00:33:30'),
(303, 1, 'admin/view/stylesheet/d_admin_style/core/core.css.map', '2019-08-18 00:33:30'),
(304, 1, 'admin/view/stylesheet/d_admin_style/core/core.scss', '2019-08-18 00:33:30'),
(305, 1, 'admin/view/stylesheet/d_admin_style/core/header', '2019-08-18 00:33:30'),
(306, 1, 'admin/view/stylesheet/d_admin_style/core/normalize', '2019-08-18 00:33:30'),
(307, 1, 'admin/view/stylesheet/d_admin_style/core/scss', '2019-08-18 00:33:30'),
(308, 1, 'admin/view/stylesheet/d_admin_style/core/setup.css', '2019-08-18 00:33:30'),
(309, 1, 'admin/view/stylesheet/d_admin_style/core/setup.css.map', '2019-08-18 00:33:30'),
(310, 1, 'admin/view/stylesheet/d_admin_style/core/setup.scss', '2019-08-18 00:33:30'),
(311, 1, 'admin/view/stylesheet/d_admin_style/core/svg', '2019-08-18 00:33:30'),
(312, 1, 'admin/view/stylesheet/d_admin_style/core/welcome.css', '2019-08-18 00:33:30'),
(313, 1, 'admin/view/stylesheet/d_admin_style/core/welcome.css.map', '2019-08-18 00:33:30'),
(314, 1, 'admin/view/stylesheet/d_admin_style/core/welcome.scss', '2019-08-18 00:33:30'),
(315, 1, 'admin/view/stylesheet/d_admin_style/themes/dark', '2019-08-18 00:33:30'),
(316, 1, 'admin/view/stylesheet/d_admin_style/themes/default', '2019-08-18 00:33:30'),
(317, 1, 'admin/view/stylesheet/d_admin_style/themes/light', '2019-08-18 00:33:30'),
(318, 1, 'admin/view/template/extension/d_admin_style/setup.twig', '2019-08-18 00:33:30'),
(319, 1, 'admin/view/template/extension/d_blog_module/author_form.twig', '2019-08-18 00:33:30'),
(320, 1, 'admin/view/template/extension/d_blog_module/author_group_form.twig', '2019-08-18 00:33:30'),
(321, 1, 'admin/view/template/extension/d_blog_module/author_group_list.twig', '2019-08-18 00:33:30'),
(322, 1, 'admin/view/template/extension/d_blog_module/author_list.twig', '2019-08-18 00:33:30'),
(323, 1, 'admin/view/template/extension/d_blog_module/category_form.twig', '2019-08-18 00:33:30'),
(324, 1, 'admin/view/template/extension/d_blog_module/category_list.twig', '2019-08-18 00:33:30'),
(325, 1, 'admin/view/template/extension/d_blog_module/post_form.twig', '2019-08-18 00:33:30'),
(326, 1, 'admin/view/template/extension/d_blog_module/post_list.twig', '2019-08-18 00:33:30'),
(327, 1, 'admin/view/template/extension/d_blog_module/review_form.twig', '2019-08-18 00:33:30'),
(328, 1, 'admin/view/template/extension/d_blog_module/review_list.twig', '2019-08-18 00:33:30'),
(329, 1, 'admin/view/template/extension/d_blog_module/welcome.twig', '2019-08-18 00:33:30'),
(330, 1, 'admin/view/template/extension/d_visual_designer/settings_block', '2019-08-18 00:33:30'),
(331, 1, 'admin/view/template/extension/event/d_blog_module.twig', '2019-08-18 00:33:30'),
(332, 1, 'admin/view/template/extension/module/d_blog_module.twig', '2019-08-18 00:33:30'),
(333, 1, 'catalog/language/en-gb/extension/d_blog_module/author.php', '2019-08-18 00:33:30'),
(334, 1, 'catalog/language/en-gb/extension/d_blog_module/category.php', '2019-08-18 00:33:30'),
(335, 1, 'catalog/language/en-gb/extension/d_blog_module/post.php', '2019-08-18 00:33:30'),
(336, 1, 'catalog/language/en-gb/extension/d_blog_module/review.php', '2019-08-18 00:33:30'),
(337, 1, 'catalog/language/en-gb/extension/d_blog_module/search.php', '2019-08-18 00:33:30'),
(338, 1, 'catalog/language/en-gb/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:30'),
(339, 1, 'catalog/language/en-gb/extension/event/d_blog_module.php', '2019-08-18 00:33:30'),
(340, 1, 'catalog/language/english/extension/d_visual_designer_module/blog_post.php', '2019-08-18 00:33:30'),
(341, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.css', '2019-08-18 00:33:30'),
(342, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.css.map', '2019-08-18 00:33:30'),
(343, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.min.css', '2019-08-18 00:33:30'),
(344, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/css/bootstrap-colorpicker.min.css.map', '2019-08-18 00:33:30'),
(345, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker', '2019-08-18 00:33:30'),
(346, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/js/bootstrap-colorpicker.js', '2019-08-18 00:33:30'),
(347, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/js/bootstrap-colorpicker.min.js', '2019-08-18 00:33:30'),
(348, 1, 'catalog/view/javascript/d_bootstrap_switch/css/bootstrap-switch.css', '2019-08-18 00:33:30'),
(349, 1, 'catalog/view/javascript/d_bootstrap_switch/css/bootstrap-switch.min.css', '2019-08-18 00:33:30'),
(350, 1, 'catalog/view/javascript/d_bootstrap_switch/js/bootstrap-switch.js', '2019-08-18 00:33:30'),
(351, 1, 'catalog/view/javascript/d_bootstrap_switch/js/bootstrap-switch.min.js', '2019-08-18 00:33:30'),
(352, 1, 'catalog/view/javascript/d_fileinput/css/fileinput-rtl.css', '2019-08-18 00:33:30'),
(353, 1, 'catalog/view/javascript/d_fileinput/css/fileinput-rtl.min.css', '2019-08-18 00:33:30'),
(354, 1, 'catalog/view/javascript/d_fileinput/css/fileinput.css', '2019-08-18 00:33:30'),
(355, 1, 'catalog/view/javascript/d_fileinput/css/fileinput.min.css', '2019-08-18 00:33:30'),
(356, 1, 'catalog/view/javascript/d_fileinput/examples/index.html', '2019-08-18 00:33:30'),
(357, 1, 'catalog/view/javascript/d_fileinput/img/loading-sm.gif', '2019-08-18 00:33:30'),
(358, 1, 'catalog/view/javascript/d_fileinput/img/loading.gif', '2019-08-18 00:33:30'),
(359, 1, 'catalog/view/javascript/d_fileinput/js/fileinput.js', '2019-08-18 00:33:30'),
(360, 1, 'catalog/view/javascript/d_fileinput/js/fileinput.min.js', '2019-08-18 00:33:30'),
(361, 1, 'catalog/view/javascript/d_fileinput/js/locales', '2019-08-18 00:33:30'),
(362, 1, 'catalog/view/javascript/d_fileinput/js/plugins', '2019-08-18 00:33:30'),
(363, 1, 'catalog/view/javascript/d_fileinput/nuget/Package.nuspec', '2019-08-18 00:33:30'),
(364, 1, 'catalog/view/javascript/d_fileinput/nuget/build.bat', '2019-08-18 00:33:30'),
(365, 1, 'catalog/view/javascript/d_fileinput/sass/fileinput.scss', '2019-08-18 00:33:30'),
(366, 1, 'catalog/view/javascript/d_fileinput/themes/explorer', '2019-08-18 00:33:30'),
(367, 1, 'catalog/view/javascript/d_fileinput/themes/explorer-fa', '2019-08-18 00:33:30'),
(368, 1, 'catalog/view/javascript/d_fileinput/themes/fa', '2019-08-18 00:33:30'),
(369, 1, 'catalog/view/javascript/d_fileinput/themes/gly', '2019-08-18 00:33:30'),
(370, 1, 'catalog/view/theme/default/javascript/d_blog_module', '2019-08-18 00:33:30'),
(371, 1, 'catalog/view/theme/default/javascript/partial', '2019-08-18 00:33:30'),
(372, 1, 'catalog/view/theme/default/stylesheet/d_blog_module', '2019-08-18 00:33:30'),
(373, 1, 'catalog/view/theme/default/template/partial', '2019-08-18 00:33:30'),
(374, 1, 'system/library/template/Twig/Extension/DTwigManager.php', '2019-08-18 00:33:30'),
(375, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/alpha-horizontal.png', '2019-08-18 00:33:30'),
(376, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/alpha.png', '2019-08-18 00:33:30'),
(377, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/hue-horizontal.png', '2019-08-18 00:33:30'),
(378, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/hue.png', '2019-08-18 00:33:30'),
(379, 1, 'admin/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/saturation.png', '2019-08-18 00:33:30'),
(380, 1, 'admin/view/javascript/d_fileinput/js/locales/LANG.js', '2019-08-18 00:33:30'),
(381, 1, 'admin/view/javascript/d_fileinput/js/locales/ar.js', '2019-08-18 00:33:30'),
(382, 1, 'admin/view/javascript/d_fileinput/js/locales/az.js', '2019-08-18 00:33:30'),
(383, 1, 'admin/view/javascript/d_fileinput/js/locales/bg.js', '2019-08-18 00:33:30'),
(384, 1, 'admin/view/javascript/d_fileinput/js/locales/ca.js', '2019-08-18 00:33:30'),
(385, 1, 'admin/view/javascript/d_fileinput/js/locales/cr.js', '2019-08-18 00:33:30'),
(386, 1, 'admin/view/javascript/d_fileinput/js/locales/cz.js', '2019-08-18 00:33:30'),
(387, 1, 'admin/view/javascript/d_fileinput/js/locales/da.js', '2019-08-18 00:33:30'),
(388, 1, 'admin/view/javascript/d_fileinput/js/locales/de.js', '2019-08-18 00:33:30'),
(389, 1, 'admin/view/javascript/d_fileinput/js/locales/el.js', '2019-08-18 00:33:30'),
(390, 1, 'admin/view/javascript/d_fileinput/js/locales/es.js', '2019-08-18 00:33:30'),
(391, 1, 'admin/view/javascript/d_fileinput/js/locales/et.js', '2019-08-18 00:33:30'),
(392, 1, 'admin/view/javascript/d_fileinput/js/locales/fa.js', '2019-08-18 00:33:30'),
(393, 1, 'admin/view/javascript/d_fileinput/js/locales/fi.js', '2019-08-18 00:33:30'),
(394, 1, 'admin/view/javascript/d_fileinput/js/locales/fr.js', '2019-08-18 00:33:30'),
(395, 1, 'admin/view/javascript/d_fileinput/js/locales/gl.js', '2019-08-18 00:33:30'),
(396, 1, 'admin/view/javascript/d_fileinput/js/locales/hu.js', '2019-08-18 00:33:30'),
(397, 1, 'admin/view/javascript/d_fileinput/js/locales/id.js', '2019-08-18 00:33:30'),
(398, 1, 'admin/view/javascript/d_fileinput/js/locales/it.js', '2019-08-18 00:33:30'),
(399, 1, 'admin/view/javascript/d_fileinput/js/locales/ja.js', '2019-08-18 00:33:30'),
(400, 1, 'admin/view/javascript/d_fileinput/js/locales/kr.js', '2019-08-18 00:33:30'),
(401, 1, 'admin/view/javascript/d_fileinput/js/locales/kz.js', '2019-08-18 00:33:30'),
(402, 1, 'admin/view/javascript/d_fileinput/js/locales/nl.js', '2019-08-18 00:33:30'),
(403, 1, 'admin/view/javascript/d_fileinput/js/locales/no.js', '2019-08-18 00:33:30'),
(404, 1, 'admin/view/javascript/d_fileinput/js/locales/pl.js', '2019-08-18 00:33:30'),
(405, 1, 'admin/view/javascript/d_fileinput/js/locales/pt-BR.js', '2019-08-18 00:33:30'),
(406, 1, 'admin/view/javascript/d_fileinput/js/locales/pt.js', '2019-08-18 00:33:30'),
(407, 1, 'admin/view/javascript/d_fileinput/js/locales/ro.js', '2019-08-18 00:33:30'),
(408, 1, 'admin/view/javascript/d_fileinput/js/locales/ru.js', '2019-08-18 00:33:30'),
(409, 1, 'admin/view/javascript/d_fileinput/js/locales/sk.js', '2019-08-18 00:33:30'),
(410, 1, 'admin/view/javascript/d_fileinput/js/locales/sl.js', '2019-08-18 00:33:30'),
(411, 1, 'admin/view/javascript/d_fileinput/js/locales/sv.js', '2019-08-18 00:33:30'),
(412, 1, 'admin/view/javascript/d_fileinput/js/locales/th.js', '2019-08-18 00:33:30'),
(413, 1, 'admin/view/javascript/d_fileinput/js/locales/tr.js', '2019-08-18 00:33:30'),
(414, 1, 'admin/view/javascript/d_fileinput/js/locales/uk.js', '2019-08-18 00:33:30'),
(415, 1, 'admin/view/javascript/d_fileinput/js/locales/vi.js', '2019-08-18 00:33:30'),
(416, 1, 'admin/view/javascript/d_fileinput/js/locales/zh-TW.js', '2019-08-18 00:33:30'),
(417, 1, 'admin/view/javascript/d_fileinput/js/locales/zh.js', '2019-08-18 00:33:30'),
(418, 1, 'admin/view/javascript/d_fileinput/js/plugins/piexif.js', '2019-08-18 00:33:30'),
(419, 1, 'admin/view/javascript/d_fileinput/js/plugins/piexif.min.js', '2019-08-18 00:33:30'),
(420, 1, 'admin/view/javascript/d_fileinput/js/plugins/purify.js', '2019-08-18 00:33:30'),
(421, 1, 'admin/view/javascript/d_fileinput/js/plugins/purify.min.js', '2019-08-18 00:33:30'),
(422, 1, 'admin/view/javascript/d_fileinput/js/plugins/sortable.js', '2019-08-18 00:33:30'),
(423, 1, 'admin/view/javascript/d_fileinput/js/plugins/sortable.min.js', '2019-08-18 00:33:30'),
(424, 1, 'admin/view/javascript/d_fileinput/themes/explorer/theme.css', '2019-08-18 00:33:30'),
(425, 1, 'admin/view/javascript/d_fileinput/themes/explorer/theme.js', '2019-08-18 00:33:30'),
(426, 1, 'admin/view/javascript/d_fileinput/themes/explorer/theme.min.css', '2019-08-18 00:33:30'),
(427, 1, 'admin/view/javascript/d_fileinput/themes/explorer/theme.min.js', '2019-08-18 00:33:30'),
(428, 1, 'admin/view/javascript/d_fileinput/themes/explorer-fa/theme.css', '2019-08-18 00:33:30'),
(429, 1, 'admin/view/javascript/d_fileinput/themes/explorer-fa/theme.js', '2019-08-18 00:33:30'),
(430, 1, 'admin/view/javascript/d_fileinput/themes/explorer-fa/theme.min.css', '2019-08-18 00:33:30'),
(431, 1, 'admin/view/javascript/d_fileinput/themes/explorer-fa/theme.min.js', '2019-08-18 00:33:30'),
(432, 1, 'admin/view/javascript/d_fileinput/themes/fa/theme.js', '2019-08-18 00:33:30'),
(433, 1, 'admin/view/javascript/d_fileinput/themes/fa/theme.min.js', '2019-08-18 00:33:30'),
(434, 1, 'admin/view/javascript/d_fileinput/themes/gly/theme.js', '2019-08-18 00:33:30'),
(435, 1, 'admin/view/javascript/d_fileinput/themes/gly/theme.min.js', '2019-08-18 00:33:30'),
(436, 1, 'admin/view/stylesheet/d_admin_style/core/header/header.css', '2019-08-18 00:33:30'),
(437, 1, 'admin/view/stylesheet/d_admin_style/core/header/header.css.map', '2019-08-18 00:33:30'),
(438, 1, 'admin/view/stylesheet/d_admin_style/core/header/header.scss', '2019-08-18 00:33:30'),
(439, 1, 'admin/view/stylesheet/d_admin_style/core/header/headerold.css', '2019-08-18 00:33:30'),
(440, 1, 'admin/view/stylesheet/d_admin_style/core/header/headerold.css.map', '2019-08-18 00:33:30'),
(441, 1, 'admin/view/stylesheet/d_admin_style/core/header/headerold.scss', '2019-08-18 00:33:30'),
(442, 1, 'admin/view/stylesheet/d_admin_style/core/normalize/normalize.css', '2019-08-18 00:33:30'),
(443, 1, 'admin/view/stylesheet/d_admin_style/core/scss/_mixin.scss', '2019-08-18 00:33:30'),
(444, 1, 'admin/view/stylesheet/d_admin_style/core/scss/_mixins.sass', '2019-08-18 00:33:30'),
(445, 1, 'admin/view/stylesheet/d_admin_style/core/scss/_variable.scss', '2019-08-18 00:33:30'),
(446, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification', '2019-08-18 00:33:30'),
(447, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication', '2019-08-18 00:33:30'),
(448, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section', '2019-08-18 00:33:30'),
(449, 1, 'admin/view/stylesheet/d_admin_style/core/scss/third_party', '2019-08-18 00:33:30'),
(450, 1, 'admin/view/stylesheet/d_admin_style/core/svg/loader.svg', '2019-08-18 00:33:30'),
(451, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/dark.css', '2019-08-18 00:33:30'),
(452, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/dark.css.map', '2019-08-18 00:33:30'),
(453, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/dark.scss', '2019-08-18 00:33:30'),
(454, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss', '2019-08-18 00:33:30'),
(455, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/styles.css', '2019-08-18 00:33:30'),
(456, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/styles.css.map', '2019-08-18 00:33:30'),
(457, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/styles.scss', '2019-08-18 00:33:30'),
(458, 1, 'admin/view/stylesheet/d_admin_style/themes/default/styles.css', '2019-08-18 00:33:30'),
(459, 1, 'admin/view/stylesheet/d_admin_style/themes/light/light.css', '2019-08-18 00:33:30'),
(460, 1, 'admin/view/stylesheet/d_admin_style/themes/light/light.css.map', '2019-08-18 00:33:30'),
(461, 1, 'admin/view/stylesheet/d_admin_style/themes/light/light.scss', '2019-08-18 00:33:30'),
(462, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification', '2019-08-18 00:33:30'),
(463, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss', '2019-08-18 00:33:30'),
(464, 1, 'admin/view/stylesheet/d_admin_style/themes/light/styles.css', '2019-08-18 00:33:30'),
(465, 1, 'admin/view/stylesheet/d_admin_style/themes/light/styles.css.map', '2019-08-18 00:33:30'),
(466, 1, 'admin/view/stylesheet/d_admin_style/themes/light/styles.scss', '2019-08-18 00:33:30'),
(467, 1, 'admin/view/template/extension/d_visual_designer/settings_block/vd-setting-block-blog_post.tag', '2019-08-18 00:33:30'),
(468, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/alpha-horizontal.png', '2019-08-18 00:33:30'),
(469, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/alpha.png', '2019-08-18 00:33:30'),
(470, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/hue-horizontal.png', '2019-08-18 00:33:30'),
(471, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/hue.png', '2019-08-18 00:33:30'),
(472, 1, 'catalog/view/javascript/d_bootstrap_colorpicker/img/bootstrap-colorpicker/saturation.png', '2019-08-18 00:33:30'),
(473, 1, 'catalog/view/javascript/d_fileinput/js/locales/LANG.js', '2019-08-18 00:33:30'),
(474, 1, 'catalog/view/javascript/d_fileinput/js/locales/ar.js', '2019-08-18 00:33:30'),
(475, 1, 'catalog/view/javascript/d_fileinput/js/locales/az.js', '2019-08-18 00:33:30'),
(476, 1, 'catalog/view/javascript/d_fileinput/js/locales/bg.js', '2019-08-18 00:33:30'),
(477, 1, 'catalog/view/javascript/d_fileinput/js/locales/ca.js', '2019-08-18 00:33:30'),
(478, 1, 'catalog/view/javascript/d_fileinput/js/locales/cr.js', '2019-08-18 00:33:30'),
(479, 1, 'catalog/view/javascript/d_fileinput/js/locales/cz.js', '2019-08-18 00:33:30'),
(480, 1, 'catalog/view/javascript/d_fileinput/js/locales/da.js', '2019-08-18 00:33:30'),
(481, 1, 'catalog/view/javascript/d_fileinput/js/locales/de.js', '2019-08-18 00:33:30'),
(482, 1, 'catalog/view/javascript/d_fileinput/js/locales/el.js', '2019-08-18 00:33:30'),
(483, 1, 'catalog/view/javascript/d_fileinput/js/locales/es.js', '2019-08-18 00:33:30'),
(484, 1, 'catalog/view/javascript/d_fileinput/js/locales/et.js', '2019-08-18 00:33:30'),
(485, 1, 'catalog/view/javascript/d_fileinput/js/locales/fa.js', '2019-08-18 00:33:30'),
(486, 1, 'catalog/view/javascript/d_fileinput/js/locales/fi.js', '2019-08-18 00:33:30'),
(487, 1, 'catalog/view/javascript/d_fileinput/js/locales/fr.js', '2019-08-18 00:33:30'),
(488, 1, 'catalog/view/javascript/d_fileinput/js/locales/gl.js', '2019-08-18 00:33:30'),
(489, 1, 'catalog/view/javascript/d_fileinput/js/locales/hu.js', '2019-08-18 00:33:30'),
(490, 1, 'catalog/view/javascript/d_fileinput/js/locales/id.js', '2019-08-18 00:33:30'),
(491, 1, 'catalog/view/javascript/d_fileinput/js/locales/it.js', '2019-08-18 00:33:30'),
(492, 1, 'catalog/view/javascript/d_fileinput/js/locales/ja.js', '2019-08-18 00:33:30'),
(493, 1, 'catalog/view/javascript/d_fileinput/js/locales/kr.js', '2019-08-18 00:33:30'),
(494, 1, 'catalog/view/javascript/d_fileinput/js/locales/kz.js', '2019-08-18 00:33:30'),
(495, 1, 'catalog/view/javascript/d_fileinput/js/locales/nl.js', '2019-08-18 00:33:30'),
(496, 1, 'catalog/view/javascript/d_fileinput/js/locales/no.js', '2019-08-18 00:33:30'),
(497, 1, 'catalog/view/javascript/d_fileinput/js/locales/pl.js', '2019-08-18 00:33:30'),
(498, 1, 'catalog/view/javascript/d_fileinput/js/locales/pt-BR.js', '2019-08-18 00:33:30'),
(499, 1, 'catalog/view/javascript/d_fileinput/js/locales/pt.js', '2019-08-18 00:33:30'),
(500, 1, 'catalog/view/javascript/d_fileinput/js/locales/ro.js', '2019-08-18 00:33:30'),
(501, 1, 'catalog/view/javascript/d_fileinput/js/locales/ru.js', '2019-08-18 00:33:30'),
(502, 1, 'catalog/view/javascript/d_fileinput/js/locales/sk.js', '2019-08-18 00:33:30'),
(503, 1, 'catalog/view/javascript/d_fileinput/js/locales/sl.js', '2019-08-18 00:33:30'),
(504, 1, 'catalog/view/javascript/d_fileinput/js/locales/sv.js', '2019-08-18 00:33:30'),
(505, 1, 'catalog/view/javascript/d_fileinput/js/locales/th.js', '2019-08-18 00:33:30'),
(506, 1, 'catalog/view/javascript/d_fileinput/js/locales/tr.js', '2019-08-18 00:33:30'),
(507, 1, 'catalog/view/javascript/d_fileinput/js/locales/uk.js', '2019-08-18 00:33:30'),
(508, 1, 'catalog/view/javascript/d_fileinput/js/locales/vi.js', '2019-08-18 00:33:30'),
(509, 1, 'catalog/view/javascript/d_fileinput/js/locales/zh-TW.js', '2019-08-18 00:33:30'),
(510, 1, 'catalog/view/javascript/d_fileinput/js/locales/zh.js', '2019-08-18 00:33:30'),
(511, 1, 'catalog/view/javascript/d_fileinput/js/plugins/piexif.js', '2019-08-18 00:33:30'),
(512, 1, 'catalog/view/javascript/d_fileinput/js/plugins/piexif.min.js', '2019-08-18 00:33:30'),
(513, 1, 'catalog/view/javascript/d_fileinput/js/plugins/purify.js', '2019-08-18 00:33:30'),
(514, 1, 'catalog/view/javascript/d_fileinput/js/plugins/purify.min.js', '2019-08-18 00:33:30'),
(515, 1, 'catalog/view/javascript/d_fileinput/js/plugins/sortable.js', '2019-08-18 00:33:30'),
(516, 1, 'catalog/view/javascript/d_fileinput/js/plugins/sortable.min.js', '2019-08-18 00:33:30'),
(517, 1, 'catalog/view/javascript/d_fileinput/themes/explorer/theme.css', '2019-08-18 00:33:30'),
(518, 1, 'catalog/view/javascript/d_fileinput/themes/explorer/theme.js', '2019-08-18 00:33:30'),
(519, 1, 'catalog/view/javascript/d_fileinput/themes/explorer/theme.min.css', '2019-08-18 00:33:30'),
(520, 1, 'catalog/view/javascript/d_fileinput/themes/explorer/theme.min.js', '2019-08-18 00:33:30'),
(521, 1, 'catalog/view/javascript/d_fileinput/themes/explorer-fa/theme.css', '2019-08-18 00:33:30'),
(522, 1, 'catalog/view/javascript/d_fileinput/themes/explorer-fa/theme.js', '2019-08-18 00:33:30'),
(523, 1, 'catalog/view/javascript/d_fileinput/themes/explorer-fa/theme.min.css', '2019-08-18 00:33:30'),
(524, 1, 'catalog/view/javascript/d_fileinput/themes/explorer-fa/theme.min.js', '2019-08-18 00:33:30'),
(525, 1, 'catalog/view/javascript/d_fileinput/themes/fa/theme.js', '2019-08-18 00:33:30'),
(526, 1, 'catalog/view/javascript/d_fileinput/themes/fa/theme.min.js', '2019-08-18 00:33:30'),
(527, 1, 'catalog/view/javascript/d_fileinput/themes/gly/theme.js', '2019-08-18 00:33:30'),
(528, 1, 'catalog/view/javascript/d_fileinput/themes/gly/theme.min.js', '2019-08-18 00:33:30'),
(529, 1, 'catalog/view/theme/default/javascript/d_blog_module/author.js', '2019-08-18 00:33:30'),
(530, 1, 'catalog/view/theme/default/javascript/d_blog_module/category.js', '2019-08-18 00:33:30'),
(531, 1, 'catalog/view/theme/default/javascript/d_blog_module/main.js', '2019-08-18 00:33:30'),
(532, 1, 'catalog/view/theme/default/javascript/d_blog_module/post.js', '2019-08-18 00:33:30'),
(533, 1, 'catalog/view/theme/default/javascript/d_blog_module/review.js', '2019-08-18 00:33:30'),
(534, 1, 'catalog/view/theme/default/javascript/partial/d_address_field.js', '2019-08-18 00:33:30'),
(535, 1, 'catalog/view/theme/default/javascript/partial/d_custom_field.js', '2019-08-18 00:33:30'),
(536, 1, 'catalog/view/theme/default/javascript/partial/d_product_sort.js', '2019-08-18 00:33:30'),
(537, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/animate.css', '2019-08-18 00:33:30'),
(538, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/bootstrap.css', '2019-08-18 00:33:30'),
(539, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/bootstrap.css.map', '2019-08-18 00:33:30'),
(540, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/bootstrap.scss', '2019-08-18 00:33:30'),
(541, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/d_blog_module.css', '2019-08-18 00:33:30'),
(542, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/d_blog_module.css.map', '2019-08-18 00:33:30'),
(543, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/d_blog_module.scss', '2019-08-18 00:33:30'),
(544, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/theme', '2019-08-18 00:33:30'),
(545, 1, 'catalog/view/theme/default/template/extension/d_blog_module', '2019-08-18 00:33:30'),
(546, 1, 'catalog/view/theme/default/template/extension/d_visual_designer', '2019-08-18 00:33:30'),
(547, 1, 'catalog/view/theme/default/template/extension/d_visual_designer_module', '2019-08-18 00:33:30'),
(548, 1, 'catalog/view/theme/default/template/partial/button.twig', '2019-08-18 00:33:30'),
(549, 1, 'catalog/view/theme/default/template/partial/d_account_field.twig', '2019-08-18 00:33:30'),
(550, 1, 'catalog/view/theme/default/template/partial/d_address_field.twig', '2019-08-18 00:33:30'),
(551, 1, 'catalog/view/theme/default/template/partial/d_breadcrumb.twig', '2019-08-18 00:33:30'),
(552, 1, 'catalog/view/theme/default/template/partial/d_button.twig', '2019-08-18 00:33:30'),
(553, 1, 'catalog/view/theme/default/template/partial/d_button_continue.twig', '2019-08-18 00:33:30'),
(554, 1, 'catalog/view/theme/default/template/partial/d_button_submit.twig', '2019-08-18 00:33:30'),
(555, 1, 'catalog/view/theme/default/template/partial/d_cart.twig', '2019-08-18 00:33:30'),
(556, 1, 'catalog/view/theme/default/template/partial/d_custom_field.twig', '2019-08-18 00:33:30'),
(557, 1, 'catalog/view/theme/default/template/partial/d_empty.twig', '2019-08-18 00:33:30'),
(558, 1, 'catalog/view/theme/default/template/partial/d_layout_close.twig', '2019-08-18 00:33:30'),
(559, 1, 'catalog/view/theme/default/template/partial/d_layout_open.twig', '2019-08-18 00:33:30'),
(560, 1, 'catalog/view/theme/default/template/partial/d_mini_cart.twig', '2019-08-18 00:33:30'),
(561, 1, 'catalog/view/theme/default/template/partial/d_name_field.twig', '2019-08-18 00:33:30'),
(562, 1, 'catalog/view/theme/default/template/partial/d_notification.twig', '2019-08-18 00:33:30'),
(563, 1, 'catalog/view/theme/default/template/partial/d_product_list.twig', '2019-08-18 00:33:30'),
(564, 1, 'catalog/view/theme/default/template/partial/d_product_sort.twig', '2019-08-18 00:33:30'),
(565, 1, 'catalog/view/theme/default/template/partial/d_product_thumb.twig', '2019-08-18 00:33:30'),
(566, 1, 'catalog/view/theme/default/template/partial/d_rating.twig', '2019-08-18 00:33:30');
INSERT INTO `mt_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(567, 1, 'catalog/view/theme/default/template/partial/d_review.twig', '2019-08-18 00:33:30'),
(568, 1, 'catalog/view/theme/default/template/partial/d_search.twig', '2019-08-18 00:33:30'),
(569, 1, 'catalog/view/theme/default/template/partial/form_group.twig', '2019-08-18 00:33:30'),
(570, 1, 'catalog/view/theme/default/template/partial/input.twig', '2019-08-18 00:33:30'),
(571, 1, 'catalog/view/theme/default/template/partial/input_group.twig', '2019-08-18 00:33:30'),
(572, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_button.scss', '2019-08-18 00:33:30'),
(573, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_callout.scss', '2019-08-18 00:33:30'),
(574, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_checkbox.scss', '2019-08-18 00:33:30'),
(575, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_common.scss', '2019-08-18 00:33:30'),
(576, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_forms.scss', '2019-08-18 00:33:30'),
(577, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_import.scss', '2019-08-18 00:33:30'),
(578, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_info.scss', '2019-08-18 00:33:30'),
(579, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_navigation.scss', '2019-08-18 00:33:30'),
(580, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_pagination.scss', '2019-08-18 00:33:30'),
(581, 1, 'admin/view/stylesheet/d_admin_style/core/scss/modification/_panels.scss', '2019-08-18 00:33:30'),
(582, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_button.scss', '2019-08-18 00:33:30'),
(583, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_callout.scss', '2019-08-18 00:33:30'),
(584, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_common.scss', '2019-08-18 00:33:30'),
(585, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_forms.scss', '2019-08-18 00:33:30'),
(586, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_import.scss', '2019-08-18 00:33:30'),
(587, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_navigation.scss', '2019-08-18 00:33:30'),
(588, 1, 'admin/view/stylesheet/d_admin_style/core/scss/mofication/_panels.scss', '2019-08-18 00:33:30'),
(589, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_dashboard.scss', '2019-08-18 00:33:30'),
(590, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_firewall.scss', '2019-08-18 00:33:30'),
(591, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_help.scss', '2019-08-18 00:33:30'),
(592, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_low_php.scss', '2019-08-18 00:33:30'),
(593, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_scan.scss', '2019-08-18 00:33:30'),
(594, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_setting.scss', '2019-08-18 00:33:30'),
(595, 1, 'admin/view/stylesheet/d_admin_style/core/scss/section/_statistic.scss', '2019-08-18 00:33:30'),
(596, 1, 'admin/view/stylesheet/d_admin_style/core/scss/third_party/_chart.scss', '2019-08-18 00:33:30'),
(597, 1, 'admin/view/stylesheet/d_admin_style/core/scss/third_party/_diff.scss', '2019-08-18 00:33:30'),
(598, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/_mixin.scss', '2019-08-18 00:33:30'),
(599, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/_variable.scss', '2019-08-18 00:33:30'),
(600, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section', '2019-08-18 00:33:30'),
(601, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/third_party', '2019-08-18 00:33:30'),
(602, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_button.scss', '2019-08-18 00:33:30'),
(603, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_common.scss', '2019-08-18 00:33:30'),
(604, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_form.scss', '2019-08-18 00:33:30'),
(605, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_forms.scss', '2019-08-18 00:33:30'),
(606, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_info.scss', '2019-08-18 00:33:30'),
(607, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_modal.scss', '2019-08-18 00:33:30'),
(608, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_navigation.scss', '2019-08-18 00:33:30'),
(609, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_notification.scss', '2019-08-18 00:33:30'),
(610, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_pagination.scss', '2019-08-18 00:33:30'),
(611, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_panel.scss', '2019-08-18 00:33:30'),
(612, 1, 'admin/view/stylesheet/d_admin_style/themes/light/modification/_table.scss', '2019-08-18 00:33:30'),
(613, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/_mixin.scss', '2019-08-18 00:33:30'),
(614, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/_variable.scss', '2019-08-18 00:33:30'),
(615, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section', '2019-08-18 00:33:30'),
(616, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/third_party', '2019-08-18 00:33:30'),
(617, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/theme/default', '2019-08-18 00:33:30'),
(618, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/theme/default.css', '2019-08-18 00:33:30'),
(619, 1, 'catalog/view/theme/default/template/extension/d_blog_module/author.twig', '2019-08-18 00:33:30'),
(620, 1, 'catalog/view/theme/default/template/extension/d_blog_module/category.twig', '2019-08-18 00:33:30'),
(621, 1, 'catalog/view/theme/default/template/extension/d_blog_module/layout_grid.twig', '2019-08-18 00:33:30'),
(622, 1, 'catalog/view/theme/default/template/extension/d_blog_module/post.twig', '2019-08-18 00:33:30'),
(623, 1, 'catalog/view/theme/default/template/extension/d_blog_module/post_thumb.twig', '2019-08-18 00:33:30'),
(624, 1, 'catalog/view/theme/default/template/extension/d_blog_module/review.twig', '2019-08-18 00:33:30'),
(625, 1, 'catalog/view/theme/default/template/extension/d_blog_module/review_thumb.twig', '2019-08-18 00:33:30'),
(626, 1, 'catalog/view/theme/default/template/extension/d_blog_module/search.twig', '2019-08-18 00:33:30'),
(627, 1, 'catalog/view/theme/default/template/extension/d_visual_designer/content_blocks', '2019-08-18 00:33:30'),
(628, 1, 'catalog/view/theme/default/template/extension/d_visual_designer_module/blog_post.twig', '2019-08-18 00:33:30'),
(629, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_dashboard.scss', '2019-08-18 00:33:30'),
(630, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_firewall.scss', '2019-08-18 00:33:30'),
(631, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_help.scss', '2019-08-18 00:33:30'),
(632, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_low_php.scss', '2019-08-18 00:33:30'),
(633, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_scan.scss', '2019-08-18 00:33:30'),
(634, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_setting.scss', '2019-08-18 00:33:30'),
(635, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/section/_statistic.scss', '2019-08-18 00:33:30'),
(636, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/third_party/_chart.scss', '2019-08-18 00:33:30'),
(637, 1, 'admin/view/stylesheet/d_admin_style/themes/dark/scss/third_party/_diff.scss', '2019-08-18 00:33:30'),
(638, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_dashboard.scss', '2019-08-18 00:33:30'),
(639, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_firewall.scss', '2019-08-18 00:33:30'),
(640, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_help.scss', '2019-08-18 00:33:30'),
(641, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_low_php.scss', '2019-08-18 00:33:30'),
(642, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_scan.scss', '2019-08-18 00:33:30'),
(643, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_setting.scss', '2019-08-18 00:33:30'),
(644, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/section/_statistic.scss', '2019-08-18 00:33:30'),
(645, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/third_party/_chart.scss', '2019-08-18 00:33:30'),
(646, 1, 'admin/view/stylesheet/d_admin_style/themes/light/scss/third_party/_diff.scss', '2019-08-18 00:33:30'),
(647, 1, 'catalog/view/theme/default/stylesheet/d_blog_module/theme/default/default.scss', '2019-08-18 00:33:30'),
(648, 1, 'catalog/view/theme/default/template/extension/d_visual_designer/content_blocks/vd-block-blog_post.tag', '2019-08-18 00:33:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_filter`
--

DROP TABLE IF EXISTS `mt_filter`;
CREATE TABLE IF NOT EXISTS `mt_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_filter_description`
--

DROP TABLE IF EXISTS `mt_filter_description`;
CREATE TABLE IF NOT EXISTS `mt_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_filter_group`
--

DROP TABLE IF EXISTS `mt_filter_group`;
CREATE TABLE IF NOT EXISTS `mt_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_filter_group_description`
--

DROP TABLE IF EXISTS `mt_filter_group_description`;
CREATE TABLE IF NOT EXISTS `mt_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_geo_zone`
--

DROP TABLE IF EXISTS `mt_geo_zone`;
CREATE TABLE IF NOT EXISTS `mt_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_geo_zone`
--

INSERT INTO `mt_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2009-01-06 23:26:25', '2010-02-26 22:33:24'),
(4, 'UK Shipping', 'UK Shipping Zones', '2009-06-23 01:14:53', '2010-12-15 15:18:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_googleshopping_category`
--

DROP TABLE IF EXISTS `mt_googleshopping_category`;
CREATE TABLE IF NOT EXISTS `mt_googleshopping_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`google_product_category`,`store_id`),
  KEY `category_id_store_id` (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_googleshopping_product`
--

DROP TABLE IF EXISTS `mt_googleshopping_product`;
CREATE TABLE IF NOT EXISTS `mt_googleshopping_product` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `conversions` int(11) NOT NULL DEFAULT 0,
  `cost` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `conversion_value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_advertise_google_id`),
  UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_googleshopping_product_status`
--

DROP TABLE IF EXISTS `mt_googleshopping_product_status`;
CREATE TABLE IF NOT EXISTS `mt_googleshopping_product_status` (
  `product_id` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_googleshopping_product_target`
--

DROP TABLE IF EXISTS `mt_googleshopping_product_target`;
CREATE TABLE IF NOT EXISTS `mt_googleshopping_product_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`,`advertise_google_target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_googleshopping_target`
--

DROP TABLE IF EXISTS `mt_googleshopping_target`;
CREATE TABLE IF NOT EXISTS `mt_googleshopping_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused',
  `date_added` date DEFAULT NULL,
  `roas` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`advertise_google_target_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_information`
--

DROP TABLE IF EXISTS `mt_information`;
CREATE TABLE IF NOT EXISTS `mt_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_information`
--

INSERT INTO `mt_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_information_description`
--

DROP TABLE IF EXISTS `mt_information_description`;
CREATE TABLE IF NOT EXISTS `mt_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_information_description`
--

INSERT INTO `mt_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_information_to_layout`
--

DROP TABLE IF EXISTS `mt_information_to_layout`;
CREATE TABLE IF NOT EXISTS `mt_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_information_to_store`
--

DROP TABLE IF EXISTS `mt_information_to_store`;
CREATE TABLE IF NOT EXISTS `mt_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_information_to_store`
--

INSERT INTO `mt_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_language`
--

DROP TABLE IF EXISTS `mt_language`;
CREATE TABLE IF NOT EXISTS `mt_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_language`
--

INSERT INTO `mt_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, 'Tiếng Việt', 'vi-vn', 'vi_VN.UTF-8,vi_VN,vi-vn,vietnamese', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_layout`
--

DROP TABLE IF EXISTS `mt_layout`;
CREATE TABLE IF NOT EXISTS `mt_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_layout`
--

INSERT INTO `mt_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(100, 'Blog post'),
(101, 'Blog category'),
(102, 'Blog search'),
(103, 'Blog author');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_layout_module`
--

DROP TABLE IF EXISTS `mt_layout_module`;
CREATE TABLE IF NOT EXISTS `mt_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_layout_module`
--

INSERT INTO `mt_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(75, 1, 'carousel.29', 'content_top', 2),
(74, 1, 'slideshow.27', 'content_top', 1),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2),
(76, 1, 'featured.28', 'content_top', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_layout_route`
--

DROP TABLE IF EXISTS `mt_layout_route`;
CREATE TABLE IF NOT EXISTS `mt_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_layout_route`
--

INSERT INTO `mt_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(54, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(55, 100, 0, 'extension/d_blog_module/post'),
(56, 101, 0, 'extension/d_blog_module/category'),
(57, 102, 0, 'extension/d_blog_module/search'),
(58, 103, 0, 'extension/d_blog_module/author');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_length_class`
--

DROP TABLE IF EXISTS `mt_length_class`;
CREATE TABLE IF NOT EXISTS `mt_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_length_class`
--

INSERT INTO `mt_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_length_class_description`
--

DROP TABLE IF EXISTS `mt_length_class_description`;
CREATE TABLE IF NOT EXISTS `mt_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_length_class_description`
--

INSERT INTO `mt_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_location`
--

DROP TABLE IF EXISTS `mt_location`;
CREATE TABLE IF NOT EXISTS `mt_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_manufacturer`
--

DROP TABLE IF EXISTS `mt_manufacturer`;
CREATE TABLE IF NOT EXISTS `mt_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_manufacturer`
--

INSERT INTO `mt_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0),
(11, 'Shell', 'catalog/vendor_icon_1 (1).jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_manufacturer_to_store`
--

DROP TABLE IF EXISTS `mt_manufacturer_to_store`;
CREATE TABLE IF NOT EXISTS `mt_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_manufacturer_to_store`
--

INSERT INTO `mt_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_marketing`
--

DROP TABLE IF EXISTS `mt_marketing`;
CREATE TABLE IF NOT EXISTS `mt_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_modification`
--

DROP TABLE IF EXISTS `mt_modification`;
CREATE TABLE IF NOT EXISTS `mt_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_modification`
--

INSERT INTO `mt_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 1, 'd_opencart_patch', 'd_opencart_patch', 'Dreamvention', '3.1.6', 'http://dreamvention.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>d_opencart_patch</name>\n    <code>d_opencart_patch</code>\n    <description>Permission fixes in Opencart 3.x</description>\n    <version>3.1.6</version>\n    <author>Dreamvention</author>\n    <link>http://dreamvention.com</link>\n    <file path=\"admin/controller/user/user_permission.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$path[] = $file . \'/*\';]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_opencart_patch.xml 1\n            $files[] = $file;\n            ]]></add>\n        </operation>\n        <operation error=\"skip\">\n            <search><![CDATA[$permission = substr($controller, 0, strrpos($controller, \'.\'));]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_opencart_patch.xml 2\n            $permission = (strrpos($controller, \'.\') !== false) ? substr($controller, 0, strrpos($controller, \'.\')) : $controller;\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/controller/extension/installer.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$modification_info = $this->model_setting_modification->getModificationByCode($code);]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_opencart_patch.xml 1\n            if (strpos($code, \'d_\') === 0 && $modification_info) {\n                $this->model_setting_modification->deleteModification($modification_info[\'modification_id\']);\n                $modification_info = false; \n            }\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/model/setting/extension.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"extension_path` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\' ORDER BY `date_added` ASC\");]]></search>\n            <add position=\"replace\"><![CDATA[\n        //d_opencart_patch.xml 1\n        $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"extension_install` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\'\");\n\n        $extension = $query->row;\n\n        if(isset($extension[\'filename\']) && strpos($extension[\'filename\'], \'_compiled_\')){\n\n\n            $parts = explode(\'_compiled_\', $extension[\'filename\']);\n            $extension_name = $parts[0];\n            $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"extension_path` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\' AND path LIKE \'%\".$this->db->escape($extension_name).\"%\' ORDER BY `date_added` ASC\");\n        }else{\n            $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"extension_path` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\' ORDER BY `date_added` ASC\");\n        }\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/model/setting/modification.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"modification` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\'\");]]></search>\n            <add position=\"replace\"><![CDATA[\n        //d_opencart_patch.xml 1\n        $query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"extension_install` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\'\");\n\n        $extension = $query->row;\n\n        if(isset($extension[\'filename\']) && strpos($extension[\'filename\'], \'_compiled_\') !== false){\n\n\n            $parts = explode(\'_compiled_\', $extension[\'filename\']);\n            $extension_name = $parts[0];\n            $this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"modification` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\' AND `name` LIKE \'%\".$this->db->escape($extension_name).\"%\'\");\n\n        }else{\n            $this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"modification` WHERE `extension_install_id` = \'\" . (int)$extension_install_id . \"\'\");\n        }\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/controller/marketplace/install.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$this->model_setting_extension->deleteExtensionInstall($extension_install_id);]]></search>\n            <add position=\"replace\"><![CDATA[//d_opencart_patch.xml 1 moved down]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/controller/marketplace/install.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$this->model_setting_modification->deleteModificationsByExtensionInstallId($extension_install_id);]]></search>\n            <add position=\"after\"><![CDATA[\n                //d_opencart_patch.xml 2\n                $this->model_setting_extension->deleteExtensionInstall($extension_install_id);]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/controller/common/filemanager.php\">\n        <operation>\n            <search><![CDATA[$files = glob($directory . \'/\' . $filter_name . \'*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}\', GLOB_BRACE);]]></search>\n            <add position=\"replace\"><![CDATA[$files = glob($directory . \'/\' . $filter_name . \'*.{jpg,jpeg,svg,png,gif,JPG,JPEG,PNG,GIF}\', GLOB_BRACE);]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[\'jpg\',]]></search>\n            <add position=\"after\"><![CDATA[\'svg\',]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[\'image/jpeg\',]]></search>\n            <add position=\"after\"><![CDATA[\'image/svg+xml\',]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/view/template/common/filemanager.twig\">\n        <operation>\n            <search><![CDATA[<img src=\"{{ image.thumb }}\" alt=\"{{ image.name }}\" title=\"{{ image.name }}\" />]]></search>\n            <add position=\"replace\"><![CDATA[<img src=\"{{ image.thumb }}\" alt=\"{{ image.name }}\" title=\"{{ image.name }}\" width=\"100\" height=\"100\" />]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/view/template/common/header.twig\">\n        <operation>\n            <search><![CDATA[</header>]]></search>\n            <add position=\"before\"><![CDATA[\n                <style type=\"text/css\">\n                    a.img-thumbnail{\n                        min-width:100px;\n                    }\n                </style>\n                ]]></add>\n        </operation>\n    </file>\n    <file path=\"admin/model/tool/image.php\">\n        <operation>\n            <search><![CDATA[public function resize($filename, $width, $height) {]]></search>\n            <add position=\"after\"><![CDATA[\n                if (isset($this->request->server[\'HTTPS\']) && (($this->request->server[\'HTTPS\'] == \'on\') || ($this->request->server[\'HTTPS\'] == \'1\'))) {\n                    $server = HTTPS_CATALOG;\n                } else {\n                    $server = HTTP_CATALOG;\n                }\n\n                if ($filename) {\n                    $image_info = @getimagesize(DIR_IMAGE . $filename);\n                    if (!$image_info) {\n                        return $server . \'image/\' . $filename;\n                    }\n                } else {\n                    $filename = \"no_image.png\";\n                }\n                ]]></add>\n        </operation>\n    </file>\n    <file path=\"catalog/model/tool/image.php\">\n        <operation>\n            <search><![CDATA[public function resize($filename, $width, $height) {]]></search>\n            <add position=\"after\"><![CDATA[\n                if (isset($this->request->server[\'HTTPS\']) && (($this->request->server[\'HTTPS\'] == \'on\') || ($this->request->server[\'HTTPS\'] == \'1\'))) {\n                    $server = HTTPS_SERVER;\n                } else {\n                    $server = HTTP_SERVER;\n                }\n\n                if ($filename) {\n                    $image_info = @getimagesize(DIR_IMAGE . $filename);\n                    if (!$image_info) {\n                        return $server . \'image/\' . $filename;\n                    }\n                } else {\n                    $filename = \"no_image.png\";\n                }\n                ]]></add>\n        </operation>\n    </file>\n    <file path=\"catalog/model/localisation/language.php\">\n        <operation error=\"skip\">\n$language_data = $this->cache->get(\'language\');\n            <search ><![CDATA[$language_data = $this->cache->get(\'language\');]]></search>\n            <add position=\"replace\"><![CDATA[\n        $language_data = $this->cache->get(\'catalog.language\');]]></add>\n        </operation>\n    </file>\n    <file path=\"system/config/catalog.php\">\n        <operation error=\"skip\">\n            <search index=\"1\" ><![CDATA[\'view/*/before\' => array(]]></search>\n            <add position=\"replace\" offset=\"2\"><![CDATA[\n                   //    \"view/*/before\" => array(\n                   //        1000  => \'event/debug/before\'\n                   //    ),\n                ]]></add>\n        </operation>\n        <operation error=\"skip\">\n            <search ><![CDATA[\'controller/*/after\'  => array(]]></search>\n            <add position=\"replace\" offset=\"2\"><![CDATA[\n                    //  \'controller/*/after\'  => array(\n                    //\'event/debug/after\'\n                    //)\n                ]]></add>\n        </operation>\n    </file>\n</modification>', 1, '2019-08-18 00:33:31'),
(2, 0, 'd_twig_manager', 'd_twig_manager', 'Dreamvention', '2.0.0', 'http://dreamvention.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>d_twig_manager</name>\n    <code>d_twig_manager</code>\n    <description>Adds support for twig templating engine</description>\n    <version>2.0.0</version>\n    <author>Dreamvention</author>\n    <link>http://dreamvention.com</link>\n    <file path=\"system/engine/loader.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$template = new Template($this->registry->get(\'config\')->get(\'template_engine\'));]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            $template = new Template($this->registry->get(\'config\')->get(\'template_engine\'), $this->registry);\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"system/library/template.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[public function __construct($adaptor) {]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            public function __construct($adaptor, $registry) {\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$this->adaptor = new $class();]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            $this->adaptor = new $class($registry);\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"system/library/template/twig.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[private $data = array();]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            private $registry = array();\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[public function __construct() {]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            public function __construct($registry) {\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[\\Twig_Autoloader::register();]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            $this->registry = $registry;\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$this->twig = new \\Twig_Environment($loader, $config);]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            if (file_exists(DIR_SYSTEM . \'library/template/Twig/Extension/DTwigManager.php\')) {\n                $this->twig->addExtension(new \\Twig_Extension_DTwigManager($this->registry));\n            }\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"catalog/controller/event/theme.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$twig = new \\Twig_Environment($loader, $config);]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            if (file_exists(DIR_SYSTEM . \'library/template/Twig/Extension/DTwigManager.php\')) {\n                $twig->addExtension(new Twig_Extension_DTwigManager($this->registry));\n            }\n            ]]></add>\n        </operation>\n    </file>\n</modification>', 1, '2019-08-18 00:36:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_module`
--

DROP TABLE IF EXISTS `mt_module`;
CREATE TABLE IF NOT EXISTS `mt_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_module`
--

INSERT INTO `mt_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_option`
--

DROP TABLE IF EXISTS `mt_option`;
CREATE TABLE IF NOT EXISTS `mt_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_option`
--

INSERT INTO `mt_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_option_description`
--

DROP TABLE IF EXISTS `mt_option_description`;
CREATE TABLE IF NOT EXISTS `mt_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_option_description`
--

INSERT INTO `mt_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_option_value`
--

DROP TABLE IF EXISTS `mt_option_value`;
CREATE TABLE IF NOT EXISTS `mt_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_option_value`
--

INSERT INTO `mt_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_option_value_description`
--

DROP TABLE IF EXISTS `mt_option_value_description`;
CREATE TABLE IF NOT EXISTS `mt_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_option_value_description`
--

INSERT INTO `mt_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order`
--

DROP TABLE IF EXISTS `mt_order`;
CREATE TABLE IF NOT EXISTS `mt_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_order`
--

INSERT INTO `mt_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2019-00', 0, 'Your Store', 'http://localhost/webphi/', 1, 1, 'Tuan', 'Pham Minh', 'minhtuan9922@gmail.com', '0123456789', '', '', 'Tuan', 'Pham Minh', '', 'abcde', '', 'ho chi minh', '', 'Việt Nam', 230, 'Hồ Chí Minh', 4269, '', '[]', 'Cash On Delivery', 'cod', 'Tuan', 'Pham Minh', '', 'abcde', '', 'ho chi minh', '', 'Việt Nam', 230, 'Hồ Chí Minh', 4269, '', '[]', 'Free Shipping', 'free.free', '', '101.0000', 1, 0, '0.0000', 0, '', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'vi', '2019-08-19 01:32:45', '2019-08-19 01:33:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_history`
--

DROP TABLE IF EXISTS `mt_order_history`;
CREATE TABLE IF NOT EXISTS `mt_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_order_history`
--

INSERT INTO `mt_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2019-08-19 01:33:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_option`
--

DROP TABLE IF EXISTS `mt_order_option`;
CREATE TABLE IF NOT EXISTS `mt_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_product`
--

DROP TABLE IF EXISTS `mt_order_product`;
CREATE TABLE IF NOT EXISTS `mt_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_order_product`
--

INSERT INTO `mt_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_recurring`
--

DROP TABLE IF EXISTS `mt_order_recurring`;
CREATE TABLE IF NOT EXISTS `mt_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_recurring_transaction`
--

DROP TABLE IF EXISTS `mt_order_recurring_transaction`;
CREATE TABLE IF NOT EXISTS `mt_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_shipment`
--

DROP TABLE IF EXISTS `mt_order_shipment`;
CREATE TABLE IF NOT EXISTS `mt_order_shipment` (
  `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_shipment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_status`
--

DROP TABLE IF EXISTS `mt_order_status`;
CREATE TABLE IF NOT EXISTS `mt_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_order_status`
--

INSERT INTO `mt_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(15, 2, 'Đã xử lý'),
(2, 2, 'Đang xử lý'),
(3, 2, 'Vận chuyển'),
(7, 2, 'Đã hủy'),
(5, 2, 'Hoàn thành'),
(8, 2, 'Từ chối'),
(9, 2, 'Không được hủy'),
(10, 2, 'Thất bại'),
(11, 2, 'Hoàn tiền'),
(12, 2, 'Đảo ngược'),
(13, 2, 'Bồi hoàn'),
(1, 2, 'Đang chờ'),
(16, 2, 'Vô hiệu'),
(14, 2, 'Hết hạn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_total`
--

DROP TABLE IF EXISTS `mt_order_total`;
CREATE TABLE IF NOT EXISTS `mt_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_order_total`
--

INSERT INTO `mt_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '101.0000', 1),
(2, 1, 'shipping', 'Free Shipping', '0.0000', 3),
(3, 1, 'total', 'Total', '101.0000', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_order_voucher`
--

DROP TABLE IF EXISTS `mt_order_voucher`;
CREATE TABLE IF NOT EXISTS `mt_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product`
--

DROP TABLE IF EXISTS `mt_product`;
CREATE TABLE IF NOT EXISTS `mt_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product`
--

INSERT INTO `mt_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 969, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 16, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 6, '2009-02-03 21:07:37', '2019-08-26 22:03:46'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 2, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 2, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 10, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_attribute`
--

DROP TABLE IF EXISTS `mt_product_attribute`;
CREATE TABLE IF NOT EXISTS `mt_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_attribute`
--

INSERT INTO `mt_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(47, 2, 1, '4'),
(43, 2, 2, '1'),
(47, 4, 2, '16GB'),
(43, 4, 2, '8gb'),
(42, 3, 2, '100mhz'),
(47, 2, 2, '4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_description`
--

DROP TABLE IF EXISTS `mt_product_description`;
CREATE TABLE IF NOT EXISTS `mt_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_description`
--

INSERT INTO `mt_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', ''),
(35, 2, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(40, 2, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', ''),
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', ''),
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', ''),
(41, 2, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', '');
INSERT INTO `mt_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(30, 2, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_discount`
--

DROP TABLE IF EXISTS `mt_product_discount`;
CREATE TABLE IF NOT EXISTS `mt_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=447 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_discount`
--

INSERT INTO `mt_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(446, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(445, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(444, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_filter`
--

DROP TABLE IF EXISTS `mt_product_filter`;
CREATE TABLE IF NOT EXISTS `mt_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_image`
--

DROP TABLE IF EXISTS `mt_product_image`;
CREATE TABLE IF NOT EXISTS `mt_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2362 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_image`
--

INSERT INTO `mt_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2361, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2360, 42, 'catalog/demo/canon_logo.jpg', 0),
(2359, 42, 'catalog/demo/hp_1.jpg', 0),
(2358, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2357, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_option`
--

DROP TABLE IF EXISTS `mt_product_option`;
CREATE TABLE IF NOT EXISTS `mt_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_option`
--

INSERT INTO `mt_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(221, 42, 9, '22:25', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(226, 30, 5, '', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(220, 42, 10, '2011-02-20 22:25', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_option_value`
--

DROP TABLE IF EXISTS `mt_product_option_value`;
CREATE TABLE IF NOT EXISTS `mt_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_option_value`
--

INSERT INTO `mt_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_recurring`
--

DROP TABLE IF EXISTS `mt_product_recurring`;
CREATE TABLE IF NOT EXISTS `mt_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_related`
--

DROP TABLE IF EXISTS `mt_product_related`;
CREATE TABLE IF NOT EXISTS `mt_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_related`
--

INSERT INTO `mt_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_reward`
--

DROP TABLE IF EXISTS `mt_product_reward`;
CREATE TABLE IF NOT EXISTS `mt_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=548 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_reward`
--

INSERT INTO `mt_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(547, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_special`
--

DROP TABLE IF EXISTS `mt_product_special`;
CREATE TABLE IF NOT EXISTS `mt_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_special`
--

INSERT INTO `mt_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(441, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_to_category`
--

DROP TABLE IF EXISTS `mt_product_to_category`;
CREATE TABLE IF NOT EXISTS `mt_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_to_category`
--

INSERT INTO `mt_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(42, 60),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_to_download`
--

DROP TABLE IF EXISTS `mt_product_to_download`;
CREATE TABLE IF NOT EXISTS `mt_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_to_layout`
--

DROP TABLE IF EXISTS `mt_product_to_layout`;
CREATE TABLE IF NOT EXISTS `mt_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_to_layout`
--

INSERT INTO `mt_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(42, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_product_to_store`
--

DROP TABLE IF EXISTS `mt_product_to_store`;
CREATE TABLE IF NOT EXISTS `mt_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_product_to_store`
--

INSERT INTO `mt_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_recurring`
--

DROP TABLE IF EXISTS `mt_recurring`;
CREATE TABLE IF NOT EXISTS `mt_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_recurring_description`
--

DROP TABLE IF EXISTS `mt_recurring_description`;
CREATE TABLE IF NOT EXISTS `mt_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_return`
--

DROP TABLE IF EXISTS `mt_return`;
CREATE TABLE IF NOT EXISTS `mt_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_return`
--

INSERT INTO `mt_return` (`return_id`, `order_id`, `product_id`, `customer_id`, `firstname`, `lastname`, `email`, `telephone`, `product`, `model`, `quantity`, `opened`, `return_reason_id`, `return_action_id`, `return_status_id`, `comment`, `date_ordered`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 1, 'Tuan', 'Pham Minh', 'minhtuan9922@gmail.com', '0123456789', 'iPhone', 'product 11', 1, 0, 1, 0, 2, '', '2019-08-19', '2019-08-19 01:35:01', '2019-08-19 01:35:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_return_action`
--

DROP TABLE IF EXISTS `mt_return_action`;
CREATE TABLE IF NOT EXISTS `mt_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_return_action`
--

INSERT INTO `mt_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_return_history`
--

DROP TABLE IF EXISTS `mt_return_history`;
CREATE TABLE IF NOT EXISTS `mt_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_return_reason`
--

DROP TABLE IF EXISTS `mt_return_reason`;
CREATE TABLE IF NOT EXISTS `mt_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_return_reason`
--

INSERT INTO `mt_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_return_status`
--

DROP TABLE IF EXISTS `mt_return_status`;
CREATE TABLE IF NOT EXISTS `mt_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_return_status`
--

INSERT INTO `mt_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, 'Đang chờ'),
(3, 2, 'Hoàn thành'),
(2, 2, 'Đang chờ sản phẩm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_review`
--

DROP TABLE IF EXISTS `mt_review`;
CREATE TABLE IF NOT EXISTS `mt_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_seo_url`
--

DROP TABLE IF EXISTS `mt_seo_url`;
CREATE TABLE IF NOT EXISTS `mt_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`seo_url_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=844 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_seo_url`
--

INSERT INTO `mt_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(824, 0, 1, 'product_id=48', 'ipod-classic'),
(836, 0, 1, 'category_id=20', 'desktops'),
(834, 0, 1, 'category_id=26', 'pc'),
(835, 0, 1, 'category_id=27', 'mac'),
(730, 0, 1, 'manufacturer_id=8', 'apple'),
(772, 0, 1, 'information_id=4', 'about_us'),
(789, 0, 1, 'category_id=34', 'mp3-players'),
(781, 0, 1, 'category_id=36', 'test2'),
(774, 0, 1, 'category_id=18', 'laptop-notebook'),
(775, 0, 1, 'category_id=46', 'macs'),
(776, 0, 1, 'category_id=45', 'windows'),
(777, 0, 1, 'category_id=25', 'component'),
(778, 0, 1, 'category_id=29', 'mouse'),
(779, 0, 1, 'category_id=28', 'monitor'),
(780, 0, 1, 'category_id=35', 'test1'),
(782, 0, 1, 'category_id=30', 'printer'),
(783, 0, 1, 'category_id=31', 'scanner'),
(784, 0, 1, 'category_id=32', 'web-camera'),
(785, 0, 1, 'category_id=57', 'tablet'),
(786, 0, 1, 'category_id=17', 'software'),
(787, 0, 1, 'category_id=24', 'smartphone'),
(788, 0, 1, 'category_id=33', 'camera'),
(790, 0, 1, 'category_id=43', 'test11'),
(791, 0, 1, 'category_id=44', 'test12'),
(792, 0, 1, 'category_id=47', 'test15'),
(793, 0, 1, 'category_id=48', 'test16'),
(794, 0, 1, 'category_id=49', 'test17'),
(795, 0, 1, 'category_id=50', 'test18'),
(796, 0, 1, 'category_id=51', 'test19'),
(797, 0, 1, 'category_id=52', 'test20'),
(798, 0, 1, 'category_id=58', 'test25'),
(799, 0, 1, 'category_id=53', 'test21'),
(800, 0, 1, 'category_id=54', 'test22'),
(801, 0, 1, 'category_id=55', 'test23'),
(802, 0, 1, 'category_id=56', 'test24'),
(803, 0, 1, 'category_id=38', 'test4'),
(804, 0, 1, 'category_id=37', 'test5'),
(805, 0, 1, 'category_id=39', 'test6'),
(806, 0, 1, 'category_id=40', 'test7'),
(807, 0, 1, 'category_id=41', 'test8'),
(808, 0, 1, 'category_id=42', 'test9'),
(809, 0, 1, 'product_id=30', 'canon-eos-5d'),
(840, 0, 1, 'product_id=47', 'hp-lp3065'),
(811, 0, 1, 'product_id=28', 'htc-touch-hd'),
(812, 0, 1, 'product_id=43', 'macbook'),
(813, 0, 1, 'product_id=44', 'macbook-air'),
(814, 0, 1, 'product_id=45', 'macbook-pro'),
(816, 0, 1, 'product_id=31', 'nikon-d300'),
(817, 0, 1, 'product_id=29', 'palm-treo-pro'),
(818, 0, 1, 'product_id=35', 'product-8'),
(819, 0, 1, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 0, 1, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 0, 1, 'product_id=46', 'sony-vaio'),
(837, 0, 1, 'product_id=41', 'imac'),
(823, 0, 1, 'product_id=40', 'iphone'),
(825, 0, 1, 'product_id=36', 'ipod-nano'),
(826, 0, 1, 'product_id=34', 'ipod-shuffle'),
(827, 0, 1, 'product_id=32', 'ipod-touch'),
(828, 0, 1, 'manufacturer_id=9', 'canon'),
(829, 0, 1, 'manufacturer_id=5', 'htc'),
(830, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(831, 0, 1, 'manufacturer_id=6', 'palm'),
(832, 0, 1, 'manufacturer_id=10', 'sony'),
(841, 0, 1, 'information_id=6', 'delivery'),
(842, 0, 1, 'information_id=3', 'privacy'),
(843, 0, 1, 'information_id=5', 'terms');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_session`
--

DROP TABLE IF EXISTS `mt_session`;
CREATE TABLE IF NOT EXISTS `mt_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_session`
--

INSERT INTO `mt_session` (`session_id`, `data`, `expire`) VALUES
('2260dd13f0f0fd874c70dd25ef', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-08-11 06:41:06'),
('2500c4ae13b6b48d7289dcd775', '{\"api_id\":\"1\"}', '2019-07-28 18:16:31'),
('2a959751971ab9be40a28d0c19', '{\"api_id\":\"1\"}', '2019-07-30 14:54:24'),
('2c97bfe4be43a7183a9e12984c', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"d_blog_module_debug\":0}', '2019-08-18 16:45:37'),
('65380546ed6c7ece7b871c8942', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"d_blog_module_debug\":0}', '2019-08-26 14:56:33'),
('756ec0bb0a4fedca6e5543bdd9', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"d_blog_module_debug\":0,\"user_id\":\"1\",\"user_token\":\"KJ5OEjmwpHokXZp49avlLPgWRuGlod3L\"}', '2019-08-26 15:31:04'),
('84af17ece06b0a3977a664d29d', '{\"api_id\":\"1\"}', '2019-08-03 04:15:35'),
('8951f962d21a785fbfb1db07aa', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"003QD3NoGe8IyFdCsIttzQpnrNmh3NwP\",\"wishlist\":[\"40\",\"43\"],\"compare\":[],\"install\":\"OVnPUgfRZ6\",\"d_blog_module_debug\":0,\"account\":\"register\",\"customer_id\":\"1\",\"payment_address\":{\"address_id\":\"1\",\"firstname\":\"Tuan\",\"lastname\":\"Pham Minh\",\"company\":\"\",\"address_1\":\"abcde\",\"address_2\":\"\",\"postcode\":\"\",\"city\":\"ho chi minh\",\"zone_id\":\"4269\",\"zone\":\"H\\u1ed3 Ch\\u00ed Minh\",\"zone_code\":\"HCM\",\"country_id\":\"230\",\"country\":\"Vi\\u1ec7t Nam\",\"iso_code_2\":\"VN\",\"iso_code_3\":\"VNM\",\"address_format\":\"\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Tuan\",\"lastname\":\"Pham Minh\",\"company\":\"\",\"address_1\":\"abcde\",\"address_2\":\"\",\"postcode\":\"\",\"city\":\"ho chi minh\",\"zone_id\":\"4269\",\"zone\":\"H\\u1ed3 Ch\\u00ed Minh\",\"zone_code\":\"HCM\",\"country_id\":\"230\",\"country\":\"Vi\\u1ec7t Nam\",\"iso_code_2\":\"VN\",\"iso_code_3\":\"VNM\",\"address_format\":\"\",\"custom_field\":null},\"comment\":\"\",\"order_id\":1}', '2019-11-13 15:48:11'),
('99e85f43c370fe43d9a858701e', '{\"api_id\":\"1\"}', '2019-07-28 18:20:31'),
('a4f4ddc32a2ad8dcbdac090cab', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"d_blog_module_debug\":0}', '2019-08-19 15:24:37'),
('b26cc8df3617ea90b9a4b4b4aa', '{\"api_id\":\"1\"}', '2019-07-14 15:00:10'),
('c45b361f2346b2b450559c6fc4', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-07-14 15:05:55'),
('e55a4a3231afa0306bb2a0d258', '{\"api_id\":\"1\"}', '2019-08-06 14:40:26'),
('f225d83394418303c2238844be', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"R2bxgjvUpwidOUXj4cssrh9vzQkPYLaQ\"}', '2019-07-15 15:11:41'),
('f27bfb45b3f960f60d5bd88c8f', '{\"api_id\":\"1\"}', '2019-07-30 18:26:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_setting`
--

DROP TABLE IF EXISTS `mt_setting`;
CREATE TABLE IF NOT EXISTS `mt_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1218 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_setting`
--

INSERT INTO `mt_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(958, 0, 'shipping_free', 'shipping_free_status', '1', 0),
(957, 0, 'shipping_free', 'shipping_free_geo_zone_id', '0', 0),
(956, 0, 'shipping_free', 'shipping_free_total', '', 0),
(1202, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(1214, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(1212, 0, 'config', 'config_file_max_size', '300000', 0),
(1213, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(4, 0, 'voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'total_voucher_status', '1', 0),
(1207, 0, 'config', 'config_compression', '0', 0),
(1208, 0, 'config', 'config_secure', '0', 0),
(1209, 0, 'config', 'config_password', '1', 0),
(1210, 0, 'config', 'config_shared', '0', 0),
(1211, 0, 'config', 'config_encryption', 'mcrzDrtfwfZz06g75sr2cfksl4wru9N6aB8VBl9o9mp1XLBuBH2TfvENLYO8HD1JrJqjHMGBLnn0f2dHsXy4qBQEpkGGqVPdk5GmCCU9QpFe9EnxFwrKI9ygVjB04qvSCEqOnMovEs3qQdOg2dRKgpLEqmPU4x5RayXZxOjhYNOVPOFrtAkPf7TAkrCPZnMXUuMjdouSp9yHMNdWAlt3di5natK4luccnzthaxXargPs5CxfRJJO8l4WBarw0kqPGMNBREhjBPV5EZCgUBMaWcAweIttoqvKyrcNqi717l7Ew4XRldLmtHOkLE2vIM0rPfmV0rjaQEAjYQZrtyakKG9azkqUdOvnV95UsQnOXptkhsD3bJrE2MSykazo0ozlscMnXJQI6h0t7Ujm22v3oI3lMEYaCkMH7kl7wPfGGr3dLmEWjwCUD3UNgEhmc9pQBn5KYcoe6Tja4dyC8D5FpZyTcn6c27sH6S3Eb5LviMOlEiRZLrcxDiefBLQDGeXc5aBo1sXcfe4jQxiyRZU3ANUbOpR1XxhzljXczxiniJQ8olYkMHecOrZQVPjkikRys13jxp3NGHmtbxxJCTGq6XVKCuQmzMZaG0DAbSf1tgp6Sx8kqWIosQSz8aHcTK1GyO89aFUbIHOhUpfzDO2cXqvM4HHxQb6MGpLAF8w4m3PtGJwXO78kPEIKVI3h3p4C7kZsj1SW7EzWffPae7dKKp9mxGWhG9l8uqBXzMJR4F4WOunvxN8JxW22IuZzTccbojcBxPgjsHmTsomYqm9NpfK36mMPtPZK9IszxDii8PlffpaxfHQog1ldmQlYqr3FZJebf7J4v2BxjD6eLTMFBBkdLDiux3JRLYNMAws546NqD25LUnni9RctxquwsHQ0KP4H1AMtqYntq3VM5cci8O6JTRv3EMj5siSr346Ay5hy3FUWsM7l6cfYNZFUBwymOzj71BovymLqJnSu6V2VkeuO2LVBHFSsejElJsxOeLpj7WUlCdCbDnbmgctHZYDA', 0),
(1204, 0, 'config', 'config_maintenance', '0', 0),
(1205, 0, 'config', 'config_seo_url', '1', 0),
(1206, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(1203, 0, 'config', 'config_mail_alert_email', '', 0),
(1201, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1200, 0, 'config', 'config_mail_smtp_port', '25', 0),
(1198, 0, 'config', 'config_mail_smtp_username', '', 0),
(1199, 0, 'config', 'config_mail_smtp_password', '', 0),
(1197, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(1194, 0, 'config', 'config_icon', 'catalog/logo.png', 0),
(1196, 0, 'config', 'config_mail_parameter', '', 0),
(1195, 0, 'config', 'config_mail_engine', 'mail', 0),
(1192, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(1193, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(1191, 0, 'config', 'config_captcha', '', 0),
(1190, 0, 'config', 'config_return_status_id', '2', 0),
(1188, 0, 'config', 'config_affiliate_id', '4', 0),
(1189, 0, 'config', 'config_return_id', '0', 0),
(1187, 0, 'config', 'config_affiliate_commission', '5', 0),
(1185, 0, 'config', 'config_affiliate_approval', '0', 0),
(1186, 0, 'config', 'config_affiliate_auto', '0', 0),
(1184, 0, 'config', 'config_affiliate_group_id', '1', 0),
(1182, 0, 'config', 'config_stock_warning', '0', 0),
(1183, 0, 'config', 'config_stock_checkout', '0', 0),
(1180, 0, 'config', 'config_api_id', '1', 0),
(1181, 0, 'config', 'config_stock_display', '0', 0),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(619, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(620, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(621, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '1', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(123, 0, 'module_category', 'module_category_status', '1', 0),
(124, 0, 'module_account', 'module_account_status', '1', 0),
(617, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(618, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(616, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(615, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(614, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(613, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(612, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(611, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(610, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(609, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(608, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(607, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(606, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(605, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(599, 0, 'theme_default', 'theme_default_status', '1', 0),
(600, 0, 'theme_default', 'theme_default_product_limit', '20', 0),
(601, 0, 'theme_default', 'theme_default_product_description_length', '50', 0),
(602, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(603, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(604, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(401, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(402, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(399, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(501, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(408, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(411, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(398, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(407, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(410, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(500, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(403, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(207, 0, 'developer', 'developer_sass', '0', 0),
(1179, 0, 'config', 'config_fraud_status_id', '7', 0),
(1178, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(1177, 0, 'config', 'config_processing_status', '[\"5\",\"3\",\"1\",\"2\",\"12\"]', 1),
(1176, 0, 'config', 'config_order_status_id', '1', 0),
(1175, 0, 'config', 'config_checkout_id', '5', 0),
(1174, 0, 'config', 'config_checkout_guest', '1', 0),
(1173, 0, 'config', 'config_cart_weight', '0', 0),
(1172, 0, 'config', 'config_invoice_prefix', 'INV-2019-00', 0),
(1171, 0, 'config', 'config_account_id', '3', 0),
(1170, 0, 'config', 'config_login_attempts', '5', 0),
(1169, 0, 'config', 'config_customer_price', '0', 0),
(206, 0, 'developer', 'developer_theme', '0', 0),
(1168, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(1167, 0, 'config', 'config_customer_group_id', '1', 0),
(412, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(499, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(1166, 0, 'config', 'config_customer_search', '0', 0),
(1165, 0, 'config', 'config_customer_activity', '0', 0),
(1164, 0, 'config', 'config_customer_online', '0', 0),
(1163, 0, 'config', 'config_tax_customer', '', 0),
(1162, 0, 'config', 'config_tax_default', '', 0),
(1161, 0, 'config', 'config_tax', '0', 0),
(1159, 0, 'config', 'config_voucher_min', '1', 0),
(1160, 0, 'config', 'config_voucher_max', '1000', 0),
(1158, 0, 'config', 'config_review_guest', '1', 0),
(409, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(400, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(598, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(695, 0, 'module_d_blog_module', 'module_d_blog_module_setting', '{\"category\":{\"main_category_id\":\"1\",\"layout_type\":\"grid\",\"layout\":[\"2\"],\"post_page_limit\":\"7\",\"image_display\":\"1\",\"image_width\":\"1200\",\"image_height\":\"750\",\"sub_category_display\":\"1\",\"sub_category_col\":\"6\",\"sub_category_image\":\"1\",\"sub_category_post_count\":\"1\",\"sub_category_image_width\":\"120\",\"sub_category_image_height\":\"75\",\"limited_post_display\":\"1\",\"main_post_display\":\"1\"},\"post\":{\"image_display\":\"1\",\"image_width\":\"1200\",\"image_height\":\"750\",\"popup_display\":\"1\",\"popup_width\":\"1400\",\"popup_height\":\"875\",\"author_display\":\"1\",\"date_display\":\"1\",\"date_format\":{\"2\":\"%d\\/%m\\/%Y\"},\"review_display\":\"1\",\"rating_display\":\"1\",\"tag_display\":\"0\",\"category_label_display\":\"1\",\"short_description_length\":\"150\",\"style_short_description_display\":\"0\",\"nav_display\":\"1\",\"nav_same_category\":\"0\"},\"post_thumb\":{\"image_width\":\"1200\",\"image_height\":\"750\",\"title_length\":\"100\",\"short_description_length\":\"300\",\"description_length\":\"300\",\"category_label_display\":\"1\",\"author_display\":\"1\",\"date_display\":\"1\",\"date_format\":{\"2\":\"%d\\/%m\\/%Y\"},\"rating_display\":\"1\",\"description_display\":\"1\",\"tag_display\":\"1\",\"views_display\":\"1\",\"review_display\":\"1\",\"read_more_display\":\"1\",\"animate\":\"fadeIn\"},\"review\":{\"guest\":\"1\",\"social_login\":\"1\",\"page_limit\":\"5\",\"rating_display\":\"1\",\"customer_display\":\"1\",\"moderate\":\"0\",\"image_user_display\":\"1\",\"image_limit\":\"5\",\"image_upload_width\":\"500\",\"image_upload_height\":\"500\"},\"review_thumb\":{\"image_width\":\"70\",\"image_height\":\"70\",\"no_image\":\"catalog\\/d_blog_module\\/no_profile_image.png\",\"date_display\":\"1\",\"image_display\":\"1\",\"rating_display\":\"1\",\"image_user_display\":\"1\",\"image_user_width\":\"70\",\"image_user_height\":\"70\"},\"author\":{\"layout_type\":\"grid\",\"layout\":[\"2\"],\"post_page_limit\":\"7\",\"image_width\":\"400\",\"image_height\":\"400\",\"category_display\":\"1\",\"category_col\":\"6\",\"category_image\":\"1\",\"category_post_count\":\"1\",\"category_image_width\":\"120\",\"category_image_height\":\"75\"},\"theme\":\"default\",\"admin_style\":\"light\",\"design\":{\"custom_style\":\"\",\"ssl_url\":\"\"}}', 1),
(1157, 0, 'config', 'config_review_status', '1', 0),
(694, 0, 'module_d_blog_module', 'module_d_blog_module_status', '1', 0),
(697, 0, 'd_blog_module', 'd_blog_module_setting', '{\"category\":{\"main_category_id\":\"1\",\"layout_type\":\"grid\",\"layout\":[\"2\"],\"post_page_limit\":\"7\",\"image_display\":\"1\",\"image_width\":\"1200\",\"image_height\":\"750\",\"sub_category_display\":\"1\",\"sub_category_col\":\"6\",\"sub_category_image\":\"1\",\"sub_category_post_count\":\"1\",\"sub_category_image_width\":\"120\",\"sub_category_image_height\":\"75\",\"limited_post_display\":\"1\",\"main_post_display\":\"1\"},\"post\":{\"image_display\":\"1\",\"image_width\":\"1200\",\"image_height\":\"750\",\"popup_display\":\"1\",\"popup_width\":\"1400\",\"popup_height\":\"875\",\"author_display\":\"1\",\"date_display\":\"1\",\"date_format\":{\"2\":\"%d\\/%m\\/%Y\"},\"review_display\":\"1\",\"rating_display\":\"1\",\"tag_display\":\"0\",\"category_label_display\":\"1\",\"short_description_length\":\"150\",\"style_short_description_display\":\"0\",\"nav_display\":\"1\",\"nav_same_category\":\"0\"},\"post_thumb\":{\"image_width\":\"1200\",\"image_height\":\"750\",\"title_length\":\"100\",\"short_description_length\":\"300\",\"description_length\":\"300\",\"category_label_display\":\"1\",\"author_display\":\"1\",\"date_display\":\"1\",\"date_format\":{\"2\":\"%d\\/%m\\/%Y\"},\"rating_display\":\"1\",\"description_display\":\"1\",\"tag_display\":\"1\",\"views_display\":\"1\",\"review_display\":\"1\",\"read_more_display\":\"1\",\"animate\":\"fadeIn\"},\"review\":{\"guest\":\"1\",\"social_login\":\"1\",\"page_limit\":\"5\",\"rating_display\":\"1\",\"customer_display\":\"1\",\"moderate\":\"0\",\"image_user_display\":\"1\",\"image_limit\":\"5\",\"image_upload_width\":\"500\",\"image_upload_height\":\"500\"},\"review_thumb\":{\"image_width\":\"70\",\"image_height\":\"70\",\"no_image\":\"catalog\\/d_blog_module\\/no_profile_image.png\",\"date_display\":\"1\",\"image_display\":\"1\",\"rating_display\":\"1\",\"image_user_display\":\"1\",\"image_user_width\":\"70\",\"image_user_height\":\"70\"},\"author\":{\"layout_type\":\"grid\",\"layout\":[\"2\"],\"post_page_limit\":\"7\",\"image_width\":\"400\",\"image_height\":\"400\",\"category_display\":\"1\",\"category_col\":\"6\",\"category_image\":\"1\",\"category_post_count\":\"1\",\"category_image_width\":\"120\",\"category_image_height\":\"75\"},\"theme\":\"default\",\"admin_style\":\"light\",\"design\":{\"custom_style\":\"\",\"ssl_url\":\"\"}}', 1),
(1156, 0, 'config', 'config_limit_admin', '20', 0),
(696, 0, 'd_blog_module', 'd_blog_module_status', '1', 0),
(959, 0, 'shipping_free', 'shipping_free_sort_order', '', 0),
(1155, 0, 'config', 'config_product_count', '1', 0),
(1142, 0, 'config', 'config_telephone', '123456789', 0),
(1154, 0, 'config', 'config_weight_class_id', '1', 0),
(1153, 0, 'config', 'config_length_class_id', '1', 0),
(1152, 0, 'config', 'config_currency_auto', '0', 0),
(1151, 0, 'config', 'config_currency', 'VND', 0),
(1150, 0, 'config', 'config_admin_language', 'vi-vn', 0),
(1149, 0, 'config', 'config_language', 'vi-vn', 0),
(1148, 0, 'config', 'config_zone_id', '', 0),
(1147, 0, 'config', 'config_country_id', '230', 0),
(1146, 0, 'config', 'config_comment', '', 0),
(1145, 0, 'config', 'config_open', '', 0),
(1144, 0, 'config', 'config_image', 'catalog/logo.png', 0),
(1143, 0, 'config', 'config_fax', '', 0),
(1141, 0, 'config', 'config_email', 'admin@gmail.com', 0),
(1134, 0, 'config', 'config_meta_keyword', '', 0),
(1135, 0, 'config', 'config_theme', 'default', 0),
(1136, 0, 'config', 'config_layout_id', '4', 0),
(1137, 0, 'config', 'config_name', 'Your Store', 0),
(1138, 0, 'config', 'config_owner', 'Your Name', 0),
(1139, 0, 'config', 'config_address', 'Address 1', 0),
(1140, 0, 'config', 'config_geocode', '', 0),
(1133, 0, 'config', 'config_meta_description', 'My Store', 0),
(1132, 0, 'config', 'config_meta_title', 'Your Store', 0),
(1215, 0, 'config', 'config_error_display', '1', 0),
(1216, 0, 'config', 'config_error_log', '1', 0),
(1217, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_shipping_courier`
--

DROP TABLE IF EXISTS `mt_shipping_courier`;
CREATE TABLE IF NOT EXISTS `mt_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`shipping_courier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_shipping_courier`
--

INSERT INTO `mt_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_statistics`
--

DROP TABLE IF EXISTS `mt_statistics`;
CREATE TABLE IF NOT EXISTS `mt_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_statistics`
--

INSERT INTO `mt_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '101.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_stock_status`
--

DROP TABLE IF EXISTS `mt_stock_status`;
CREATE TABLE IF NOT EXISTS `mt_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_stock_status`
--

INSERT INTO `mt_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(8, 1, 'Pre-Order'),
(6, 1, '2-3 Days'),
(7, 2, 'Còn hàng'),
(8, 2, 'Pre-Order'),
(5, 2, 'Hết hàng'),
(6, 2, '2-3 Days');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_store`
--

DROP TABLE IF EXISTS `mt_store`;
CREATE TABLE IF NOT EXISTS `mt_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_tax_class`
--

DROP TABLE IF EXISTS `mt_tax_class`;
CREATE TABLE IF NOT EXISTS `mt_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_tax_class`
--

INSERT INTO `mt_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_tax_rate`
--

DROP TABLE IF EXISTS `mt_tax_rate`;
CREATE TABLE IF NOT EXISTS `mt_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_tax_rate`
--

INSERT INTO `mt_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `mt_tax_rate_to_customer_group`;
CREATE TABLE IF NOT EXISTS `mt_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_tax_rate_to_customer_group`
--

INSERT INTO `mt_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_tax_rule`
--

DROP TABLE IF EXISTS `mt_tax_rule`;
CREATE TABLE IF NOT EXISTS `mt_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_tax_rule`
--

INSERT INTO `mt_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_theme`
--

DROP TABLE IF EXISTS `mt_theme`;
CREATE TABLE IF NOT EXISTS `mt_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_translation`
--

DROP TABLE IF EXISTS `mt_translation`;
CREATE TABLE IF NOT EXISTS `mt_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_upload`
--

DROP TABLE IF EXISTS `mt_upload`;
CREATE TABLE IF NOT EXISTS `mt_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_user`
--

DROP TABLE IF EXISTS `mt_user`;
CREATE TABLE IF NOT EXISTS `mt_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_user`
--

INSERT INTO `mt_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'b122836d840e781b702c3c6f0438742f6fc12644', 'zhOTpxv7d', 'John', 'Doe', 'admin@gmail.com', '', '', '::1', 1, '2019-07-14 21:12:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_user_group`
--

DROP TABLE IF EXISTS `mt_user_group`;
CREATE TABLE IF NOT EXISTS `mt_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_user_group`
--

INSERT INTO `mt_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/d_ajax_search\\/blog\",\"extension\\/d_blog_module\\/author\",\"extension\\/d_blog_module\\/author_group\",\"extension\\/d_blog_module\\/category\",\"extension\\/d_blog_module\\/post\",\"extension\\/d_blog_module\\/review\",\"extension\\/d_visual_designer_module\\/blog_post\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\\/d_blog_module\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/d_blog_module\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\\/category\",\"extension\\/d_blog_module\\/post\",\"extension\\/d_blog_module\\/review\",\"extension\\/d_blog_module\\/author\",\"extension\\/d_blog_module\\/author_group\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/shipping\\/free\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/d_ajax_search\\/blog\",\"extension\\/d_blog_module\\/author\",\"extension\\/d_blog_module\\/author_group\",\"extension\\/d_blog_module\\/category\",\"extension\\/d_blog_module\\/post\",\"extension\\/d_blog_module\\/review\",\"extension\\/d_visual_designer_module\\/blog_post\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\\/d_blog_module\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/d_blog_module\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\\/category\",\"extension\\/d_blog_module\\/post\",\"extension\\/d_blog_module\\/review\",\"extension\\/d_blog_module\\/author\",\"extension\\/d_blog_module\\/author_group\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/d_blog_module\",\"extension\\/shipping\\/free\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_voucher`
--

DROP TABLE IF EXISTS `mt_voucher`;
CREATE TABLE IF NOT EXISTS `mt_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_voucher_history`
--

DROP TABLE IF EXISTS `mt_voucher_history`;
CREATE TABLE IF NOT EXISTS `mt_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_voucher_theme`
--

DROP TABLE IF EXISTS `mt_voucher_theme`;
CREATE TABLE IF NOT EXISTS `mt_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_voucher_theme`
--

INSERT INTO `mt_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_voucher_theme_description`
--

DROP TABLE IF EXISTS `mt_voucher_theme_description`;
CREATE TABLE IF NOT EXISTS `mt_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_voucher_theme_description`
--

INSERT INTO `mt_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_weight_class`
--

DROP TABLE IF EXISTS `mt_weight_class`;
CREATE TABLE IF NOT EXISTS `mt_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_weight_class`
--

INSERT INTO `mt_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_weight_class_description`
--

DROP TABLE IF EXISTS `mt_weight_class_description`;
CREATE TABLE IF NOT EXISTS `mt_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_weight_class_description`
--

INSERT INTO `mt_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_zone`
--

DROP TABLE IF EXISTS `mt_zone`;
CREATE TABLE IF NOT EXISTS `mt_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4302 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_zone`
--

INSERT INTO `mt_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(4258, 230, 'Điện Biên', 'DB', 1),
(4257, 230, 'Đồng Tháp', 'DT', 1),
(4256, 230, 'Đồng Nai', 'DN', 1),
(4255, 230, 'Đắk Nông', 'DNO', 1),
(4254, 230, 'Đắk Lắk', 'DL', 1),
(4253, 230, 'Đà Nẵng', 'DNA', 1),
(4252, 230, 'Cần Thơ', 'CT', 1),
(4251, 230, 'Cao Bằng', 'CB', 1),
(4250, 230, 'Cà Mau', 'CM', 1),
(4249, 230, 'Bình Thuận', 'BT', 1),
(4248, 230, 'Bình Phước', 'BP', 1),
(4247, 230, 'Bình Định', 'BĐ', 1),
(4246, 230, 'Bình Dương', 'BD', 1),
(4245, 230, 'Bến Tre', 'BT', 1),
(4244, 230, 'Bắc Ninh', 'BN', 1),
(4243, 230, 'Bắc Giang', 'BG', 1),
(4242, 230, 'Bắc Kạn', 'BK', 1),
(4241, 230, 'Bạc Liêu', 'BL', 1),
(4240, 230, 'Bà Rịa - Vũng Tàu', 'BRVT', 1),
(4239, 230, 'An Giang', 'AG', 1),
(4301, 230, 'Yên Bái', 'YB', 1),
(4300, 230, 'Vĩnh Phúc', 'VP', 1),
(4299, 230, 'Vĩnh Long', 'VL', 1),
(4298, 230, 'Tuyên Quang', 'TQ', 1),
(4297, 230, 'Trà Vinh', 'TV', 1),
(4296, 230, 'Tiền Giang', 'TG', 1),
(4295, 230, 'Thừa Thiên - Huế', 'TTH', 1),
(4294, 230, 'Thanh Hóa', 'TH', 1),
(4293, 230, 'Thái Nguyên', 'TN', 1),
(4292, 230, 'Thái Bình', 'TB', 1),
(4291, 230, 'Tây Ninh', 'TN', 1),
(4290, 230, 'Sơn La', 'SL', 1),
(4289, 230, 'Sóc Trăng', 'ST', 1),
(4288, 230, 'Quảng Trị', 'QT', 1),
(4287, 230, 'Quảng Ninh', 'QN', 1),
(4286, 230, 'Quảng Ngãi', 'QNG', 1),
(4285, 230, 'Quảng Nam', 'QNA', 1),
(4284, 230, 'Quảng Bình', 'QB', 1),
(4283, 230, 'Phú Yên', 'PY', 1),
(4282, 230, 'Phú Thọ', 'PT', 1),
(4281, 230, 'Ninh Thuận', 'NT', 1),
(4280, 230, 'Ninh Bình', 'NB', 1),
(4279, 230, 'Nghệ An', 'NA', 1),
(4278, 230, 'Nam Định', 'ND', 1),
(4277, 230, 'Long An', 'LA', 1),
(4276, 230, 'Lâm Đồng', 'LD', 1),
(4275, 230, 'Lạng Sơn', 'LS', 1),
(4274, 230, 'Lào Cai', 'LC', 1),
(4273, 230, 'Lai Châu', 'LCH', 1),
(4272, 230, 'Kon Tum', 'KT', 1),
(4271, 230, 'Kiên Giang', 'KG', 1),
(4270, 230, 'Khánh Hòa', 'KH', 1),
(4269, 230, 'Hồ Chí Minh', 'HCM', 1),
(4268, 230, 'Hưng Yên', 'HY', 1),
(4267, 230, 'Hậu Giang', 'HG', 1),
(4266, 230, 'Hòa Bình', 'HB', 1),
(4265, 230, 'Hải Phòng', 'HP', 1),
(4264, 230, 'Hải Dương', 'HD', 1),
(4263, 230, 'Hà Tĩnh', 'HT', 1),
(4262, 230, 'Hà Nội', 'NHO', 1),
(4261, 230, 'Hà Nam', 'HN', 1),
(4260, 230, 'Hà Giang', 'HG', 1),
(4259, 230, 'Gia Lai', 'GL', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mt_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `mt_zone_to_geo_zone`;
CREATE TABLE IF NOT EXISTS `mt_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mt_zone_to_geo_zone`
--

INSERT INTO `mt_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

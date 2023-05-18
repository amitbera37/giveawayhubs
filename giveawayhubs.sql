-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2023 at 07:12 AM
-- Server version: 8.0.33-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giveawayhubs`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashback_categories`
--

CREATE TABLE `cashback_categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` text,
  `status` enum('0','1') DEFAULT '1',
  `dated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_cat_id` int DEFAULT NULL,
  `pid` text,
  `threadid` varchar(255) DEFAULT NULL,
  `banner_title` varchar(400) DEFAULT NULL,
  `banner_text` text,
  `banner_image` text,
  `seo_title` text,
  `seo_description` text,
  `keyword` longtext,
  `seo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashback_categories`
--

INSERT INTO `cashback_categories` (`id`, `name`, `description`, `image`, `status`, `dated`, `parent_cat_id`, `pid`, `threadid`, `banner_title`, `banner_text`, `banner_image`, `seo_title`, `seo_description`, `keyword`, `seo_url`) VALUES
(1, 'Accessories', '', '1.webp', '1', '2022-07-20 12:28:49', 0, '', 'accessories', 'Up your style with the latest accessories from various stores at amazing offers.', 'Accessories', 'banner1.webp', 'Fashion Accessories Discount Coupons - giveawayhubs.com', 'giveawayhubs.com brings you the exclusive list of discount coupons for fashion accessories from all the leading brands. No need to wait any longer.', NULL, 'accessories'),
(7, 'Auto', '', '7.webp', '1', '2022-07-20 12:28:49', 0, '', 'auto', 'Get tools, parts and accessories for your motors, book rentals at the best prices. ', 'Auto', 'banner7.webp', 'Automobile and Accessories Discount Coupons - giveawayhubs.com', 'giveawayhubs.com brings you the updated list of Automobile and accessories discount coupons. Buying a car or accessories is easier with coupon codes.', NULL, 'auto'),
(14, 'Appliances', '', '14.webp', '1', '2022-07-20 12:28:49', 0, '', 'appliances', 'Get the latest appliances for home and kitchen at the best prices.', 'Appliances', 'banner14.webp', 'Home and Kitchen Appliances Coupons  - giveawayhubs.com', 'giveawayhubs.com brings you the updated list of home and kitchen appliances coupons with promo codes. We cover all the renowned brands.', NULL, 'appliances'),
(17, 'Art / Music / Photography', '', '17.webp', '0', '2022-07-20 12:28:49', 0, '', 'art/music/photography', NULL, 'Art/Music/Photography', 'banner17.webp', 'Art / Music / Photography', NULL, NULL, 'art-music-photography'),
(22, 'Shoes', '', '22.webp', '0', '2022-07-20 12:28:49', 0, '', 'shoes', NULL, 'Shoes', 'banner22.webp', 'Shoes', NULL, NULL, 'shoes'),
(26, 'Books/Media', '', '26.webp', '1', '2022-07-20 12:28:49', 0, '', 'books/media', NULL, 'Books/Media', 'banner26.webp', 'Books/Media', NULL, NULL, 'books-media'),
(31, 'Education', '', '31.webp', '0', '2022-07-20 12:28:49', 0, '', 'education', NULL, 'Education', 'banner31.webp', 'Education', NULL, NULL, 'education'),
(35, 'Baby Kids & Toys', '', '35.webp', '0', '2022-07-20 12:28:49', 0, '', 'baby-kids&toys', NULL, 'Baby, Kids & Toys', 'banner35.webp', 'Baby Kids & Toys', NULL, NULL, 'baby-kids-toys'),
(41, 'Beauty', '', '41.webp', '0', '2022-07-20 12:28:49', 0, '', 'beauty', NULL, 'Beauty', 'banner41.webp', NULL, NULL, NULL, 'beauty'),
(54, 'Clothing', '', '54.webp', '1', '2022-07-20 12:28:49', 0, '', 'clothing', 'Shop the trendiest clothes for men, women, children, active wear and more at absolutely reasonable rates.', 'Clothing', 'banner54.webp', 'Discount Coupon Codes for Clothing and Accessories - Hurry Up', 'giveawayhubs.com brings you the updated list of discount coupon codes for all the leading clothing brands. Get the clothes from your favorite brand now.', NULL, 'clothing'),
(62, 'Computer', '', '62.webp', '1', '2022-07-20 12:28:49', 0, '', 'computers', 'Get the latest computer, laptop models, and other accessories with the best deals.', 'Computers', 'banner62.webp', 'Computer and Accessories Discount Coupons and Deals', 'giveawayhubs.com brings you an exclusive list of discount offers and coupon codes for computers and accessories from all the global brands. ', NULL, 'computers'),
(68, 'Consumer Electronics', '', '68.webp', '1', '2022-07-20 12:28:49', 0, '', 'consumerelectronics', 'Get all your everyday electronic appliances here at most affordable rates.', 'Consumer Electronics', 'banner68.webp', 'Consumer Electronics Deals and Coupons - giveawayhubs.com', 'giveawayhubs.com brings you all the exciting consumer electronics discounts and coupon codes for all the leading brands. We got all these exclusively for you.', NULL, 'consumer-electronics'),
(73, 'Department Stores/ Malls', '', '73.webp', '1', '2022-07-20 12:28:49', 0, '', 'departmentstores/malls', 'Your one-stop destination for affordable electronics, clothing, accessories, toys, and virtual malls.', 'Department Stores/ Malls', 'banner73.webp', 'Department Stores Coupons & Promo Codes - giveawayhubs.com', 'giveawayhubs.com brings you the most recommended department stores coupons and discount offers. We got all these deals exclusively for you.', NULL, 'department-stores-malls'),
(80, 'Entertainment', '', '80.webp', '0', '2022-07-20 12:28:49', 0, '', 'entertainment', NULL, 'Entertainment', 'banner80.webp', NULL, NULL, NULL, 'entertainment'),
(87, 'Food & Drinks', '', '87.webp', '0', '2022-07-20 12:28:49', 0, '', 'food&drinks', 'Get the best of food items, drinks, groceries and more and save big.', 'Food & Drinks', 'banner87.webp', 'Food and Drinks Discount Coupons and Deals - giveawayhubs.com', 'giveawayhubs.com brings you the list of discount coupons for all the renowned foods and drinks stores. Grab the coupon now before ordering your next meal. ', NULL, 'food-drinks'),
(92, 'Restaurants & Hotels', '', '92.webp', '0', '2022-07-20 12:28:49', 0, '', 'restaurants&hotels', NULL, 'Restaurants & Hotels', 'banner92.webp', NULL, NULL, NULL, 'restaurants-hotels'),
(93, 'Games & Toys', '', '93.webp', '0', '2022-07-20 12:28:49', 0, '', 'games&toys', NULL, 'Games & Toys', 'banner93.webp', NULL, NULL, NULL, 'games-toys'),
(98, 'Gifts & Flowers', '', '98.webp', '1', '2022-07-20 12:28:49', 0, '', 'gifts&flowers', 'Make someone’s day special with thoughtful gifts.', 'Gifts & Flowers', 'banner98.webp', 'Discount Coupons with Promo Codes', 'giveawayhubs.com brings you the list of discount coupons for all the renowned foods and drinks stores. Grab the coupon now before ordering your next meal. ', NULL, 'gifts-flowers'),
(103, 'Health & Beauty', '', '103.webp', '1', '2022-07-20 12:28:49', 0, '', 'health&wellness', NULL, 'Health & Wellness', 'banner103.webp', 'Health & Wellness', NULL, NULL, 'health-wellness'),
(117, 'Pets', '', '117.webp', '0', '2022-07-20 12:28:49', 0, '', 'pets', NULL, 'Pets', 'banner117.webp', NULL, NULL, NULL, 'pets'),
(120, 'Home & Garden', '', '120.webp', '1', '2022-07-20 12:28:49', 0, '', 'garden', 'Get the best products for your dream garden at affordable rates.', 'Garden', 'banner120.webp', 'Get the best products for your dream garden at affordable rates.', 'giveawayhubs.com brings you the list of exclusive mattress deals and coupons from all the leading brands. We bring all the exclusive deals for you.', NULL, 'garden'),
(125, 'Sports & Fitness', '', '125.webp', '0', '2022-07-20 12:28:49', 0, '', 'sports&fitness', NULL, 'Sports & Fitness', 'banner125.webp', NULL, NULL, NULL, 'sports-fitness'),
(133, 'Travel', '', '133.webp', '0', '2022-07-20 12:28:49', 0, '', 'travel', NULL, 'Travel', 'banner133.webp', NULL, NULL, NULL, 'travel'),
(140, 'Outdoors', '', '140.webp', '0', '2022-07-20 12:28:49', 0, '', 'outdoors', NULL, 'Outdoors', 'banner140.webp', NULL, NULL, NULL, 'outdoors');

-- --------------------------------------------------------

--
-- Table structure for table `cashback_categorytypes`
--

CREATE TABLE `cashback_categorytypes` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `dated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashback_categorytypes`
--

INSERT INTO `cashback_categorytypes` (`id`, `name`, `dated`, `description`, `status`) VALUES
(1, 'SHOP TODAY\'S TRENDING DEALS AND SAVE BIG - Home Page', '2023-04-26 04:59:20', 'Home Page Display', '1'),
(2, 'HOT DEALS - Home Page', '2023-04-26 04:59:49', 'Home Page Display', '1'),
(4, 'SOME OF OUR FAVORITE DEALS OF THE SEASON - Home Page', '2023-04-26 05:00:38', 'Home Page Display', '1'),
(7, 'FEATURED STORES', '2023-04-05 05:05:40', 'FEATURED STORES - under coupons', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cashback_store_type_map`
--

CREATE TABLE `cashback_store_type_map` (
  `id` int NOT NULL,
  `affiliated_store_id` bigint NOT NULL,
  `type_id` int NOT NULL,
  `dated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cashback_store_type_map`
--

INSERT INTO `cashback_store_type_map` (`id`, `affiliated_store_id`, `type_id`, `dated`, `catid`) VALUES
(2, 7452, 7, '2023-04-26 02:51:37', 14),
(3, 729207, 7, '2023-04-26 02:51:37', 98),
(4, 1124214, 7, '2023-04-26 02:51:37', 98),
(15, 17653, 2, '2023-04-26 04:51:16', NULL),
(16, 5488109, 2, '2023-04-26 04:55:17', NULL),
(17, 5652880, 2, '2023-04-26 04:55:17', NULL),
(18, 5305691, 2, '2023-04-26 04:55:17', NULL),
(19, 7452, 2, '2023-04-26 04:55:17', NULL),
(20, 5262281, 2, '2023-04-26 04:55:17', NULL),
(25, 5618, 2, '2023-04-26 04:55:17', NULL),
(26, 9989, 2, '2023-04-26 04:55:17', NULL),
(27, 16836, 2, '2023-04-26 04:55:17', NULL),
(28, 12845, 2, '2023-04-26 04:55:17', NULL),
(29, 16836, 7, '2023-04-27 14:51:43', NULL),
(30, 1124214, 7, '2023-04-27 14:51:59', NULL),
(31, 3350021, 7, '2023-04-27 14:52:17', NULL),
(32, 16080, 7, '2023-04-27 14:52:40', NULL),
(33, 17908, 7, '2023-04-27 14:54:24', NULL),
(34, 11653, 7, '2023-04-27 14:54:38', NULL),
(2805, 9901, 4, '2023-05-10 06:14:00', NULL),
(2806, 4482, 4, '2023-05-10 06:14:00', NULL),
(2807, 5618, 4, '2023-05-10 06:14:00', NULL),
(2808, 7452, 4, '2023-05-10 06:14:00', NULL),
(2809, 9802, 4, '2023-05-10 06:14:00', NULL),
(2810, 9989, 4, '2023-05-10 06:14:00', NULL),
(2811, 11653, 4, '2023-05-10 06:14:00', NULL),
(2812, 12845, 4, '2023-05-10 06:14:00', NULL),
(2813, 13512, 4, '2023-05-10 06:14:00', NULL),
(2814, 14403, 4, '2023-05-10 06:14:00', NULL),
(2815, 15355, 4, '2023-05-10 06:14:00', NULL),
(2816, 16836, 4, '2023-05-10 06:14:00', NULL),
(2817, 16960, 4, '2023-05-10 06:14:00', NULL),
(2818, 17663, 4, '2023-05-10 06:14:00', NULL),
(2819, 17908, 4, '2023-05-10 06:14:00', NULL),
(2820, 17986, 4, '2023-05-10 06:14:00', NULL),
(2821, 129899, 4, '2023-05-10 06:14:00', NULL),
(2822, 3350021, 4, '2023-05-10 06:14:00', NULL),
(2823, 4297609, 4, '2023-05-10 06:14:00', NULL),
(2824, 5262281, 4, '2023-05-10 06:14:00', NULL),
(2825, 5903, 1, '2023-05-10 06:16:00', NULL),
(2826, 5262281, 1, '2023-05-10 06:16:00', NULL),
(2827, 11653, 1, '2023-05-10 06:16:00', NULL),
(2828, 17663, 1, '2023-05-10 06:16:00', NULL),
(2829, 24631, 1, '2023-05-10 06:16:00', NULL),
(2830, 7452, 1, '2023-05-10 06:16:00', NULL),
(2831, 17986, 1, '2023-05-10 06:16:00', NULL),
(2832, 12845, 1, '2023-05-10 06:16:00', NULL),
(2833, 5618, 1, '2023-05-10 06:16:00', NULL),
(2834, 16960, 1, '2023-05-10 06:16:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_details`
--

CREATE TABLE `coupon_details` (
  `id` int NOT NULL,
  `affiliated_coupon_id` bigint NOT NULL,
  `affiliated_store_id` bigint NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `network` varchar(50) NOT NULL,
  `coupon_code` varchar(100) NOT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL,
  `clickUrl` varchar(255) DEFAULT NULL,
  `description` longtext,
  `coupon_code_status` varchar(50) DEFAULT NULL,
  `openUrl` text,
  `lavel` varchar(255) DEFAULT NULL,
  `coupon_img_link` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `site_status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coupon_details`
--

INSERT INTO `coupon_details` (`id`, `affiliated_coupon_id`, `affiliated_store_id`, `category`, `network`, `coupon_code`, `start_date`, `end_date`, `commission`, `clickUrl`, `description`, `coupon_code_status`, `openUrl`, `lavel`, `coupon_img_link`, `rating`, `site_status`) VALUES
(2, 132777, 16873, '', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 00:00:00', 'Vacation Tops - Only $10.99 for you', 'https://popilush.pxf.io/c/3324490/1417895/16873', 'Vacation Tops - Only $10.999 for you', NULL, NULL, NULL, NULL, NULL, '1'),
(5, 142295, 17203, '', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 00:00:00', 'Buy More Save More', 'https://elpumps.sjv.io/c/3324490/1449520/17203', 'JFN Buy More Save More-Limited', NULL, NULL, NULL, NULL, NULL, '1'),
(8, 141783, 15929, 'Hoodies&shirts&Bottoms&shoes', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 00:00:00', '30%-50% Savings on Sale-limited', 'https://justfashionnow.sjv.io/c/3324490/1303388/15929?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/15929/Deals/141783', 'Flash sales and Big Discount', NULL, NULL, NULL, NULL, NULL, '1'),
(11, 151689, 9989, '', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 00:00:00', 'Save up to 45% off Holiday Gift Guide', 'https://eufy-uk.sjv.io/c/3324490/611694/9989?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/9989/Deals/151689', 'Save up to 45% off Holiday Gift Guide', NULL, NULL, NULL, NULL, NULL, '1'),
(14, 37635, 5618, '', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 00:00:00', 'Get 50% off Shared Hosting at Namecheap', 'https://namecheap.pxf.io/c/3324490/386170/5618?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/5618/Deals/37635', 'Get 50% off Shared Hosting at Namecheap', NULL, NULL, NULL, NULL, NULL, '1'),
(24, 15388088, 4297609, 'Garden', 'CJ', 'No code needed', '2022-11-29 00:00:00', '2023-12-31 14:00:00', '10.00%', 'https://www.dpbolvw.net/click-100566409-15388088-1669722907000', 'Winter Holiday Sale 2022 Es Winter', NULL, NULL, NULL, NULL, NULL, '1'),
(25, 1, 729207, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.dpbolvw.net/click-100566409-2635518', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(27, 1, 1124214, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.jdoqocy.com/click-100566409-12725289', 'Tap offer to copy the coupon code. Remember to paste code when you check out. Online only.', NULL, NULL, NULL, NULL, NULL, '1'),
(29, 1, 3259243, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.dpbolvw.net/click-100566409-14504987', 'Save $5 on orders over $349.99', NULL, NULL, NULL, NULL, NULL, '1'),
(31, 1, 3350021, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.kqzyfj.com/click-100566409-14511071', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(34, 2, 4498040, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', '12% OFF Coupon For Consumer Electronics', 'https://www.kqzyfj.com/click-100566409-12637573', '12% OFF Coupon For Consumer Electronics', NULL, NULL, NULL, NULL, NULL, '1'),
(35, 1, 5262281, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.kqzyfj.com/click-100566409-15372609', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(38, 2, 5305691, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.dpbolvw.net/click-100566409-13814471', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(40, 2, 5357356, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.tkqlhce.com/click-100566409-13999325', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(42, 2, 5488109, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.kqzyfj.com/click-100566409-15039113', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(43, 1, 5652880, NULL, 'CJ', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 16:39:18', NULL, 'https://www.tkqlhce.com/click-100566409-14455505', '0.1% - 2.5% Cash Back', NULL, NULL, NULL, NULL, NULL, '1'),
(102, 440762, 24631, '', 'SS', 'LEAVANA', '2017-09-02 00:00:00', '2050-12-31 00:00:00', '20% off site wide', 'https://www.shareasale.com/u.cfm?d=440762&m=24631&u=3148616', '20% off site wide', 'active', NULL, NULL, NULL, NULL, '1'),
(122, 185332, 24631, '', 'SS', 'SHAREBLOOM', '2014-01-29 00:00:00', '2050-12-31 00:00:00', 'Free Blooming tea on all orders $15 or more!', 'https://www.shareasale.com/u.cfm?d=185332&m=24631&u=3148616', 'Free Blooming tea on all orders $15 or more!', 'active', NULL, NULL, NULL, NULL, '1'),
(169, 28370, 24631, 'permanent coupon', 'SS', '5off', '2010-02-20 00:00:00', '2050-12-31 00:00:00', '5% off the entire tea store!', 'https://www.shareasale.com/u.cfm?d=28370&m=24631&u=3148616', '5% off the entire tea store!', 'active', NULL, NULL, NULL, NULL, '1'),
(172, 715740, 24631, '', 'SS', 'FREEBLOOMTEA', '2020-10-14 00:00:00', '2050-12-31 00:00:00', 'Free blooming tea with orders $35+', 'https://www.shareasale.com/u.cfm?d=715740&m=24631&u=3148616', 'Free blooming tea with orders $35+', 'active', NULL, NULL, NULL, NULL, '1'),
(176, 1, 5846, NULL, 'SS', 'No code needed', '2022-12-08 00:00:00', '2023-12-31 17:15:45', NULL, 'https://www.shareasale.com/r.cfm?b=22884&u=3148616&m=5846', 'SAVINGS of up to 67% OFF retail prices', NULL, NULL, NULL, NULL, NULL, '1'),
(178, 1, 5903, NULL, 'SS', 'No code needed', '2023-12-08 00:00:00', '2023-12-31 17:15:45', NULL, 'https://www.shareasale.com/r.cfm?b=23124&u=3148616&m=5903', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(181, 2, 112418, NULL, 'SS', 'BLACK15', '2022-12-08 00:00:00', '2023-12-31 17:15:45', NULL, 'https://www.shareasale.com/r.cfm?b=1802867&u=3148616&m=112418', 'GET 15% OFF', NULL, NULL, NULL, NULL, NULL, '1'),
(205, 978661, 24631, '', 'SS', '50BLOWOUT', '2022-11-28 00:00:00', '2025-12-28 00:00:00', '', 'https://www.shareasale.com/u.cfm?d=978661&m=24631&u=3148616', '', 'active', NULL, NULL, NULL, NULL, '1'),
(311, 152150, 17653, '', 'IR', 'No code needed', '2022-12-10 00:00:00', '2023-12-27 04:30:00', 'ADVENT10 - 10% OFF - Netherlands', 'https://luxecosmetics.pxf.io/c/3324490/1496591/17653?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17653/Deals/152150', 'Coupon code: ADVENT10\r\n        Discount: 10% Off\r\n        Expiry: 27th Dec 2022', NULL, NULL, NULL, NULL, NULL, '1'),
(313, 146483, 17606, '', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 23:59:59', 'Test', 'https://beneunderpromotioncampaign.pxf.io/c/3324490/1492955/17606?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17606/Deals/146483', 'Free Shipping and Free Taxes on All Orders Worldwide', NULL, NULL, NULL, NULL, NULL, '1'),
(322, 125791, 15271, '', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 23:59:59', '20% discount over $99', 'https://popvil.sjv.io/c/3324490/1241790/15271?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/15271/Deals/125791', '', NULL, NULL, NULL, NULL, NULL, '1'),
(325, 119899, 14743, 'Smart Wi-Fi Bulb', 'IR', 'No code needed', '2022-12-31 00:00:00', '2023-12-31 23:59:59', 'Smart Wi-Fi', 'https://ledvanceus.sjv.io/c/3324490/1167002/14743?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/14743/Deals/119899', '', NULL, NULL, NULL, NULL, NULL, '1'),
(326, 1, 16080, NULL, 'IR', 'No code needed', NULL, '2023-12-31 16:39:18', NULL, 'https://walkingpad.pxf.io/c/3324490/1332889/16080', 'SAVE $100 ❄ New Year Gift Card', NULL, NULL, NULL, NULL, NULL, '1'),
(327, 1, 11653, NULL, 'IR', 'No code needed', NULL, '2023-12-31 16:39:18', NULL, 'https://ador.sjv.io/c/3324490/829468/11653', '20% OFF $119+', NULL, NULL, NULL, NULL, NULL, '1'),
(328, 1, 18138, NULL, 'IR', 'No code needed', NULL, '2022-12-31 16:39:18', NULL, 'https://cisnevirtuosouniplda.sjv.io/c/3324490/1554300/18138', 'Upto 20% OFF', NULL, NULL, NULL, NULL, NULL, '1'),
(329, 1, 16836, NULL, 'IR', 'No code needed', NULL, '2023-12-31 16:39:18', NULL, 'https://25home.pxf.io/c/3324490/1414515/16836', 'Christmas Sale Up To 45% Off Sitewide', NULL, NULL, NULL, NULL, NULL, '1'),
(348, 153784, 4482, '', 'IR', 'No code needed', '2023-01-04 00:00:00', '2023-12-31 00:00:00', 'AX Chorus plugin for less than $2 ', 'https://martinic.evyy.net/c/3324490/281363/4482?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/4482/Deals/153784', 'In celebration of reaching 50K Twitter followers, were excited to offer our AX Chorus plugin for less than $2 for a limited time! Simple conditions apply, found at\r\n        \r\n        https://www.martinic.com/50k', NULL, NULL, NULL, NULL, NULL, '1'),
(353, 154484, 16960, '', 'IR', 'No code needed', '2023-01-12 00:00:00', '2023-12-31 00:00:00', 'Full discount offer: 15%OFF', 'https://momentwish.pxf.io/c/3324490/1423630/16960?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/16960/Deals/154484', 'Full discount offer: 15%OFF, 15% OFF for purchases over $190', NULL, NULL, NULL, NULL, NULL, '1'),
(355, 153874, 17908, '', 'IR', 'No code needed', '2023-01-12 00:00:00', '2023-12-31 00:00:00', 'Buy 2 Get 1 Free Root Strength Energy Blend', 'https://arete-adaptogens.pxf.io/c/3324490/1531343/17908?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17908/Deals/153874', 'BUY 2, GET 1 FREE ROOT STRENGTH PRE-WORKOUT ENERGY BLEND\r\n        Original Price: $149.99\r\n        Deal Price: $99.99', NULL, NULL, NULL, NULL, NULL, '1'),
(364, 131320, 12845, '', 'IR', 'No code needed', '2023-01-12 00:00:00', '2023-12-31 00:00:00', '[EU store] 2022 Mothers Day Deal', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/12845/Deals/131320', 'Save Up to 40 EUROS.', NULL, NULL, NULL, NULL, NULL, '1'),
(381, 126151, 15355, '', 'IR', 'No code needed', '2023-01-12 00:00:00', '2023-12-31 00:00:00', 'VIP Offer Save $100 Off', 'https://hapbee.sjv.io/c/3324490/1246122/15355?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/15355/Deals/126151', 'Save $100 off Hapbee Smart Wearable', NULL, NULL, NULL, NULL, NULL, '1'),
(410, 15436972, 5262281, 'Womens', 'CJ', 'AFF10', '2023-01-03 00:00:00', '2023-09-29 09:00:00', '10% OFF $79+', 'https://www.anrdoezrs.net/click-100566409-15436972-1672899100000', '10% OFF $79+', 'active', NULL, '10% off', NULL, NULL, '1'),
(412, 15436971, 5262281, 'Womens', 'CJ', 'AFF5', '2023-01-03 00:00:00', '2023-09-29 09:00:00', '5% OFF $49+', 'https://www.dpbolvw.net/click-100566409-15436971-1672899064000', '5% OFF $49+', 'active', NULL, '5% off', NULL, NULL, '1'),
(415, 162449, 4482, '', 'IR', 'SCANMAY2023', '2023-04-30 00:00:00', '2023-05-31 23:00:00', '50% off on the Martinic Scanner Vibrato plugin', 'https://martinic.evyy.net/c/3324490/281363/4482?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/4482/Deals/162449', 'The deal is valid until 31st May with coupon code SCANMAY2023.', 'active', NULL, '', NULL, NULL, '1'),
(417, 131212, 7968, '', 'IR', 'No code needed', '2023-04-30 11:59:59', '2023-12-31 00:00:00', '[CA Store] Spring Sales', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/12845/Deals/131212', 'Buy One get One 50% OFF', NULL, NULL, NULL, NULL, NULL, '1'),
(437, 51674, 9802, '', 'IR', 'SAVE7NOW', '2023-04-30 11:59:59', '2023-05-21 00:00:00', '$7 off New Users', 'https://go.novica.com/c/3324490/597314/9802?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/9802/Deals/51674', '$7 off at NOVICA for new users', 'active', NULL, '', NULL, NULL, '1'),
(438, 85318, 9802, '', 'IR', 'CodesPublishedInPassportClubEmail', '2023-04-30 11:59:59', '2023-05-21 00:00:00', 'Free NOVICA Passport Club Account - Receive The Biggest Discounts!', 'https://go.novica.com/c/3324490/597314/9802?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/9802/Deals/85318', 'Sign up to the NOVICA Passport Club rewards program to qualify for our friends and family codes issued to every active rewards member. These codes will be personal to you and will be on display within your rewards account.', 'active', NULL, '', NULL, NULL, '1'),
(439, 57849, 9901, '', 'IR', 'BH2019IMPACT', '2023-04-30 11:59:59', '2023-05-31 00:00:00', 'BulbHead Affiliates Promo Code', 'https://bulbhead.uewp.net/c/3324490/604292/9901?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/9901/Deals/57849', 'BulbHead Affiliates Promo Code 10% Off', 'active', NULL, '', NULL, NULL, '1'),
(440, 12456, 16836, NULL, 'IR', 'EASTER', NULL, '2023-12-31 16:39:18', '35%off side-wide discount and also extra 5% off discount code \"EASTER\"!', 'https://25home.pxf.io/c/3324490/1414515/16836', 'We offer a 35%off side-wide discount and also extra 5% off discount code \"EASTER\"!', 'active', NULL, NULL, NULL, NULL, '0'),
(445, 15485563, 5262281, 'Womens', 'CJ', 'BOGO', '2023-03-08 01:00:00', '2023-12-30 08:00:00', 'Buy One Get One Free!', 'https://www.jdoqocy.com/click-100566409-15485563-1678332696000', 'Buy One Get One Free!', 'active', NULL, 'Super Offer', NULL, NULL, '1'),
(446, 15226844, 4297609, 'Garden', 'CJ', 'FORMOM20', '2023-04-16 14:00:00', '2023-05-14 13:59:00', 'Mothers Day Promo April Short', 'https://www.jdoqocy.com/click-100566409-15226844-1681459836000', 'Mothers Day Promo April', 'active', NULL, 'Super Offer', NULL, NULL, '1'),
(447, 15485569, 5262281, 'Womens', 'CJ', 'RED25', '2023-03-10 01:00:00', '2023-12-26 08:00:00', 'The Night Before: Everything Only $5', 'https://www.kqzyfj.com/click-100566409-15485569-1678435209000', 'The Night Before: Everything Only $5', 'active', NULL, 'Super Offer', NULL, NULL, '1'),
(448, 15485560, 5262281, 'Womens', 'CJ', 'BOGO', '2023-03-08 01:00:00', '2023-12-30 08:00:00', '10.00%', 'https://www.kqzyfj.com/click-100566409-15485560-1678332652000', 'Buy One Get One Free!', 'active', NULL, NULL, NULL, NULL, '1'),
(449, 15226845, 4297609, 'Garden', 'CJ', 'FORMOM20', '2023-04-16 14:00:00', '2023-05-14 13:59:00', '10.00%', 'https://www.tkqlhce.com/click-100566409-15226845-1681459880000', 'Mothers Day Promo April Short', 'active', NULL, NULL, NULL, NULL, '1'),
(451, 16834001, 16834, NULL, 'IR', 'No code needed', NULL, '2023-12-31 00:00:00', NULL, 'https://castleryus.pxf.io/c/3324490/1414258/16834', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(452, 14384001, 14384, NULL, 'IR', 'No code needed', NULL, '2023-12-31 00:00:00', NULL, 'https://gentleherd.pxf.io/c/3324490/1136691/14384', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(453, 9901001, 9901, NULL, 'IR', 'No code needed', NULL, '2023-12-31 00:00:00', NULL, 'https://bulbhead.uewp.net/c/3324490/604292/9901', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(454, 9802001, 9802, NULL, 'IR', 'No code needed', NULL, '2023-12-31 00:00:00', NULL, 'https://go.novica.com/c/3324490/597314/9802', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(455, 15833001, 15833, NULL, 'IR', 'No code needed', NULL, '2023-12-31 00:00:00', NULL, 'https://stardock.pxf.io/c/3324490/1292592/15833', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(456, 15491135, 5262281, 'Womens', 'CJ', 'FEST30', '2023-03-17 02:00:00', '2024-01-24 08:00:00', 'SPRING BLOWOUT SALE: 80% OFF EVERYTHING', 'https://www.anrdoezrs.net/click-100566409-15491135-1679047281000', 'SPRING BLOWOUT SALE: 80% OFF EVERYTHING', 'active', NULL, '80% off', NULL, NULL, '1'),
(457, 15515120, 5262281, 'Womens', 'CJ', 'DENIM20', '2023-04-18 02:00:00', '2023-05-21 09:00:00', '$59-$5, $89-$10, $169-$20', 'https://www.anrdoezrs.net/click-100566409-15515120-1681884245000', '$59-$5, $89-$10, $169-$20', 'active', NULL, 'save $20', NULL, NULL, '1'),
(471, 13986197, 129899, 'Books', 'CJ', '10MAY', '2020-02-29 22:00:00', '2023-05-31 21:59:00', 'Get an extra 10% off your order of $25 or more, only at Booksamillion.com when you use the code 10MAY', 'https://www.jdoqocy.com/click-100566409-13986197-1682543513000', 'Get an extra 10% off your order of $25 or more, only at Booksamillion.com when you use the code 10MAY', 'active', NULL, '10% off', NULL, NULL, '1'),
(472, 13986212, 129899, 'Books', 'CJ', '20MAY', '2020-02-29 22:00:00', '2023-05-31 21:59:00', 'Get an extra 20% off your purchase of $100 or more, only at Booksamillion.com when you use the coupon code 20MAY', 'https://www.dpbolvw.net/click-100566409-13986212-1682543812000', 'Get an extra 20% off your purchase of $100 or more, only at Booksamillion.com when you use the coupon code 20MAY', 'active', NULL, '20% off', NULL, NULL, '1'),
(473, 13986208, 129899, 'Books', 'CJ', '15MAY', '2020-02-29 22:00:00', '2023-05-31 13:09:00', 'Save 15% off your order of $35 or more, only at Booksamillion.com when you use the coupon code 15MAY', 'https://www.jdoqocy.com/click-100566409-13986208-1682543720000', 'Save 15% off your order of $35 or more, only at Booksamillion.com when you use the coupon code 15MAY', 'active', NULL, 'save 15%', NULL, NULL, '1'),
(474, 779771, 5903, '', 'SS', 'INST1000', '2021-03-27 00:00:00', '2041-04-26 00:00:00', '', 'https://www.shareasale.com/u.cfm?d=779771&m=5903&u=3148616', '', 'active', NULL, NULL, NULL, NULL, '1'),
(475, 301306, 5903, '', 'SS', 'DSBL15', '2015-09-18 00:00:00', '2035-10-18 00:00:00', 'Goldia.com is owned and operated by hearing impaired people. Individuals with disabilities (Deaf, Blindness, Paralysis etc.) can enjoy 15% discount on the entire online webstore items.', 'https://www.shareasale.com/u.cfm?d=301306&m=5903&u=3148616', 'Goldia.com is owned and operated by hearing impaired people. Individuals with disabilities (Deaf, Blindness, Paralysis etc.) can enjoy 15% discount on the entire online webstore items.', 'active', NULL, NULL, NULL, NULL, '1'),
(476, 779769, 5903, '', 'SS', 'INST100', '2021-03-27 00:00:00', '2041-04-26 00:00:00', '', 'https://www.shareasale.com/u.cfm?d=779769&m=5903&u=3148616', '', 'active', NULL, NULL, NULL, NULL, '1'),
(477, 779770, 5903, '', 'SS', 'INST500', '2021-03-27 00:00:00', '2041-04-26 00:00:00', '', 'https://www.shareasale.com/u.cfm?d=779770&m=5903&u=3148616', '', 'active', NULL, NULL, NULL, NULL, '1'),
(478, 218912, 5903, 'Wedding Rings', 'SS', 'bands7', '2014-08-31 00:00:00', '2050-12-31 00:00:00', 'Enjoy a special 7% discount on all of our classic wedding band rings.', 'https://www.shareasale.com/u.cfm?d=218912&m=5903&u=3148616', 'Enjoy a special 7% discount on all of our classic wedding band rings.', 'active', NULL, NULL, NULL, NULL, '1'),
(479, 2818, 5903, 'black Friday, cyber Monday, blackfriday, cybermonday', 'SS', 'SAS5', '2013-09-01 00:00:00', '2050-12-31 00:00:00', '%5 off on all orders over $100', 'https://www.shareasale.com/u.cfm?d=2818&m=5903&u=3148616', '%5 off on all orders over $100', 'active', NULL, NULL, NULL, NULL, '1'),
(480, 21735, 5903, 'black Friday, cyber Monday, blackfriday, cybermonday', 'SS', 'SAS50', '2014-09-01 00:00:00', '2050-12-31 00:00:00', 'SAVE $50 on all orders over $1000', 'https://www.shareasale.com/u.cfm?d=21735&m=5903&u=3148616', 'SAVE $50 on all orders over $1000', 'active', NULL, NULL, NULL, NULL, '1'),
(481, 21736, 5903, 'black Friday, cyber Monday, blackfriday, cybermonday', 'SS', 'SAS150', '2014-09-01 00:00:00', '2050-12-31 00:00:00', 'SAVE $150 ALL ORDERS OVER $2000', 'https://www.shareasale.com/u.cfm?d=21736&m=5903&u=3148616', 'SAVE $150 ALL ORDERS OVER $2000', 'active', NULL, NULL, NULL, NULL, '1'),
(482, 6569964, 5618, '', 'IR', 'NEWCOM598', '2023-04-30 03:41:21', '2023-12-30 03:41:21', 'Get a .COM for just $5.98!', 'https://namecheap.pxf.io/c/3324490/1130467/5618', 'Get a .COM for just $5.98!', 'active', NULL, 'Super Offer', '', 2, '1'),
(483, 7070696, 5618, '', 'IR', 'EMAIL4LESS', '2023-04-30 03:41:21', '2023-06-07 00:00:00', 'Up to 28% off Professional Business Email!', 'https://namecheap.pxf.io/c/3324490/1676714/5618', 'Up to 28% off Professional Business Email!', 'active', NULL, '28% off', '', 1, '1'),
(484, 2931402, 5618, '', 'IR', '99SPECIAL', '2023-04-30 03:41:21', '2023-12-30 03:41:21', 'Just $0.99! Get a popular domain today!', 'https://namecheap.pxf.io/c/3324490/890714/5618', 'Just $0.99! Get a popular domain today!', 'active', NULL, 'Best Offer', '', 2, '1'),
(485, 7452222, 7452, NULL, 'IR', 'No code needed', '2023-05-02 15:28:46', '2023-12-31 15:27:48', NULL, 'https://nordvpn.sjv.io/c/3324490/417838/7452', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(486, 7969222, 7969, NULL, 'IR', 'No code needed', '2023-05-02 15:29:35', '2023-12-31 15:27:48', NULL, 'https://wwwswiftpublishercom.sjv.io/c/3324490/447139/7969', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(487, 12594222, 12594, NULL, 'IR', 'No code needed', '2023-05-02 15:30:17', '2023-12-31 15:27:48', NULL, 'https://sleepandbeyond.sjv.io/c/3324490/924876/12594', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(488, 1351222, 13512, NULL, 'IR', 'No code needed', '2023-05-02 15:31:02', '2023-12-31 15:27:48', NULL, 'https://naploungewear.sjv.io/c/3324490/1038914/13512', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(489, 18020222, 18020, NULL, 'IR', 'No code needed', '2023-05-02 15:31:41', '2023-12-31 15:27:48', NULL, 'https://heyabby.sjv.io/c/3324490/1543906/18020', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(490, 1798622, 17986, NULL, 'IR', 'No code needed', '2023-05-02 15:32:16', '2023-12-31 15:27:48', NULL, 'https://collovinc.sjv.io/c/3324490/1542122/17986', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(491, 1798822, 17988, NULL, 'IR', 'No code needed', '2023-05-02 15:32:57', '2023-12-31 15:27:48', NULL, 'https://consdanhardwoodfurniture.sjv.io/c/3324490/1542126/17988', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(492, 6342639001, 6342639, NULL, 'CJ', 'No code needed', '2023-05-05 11:57:28', '2023-12-31 18:25:45', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.vantrue.com/', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(493, 6396589001, 6396589, NULL, 'CJ', 'No code needed', '2023-05-05 11:58:21', '2023-12-31 18:25:45', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/https://mojoboutique.com/', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(494, 6456462001, 6456462, NULL, 'CJ', 'No code needed', '2023-05-05 11:59:08', '2023-12-31 18:25:45', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.thxsilk.com', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(495, 1284512, 12845, NULL, 'IR', 'MAY8', '2023-05-05 17:55:51', '2023-05-31 23:23:57', 'Mother\'s Day Deal---Up To 35% OFF', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/https://us.govee.com/pages/mothers-day-2023', NULL, NULL, NULL, '8% OFF', NULL, NULL, '1'),
(496, 1284513, 12845, NULL, 'IR', 'H61C3', '2023-05-05 17:57:37', '2023-05-31 23:23:57', 'Mother\'s Day Deal---Up To 28% OFF', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/https://us.govee.com/products/govee-rgbic-led-neon-rope-lights-for-desks ', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(497, 1284514, 12845, NULL, 'IR', 'H6072', '2023-05-05 17:58:47', '2023-05-31 23:23:57', 'Silver Color (35% OFF): $64.4', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/https://us.govee.com/products/govee-rgbicw-smart-corner-floor-lamp?variant=43165965844665', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(498, 1284515, 12845, NULL, 'IR', 'MAY10', '2023-05-05 17:59:47', '2023-05-31 23:23:57', 'Mothers Day Deal---Up To 35% OFF', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/https://ca.govee.com/pages/mothers-day-2023 ', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(499, 147234, 9989, '', 'IR', 'WSCAM3X825', '2023-05-06 06:04:56', '2023-07-06 06:04:56', '25% off on S330 eufyCam 3 & Robovac X8', 'https://eufy-uk.sjv.io/c/3324490/611694/9989?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/9989/Deals/147234', '25% off on S330 eufyCam 3 & Robovac X8', 'active', NULL, '', NULL, NULL, '1'),
(500, 154480, 16960, '', 'IR', 'WE10', '2023-05-06 06:05:02', '2023-07-06 06:05:02', 'Wethrift exclusive code', 'https://momentwish.pxf.io/c/3324490/1423630/16960?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/16960/Deals/154480', 'No threshold 10%OFF No time limit, no limit on the number of uses', 'active', NULL, '', NULL, NULL, '1'),
(501, 154481, 16960, '', 'IR', 'NEW8', '2023-05-06 06:05:02', '2023-07-06 06:05:02', 'new customers $8 discount ', 'https://momentwish.pxf.io/c/3324490/1423630/16960?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/16960/Deals/154481', 'New customer registration use an $8 discount, No threshold, and only use one time ', 'active', NULL, '', NULL, NULL, '1'),
(502, 154482, 16960, '', 'IR', 'MW05', '2023-05-06 06:05:02', '2023-07-06 06:05:02', 'regular Discounts: 5%OFF', 'https://momentwish.pxf.io/c/3324490/1423630/16960?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/16960/Deals/154482', 'Regular Discounts: 5%OFF No threshold, can be used multiple times ', 'active', NULL, '', NULL, NULL, '1'),
(503, 154483, 16960, '', 'IR', 'MW10', '2023-05-06 06:05:02', '2023-07-06 06:05:02', 'Full discount offer: 10%OFF ', 'https://momentwish.pxf.io/c/3324490/1423630/16960?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/16960/Deals/154483', 'Full discount offer: 10% OFF for purchases over $100', 'active', NULL, '', NULL, NULL, '1'),
(504, 154484, 16960, '', 'IR', 'MW15', '2023-05-06 06:05:02', '2023-07-06 06:05:02', 'Full discount offer: 15%OFF', 'https://momentwish.pxf.io/c/3324490/1423630/16960?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/16960/Deals/154484', 'Full discount offer: 15%OFF, 15% OFF for purchases over $190', 'active', NULL, '', NULL, NULL, '1'),
(505, 153356, 17908, '', 'IR', 'AA20', '2023-05-06 06:05:03', '2023-07-06 06:05:03', 'Generic discount code 20 off', 'https://arete-adaptogens.pxf.io/c/3324490/1531343/17908?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17908/Deals/153356', '20% off ', 'active', NULL, '', NULL, NULL, '1'),
(506, 153357, 17908, '', 'IR', 'AA15', '2023-05-06 06:05:03', '2023-07-06 06:05:03', 'Generic discount code 15 off ', 'https://arete-adaptogens.pxf.io/c/3324490/1531343/17908?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17908/Deals/153357', '15% off ', 'active', NULL, '', NULL, NULL, '1'),
(507, 111327, 12845, '', 'IR', 'US30OFF159', '2023-05-06 06:05:09', '2023-07-06 06:05:09', '[US Store]-$30 Off Over $159.', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/12845/Deals/111327', '[US Store]-$30 Off Over $159. Use Code: US30OFF159.Expired On Oct 15th.Shop Now.\r\n        ', 'active', NULL, '', NULL, NULL, '1'),
(508, 111328, 12845, '', 'IR', 'US50OFF209', '2023-05-06 06:05:09', '2023-07-06 06:05:09', '[US Store]-$50 Off Over $209. ', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/12845/Deals/111328', '[US Store]-$50 Off Over $209. Use Code: US50OFF209.Expired On Oct 15th.Shop Now.\r\n        ', 'active', NULL, '', NULL, NULL, '1'),
(509, 111329, 12845, '', 'IR', 'US100OFF399', '2023-05-06 06:05:09', '2023-07-06 06:05:09', '[US Store]-$100 Off Over $399. ', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/12845/Deals/111329', '[US Store]-$100 Off Over $399. Use Code: US100OFF399.Expired On Oct 15th.Shop Now.\r\n        ', 'active', NULL, '', NULL, NULL, '1'),
(510, 111326, 12845, '', 'IR', 'AFFUSGlide', '2023-05-06 06:05:09', '2023-07-06 06:05:09', '[US Store]-Govee Glide Wall Light:25%OFF. Use Code:AFFUSGlide.Expired On Oct 15th.Shop Now.', 'https://govee.sjv.io/c/3324490/970740/12845?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/12845/Deals/111326', '[US Store]-Govee Glide Wall Light:25%OFF. Use Code: AFFUSGlide.Expired On Oct 15th.Shop Now.\r\n        ', 'active', NULL, '', NULL, NULL, '1'),
(511, 126151, 15355, '', 'IR', 'VIP', '2023-05-06 06:05:10', '2023-07-06 06:05:10', 'VIP Offer Save $100 Off', 'https://hapbee.sjv.io/c/3324490/1246122/15355?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/15355/Deals/126151', 'Save $100 off Hapbee Smart Wearable', 'active', NULL, '', NULL, NULL, '1'),
(512, 44916, 7452, '', 'IR', 'XMASDEAL', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Special Xmas deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/44916', 'Special Xmas deal! get 75% Off for 3 years plan. Only $2.99/month', 'active', NULL, '', NULL, NULL, '1'),
(513, 47655, 7452, '', 'IR', 'EBATESDEAL', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Ebatesdeal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/47655', 'Last chance to grab 3-years NordVPN deal for only $2.99/month, charged every 3 years $107.55. (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(514, 51253, 7452, '', 'IR', 'EXTRA1YOFF', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Secret 1 year NordVPN deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/51253', 'Secret 1 year NordVPN deal for with 58% off for $5.00/mo, charged annually $60.00. (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(515, 65785, 7452, '', 'IR', 'BFOFFER', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'NordVPN Black Friday deal!', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/65785', 'Save 83% and get two amazing gifts: 3 extra months with the 3-year plan and the NordLocker file encryption app (worth $312).', 'active', NULL, '', NULL, NULL, '1'),
(516, 67154, 7452, '', 'IR', 'HOLIDAY', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Holiday deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/67154', 'NordVPN holiday deal! Save 80% and get two amazing gifts: 3 extra months with the 3-year plan and the NordPass password manager (worth $194.61)', 'active', NULL, '', NULL, NULL, '1'),
(517, 72192, 7452, '', 'IR', 'WIKIBUY', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Wikibuy 3 years deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/72192', 'NordVPN 3-years plan with 70% off for only $3.49/mo (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(518, 46972, 7452, '', 'IR', 'EXTRAOFF', '2023-05-06 06:05:15', '2023-07-06 06:05:15', ' NordVPN 3-year plan sale', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/46972', 'Last chance to grab 3-year NordVPN deal for $2.99/mo', 'active', NULL, '', NULL, NULL, '1'),
(519, 46392, 7452, '', 'IR', 'VIP3Y', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Special 3-year offer', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/46392', 'Last chance to grab 3-years NordVPN deal for only $2.99/month, charged every 3 years $107.55. (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(520, 72194, 7452, '', 'IR', 'WIKIBUY1Y', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Wikibuy 1 year deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/72194', 'Secret 1 year NordVPN deak with 58% off for $5.00/mo, charged annually $60.00. (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(521, 72640, 7452, '', 'IR', 'POUCHSPECIAL', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Pouch 3 years offer', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/72640', 'NordVPN 3-years plan with 70% off for only $3.49/mo (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(522, 72641, 7452, '', 'IR', 'POUCH', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Pouch 1-year offer', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/72641', 'Secret 1 year NordVPN deak with 58% off for $5.00/mo, charged annually $60.00. (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(523, 74803, 7452, '', 'IR', 'ORANGEDEAL', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Orange Buddies 3-years plan with 70%', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/74803', 'NordVPN 3-years plan with 70%', 'active', NULL, '', NULL, NULL, '1'),
(524, 77907, 7452, '', 'IR', 'SPRINGDEAL', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Spring deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/77907', 'NordVPN 3-years plan with 70% off for only $3.49/mo (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(525, 79025, 7452, '', 'IR', 'BESTVPN', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Best VPN Deal', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/79025', 'NordVPN 2-years plan with 70% off for only $3.49/mo (30 days risk-free. Not satisfied? Get your money back, no questions asked.)', 'active', NULL, '', NULL, NULL, '1'),
(526, 81168, 7452, '', 'IR', 'LATIMES', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'LATIMES', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/81168', 'NordVPN 2-year plan with 70% off! That’s online security for $3.54/mo.', 'active', NULL, '', NULL, NULL, '1'),
(527, 83056, 7452, '', 'IR', 'DEALNEWS', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'dealnews', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/83056', 'NordVPN exclusive deal: shorter commitment, lowest price! Get 2-years at 70% off, only $3.49/mo, total $83.76', 'active', NULL, '', NULL, NULL, '1'),
(528, 102378, 7452, '', 'IR', 'topdeal', '2023-05-06 06:05:15', '2023-07-06 06:05:15', '2 Year 65% Default Offer', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/102378', 'NordVPN’s 2-year offer: Get 65% OFF for only $4.13/mo or €3.30/mo or £3.05/mo', 'active', NULL, '', NULL, NULL, '1'),
(529, 110375, 7452, '', 'IR', 'SAVOO', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Savoo', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/110375', 'VPN Awareness Month: get 72% off NordVPNs 2 year plan + 3 months free!', 'active', NULL, '', NULL, NULL, '1'),
(530, 111820, 7452, '', 'IR', 'EINFACH', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Einfach', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/111820', '', 'active', NULL, '', NULL, NULL, '1'),
(531, 83322, 7452, '', 'IR', 'topdeal', '2023-05-06 06:05:15', '2023-07-06 06:05:15', '2 Year 68% Offer', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/83322', 'NordVPN 2 Year Deal With 68% OFF', 'active', NULL, '', NULL, NULL, '1'),
(532, 85970, 7452, '', 'IR', 'INDEPENDENT', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'INDEPENDENT', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/85970', 'NordVPN 2-year plan with 70% off! That’s online security for $3.54/mo.', 'active', NULL, '', NULL, NULL, '1'),
(533, 112656, 7452, '', 'IR', 'LUMALY', '2023-05-06 06:05:15', '2023-07-06 06:05:15', 'Lumaly', 'https://nordvpn.sjv.io/c/3324490/417838/7452?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/7452/Deals/112656', '', 'active', NULL, '', NULL, NULL, '1'),
(534, 116170, 13512, '', 'IR', 'hol25', '2023-05-06 06:05:18', '2023-07-06 06:05:18', 'BlackFriday coupon', 'https://naploungewear.sjv.io/c/3324490/1038914/13512?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/13512/Deals/116170', 'Best coupon ever! 30%off and no limit .', 'active', NULL, '', NULL, NULL, '1'),
(535, 157176, 17986, '', 'IR', 'PD10', '2023-05-06 06:05:20', '2023-07-06 06:05:20', '10% Off Presidents Day Sale for 1-2 Design Package!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157176', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(536, 157179, 17986, '', 'IR', 'PD15', '2023-05-06 06:05:20', '2023-07-06 06:05:20', '15% Off Presidents Day Sale for 3-4 Design Package!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157179', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(537, 157180, 17986, '', 'IR', 'PD20', '2023-05-06 06:05:20', '2023-07-06 06:05:20', '20% Off Presidents Day Sale for 5+ Design Package!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157180', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(538, 157181, 17986, '', 'IR', 'PDS10', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Up to 10% Presidents Day Sale for Furniture Order over $1,000!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157181', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(539, 157182, 17986, '', 'IR', 'PDS12', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Up to 12% Presidents Day Sale for Furniture Order over $3,000!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157182', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(540, 157183, 17986, '', 'IR', 'PDS20', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Up to 20% Presidents Day for Furniture Order over $9,000!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157183', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(541, 157184, 17986, '', 'IR', 'PDS15', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Up to 15% Presidents Day Sale for Furniture Order over $5,000!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157184', 'Presidents Day Sale (2/20 - 2/28)', 'active', NULL, '', NULL, NULL, '1'),
(542, 157960, 17986, '', 'IR', 'HOME15', '2023-05-06 06:05:20', '2023-07-06 06:05:20', '15%OFF on Collov Design Plans!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157960', '15%OFF on Collov Design Plans!', 'active', NULL, '', NULL, NULL, '1'),
(543, 157963, 17986, '', 'IR', 'HOME20', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Save $20 on Collov Design Plans!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157963', 'Save $20 on Collov Design Plans!', 'active', NULL, '', NULL, NULL, '1'),
(544, 157964, 17986, '', 'IR', 'HOME20', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Save $20 on Kick-Start Design Plan!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157964', 'Save $20 on Kick-Start Design Plan!', 'active', NULL, '', NULL, NULL, '1'),
(545, 157965, 17986, '', 'IR', 'HOME20', '2023-05-06 06:05:20', '2023-07-06 06:05:20', 'Save $20 on Luxe Design Plan!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157965', 'Save $20 on Luxe Design Plan!', 'active', NULL, '', NULL, NULL, '1'),
(546, 157961, 17986, '', 'IR', 'HOME15', '2023-05-06 06:05:20', '2023-07-06 06:05:20', '15%OFF on Kick-Start Design Plan!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157961', '15%OFF on Kick-Start Design Plan!', 'active', NULL, '', NULL, NULL, '1'),
(547, 157962, 17986, '', 'IR', 'HOME15', '2023-05-06 06:05:20', '2023-07-06 06:05:20', '15%OFF on Luxe Design Plan!', 'https://collovinc.sjv.io/c/3324490/1542122/17986?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/17986/Deals/157962', '15%OFF on Luxe Design Plan!', 'active', NULL, '', NULL, NULL, '1'),
(548, 127306, 14403, '', 'IR', 'HONEY15', '2023-05-06 06:05:22', '2023-07-06 06:05:22', 'Save 15% off orders of $100+ with code HONEY15', 'https://apotheke.pxf.io/c/3324490/1138195/14403?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/14403/Deals/127306', 'Save 15% off orders of $100+ with code HONEY15', 'active', NULL, '', NULL, NULL, '1'),
(549, 127307, 14403, '', 'IR', 'HONEY10', '2023-05-06 06:05:22', '2023-07-06 06:05:22', '10% off sitewide with code HONEY10', 'https://apotheke.pxf.io/c/3324490/1138195/14403?/Mediapartners/IRH4dfZWjfpL3324490RY2WJbJGH45JAi1/Campaigns/14403/Deals/127307', '10% off sitewide with code HONEY10', 'active', NULL, '', NULL, NULL, '1'),
(550, 17663001, 17663, NULL, 'IR', 'No code needed', '2023-05-06 10:06:39', '2023-12-31 15:35:25', NULL, 'https://zamatsleep.pxf.io/c/3324490/1497541/17663', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(551, 15485571, 5262281, 'Womens', 'CJ', 'RED25', '2023-05-07 00:05:03', '2023-12-26 08:00:00', '10.00%', 'https://www.tkqlhce.com/click-100566409-15485571-1678435202000', 'The Night Before: Everything Only $5', 'active', NULL, NULL, NULL, NULL, '1'),
(552, 3350021552, 3350021, NULL, 'CJ', 'EXTRA30', '2023-05-09 09:32:58', '2023-05-14 18:29:00', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/https://shop.mango.com', 'All products with -30% OFF with MOV $220', NULL, NULL, '30% OFF', NULL, NULL, '1'),
(553, 17663316, 17663, NULL, 'IR', 'HM12', '2023-05-09 09:32:58', '2023-05-15 00:00:00', NULL, 'https://zamatsleep.pxf.io/c/3324490/1685640/17663', 'MOTHERS DAY SALE: UP TO 50% OFF SITEWIDE', NULL, NULL, '', NULL, NULL, '1'),
(554, 17663199, 17663, NULL, 'IR', 'HM18', '2023-05-09 09:32:58', '2023-05-15 00:00:00', NULL, 'https://zamatsleep.pxf.io/c/3324490/1685637/17663', ' 18% OFF over $70 on All Pillows (5.4-5.14) ', NULL, NULL, '', NULL, NULL, '1'),
(555, 17663222, 17663, NULL, 'IR', 'HM10', '2023-05-09 09:32:58', '2023-05-15 00:00:00', NULL, 'https://zamatsleep.pxf.io/c/3324490/1685641/17663', 'Get $10 OFF on All Bundle', NULL, NULL, '', NULL, NULL, '1'),
(556, 17663624, 17663, NULL, 'IR', 'No code needed', '2023-05-09 09:32:58', '2023-05-15 00:00:00', NULL, 'https://zamatsleep.pxf.io/c/3324490/1685643/17663', '40% OFF Grey Butterfly Shaped Pillow ', NULL, NULL, '', NULL, NULL, '1'),
(557, 17663793, 17663, NULL, 'IR', 'No code needed', '2023-05-09 09:32:58', '2023-05-15 00:00:00', NULL, 'https://zamatsleep.pxf.io/c/3324490/1685642/17663', '35% OFF Zamat Original Cervical Pillow', NULL, NULL, '', NULL, NULL, '1'),
(558, 6824138, 11653, '', 'IR', 'Not needed', '2023-05-10 05:45:05', '2023-06-29 00:00:00', '$(€ ￡)59-10%off', 'https://ador.sjv.io/c/3324490/1648044/11653', '$(€ ￡)59-10%off', 'active', NULL, '-10% off', '', 1, '1'),
(559, 6824827, 11653, '', 'IR', 'AD13', '2023-05-10 05:45:05', '2023-06-29 00:00:00', 'Extra 10% off Over order $(€ ￡)59 discount', 'https://ador.sjv.io/c/3324490/884814/11653', '$(€ £)59-10%off', 'active', NULL, '10% off', '', 1, '1'),
(560, 3750259, 11653, '', 'IR', 'Not needed', '2023-05-10 05:45:05', '2023-06-30 00:00:00', 'Free Shipping Promotion', 'https://ador.sjv.io/c/3324490/884814/11653', 'Free Shipping on order amount over $50', 'active', NULL, 'Great Value', '', 1, '1'),
(561, 6831696, 11653, '', 'IR', 'Not needed', '2023-05-10 05:45:05', '2023-06-30 00:00:00', '¡ Oferta Primavera - Verano !', 'https://ador.sjv.io/c/3324490/884814/11653', 'Disfruta de un 10% en compras superiores a 59$, de un 15% en compras superiores a 79$ y 20& en superiores a 199$.', 'active', NULL, 'Ahorra en grande', '', 0, '1'),
(562, 7031818, 16836, '', 'IR', 'MOM', '2023-05-10 05:53:25', '2023-07-10 05:53:25', '25Home: Mothers Day Sale+Sidewide35%Off+Code MOM for Xtra 5% Off', 'https://25home.pxf.io/c/3324490/1568931/16836', '', 'active', NULL, '35% off', '', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `create_sharerefcode`
--

CREATE TABLE `create_sharerefcode` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `storeId` varchar(50) DEFAULT NULL,
  `couponId` int DEFAULT NULL,
  `shareCode` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` date DEFAULT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `create_sharerefcode`
--

INSERT INTO `create_sharerefcode` (`id`, `userId`, `storeId`, `couponId`, `shareCode`, `created_date`, `expire_date`, `status`) VALUES
(1, 3, '', 66, 'code_7156', '2022-12-14 05:20:56', NULL, 'Y'),
(2, 1, '', 9, 'code_4978', '2022-12-15 08:52:54', NULL, 'Y'),
(3, 1, '', 9, 'code_9250', '2022-12-15 08:52:56', NULL, 'Y'),
(4, 1, '', 9, 'code_3686', '2022-12-15 09:01:49', NULL, 'Y'),
(5, 1, '', 9, 'code_5389', '2022-12-15 09:01:55', NULL, 'Y'),
(6, 5, '', 329, 'code_2618', '2023-01-03 17:15:32', NULL, 'Y'),
(7, 5, '', 329, 'code_6728', '2023-01-03 17:16:13', NULL, 'Y'),
(8, 5, '', 329, 'code_4053', '2023-01-03 17:17:18', NULL, 'Y'),
(9, 5, '', 205, 'code_4958', '2023-01-03 17:19:03', NULL, 'Y'),
(10, 1, '', 3, 'code_9062', '2023-01-04 12:06:19', NULL, 'Y'),
(11, 6, '', 329, 'code_6341', '2023-04-12 09:08:05', NULL, 'Y'),
(12, 6, '', 329, 'code_3286', '2023-04-12 09:10:32', NULL, 'Y'),
(13, 6, '', 329, 'code_1921', '2023-04-12 09:15:13', NULL, 'Y'),
(14, 7, '', 329, 'code_9399', '2023-04-12 13:08:09', NULL, 'Y'),
(15, 9, '', 329, 'code_5642', '2023-04-13 11:51:10', NULL, 'Y'),
(16, 9, '', 329, 'code_5729', '2023-04-13 12:03:35', NULL, 'Y'),
(17, 10, '', 329, 'code_8748', '2023-04-13 13:22:49', NULL, 'Y'),
(18, 10, '', 329, 'code_8833', '2023-04-13 13:26:39', NULL, 'Y'),
(19, 1, '1', 0, 'code_9847', '2023-04-25 11:38:32', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_users`
--

CREATE TABLE `frontend_users` (
  `userId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phno` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loginType` enum('normal','gmail','fb') NOT NULL DEFAULT 'normal',
  `img` varchar(100) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `slagName` varchar(255) DEFAULT NULL,
  `paypalEmailId` varchar(255) DEFAULT NULL,
  `profileImg` varchar(255) DEFAULT NULL,
  `bannerImg` varchar(255) DEFAULT NULL,
  `status` enum('Y','N') DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `frontend_users`
--

INSERT INTO `frontend_users` (`userId`, `name`, `phno`, `emailId`, `password`, `created_date`, `loginType`, `img`, `lastName`, `zipCode`, `slagName`, `paypalEmailId`, `profileImg`, `bannerImg`, `status`) VALUES
(36, 'Samit', NULL, 'samit.bera@zivanta-analytics.com', NULL, '2023-05-06 06:16:28', 'gmail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
(37, 'Amit', NULL, 'amit.bera@zivanta-analytics.com', NULL, '2023-05-06 06:16:39', 'gmail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` int NOT NULL,
  `order_id` varchar(256) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `affiliated_store_id` int DEFAULT NULL,
  `store_name` varchar(256) DEFAULT NULL,
  `ActionTrackerName` varchar(100) DEFAULT NULL,
  `ActionTrackerId` varchar(100) DEFAULT NULL,
  `EventCode` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `AdId` varchar(100) DEFAULT NULL,
  `Payout` float DEFAULT NULL,
  `DeltaPayout` float(10,2) DEFAULT NULL,
  `IntendedPayout` float(10,2) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `DeltaAmount` float(10,2) DEFAULT NULL,
  `IntendedAmount` float(10,2) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `ReferringDate` datetime DEFAULT NULL,
  `EventDate` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `LockingDate` datetime DEFAULT NULL,
  `ClearedDate` datetime DEFAULT NULL,
  `ReferringType` varchar(100) DEFAULT NULL,
  `ReferringDomain` varchar(100) DEFAULT NULL,
  `PromoCode` varchar(50) DEFAULT NULL,
  `Oid` varchar(50) DEFAULT NULL,
  `CustomerArea` varchar(100) DEFAULT NULL,
  `CustomerCity` varchar(100) DEFAULT NULL,
  `CustomerRegion` varchar(100) DEFAULT NULL,
  `CustomerCountry` varchar(50) DEFAULT NULL,
  `SubId1` int DEFAULT NULL,
  `SubId2` int DEFAULT NULL,
  `SubId3` int DEFAULT NULL,
  `SharedId` int DEFAULT NULL,
  `Uri` int DEFAULT NULL,
  `affiliate_type` varchar(256) DEFAULT NULL,
  `State_status` varchar(256) DEFAULT NULL,
  `status_by_backend_team` enum('PENDING','APPROVED') NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`id`, `order_id`, `userId`, `affiliated_store_id`, `store_name`, `ActionTrackerName`, `ActionTrackerId`, `EventCode`, `State`, `AdId`, `Payout`, `DeltaPayout`, `IntendedPayout`, `Amount`, `DeltaAmount`, `IntendedAmount`, `Currency`, `ReferringDate`, `EventDate`, `CreationDate`, `LockingDate`, `ClearedDate`, `ReferringType`, `ReferringDomain`, `PromoCode`, `Oid`, `CustomerArea`, `CustomerCity`, `CustomerRegion`, `CustomerCountry`, `SubId1`, `SubId2`, `SubId3`, `SharedId`, `Uri`, `affiliate_type`, `State_status`, `status_by_backend_team`) VALUES
(4, '10014.5453.864431', 3, 10014, 'Best Buy U.S', 'Sale', '17897', '', 'PENDING', '614286', 0, 0.00, 0.00, 404.98, 404.98, 404.98, 'USD', '2022-12-07 04:43:47', '2022-12-07 05:01:19', '2022-12-07 05:09:13', '2023-02-16 06:00:00', '2022-03-02 10:38:37', 'CLICK_COOKIE', 'powershopr.com', '', '', 'N/A', 'Eden Prairie', 'Minnesota', 'US', 21, 0, 0, 0, 0, 'IR', 'Cashback pending', 'PENDING'),
(6, '15382.5406.497294', 0, 15382, 'Stearns & Foster', 'Sale', '28902', '', 'PENDING', '1248248', 56.98, 56.98, 56.98, 2849, 2849.00, 2849.00, 'USD', '2022-10-20 18:02:34', '2022-10-20 20:05:22', '2022-10-20 20:11:19', '2022-11-16 05:00:00', '2021-04-01 10:39:05', 'CLICK_COOKIE', 'www.smartmattressbuy.com', '$300 in Free Accessories', '', 'N/A', 'Antioch', 'Tennessee', 'US', 0, 0, 0, 0, 0, 'IR', 'Cashback ready to redeem', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` int NOT NULL,
  `page` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `page`, `title`, `description`, `keywords`, `url`) VALUES
(1, 'Home', 'Giveawayhubs: coupons, Offers, Promo Codes, Deals & Discounts', 'Latest Discounts, Coupons and Offers available on Givewayhubs. All the Promo Codes are validated daily, get your latest coupon codes.', 'best holiday deals,discount code,coupon code,free discount codes,promo coupon,shopping coupons,online coupons,coupon codes,shopping deals,discount online shopping,free coupons,promo code,deal coupon,discount price,discount coupon,free online coupons,online coupon codes,offer code,store coupons,free coupon codes,discount sites,promo discount,online discount stores,lower coupons,discount shopping sites,discount coupon code,holiday coupons,discount shop,discount sales,coupon deals,discount website,free shipping coupon,promo code for,best shopping deals,verizon coupons,verizon discounts,free shipping code,discount deals,discount offer,online discount codes,coupons and deals,coupon sites,all coupons,deals and coupons,best deals online,coupon website,retail coupons,sale discount,deals website,get discount,mother\'s day special promo code, Mother\'s Day Special Discount Coupons', '/'),
(2, 'deals', 'Get Online Coupons and Deals for Store', 'Get all the latest updated coupons, promo codes and discount codes here. You get get all latest promo codes here on DesiDime. All coupons are updated and verified by our shopping experts and Dimmers.', 'coupon codes, india coupon codes, online shopping coupon, discounts, coupons, promotional, promo, promotion, deal,Mother\'s Day Special Discount Coupons code.', '/deals'),
(3, 'all', 'Online Codes &amp; Deals by Store | giveawayhubs', 'Incredible Promo Codes and 300 plus Coupons are available for all major categories. Do check these coupons, deals, offers before you shop online.', 'coupons, coupon codes, promo codes, free shipping, deals, discount, promotion', '/deals/stores/all'),
(4, 'Categories', 'All Categories Coupons, Offers & Promo Codes', 'Incredible Promo Codes and 300 plus Coupons are available for all major categories. Do check these coupons, deals, offers before you shop online.', 'coupon codes, india coupon codes, online shopping coupon, discounts, coupons, promotional, promo, promotion, deal', '/deals/categories');

-- --------------------------------------------------------

--
-- Table structure for table `seo_info`
--

CREATE TABLE `seo_info` (
  `id` int NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `page_title` varchar(100) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `robots` varchar(255) DEFAULT NULL,
  `status` enum('N','Y') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seo_info`
--

INSERT INTO `seo_info` (`id`, `page_name`, `page_title`, `keywords`, `author`, `meta_description`, `robots`, `status`) VALUES
(1, 'Home', 'Home', 'giveawayhubs.com', 'giveawayhubs.com', 'giveawayhubs.com', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `sharecode_accept_by_user`
--

CREATE TABLE `sharecode_accept_by_user` (
  `id` int NOT NULL,
  `shareCodeId` varchar(255) DEFAULT NULL,
  `accept_user_id` int NOT NULL,
  `curentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sharecode_accept_by_user`
--

INSERT INTO `sharecode_accept_by_user` (`id`, `shareCodeId`, `accept_user_id`, `curentDate`) VALUES
(1, 'code_9847', 12, '2023-04-25 11:40:23'),
(2, 'code_9847', 13, '2023-04-25 13:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int NOT NULL,
  `affiliated_store_id` bigint DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `store_status` varchar(255) DEFAULT NULL,
  `store_parent_categories` varchar(255) DEFAULT NULL,
  `child_categories` varchar(255) DEFAULT NULL,
  `network` varchar(50) DEFAULT NULL,
  `store_website` varchar(100) DEFAULT NULL,
  `store_logo` varchar(255) DEFAULT NULL,
  `description` longtext,
  `CampaignId` int DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` date DEFAULT NULL,
  `shareSale_linkurl` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `alternate_name` varchar(255) DEFAULT NULL,
  `seo_title` text,
  `seo_description` text,
  `keyword` longtext,
  `banner_title` text,
  `banner_text` text,
  `banner_image` text,
  `seo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `affiliated_store_id`, `store_name`, `store_status`, `store_parent_categories`, `child_categories`, `network`, `store_website`, `store_logo`, `description`, `CampaignId`, `start_date`, `modified_date`, `shareSale_linkurl`, `short_name`, `alternate_name`, `seo_title`, `seo_description`, `keyword`, `banner_title`, `banner_text`, `banner_image`, `seo_url`) VALUES
(1, 5618, 'Namecheap', 'Active', '', '', 'IR', 'http://www.namecheap.com', '5618.webp', 'Namecheap is committed to offering the industrys best value and customer service for domains, SSL certificates, hosting and more. Increase your sales while helping your clients build or improve their web presence. Join today and start earning.', 5618, '2022-12-03 14:41:34', '2023-05-06', 'https://namecheap.pxf.io/c/3324490/386170/5618', NULL, NULL, 'Namecheap Discount Coupon Codes and Deals - giveawayhubs.com', 'Namecheap offers affordable domain registration and hosting solutions. Get reliable, secure web hosting and website domains to jumpstart your online presence. Start today!.', 'namecheap,namecheap domain,privateemail,namecheap com,namecheap coupon,buy a domain name cheap,namecheap discount code,namecheap promo,namecheap domain promo code,namecheap com,namecheap hosting promo code, code, discounts, coupons, promotional, promo, promotion, deal', 'Namecheap COUPONS & PROMO CODES', 'Save and earn while you shop at Namecheap.', NULL, 'namecheap'),
(2, 5846, 'Sunshine Jewelry', 'Active', 'Accessories', '', 'SS', 'www.sunshinejewelry.com', '5846.webp', NULL, NULL, '2022-11-16 17:29:54', '2022-12-31', 'https://www.shareasale.com/r.cfm?b=22884&u=3148616&m=5846', NULL, NULL, 'Sunshine Jewelry Promo Codes & Coupons - giveawayhubs.com', 'giveawayhubs.com brings you the exclusive list of verified deals and discount coupon codes for Sunshine Jewelry. catch the coupons now and save big bill.', 'sunshine jewelry,sunshine jewelry discount code,you are my sunshine necklace,code, discounts, coupons, promotional, promo, promotion, deal', 'Sunshine Jewelry COUPONS & PROMO CODES', 'Save and earn while you shop at sunshinejewelry.com', 'banner5846.webp', 'sunshine-jewelry'),
(3, 5903, 'Goldia.com L.L.C.', 'Active', 'Accessories', '', 'SS', 'www.goldia.com', '5903.webp', NULL, NULL, '2022-11-16 17:29:54', '2022-12-31', 'https://www.shareasale.com/r.cfm?b=23124&u=3148616&m=5903', 'Goldia L.L.C.', 'Goldia L.L.C.', 'Goldia.com Promo Codes & Coupons - giveawayhubs.com', 'giveawayhubs.com brings you the entire list of verified coupons and promo codes of Goldia.com. Save big on your final bill.', NULL, 'Goldia.com L.L.C. COUPONS & PROMO CODES', 'Save and earn while you shop at Goldia.com L.L.C.', 'banner5903.webp', 'goldia'),
(4, 9989, 'Eufy UK', 'Active', '', '', 'IR', 'http://www.eufylife.com/uk/', '9989.webp', 'Join Eufy UK and earn Commision per sale with up to 15% AOV. \r\n        Eufy UK smart home appliances support and protect the well-being of you and your home. eufy is developing a new generation of connected devices and appliances that work seamlessly. ', 9989, '2022-12-03 14:41:33', '2023-05-06', 'https://eufy-uk.sjv.io/c/3324490/611694/9989', NULL, NULL, 'Eufy UK Discount Coupon Codes and Deals - giveawayhubs.com', 'giveawayhubs.com brings you the exclusive list of verified deals and discount coupon codes for eufylife.com. catch the coupons now and save big bill. Eufy UK - The home of robotic vacuums, mops & accessories. Experience hassle-free cleaning with our revolutionary smart home products that make life easier.', 'eufy uk,eufy discount code uk,ufy uk discount code,eufy promo code amazon uk,eufy doorbell uk,eufy security uk,eufy outdoor camera uk,eufy doorbell uk best price,uk eufy,eufy wired doorbell uk,eufy smart lock uk,eufy hoover uk,eufy solocam e40 uk,eufy uk doorbell,eufy amazon uk', 'eufylife.com COUPONS & PROMO CODES', 'Save and earn while you shop at eufylife.com', 'banner9989.webp', 'eufy'),
(5, 15929, 'JustFashionNow', 'Active', '', '', 'IR', 'http://www.justfashionnow.com/', '15929.webp', 'JustFashionNow is an international B2C fast fashion e-commerce platform. It was founded in 2016 by a group of working women who wanted to boost other women’s confidence with fashion. Our mission has remained the same ever since! We offer fast fashion', 15929, '2022-12-03 14:41:33', '2023-05-06', 'https://justfashionnow.sjv.io/c/3324490/1303388/15929', NULL, NULL, 'JustFashionNow Discount Coupon Codes and Deals - giveawayhubs.com', 'giveawayhubs.com brings you the entire list of verified coupons and promo codes of justfashionnow.com. Save big on your final bill. Shop the latest fashion trends with JustFashionNow. Get the most stylish dresses, tops, and bottoms at unbeatable prices. Shop now!', 'justfashionnow,just fashion now canada,justfashionnow canada,just fashion now com,justfashionnow returns,justfashionnow uk,uk justfashionnow,just fashion now website,justfashionnow summer dresses,just fashion now sandals,women\'s just fashion now,justfashionnow coupon,justfashionnow coupon code,just fashion now promo code,just fashion now free shipping code, code, discounts, coupons, promotional, promo, promotion, deal', 'justfashionnow.com COUPONS & PROMO CODES', 'Save and earn while you shop at justfashionnow.com', 'banner15929.webp', 'justfashionnow'),
(6, 16873, 'Popilush', 'Active', '', '', 'IR', 'https://www.popilush.com?utm_source=AFFIP', '16873.webp', 'Default commission 9% and more. Free Shipping (08/29-09/11). Popilush is an empowering, inviting, and fashion-forward shapewear line for women. The main categories are shapewear, bodysuit, loungewear, leggings, bra, and panties', 16873, '2022-12-03 14:41:33', '2023-05-06', 'https://popilush.pxf.io/c/3324490/1417895/16873', NULL, NULL, 'Popilush Discount Coupon Codes and Deals - giveawayhubs.com', 'Discover delicious Popilush, a unique blend of crunchy popcorn and luscious chocolate - perfect for snacking! Try it today and satisfy your sweet tooth!', 'popilush,popilush dress,popilush shapewear dress,popilush shapewear,popilush bodysuit,code, discounts, coupons, promotional, promo, promotion, deal', 'Popilush COUPONS & PROMO CODES', 'Save and earn while you shop at popilush.com', 'banner16873.webp', 'popilush'),
(7, 17203, 'Elpumps', 'Active', '', '', 'IR', 'https://elpumps.com', '17203.webp', 'Elpumps is a Hungarian water pump factory that has been supplying wholesale and retail distributors from around the world for almost 30 years. Elpumps water pumps are 100% European products that are renowned for their reliability and performance.', 17203, '2022-12-03 14:41:34', '2023-05-06', 'https://elpumps.sjv.io/c/3324490/1449520/17203', NULL, NULL, 'Elpumps Discount Coupon Codes and Deals - giveawayhubs.com', 'Save money on your next pump purchase with Elpumps coupons! Get discounts on the best quality pumps for your home or business. Shop now and save!', '\r\nelpumps,ct 2274,elpumps dsk 10,elpumps jpv 1500 b,elpumps bt 4877 k,elpumps ct 4274,elpumps jpv 1300 b,elpumps jpv 800,elpumps jpv2000b,elpumps vp 300,jpv900', 'Elpumps COUPONS & PROMO CODES', 'Save and earn while you shop at elpumps.com', 'banner17203.webp', 'elpumps'),
(8, 24631, 'California Tea House', 'Active', 'Food/Drink', '', 'SS', 'www.CaliforniaTeaHouse.com', '24631.webp', NULL, NULL, '2022-11-16 17:29:54', '2022-12-31', 'https://www.shareasale.com/r.cfm?b=199286&u=3148616&m=24631', 'California Tea House', 'California Tea House', 'California Tea House Discount Coupon Codes and Deals - giveawayhubs.com', 'giveawayhubs.com brings you the exclusive list of verified deals and discount coupon codes for California Tea House. catch the coupons now and save big bill.', NULL, 'California Tea House COUPONS & PROMO CODES', 'Save and earn while you shop at California Tea House', 'banner24631.webp', 'california-tea-house'),
(9, 112418, 'Claris Housewares and stationery solutions limited', 'Active', 'Home & Garden', '', 'SS', 'www.clarisworld.co.uk', '112418.webp', NULL, NULL, '2022-11-16 17:29:54', '2022-12-31', 'https://www.shareasale.com/r.cfm?b=1802867&u=3148616&m=112418', NULL, NULL, 'Claris Housewares Promo Codes & Coupons - giveawayhubs.com', 'giveawayhubs.com brings you the entire list of verified coupons and promo codes of Claris Housewares. Save big on your final bill.', NULL, 'Claris Housewares COUPONS & PROMO CODES', 'Save and earn while you shop at Claris Housewares', 'banner112418.webp', 'claris-housewares'),
(10, 729207, 'JustFlowers.com', 'Active', 'Gifts & Flowers', 'Flowers', 'CJ', 'http://www.JustFlowers.com/affiliates', '729207.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.JustFlowers.com/affiliates', NULL, NULL, 'JustFlowers.com Coupons and Promo Codes - giveawayhubs.com', 'giveawayhubs.com brings you the exclusive list of verified deals and discount coupon codes for JustFlowers.com. catch the coupons now and save big bill.\r\n', 'justflowers,just flowers delivery,just flowers coupon,just flowers coupon code,justflowers coupon code,ust flowers promo code,just don t send flowers coupon code,just flowers discount code,justflowers coupon,justflowers com coupon code,just paper roses coupon,just knock knock flowers discount code', 'JustFlowers.com COUPONS & PROMO CODES', 'Save and earn while you shop at JustFlowers.com', 'banner729207.webp', 'justFlowers'),
(11, 1124214, 'zChocolat.com', 'Active', 'Gifts & Flowers', 'Gifts', 'CJ', 'http://www.zchocolat.com', '1124214.jpg', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.zchocolat.com', 'Zchocolat', 'Zchocolat', 'zChocolat Coupons and Promo Codes - giveawayhubs.com', 'zChocolat.com has been rated \"Best Chocolate Store 2022\" by Top Consumer Reviews, \"Top 5 Chocolate Gifts\" by the Food Network', 'zchocolat,zchocolat reddit,zchocolat coupon,zchocolat coupon code,zchocolat promo code', 'zChocolat COUPONS & PROMO CODES', 'Save and earn while you shop at zChocolat.com', 'banner1124214.webp', 'zchocolat'),
(12, 3259243, 'AppliancesConnection.com', 'Active', 'Home & Garden', 'Home Appliances', 'CJ', 'http://www.appliancesconnection.com', '3259243.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.appliancesconnection.com', 'Appliancesconnection', 'Appliancesconnection', 'AppliancesConnection.com Coupons and Promo Codes - giveawayhubs.com', 'Save on appliances with our exclusive Appliance Connection coupon codes! Get the best deals on washers, dryers, refrigerators, stoves, and more. Shop now!', 'appliances connection,appliances connection coupon,appliances connection promo code,appliance connection promo code,appliancesconnection promo code,appliance connection coupon code,appliance connection discount code,appliancesconnection com coupon code,appliancesconnection com coupon,appliance connection promo code 2023', 'AppliancesConnection COUPONS & PROMO CODES', 'Save and earn while you shop at appliancesConnection.com', 'banner3259243.webp', 'appliancesconnection'),
(13, 3350021, 'Mango US', 'Active', 'Clothing/Apparel', 'Womens', 'CJ', 'https://shop.mango.com', '3350021.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/https://shop.mango.com', NULL, NULL, 'Mango US Coupons and Promo Codes - giveawayhubs.com', 'giveawayhubs.com brings you the entire list of verified coupons and promo codes of shop.mango.com. Save big on your final bill.', 'mango us,mango coupon usa,mango discount code usa,mango discount code usa,mango usa promo code,mango coupon code usa,mango promo code usa,mango new customer code,mango us promo code,mango usa discount code', 'shop.mango.com COUPONS & PROMO CODES', 'Save and earn while you shop at shop.mango.com', NULL, 'mango-us'),
(14, 4297609, 'Click & Grow', 'Active', 'Home & Garden', 'Garden', 'CJ', 'http://www.clickandgrow.com/', '4297609.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.clickandgrow.com/', 'Click & Grow', 'Click & Grow', 'Click & Grow Discount Coupon Codes and Deals - giveawayhubs.com', 'Click & Grow specialises in smart gardens that help anyone grow fresh food at home with 0 effort. Our technology takes care of plants automatically, making sure they always have enough light, nutrients, and water. Thanks to the Smart Soil we use - plants grow 30% faster while using 95% less water', 'click and grow coupon,click and grow smart garden,smart garden 9,click & grow coupon,click and grow discount code,click and grow promo code,click and grow free shipping,click and grow coupon code,click and grow discount,click & grow discount code,click & grow promo code,click & grow coupon code,click and grow free shipping code,click and grow promo', 'clickandgrow COUPONS & PROMO CODES', 'Save and earn while you shop at clickandgrow.com', 'banner4297609.webp', 'click-grow'),
(15, 4498040, 'Banggood CJ Affiliate Program', 'Active', 'Department Stores/Malls', 'Virtual Malls', 'CJ', 'http://www.banggood.com', '4498040.jpg', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.banggood.com', 'Banggood', 'Banggood', 'Banggood USA Coupons and Promo Codes - giveawayhubs.com', 'giveawayhubs.com brings you the entire list of verified coupons and promo codes of Banggood. Save big on your final bill.', 'banggood,banggood usa,bangood com online shopping,bangood coupon,bangood coupon code,bangood code,bangood promo code,bangood discount code,bangood discount', 'Banggood COUPONS & PROMO CODES', 'Save and earn while you shop at Banggood', 'banner4498040.webp', 'banggood'),
(16, 5262281, 'LovelyWholesale', 'Active', 'Clothing/Apparel', 'Womens', 'CJ', 'http://m.lovelywholesale.com/?tname=curve_plus', '5262281.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://m.lovelywholesale.com/?tname=curve_plus', 'Lovelywholesale', 'Lovelywholesale', 'Save money on stylish fashion with LovelyWholesale.com\'s exclusive coupons! Get the latest coupon codes and discounts on the season\'s hottest trends. Shop now and save!', 'giveawayhubs.com brings you the exclusive list of verified deals and discount coupon codes for LovelyWholesale. catch the coupons now and save big bill.', 'lovelywholesale,lovely wholesale clothing,lovely wholesale coupon,lovelywholesale coupon,lovelywholesale discount,lovelywholesale promo code,lovelywholesale coupon code,lovelywholesale voucher,lovelywholesale discount code,lovelywholesale promotion,lovelywholesale voucher code,lovely wholesale free shipping,lovelywholesale code,lovely wholesale coupons,lovelywholesale coupons 2023,lovely wholesale discount code,lovely wholesale coupon code 2023,lovelywholesale coupon code new customer,coupon code for lovely wholesale,lovelywholesale free shipping,lovely wholesale promo codes,lovelywholesale deals,lovelywholesale free shipping coupon,lovely wholesale promo,lovelywholesale com coupons,lovelywholesale free shipping code', 'LovelyWholesale COUPONS & PROMO CODES', 'Save and earn while you shop at LovelyWholesale', 'banner5262281.webp', 'lovelywholesale'),
(17, 5305691, 'Sleep & Beyond', 'Active', 'Home & Garden', 'Bed & Bath', 'CJ', 'http://www.sleepandbeyond.com', '5305691.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.sleepandbeyond.com', 'Sleep & Beyond', 'Sleep & Beyond', 'Sleep & Beyond Coupons and Promo Codes - giveawayhubs.com', 'Sleep & Beyond are the “Top Three Best Wool Bedding Brands” in the US\r\nWe specialize in certified organic and natural cotton and wool-filled bedding, such as comforters, pillows, sheets, mattress pads, toppers, protectors', 'sleep & beyond,beyond sleep,sleep from beyond,sleep & beyond coupon,sleep and beyond coupon code,sleep and beyond coupon', 'sleepandbeyond COUPONS & PROMO CODES', 'Save and earn while you shop at sleepandbeyond.com', 'banner5305691.webp', 'sleep-beyond'),
(18, 5357356, 'Rexing', 'Active', 'Automotive', 'Cars & Trucks', 'CJ', 'https://www.rexingusa.com/', '5357356.png', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.rexingusa.com/', 'Rexing', 'Rexing', 'Rexing Exclusive Coupons, Promo Codes - giveawayhubs.com', 'giveawayhubs.com brings you the exclusive list of verified deals and discount coupon codes for rexingusa.com. catch the coupons now and save big bill.', 'rexing,rexing m2,rexing coupon,rexing coupon code', 'Rexing COUPONS & PROMO CODES', 'Save and earn while you shop at rexingusa.com', 'banner5357356.webp', 'rexing'),
(19, 5488109, 'KC Chic Designs', 'Active', 'Accessories', 'Jewelry', 'CJ', 'https://www.kcchicdesigns.com/', '5488109.webp', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.kcchicdesigns.com/', NULL, NULL, 'KC Chic Designs Coupons and Promo Codes - giveawayhubs.com', 'KC Chic Designs are a small, family owned business specializing in unique, quality jewelry and accessories', 'kc chic designs,kc chic designs jewelry,kc chic design,kc chic design coupon', 'KC Chic Designs COUPONS & PROMO CODES', 'Save and earn while you shop at kcchicdesigns.com', 'banner5488109.webp', 'kc-chic-designs'),
(20, 5652880, 'Mobisystems Inc', 'Active', 'Computer & Electronics', 'Computer SW', 'CJ', 'https://www.mobisystems.com/en-us/', '5652880.png', NULL, NULL, '2022-11-17 10:55:47', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.mobisystems.com/en-us/', 'Mobisystems Inc', 'Mobisystems Inc', 'Mobisystems Coupons and Promo Codes - giveawayhubs.com', '\"Save money on your favorite apps with Mobisystems coupons! Get exclusive deals and discounts on productivity, security, and multimedia apps for Android, iOS, and Mac.', 'mobisystems,mobisystems coupon', 'Mobisystems COUPONS & PROMO CODES', 'Save and earn while you shop at mobisystems.com', 'banner5652880.webp', 'mobisystems'),
(21, 17653, 'Luxe Cosmetics', 'Active', '', '', 'IR', 'https://www.luxe-cosmetics.com', '17653.webp', 'Luxe Cosmetics offers revolutionary cosmetic products. We produce high-quality cosmetics for eyelashes and eyebrows. All of our products are vegan and not tested on animals. Our products have received multiple awards and are laboratory-tested.', 17653, '2022-12-17 19:36:28', '2023-05-06', 'https://luxecosmetics.pxf.io/c/3324490/1496591/17653', NULL, NULL, 'Luxe cosmetics Coupons and Promo Codes - giveawayhubs.com', 'Save up to 50% off with our exclusive Luxe Cosmetics coupons! Shop for your favorite makeup products and find the perfect look for any occasion.', 'luxe cosmetics,luxe cosmetics us,it cosmetics heavenly luxe brush,bobbi brown luxe eye shadow,luxe makeup,zuzu makeup,it cosmetics dual ended brush,luxe mascara,heavenly luxe complexion perfection brush 7,rimmel wonder luxe mascara,zuzu luxe mascara,heavenly luxe complexion perfection brush,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner17653.webp', 'luxe_cosmetics'),
(22, 16080, 'WalkingPad', 'Active', '', '', 'IR', 'http://www.walkingpad.com', '16080.webp', 'The WalkingPad is the worlds first treadmill with foldable body technology, which has won the German Red Dot Award, the IF Design Award and the Good Design Award.This feature of Walkingpad provides a perfect exercise experience at home, saving more ', 16080, '2022-12-17 19:36:28', '2023-05-06', 'https://walkingpad.pxf.io/c/3324490/1332889/16080', NULL, NULL, 'walking pad Coupons and Promo Codes - giveawayhubs.com', 'Save big with WalkingPad coupons! Get the best deals on the latest and most popular models. Shop now to find the perfect WalkingPad at an unbeatable price.', 'walkingpad,walking pad,walking pad treadmill,walking pad amazon,xiaomi walkingpad,walking pad under desk,walk pad,walkingpad a1,kingsmith r1 pro', NULL, NULL, 'banner16080.webp', 'walkingpad'),
(23, 16960, 'momentwish', 'Active', '', '', 'IR', 'https://momentwish.com/', '16960.webp', 'Momentwish is an affordable luxury jewelry brand inspired by the beauty of Moissanite stones, Carrying the dream of presenting gorgeous and sparkling .Momentwish is emblematic of elegance, having committed torings to women who pursue a tasteful life.', 16960, '2022-12-17 19:36:28', '2023-05-06', 'https://momentwish.pxf.io/c/3324490/1423630/16960', NULL, NULL, 'MomentWish Jewelry - Sparking Moissanite Jewelry For Your Love Story -giveawayhubs.com', 'Save big with the best deals and coupons on momentwish. Find amazing discounts on the products you love, and get the best prices on your purchases!', 'momentwish,momentwish coupon,momentwish coupon code,momentwish discount', NULL, NULL, 'banner16960.jpg', 'momentwish'),
(24, 17606, 'Beneunder', 'Inactive', '', '', 'IR', 'https://shop.beneunder.com', '', 'Benuender is a new urban outdoor brand focusing on multifunctional technology apparel. We are now looking for partners who are willing to join us and can work together.', 17606, '2022-12-17 19:36:28', '2023-05-06', '', NULL, NULL, 'Beneunder Coupons and Promo Codes - giveawayhubs.com', 'Beneunder Coupons and Promo Codes - giveawayhubs.com', 'beneunder,beneunder hat,beneunder sun hat,beneunder umbrella,beneunder shoes,beneunder brand,beneunder coupon,beneunder promo code', NULL, NULL, 'banner17606.avif', 'beneunder'),
(25, 17908, 'Arete Adaptogens', 'Active', '', '', 'IR', 'https://areteadaptogens.com/', '17908.webp', 'Arete offers cutting edge adaptogenic products to enhance your daily performance. Arete is becoming one of the most well known adaptogenic supplement companies in the health & wellness industry by providing the highest quality products around. ', 17908, '2022-12-17 19:36:28', '2023-05-06', 'https://arete-adaptogens.pxf.io/c/3324490/1531343/17908', NULL, NULL, 'Arete Adaptogens Coupons and Promo Codes - giveawayhubs.com', 'Arete Adaptogens Coupon Code & Deals - Get discounts on all-natural superfoods and supplements with our exclusive coupon codes. Shop now and save big!', 'arete adaptogens, arete adaptogens couppon, code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'arete_adaptogens'),
(26, 7968, 'www.livehome3d.com', 'Active', '', '', 'IR', 'http://www.livehome3d.com', '7968.webp', 'Live Home 3D is the powerful yet intuitive home and interior design software that lets you build the house of your dreams right on your Mac. Create detailed floor plan, visualize and walkthrough the interior in 3D.', 7968, '2022-12-17 19:36:28', '2023-05-06', 'https://wwwlivehome3dcom.pxf.io/c/3324490/447137/7968', NULL, NULL, 'Livehome3d Coupons and Promo Codes - giveawayhubs.com', 'Save big on LiveHome3D with exclusive coupon codes and deals. Get the best discounts on the latest version of LiveHome3D software today.', 'code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner7968.png', 'livehome3d'),
(50, 15271, 'Popvil Marketing Campaign ', 'Inactive', '', '', 'IR', 'http://www.popvil.com/', '', 'Popvil is a new online fashion clothing website, focusing on the very latest style of women swimsuits, we provide trendy, obsessed swimsuits to give choices to our valued customers from all over the world.', 15271, '2022-12-20 10:06:16', '2023-05-06', '', NULL, NULL, 'Popvil Marketing Coupons and Promo Codes - giveawayhubs.com', 'Save big on your favorite Popvil products! Check out the latest Popvil coupon codes and deals to get the best discounts on your purchases. Shop now!', 'popvil,popvil shop,popville discount code,popville coupon code,popville swim discount code,popvil swim,popville swim,popvil bikini,popvil uk,popvil swimsuits,popvil swimwear,popville bathing suits', NULL, NULL, 'banner15271.jpg', 'popvil'),
(51, 15833, 'Stardock', 'Active', '', '', 'IR', 'https://www.stardock.com/', '15833.webp', 'Were a software development company that was founded in 1991. We specialize in extending and enriching the Windows experience by allowing you to customize the UI to make Windows more personal and productive.\r\n        ', 15833, '2022-12-20 10:06:16', '2023-05-06', 'https://stardock.pxf.io/c/3324490/1292592/15833', NULL, NULL, 'Stardock Coupons and Promo Codes - giveawayhubs.com', 'Save money on your next Stardock purchase! Get the latest Stardock coupon code & deals. Shop today & save up to 50%!', 'stardock,stardock fences,objectdock,start10,stardock start11,stardock coupon,stardock promo code,stardock coupon code,stardock promotional code,stardock discount code,object desktop promo code,stardock fences promo code,stardock object desktop promo code,stardock start 11 promo code,stardock discount,stardock fences coupon,stardock fences discount code,stardock fences discount,object desktop coupon code,stardock fences coupon code,bject desktop coupon,stardock promo, code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner15833.png', 'stardock'),
(52, 16836, '25home furnishing.com', 'Active', '', '', 'IR', 'https://25home.com', '16836.webp', 'Product of 25Home are premium on-trend furniture with Modern& Scandinavian style empowered by Nordic designers. Our mission is bringing high quality products to customers at fair prices. Our CA warehouse make inventory easy to ship. Our AOV is $3000.', 16836, '2022-12-20 10:06:17', '2023-05-06', 'https://25home.pxf.io/c/3324490/1414515/16836', NULL, NULL, '25home furnishing.com Coupons and Promo Codes - giveawayhubs.com', 'Save 25% on home furnishing with our exclusive coupon codes & deals. Shop for furniture, home decor, appliances & more at unbeatable prices.', '25home,25home furniture,25home.com reviews,25home legit,25home sandwich sectional reviews,25home sofa,25home furniture legit,25home coupon,25home coupon code,25home discount code, code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, '25home'),
(53, 18138, 'Cisne Virtuoso Unip Lda', 'Inactive', '', '', 'IR', 'https://www.zappblack.com', '', 'As a B2C luxury marketplace, Zappblack is committed to selling authentic products sourced directly from authorized and reputable dealers.', 18138, '2022-12-20 10:06:17', '2023-05-06', '', NULL, NULL, 'Cisne Virtuoso Unip Lda Coupons and Promo Codes - giveawayhubs.com', 'Save BIG with Cisne Virtuoso Unip Lda\'s coupon codes and deals on the latest fashion trends! Shop now and get huge discounts on your order!', NULL, NULL, NULL, NULL, 'zappblack'),
(54, 14743, 'SYLVANIA', 'Inactive', '', '', 'IR', 'http://www.shop.ledvanceus.com/', '', 'Sylvania is a leading provider of consumer, professional and architectural lighting solutions. Not only do we design, manufacture and install lighting solutions, we push the boundaries of technology and strive to innovate in everything we do.', 14743, '2022-12-20 10:06:17', '2023-05-06', '', NULL, NULL, 'SYLVANIA Coupons and Promo Codes - giveawayhubs.com', 'SYLVANIA Coupons and Promo Codes - giveawayhubs.com', 'sylvania,sylvania ohio,sylvania bulb guide,sylvania bluetooth speaker,sylvania schools,sylvania head lights,sylvania headlight bulbs,sylvania headlight restoration kit,\r\nsylvania automotive,sylvania auto bulbs,\r\nsylvania funeral home,sylvania bulb lookup,sylvania light bulb,sylvania headlight,sylvania 3157', NULL, NULL, 'banner14743.jpeg', 'sylvania'),
(55, 11653, 'ADOR', 'Active', '', '', 'IR', 'http://www.ador.com', '11653.webp', 'ADOR.com is a professional online fashion clothing boutique. At AODR.com, you will find thousands of products offered at incredible prices. A quick look around our site will reveal our massive range of first-rate goods, fashion clothing, etc. ', 11653, '2022-12-20 10:06:17', '2023-05-06', 'https://ador.sjv.io/c/3324490/829468/11653', NULL, NULL, 'ADOR Coupon Code: Last Chance To Have An Awesome Summer!. Check out our latest coupon, promo & deals and save on all your purchases!', 'Save big with ADOR coupon codes and deals! Find exclusive discounts on fashion, electronics, travel, and more. Shop now and get the best deals!', 'ador,ador hybe,ador world,ador coupon,adoreme promo code,ador coupon code,adoreme coupons,ador discount code,adoreme codes,ador promo code,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner11653.jpeg', 'ador'),
(56, 4482, 'Martinic Audio', 'Active', '', '', 'IR', 'https://www.martinic.com/', '4482.webp', 'Audio software developers with a passion for accurately modeling classic electronic instruments and effects to the highest possible quality. Audio Plugins (Virtual Instruments and Virtual Effects) - VST Plugins, Audio Units.', 4482, '2023-01-12 08:11:28', '2023-05-06', 'https://martinic.evyy.net/c/3324490/281363/4482', NULL, NULL, 'Martinic Audio Promo Code to Save 10% To $50 on Your Order.Free Shipping On All Martinic Audio Products At MartinicAudio.com When You Use The Coupon.', 'Save on music production and audio software with Martinic Audio\'s exclusive coupon codes and deals. Get the best discounts on the top-rated software and hardware today!', 'martinic audio,martinic audio coupon,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner_4482.webp', 'martinic _audio'),
(57, 12845, 'GOVEE', 'Active', '', '', 'IR', 'http://govee.com/', '12845.webp', 'Govee is devoted to enhancing peoples life with smart home technology. Right now we have product categories including smart led lights, bulbs, thermo-hydrometer, water sensor and more, which are all hot selling across all channels.', 12845, '2023-01-12 08:24:39', '2023-05-06', 'https://govee.sjv.io/c/3324490/970740/12845', NULL, NULL, 'GOVEE Discount Coupon Codes and Deals - giveawayhubs.com | Mother’s Day Specials | Up to 35% OFF', 'Grab amazing deals on home decor and appliances with Govee coupons! Save big on the best selection of products for your home. Get your coupon code today!', 'govee,govee lights,govee led lights,govee coupon,govee discount code,govee promo code,govee coupon code,govee code promo,govee codes,govee voucher code,govee eu discount code,govee student discount code,govee lights discount code,govee promo,govee discounts,govee lights coupon code,govee com discount code,govee lights promo code,govee led lights coupon code,govee led lights discount code,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner12845.webp', 'govee'),
(58, 15355, 'Hapbee', 'Active', '', '', 'IR', 'http://hapbee.com', '15355.webp', 'Hapbee imagines a world where every human can unleash the potential theyre born with - the potential to be happy, present, productive and connected. Hapbee is a unique and patented magnetic wearable device that can deliver compounds to your cells\r\n        ', 15355, '2023-01-12 08:31:14', '2023-05-06', 'https://hapbee.sjv.io/c/3324490/1246122/15355', NULL, NULL, 'Hapbee | Smart Sleep &amp; Wellness Wearable Technology -Giveawayhubs.com', 'Unlock exclusive Hapbee discounts and coupon codes with our unbeatable deals. Shop now and save up to 50% off your purchase!', 'hapbee,hapbee smart wearable,hapbee device,hapbee coupon,hapbee discount code,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, 'banner15355.jpg', 'hapbee'),
(59, 5305397, 'Magzter - Digital Magazine Newsstand', 'Active', 'Books/Media', 'Magazines', 'CJ', 'https://www.magzter.com/', '5305397.webp', NULL, NULL, '2023-04-13 13:47:13', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.magzter.com/', NULL, NULL, NULL, NULL, 'magzter,magzter gold,magzter coupon,magzter coupon code,magzter coupon code free,magzter gold coupon,magzter gold coupon code,magzter promo code,magzter offer 2023,magzter discount code,magzter redeem code free,magzter discount,magzter redeem code,magzter deals,magzter subscription deals,magzter gold coupon code free,magzter gold subscription coupon,magzter cashback offer,magzter freecharge offer,magzter subscription coupon,magzter code,magzter free coupon code,magzter gold discount,magzter coupon gold,www magzter coupon gold,coupon for magzter,magzter gold freecharge offer,magzter paytm offer', NULL, NULL, NULL, 'magzter'),
(60, 1457779, 'Newspaper Subscriptions', 'Active', 'Books/Media', 'News', 'CJ', 'http://www.discountednewspapers.com', '1457779.webp', NULL, NULL, '2023-04-13 13:47:14', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.discountednewspapers.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'newspaper_subscriptions'),
(61, 129899, 'BOOKSAMILLION.COM', 'Active', 'Books/Media', 'Books', 'CJ', 'https://www.booksamillion.com', '129899.webp', NULL, NULL, '2023-04-13 13:47:14', '2023-05-04', 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.booksamillion.com', NULL, NULL, 'Booksamillion Discount Coupon Codes and Deals - giveawayhubs.com', NULL, 'booksamillion,books a million hours,booksamillion coupon code,books a million promo code,books a million coupon in store,book a million coupon,books a million free shipping,booksamillion com coupon code', NULL, NULL, NULL, 'booksamillion'),
(62, 9802, 'Novica', 'Active', '', '', 'IR', 'http://www.novica.com', '9802.webp', 'NOVICA, the world’s largest fair-trade online marketplace, strives to create a better global economy by empowering artisans around the world while delivering unique, handmade products to customers.', 9802, '2023-04-19 07:22:25', '2023-05-06', 'https://go.novica.com/c/3324490/597314/9802', NULL, NULL, 'Novica Discount Coupon Codes and Deals - giveawayhubs.com', 'Find the best Novica coupon codes and deals! Save up to 50% on all your favorite Novica products with our exclusive, verified coupons. Shop now!', 'novica,novica jewelry,novica canada,novica outlet,novica com jewelry,novica jewelry sale,novica the impact marketplace,novica wood sculpture,novica store,novica amazon,novica coupon,novica promo code,novica coupon code,novica discount code,novica promo code 2022,novica promo code 2023,novica coupon code 2022,novica coupon code 2023,novica gift code,novica coupon code free shipping,novica com promotional coupon,novica discount,novica promotion code,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'novica'),
(63, 9901, 'BulbHead', 'Active', '', '', 'IR', 'http://www.bulbhead.com', '30945.webp', 'If youre looking for smart solutions to everyday problems, youve come to the right place. We have curated a select mix of innovative and practical products that people won’t want to be without.', 9901, '2023-04-19 07:24:14', '2023-05-06', 'https://bulbhead.uewp.net/c/3324490/604292/9901', NULL, NULL, 'BulbHead Discount Coupon Codes and Deals - giveawayhubs.com', 'Find the best BulbHead coupon codes and deals here! Save money with our exclusive offers; get free shipping, discounts, and more. Shop now & save!', 'bulbhead,bulbhead products,list of bulbhead products,bulbhead coupon,bulbhead coupon code,bulbhead discount code,bulbhead promo code,bulbhead free shipping code', NULL, NULL, NULL, 'bulbHead'),
(64, 14384, 'Gentle Herd', 'Active', '', '', 'IR', 'http://gentleherd.com', '14384.webp', 'Gentle Herd is a designer lifestyle brand committed to producing high-quality cashmere, silk essentials, daily clothes, and accessories for modern women.', 14384, '2023-04-19 07:24:14', '2023-05-06', 'https://gentleherd.pxf.io/c/3324490/1136691/14384', NULL, NULL, 'Gentle Herd Discount Coupon Codes and Deals - giveawayhubs.com', 'Save up to 50% on Gentle Herd\'s high-quality pet products! Shop now and get exclusive coupon codes and deals to help you save even more!', 'gentle herd,gentle herd clothing,gentleherd reviews,gentle herd australia,gentle herd canada,gentle herd coats,gentle herd wool coat,gentle herd coupon,gentle herd coupon code,gentle herd discount code,gentle herd promo code,gentleherd coupon,gentle herd coupon codes,gentleherd coupon code,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'gentle_herd'),
(65, 16834, 'Castlery US', 'Active', '', '', 'IR', 'http://www.castlery.com/us', '16834.webp', 'Castlery is a DTC retailer that designs and produces stylish, modern furniture at a competitive price point without compromising on quality. With timeless design and time-tested durability, Castlery is the brand that creates furniture to thrive in.', 16834, '2023-04-19 07:24:14', '2023-05-06', 'https://castleryus.pxf.io/c/3324490/1414258/16834', NULL, NULL, 'Castlery US Discount Coupon Codes and Deals - giveawayhubs.com', 'Save on luxury furniture with Castlery US coupon codes and deals. Shop designer furniture for your home and get up to 50% off with our exclusive Castlery US discounts.', 'castlery us,castlery coupon code free shipping,castlery us coupon,castlery furniture usa,castlery us furniture,castlery coupon code free shipping,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'castleryUS'),
(66, 7452, 'NordVPN', 'Active', '', '', 'IR', 'http://nordvpn.com', '7452.png', 'The NordVPN service allows you to connect to 5230+ servers in 56+ countries. It secures your Internet data with military-grade encryption, ensures your web activity remains private and helps bypass geographic content restrictions online.', 7452, '2023-05-02 14:49:57', '2023-05-06', 'https://nordvpn.sjv.io/c/3324490/417838/7452', NULL, NULL, 'NordVPN Discount Coupon Codes and Deals - giveawayhubs.com', 'Save money and protect your privacy with the best NordVPN coupon codes and deals. Get the best discounts on your next subscription today!', 'nordvpn coupon code,nordvpn discount,nordvpn deals,nordvpn discount code,nordvpn code,nord vpn discount code,nord vpn discount,nordvpn promo code,nordvpn promo,nordvpn voucher,nord vpn promo,best nordvpn deal,vpn discount,nord vpn promo code,nordvpn youtuber codes,nordvpn discount code reddit,nordvpn promo code reddit,nordvpn redeem code free,nordvpn coupon code reddit,nord vpn voucher,ordvpn coupons 2023,nordvpn discount coupon,best nordvpn discount,nordvpn student discounts', NULL, NULL, NULL, 'nordVPN'),
(67, 7969, 'www.swiftpublisher.com', 'Active', '', '', 'IR', 'http://www.swiftpublisher.com', '7969.png', 'Swift Publisher is a page layout and desktop publishing software for Mac that provides all you need for creating professional-looking flyers, brochures, catalogs, magazines, booklets, newsletters, posters, menus, cards, and many more.', 7969, '2023-05-02 14:49:57', '2023-05-06', 'https://wwwswiftpublishercom.sjv.io/c/3324490/447139/7969', NULL, NULL, 'Swift Publisher Coupon Codes And Deals. SwiftPublisher Coupon Code| Extra 10% Discount.', 'Save on your favorite design tools with SwiftPublisher coupon code & deals. Get the best discounts on SwiftPublisher and design like a pro!', 'swiftpublisher coupon code.', NULL, NULL, NULL, 'swiftpublisher'),
(68, 12594, 'Sleep and Beyond', 'Active', '', '', 'IR', 'http://sleepandbeyond.com', '12594.webp', 'Sleep & Beyond is “Top Three Best Wool Bedding Brands” in the USA. We specialize in certified organic, natural cotton, and wool-filled bedding, such as comforters, pillows, sheets, mattress pads, toppers, protectors, and more. We offer 10% per sale.', 12594, '2023-05-02 14:49:57', '2023-05-06', 'https://sleepandbeyond.sjv.io/c/3324490/924876/12594', NULL, NULL, 'Sleep And Beyond Coupon Code. Get 15% Off Your Sleep & Beyond Order Today!', 'Save big on your next mattress purchase with Sleep and Beyond coupon codes and deals. Find the best deals and discounts on mattresses, bedding, and more.', 'sleep and beyond coupon code,sleep and beyond coupon,sleep & beyond coupon,Secrets of Sleeping Well, code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'sleepAndBeyond'),
(69, 13512, 'Naploungewear', 'Active', '', '', 'IR', 'http://www.naploungewear.com', '13512.png', 'Nap was established in the summer of 2020. It is a designer brand that represents modernity, simplicity, and fashion. NAP is devoted to producing high-quality loungewear and home products that embody our philosophy.', 13512, '2023-05-02 14:49:57', '2023-05-06', 'https://naploungewear.sjv.io/c/3324490/1038914/13512', NULL, NULL, 'Naploungewear Promo Code, Coupons And Deals', 'Shop Nap Loungewear for comfort and style and save money with our coupon codes and deals. Get the best in cozy loungewear and save!', 'naploungewear coupon code and deal.Summer Dress Sale, Get $100 Off.For Veterans & Military Only!', NULL, NULL, NULL, 'naploungewear'),
(70, 18020, 'Hey Abby Growbox', 'Active', '', '', 'IR', 'https://heyabby.com', '18020.png', 'Building the worlds first automated grow box wasnt all that we set out to do. We wanted to bring users together into a growing community to share their knowledge and experience and to reward the users for reaching their new milestones. ', 18020, '2023-05-02 14:49:57', '2023-05-06', 'https://heyabby.sjv.io/c/3324490/1543906/18020', NULL, NULL, 'Hey Abby Growbox Promo Code, Offers And Free Shipping. Hey Abby - Get 15% Off First Growbox!', 'Hey Abby Growbox: Get the best deals with our exclusive coupon code & discounts. Shop now and save up to 50% off your order!', 'hey abby growbox coupon code and deal.Hey Abby: New growbox coupon code and deal.Hey Abigail - Best Deals On Grow Boxes, Best Coupon Codes, Discount Promo.Hey Abby: GrowBox: The Ultimate Gardening Kit for the Urban Gardeners in Your Life,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'HeyAbbyGrowbox'),
(71, 17986, 'Collov Inc.', 'Active', '', '', 'IR', 'https://collov.com', '17986.png', 'Collov.com, the virtual interior design and shopping platform!\r\n        \r\n        AFFILIATE PROGRAM HIGHLIGHTS\r\n        · 30% commission rate for the design package\r\n        · 3% commission rate for the furniture product\r\n        · 60-day cookie duration\r\n        · Up to $58 COMM for each sale', 17986, '2023-05-02 14:49:57', '2023-05-06', 'https://collovinc.sjv.io/c/3324490/1542122/17986', NULL, NULL, 'Collov Inc coupon codes and discounts. Save $10 with Collov coupon code.', 'Save big on your next purchase with Collov Inc! Get exclusive coupons and deals to save even more on your favorite products. Shop now and start saving!. 20% Off Your First Order With Collov Inc', 'collov coupon code and deal.Best coupons code and deals. ( coupon code and deal ).Top 5 More Creative And Unique Diy Christmas Gifts.', NULL, NULL, NULL, 'collov'),
(72, 17988, 'Consdan Hardwood Furniture', 'Active', '', '', 'IR', 'https://store.consdan.com', '17988.png', 'With a solid knowledge of North American hardwood, CONSDAN started to make our own wood products and we are committed to building a hardwood brand and providing high-quality items.', 17988, '2023-05-02 14:49:57', '2023-05-06', 'https://consdanhardwoodfurniture.sjv.io/c/3324490/1542126/17988', NULL, NULL, 'Consdan Hardwood Furniture Free Shipping Coupon Code.Get 20% Off Consdan Furniture Coupon Code.', 'Save on premium hardwood furniture with Consdan\'s exclusive coupon codes and deals. Shop now and get the style and quality you deserve at a price you can afford!', 'consdan hardwood furniture coupon code and deal.Dan Hardwood Furniture Coupon Code & Discount Codes.Uncontrollably Promo Code | 15% Shopping Discount.Leave our home sweet home and travel the world with consdan\'s travel deals.Dan Hardwood,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'ConsdanHardwoodFurniture'),
(73, 6342639, 'Vantrue', 'Active', 'Automotive', 'Parts & Accessories', 'CJ', 'https://www.vantrue.com/', '6342639.webp', 'The Vantrue online store offers the latest and greatest in car accessories, dash cams, and more. Shop now for unbeatable prices and free shipping!', NULL, '2023-05-04 16:55:01', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/https://www.vantrue.com/', NULL, NULL, 'Experience quality, reliable dash cams from Vantrue. With a wide selection to choose from, you can find the perfect fit for your car and driving needs!', 'Save big with Vantrue coupon codes. Get the latest discounts for top car electronics, dash cams, and more. Shop now and start saving!', 'vantrue,vantrue coupon code,vantrue promo code,vantrue,vantrue n4,vantrue dash cam,vantrue n2 pro,vantrue n1 pro,vantrue x4s,vantrue e1,vantrue n2s\r\n', NULL, NULL, NULL, 'vantrue'),
(74, 6396589, 'Mojo Boutique', 'Active', 'Home & Garden', 'Furniture', 'CJ', 'https://mojoboutique.com/', '6396589.webp', 'Look your best in the latest fashion trends from Mojo Boutique. Shop our selection of stylish clothing and accessories for men, women, and kids. Shop designer fashion from around the world at Mojo Boutique! Find the perfect look for any occasion today, with free shipping on orders over $50', NULL, '2023-05-04 16:55:01', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/https://mojoboutique.com/', NULL, NULL, 'Look your best in the latest fashion trends from Mojo Boutique. Shop our selection of stylish clothing and accessories for men, women, and kids.', 'Shop the latest trends at Mojo Boutique and save big with our exclusive coupon code! Get the best discounts on clothes, shoes, and accessories for all occasions. Hurry, limited time offer!', 'mojo boutique,boutique hotel mojo,mojo m villa airport boutique hotel,hotel mojo tbilisi,mojo boutique coupon code', NULL, NULL, NULL, 'mojoboutique'),
(75, 6456462, 'THXSILK', 'Active', 'Home & Garden', 'Bed & Bath', 'CJ', 'http://www.thxsilk.com', '6456462.webp', NULL, NULL, '2023-05-04 16:55:01', NULL, 'https://www.jdoqocy.com/links/100566409/type/dlg/http://www.thxsilk.com', NULL, NULL, 'Experience the luxury of THXSILK, the highest quality silk bedding available. Our products are designed for maximum comfort and softness. Shop now!', 'Save up to 50% off with the latest THXSILK Coupon Code. Get the best deals on high-quality silk bedding, sleepwear, and more with free shipping today!', 'thxsilk,thxsilk reviews,thx silk reviews,thxsilk coupon,thxsilk coupon code,thxsilk discount code,thxsilk promo code,thx silk discount code', NULL, NULL, NULL, 'thxsilk'),
(76, 14403, 'Apotheke', 'Active', '', '', 'IR', 'http://www.apothekeco.com', '14403.webp', 'Apotheke is a luxury home fragrance brand that believes scent transforms a house into a home, elevates our mood, and helps keep memories alive. We believe fragrance can be simple yet captivating, and products should be beautiful and attainable.', 14403, '2023-05-06 05:27:42', '2023-05-06', 'https://apotheke.pxf.io/c/3324490/1138195/14403', NULL, NULL, 'Apotheke is your one-stop shop for all your health and wellness needs. We offer top-notch products and personalized service to help you live a healthier life. Shop now!', 'Discover amazing Apotheke coupon codes! Get up to 75% off on your next purchase and save big with our exclusive deals. Shop now and save!', 'apotheke,hepathrombin,elevit 3,enelbin,mobilat intens,apotheke coupon,shop apotheke coupon code,apotheke discount code,apotheke coupon code,shop apotheke discount code,apotheke promo code,docmorris coupon code,apo rot coupon,aliva coupon,code, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'apotheke'),
(77, 17663, 'Zamatsleep', 'Active', '', '', 'IR', 'https://zamatsleep.com/', '17663.webp', 'ZAMAT, a dedicated team focused on innovative cervical pillows for comfortable sleep and neck health since 2017. Zamat pillows have been recommended by Forbes, USA Today, Healthline, etc. We have 1,000,000+ happy customers.', 17663, '2023-05-06 05:27:42', '2023-05-06', 'https://zamatsleep.pxf.io/c/3324490/1497541/17663', NULL, NULL, 'Zamat Sleep: Get the restful sleep you deserve with our natural, non-toxic sleep products. Enjoy a deeper, healthier sleep experience today!', 'Save money and get a better night\'s sleep with our exclusive Zamat Sleep Coupon! Get 15% off your first purchase and enjoy a deep, rejuvenating sleep.', 'zamat sleep,code,zamat contour memory foam pillow, zamat sleep coupon, discounts, coupons, promotional, promo, promotion, deal', NULL, NULL, NULL, 'zamatsleep');

-- --------------------------------------------------------

--
-- Table structure for table `store_cat_map`
--

CREATE TABLE `store_cat_map` (
  `id` int NOT NULL,
  `affiliated_store_id` bigint NOT NULL,
  `dated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catid` varchar(50) DEFAULT NULL,
  `type` enum('N','P') DEFAULT 'N' COMMENT 'N=NormalStore, P=Popular'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `store_cat_map`
--

INSERT INTO `store_cat_map` (`id`, `affiliated_store_id`, `dated`, `catid`, `type`) VALUES
(1, 5618, '2022-09-08 17:59:35', '62', 'N'),
(2, 5846, '2022-09-08 18:46:14', '1', 'N'),
(3, 5903, '2022-09-08 18:56:48', '1', 'N'),
(4, 9989, '2022-09-08 18:56:54', '1', 'N'),
(5, 15929, '2022-09-08 19:24:13', '54', 'N'),
(6, 16873, '2022-09-08 19:24:15', '54', 'N'),
(7, 17203, '2022-09-08 19:24:18', '14', 'N'),
(8, 24631, '2022-09-08 19:24:20', '103', 'N'),
(9, 112418, '2022-09-08 19:24:23', '120', 'N'),
(10, 729207, '2022-09-08 19:24:27', '98', 'N'),
(11, 1124214, '2022-09-08 22:18:19', '98', 'N'),
(12, 3259243, '2022-09-08 22:18:22', '120', 'N'),
(13, 3350021, '2022-09-08 22:18:25', '54', 'N'),
(14, 4297609, '2022-09-08 22:18:28', '120', 'N'),
(15, 4498040, '2022-09-08 22:18:31', '73', 'N'),
(16, 5262281, '2022-09-08 22:18:33', '54', 'N'),
(17, 5305691, '2022-09-08 23:23:04', '120', 'N'),
(18, 5357356, '2022-09-08 23:23:04', '7', 'N'),
(19, 5488109, '2022-09-08 23:48:26', '1', 'N'),
(20, 5652880, '2022-09-08 23:48:29', '68', 'N'),
(21, 17653, '2022-09-08 23:48:31', '103', 'N'),
(22, 16080, '2022-09-08 23:48:33', '14', 'N'),
(25, 17908, '2022-09-08 23:51:55', '103', 'N'),
(26, 7968, '2022-09-08 23:51:55', '68', 'N'),
(27, 15271, '2022-09-08 23:51:57', '62', 'N'),
(28, 15833, '2022-09-08 23:51:57', '62', 'N'),
(29, 16836, '2022-09-08 23:52:01', '14', 'N'),
(31, 14743, '2022-12-06 21:43:20', '1', 'N'),
(32, 11653, '2022-12-06 21:43:20', '54', 'N'),
(33, 4482, '2022-12-06 21:43:20', '68', 'N'),
(34, 12845, '2022-12-06 21:43:20', '68', 'N'),
(35, 15355, '2022-12-06 21:43:20', '103', 'N'),
(36, 5305397, '2022-12-06 21:43:20', '26', 'N'),
(37, 1457779, '2022-12-06 21:43:20', '26', 'N'),
(38, 129899, '2022-12-06 21:43:20', '26', 'N'),
(39, 9802, '2022-12-06 21:43:20', '54', 'N'),
(40, 9901, '2022-12-06 21:43:20', '120', 'N'),
(41, 14384, '2022-12-06 21:43:20', '1', 'N'),
(42, 16834, '2022-12-06 21:43:20', '120', 'N'),
(82, 7452, '2023-05-02 15:04:40', '62', 'N'),
(83, 7969, '2023-05-02 15:05:31', '68', 'N'),
(84, 12594, '2023-05-02 15:06:54', '120', 'N'),
(85, 13512, '2023-05-02 15:08:16', '54', 'N'),
(86, 18020, '2023-05-02 15:10:01', '68', 'N'),
(87, 17986, '2023-05-02 15:11:17', '14', 'N'),
(88, 17988, '2023-05-02 15:12:44', '1', 'N'),
(89, 17988, '2023-05-02 15:15:51', '120', 'N'),
(90, 12594, '2023-05-02 15:17:52', '1', 'N'),
(91, 18020, '2023-05-02 15:19:11', '120', 'N'),
(92, 6396589, '2023-05-04 17:00:34', '120', 'N'),
(93, 6456462, '2023-05-04 17:00:34', '1', 'N'),
(94, 6342639, '2023-05-04 17:01:01', '120', 'N'),
(95, 6456462, '2023-05-04 17:01:01', '120', 'N'),
(96, 17663, '2023-05-06 09:16:51', '103', 'N'),
(97, 14403, '2023-05-06 09:18:10', '98', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `track_googlebot`
--

CREATE TABLE `track_googlebot` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `bot` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `track_googlebot`
--

INSERT INTO `track_googlebot` (`id`, `date`, `time`, `url`, `bot`, `ip`) VALUES
(1, '2023-04-12', '13:8:37', '/login?code=code_9399', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(2, '2023-04-12', '13:8:38', '/login?code=code_9399', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(3, '2023-04-12', '13:8:45', '/login?code=code_9399', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(4, '2023-04-12', '13:8:52', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(5, '2023-04-12', '13:9:2', '/login?code=code_9399', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(6, '2023-04-12', '13:9:12', '/login?code=code_9399', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(7, '2023-04-12', '14:0:10', '/', 'python-requests/2.21.0', '::ffff:127.0.0.1'),
(8, '2023-04-12', '20:24:44', '/assets/admin/global/plugins/jquery_uploader/server/php/index.php?file=tf2rghf.jpg', 'ALittle Client', '::ffff:127.0.0.1'),
(9, '2023-04-13', '0:36:39', '/', 'Go-http-client/1.1', '::ffff:127.0.0.1'),
(10, '2023-04-13', '2:51:52', '/', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/111.0.5563.64 Safari/537.36', '::ffff:127.0.0.1'),
(11, '2023-04-13', '10:35:2', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(12, '2023-04-13', '10:35:4', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(13, '2023-04-13', '10:35:12', '/privacypolicy', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(14, '2023-04-13', '10:35:15', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(15, '2023-04-13', '10:35:25', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(16, '2023-04-13', '10:35:29', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(17, '2023-04-13', '11:9:10', '/google4579d900a5c186c3.html', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(18, '2023-04-13', '11:9:10', '/googlee4193188abb15cab.html', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(19, '2023-04-13', '11:9:11', '/', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(20, '2023-04-13', '11:9:11', '/', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(21, '2023-04-13', '11:9:17', '/google4579d900a5c186c3.html', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(22, '2023-04-13', '11:9:18', '/googlee4193188abb15cab.html', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(23, '2023-04-13', '11:14:6', '/googlee4193188abb15cab.html', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(24, '2023-04-13', '11:14:19', '/', 'Mozilla/5.0 (compatible; Google-Site-Verification/1.0)', '::ffff:127.0.0.1'),
(25, '2023-04-13', '11:15:53', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(26, '2023-04-13', '11:15:55', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(27, '2023-04-13', '11:16:30', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(28, '2023-04-13', '11:16:31', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(29, '2023-04-13', '11:16:47', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(30, '2023-04-13', '11:16:48', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(31, '2023-04-13', '11:21:31', '/', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(32, '2023-04-13', '11:21:33', '/', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(33, '2023-04-13', '11:21:35', '/deals/stores/all', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(34, '2023-04-13', '11:21:36', '/deals/stores/25home', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(35, '2023-04-13', '11:21:38', '/deals/stores/california-tea-house', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(36, '2023-04-13', '11:21:39', '/deals/stores/elpumps', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(37, '2023-04-13', '11:21:40', '/', '\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/78.0.3882.0 Safari/537.36\"', '::ffff:127.0.0.1'),
(38, '2023-04-13', '11:21:41', '/deals/stores/eufy', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(39, '2023-04-13', '11:21:43', '/deals/stores/goldia', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(40, '2023-04-13', '11:21:44', '/deals/stores/justflowers', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(41, '2023-04-13', '11:21:46', '/deals/stores/sleep-beyond', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(42, '2023-04-13', '11:21:48', '/deals/stores/sunshine-jewelry', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(43, '2023-04-13', '11:21:49', '/deals/stores/walkingpad', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(44, '2023-04-13', '11:21:51', '/deals/stores/momentwish', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(45, '2023-04-13', '11:21:52', '/deals/categories', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(46, '2023-04-13', '11:21:54', '/deals/accessories', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(47, '2023-04-13', '11:21:55', '/deals/appliances', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(48, '2023-04-13', '11:21:56', '/deals/auto', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(49, '2023-04-13', '11:21:58', '/deals/beauty', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(50, '2023-04-13', '11:21:59', '/deals/clothing', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(51, '2023-04-13', '11:22:0', '/deals/computers', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(52, '2023-04-13', '11:22:2', '/deals/department-stores-malls', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(53, '2023-04-13', '11:22:3', '/deals/garden', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(54, '2023-04-13', '11:22:5', '/deals/gifts-flowers', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(55, '2023-04-13', '11:22:6', '/deals/health-wellness', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(56, '2023-04-13', '11:22:7', '/login', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(57, '2023-04-13', '11:22:9', '/register', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(58, '2023-04-13', '11:22:10', '/deals', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(59, '2023-04-13', '11:22:12', '/deals/stores/click-grow', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(60, '2023-04-13', '11:22:14', '/deals/stores/justfashionnow', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(61, '2023-04-13', '11:22:15', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(62, '2023-04-13', '11:22:17', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(63, '2023-04-13', '11:22:18', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(64, '2023-04-13', '11:22:19', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(65, '2023-04-13', '11:22:21', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(66, '2023-04-13', '11:22:22', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(67, '2023-04-13', '11:22:23', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(68, '2023-04-13', '11:22:25', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(69, '2023-04-13', '11:22:26', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(70, '2023-04-13', '11:22:28', '/404', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(71, '2023-04-13', '11:22:29', '/deals/stores/namecheap', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(72, '2023-04-13', '11:22:31', '/deals/stores/ador', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(73, '2023-04-13', '11:22:33', '/deals/stores/popilush', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(74, '2023-04-13', '11:22:34', '/aboutus', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(75, '2023-04-13', '11:22:35', '/termsofuse', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(76, '2023-04-13', '11:22:37', '/privacypolicy', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(77, '2023-04-13', '11:22:38', '/disclosures', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(78, '2023-04-13', '11:22:39', '/contact', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(79, '2023-04-13', '11:22:41', '/sitemap', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(80, '2023-04-13', '11:22:42', '/deals/stores/all/a', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(81, '2023-04-13', '11:22:43', '/deals/stores/all/b', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(82, '2023-04-13', '11:22:45', '/deals/stores/all/c', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(83, '2023-04-13', '11:22:46', '/deals/stores/all/d', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(84, '2023-04-13', '11:22:48', '/deals/stores/all/e', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(85, '2023-04-13', '11:22:49', '/deals/stores/all/f', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(86, '2023-04-13', '11:22:50', '/deals/stores/all/g', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(87, '2023-04-13', '11:22:52', '/deals/stores/all/h', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(88, '2023-04-13', '11:22:53', '/deals/stores/all/i', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(89, '2023-04-13', '11:22:55', '/deals/stores/all/j', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(90, '2023-04-13', '11:22:56', '/deals/stores/all/k', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(91, '2023-04-13', '11:22:57', '/deals/stores/all/l', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(92, '2023-04-13', '11:22:59', '/deals/stores/all/m', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(93, '2023-04-13', '11:23:0', '/deals/stores/all/n', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(94, '2023-04-13', '11:23:1', '/deals/stores/all/o', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(95, '2023-04-13', '11:23:4', '/deals/stores/all/p', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(96, '2023-04-13', '11:23:6', '/deals/stores/all/q', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(97, '2023-04-13', '11:23:7', '/deals/stores/all/r', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(98, '2023-04-13', '11:23:8', '/deals/stores/all/s', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(99, '2023-04-13', '11:23:10', '/deals/stores/all/t', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(100, '2023-04-13', '11:23:11', '/deals/stores/all/u', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(101, '2023-04-13', '11:23:13', '/deals/stores/all/v', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(102, '2023-04-13', '11:23:14', '/deals/stores/all/w', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(103, '2023-04-13', '11:23:15', '/deals/stores/all/x', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(104, '2023-04-13', '11:23:17', '/deals/stores/all/y', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(105, '2023-04-13', '11:23:18', '/deals/stores/all/z', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(106, '2023-04-13', '11:23:19', '/deals/stores/all/0-9', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(107, '2023-04-13', '11:23:21', '/deals/stores/rexing', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(108, '2023-04-13', '11:23:23', '/deals/stores/lovelywholesale', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(109, '2023-04-13', '11:23:24', '/deals/stores/zchocolat', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(110, '2023-04-13', '11:23:26', '/deals/stores/claris-housewares', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(111, '2023-04-13', '11:23:28', '/deals/home', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(112, '2023-04-13', '11:23:39', '/deals/stores/kc-chic-designs', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(113, '2023-04-13', '11:23:43', '/deals/stores/appliancesconnection', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(114, '2023-04-13', '11:23:51', '/deals/accessories/handbags', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(115, '2023-04-13', '11:23:53', '/deals/accessories/mens-jewelery', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(116, '2023-04-13', '11:23:54', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(117, '2023-04-13', '11:23:56', '/deals/appliances/home-appliances', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(118, '2023-04-13', '11:23:57', '/deals/appliances/kitchen-appliances', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(119, '2023-04-13', '11:23:58', '/deals/auto/motorcycles', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(120, '2023-04-13', '11:24:0', '/deals/beauty/cosmetics', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(121, '2023-04-13', '11:24:1', '/deals/clothing/active-wear', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(122, '2023-04-13', '11:24:3', '/deals/clothing/womens-clothing', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(123, '2023-04-13', '11:24:4', '/deals/computers/accessories-peripherals', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(124, '2023-04-13', '11:24:6', '/deals/computers/laptops-computers', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(125, '2023-04-13', '11:24:7', '/deals/department-stores-malls/virtual-malls', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(126, '2023-04-13', '11:24:9', '/deals/garden/equipments', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(127, '2023-04-13', '11:24:10', '/deals/garden/flowers-plants', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(128, '2023-04-13', '11:24:11', '/deals/garden/garden-tools', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(129, '2023-04-13', '11:24:13', '/deals/garden/seeds-fertilizers', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(130, '2023-04-13', '11:24:14', '/deals/gifts-flowers/collectibles', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(131, '2023-04-13', '11:24:15', '/deals/gifts-flowers/flowers', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(132, '2023-04-13', '11:24:17', '/deals/gifts-flowers/gifts', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(133, '2023-04-13', '11:24:18', '/deals/gifts-flowers/greeting-cards', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(134, '2023-04-13', '11:24:19', '/deals/health-wellness/nutritional-supplements', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(135, '2023-04-13', '11:24:21', '/deals/health-wellness/weight-loss', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(136, '2023-04-13', '11:24:22', '/deals/home/furniture', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(137, '2023-04-13', '11:24:23', '/deals/home/home-decor', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(138, '2023-04-13', '11:24:25', '/deals/home/mattress-bedding', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(139, '2023-04-13', '11:24:27', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(140, '2023-04-13', '11:24:27', '/deals/stores/luxe_cosmetics', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(141, '2023-04-13', '11:24:29', '/deals/stores/mango-us', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(142, '2023-04-13', '11:24:30', '/deals/stores/beneunder', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(143, '2023-04-13', '11:24:32', '/deals/stores/popvil', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(144, '2023-04-13', '11:24:33', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(145, '2023-04-13', '11:24:34', '/deals/stores/mobisystems', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(146, '2023-04-13', '11:24:36', '/deals/stores/stardock', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(147, '2023-04-13', '11:24:37', '/deals/stores/banggood', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(148, '2023-04-13', '11:24:38', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(149, '2023-04-13', '11:24:39', '/deals/stores/arete_adaptogens', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(150, '2023-04-13', '11:24:41', '/forgot-password', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(151, '2023-04-13', '11:24:55', '/deals/stores/govee', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(152, '2023-04-13', '11:24:56', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(153, '2023-04-13', '11:24:58', '/deals/stores/hapbee', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(154, '2023-04-13', '11:24:59', '/deals/stores/martinic%20_audio', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(155, '2023-04-13', '11:25:8', '/deals/stores/livehome3d', 'Mozilla/5.0 (compatible; XML Sitemaps Generator; www.xml-sitemaps.com) Gecko XML-Sitemaps/1.0', '::ffff:127.0.0.1'),
(156, '2023-04-13', '11:28:46', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(157, '2023-04-13', '11:28:51', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(158, '2023-04-13', '11:28:56', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(159, '2023-04-13', '11:29:13', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(160, '2023-04-13', '11:29:55', '/', 'Mozilla/5.0 (compatible; SemrushBot-SI/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(161, '2023-04-13', '11:30:4', '/', 'Mozilla/5.0 (compatible; SemrushBot-SI/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(162, '2023-04-13', '11:53:5', '/login?code=code_5642', 'WhatsApp/2.23.6.76 A', '::ffff:127.0.0.1'),
(163, '2023-04-13', '12:3:5', '/', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(164, '2023-04-13', '12:3:7', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(165, '2023-04-13', '12:3:36', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(166, '2023-04-13', '12:3:38', '/', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(167, '2023-04-13', '12:4:2', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(168, '2023-04-13', '12:6:32', '/login?code=code_5729', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(169, '2023-04-13', '12:6:34', '/login?code=code_5729', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(170, '2023-04-13', '12:6:41', '/login?code=code_5729', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(171, '2023-04-13', '12:13:32', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(172, '2023-04-13', '12:13:39', '/runtime.29178c88c03168a8.js', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(173, '2023-04-13', '12:13:43', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(174, '2023-04-13', '12:13:45', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(175, '2023-04-13', '13:27:55', '/login?code=code_8833', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(176, '2023-04-13', '13:27:55', '/login?code=code_8833', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(177, '2023-04-13', '13:27:58', '/login?code=code_8833', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(178, '2023-04-13', '13:28:1', '/login?code=code_8833', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(179, '2023-04-13', '13:28:1', '/login?code=code_8833', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(180, '2023-04-13', '13:52:5', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(181, '2023-04-13', '14:8:17', '/', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(182, '2023-04-13', '14:40:41', '/deals/stores/stardock', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(183, '2023-04-13', '15:32:41', '/deals/stores/livehome3d', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(184, '2023-04-13', '16:24:41', '/deals/stores/stardock', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(185, '2023-04-13', '17:44:21', '/terms-Condition', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(186, '2023-04-13', '18:8:35', '/deals/stores/livehome3d', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(187, '2023-04-13', '19:14:21', '/terms-Condition', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(188, '2023-04-13', '19:26:18', '/', 'Mozilla/5.0 zgrab/0.x', '::ffff:127.0.0.1'),
(189, '2023-04-13', '19:26:18', '/', 'Mozilla/5.0 zgrab/0.x', '::ffff:127.0.0.1'),
(190, '2023-04-13', '23:26:18', '/', 'Mozilla/5.0 zgrab/0.x', '::ffff:127.0.0.1'),
(191, '2023-04-13', '23:26:18', '/', 'Mozilla/5.0 zgrab/0.x', '::ffff:127.0.0.1'),
(192, '2023-04-13', '23:33:55', '/deals', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(193, '2023-04-14', '1:27:58', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(194, '2023-04-14', '7:7:4', '/contact', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(195, '2023-04-14', '8:33:36', '/contact', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(196, '2023-04-14', '9:24:35', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(197, '2023-04-14', '15:14:42', '/deals/stores/stardock', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(198, '2023-04-14', '16:53:1', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(199, '2023-04-14', '17:26:10', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(200, '2023-04-15', '0:41:29', '/deals/stores/stardock', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(201, '2023-04-15', '10:2:20', '/', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', '::ffff:127.0.0.1'),
(202, '2023-04-15', '10:30:15', '/deals/stores/all/c', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(203, '2023-04-15', '11:25:27', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(204, '2023-04-15', '11:31:44', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(205, '2023-04-15', '11:38:3', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(206, '2023-04-15', '12:16:34', '/deals/stores/walkingpad', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(207, '2023-04-15', '12:23:14', '/deals/stores/popvil', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(208, '2023-04-15', '12:27:52', '/deals/stores/martinic%20_audio', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(209, '2023-04-15', '12:32:56', '/deals/stores/mango-us', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(210, '2023-04-15', '12:39:18', '/deals/stores/all/y', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(211, '2023-04-15', '12:44:38', '/deals/stores/all/s', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(212, '2023-04-15', '12:50:1', '/deals/stores/all/o', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(213, '2023-04-15', '12:55:29', '/deals/gifts-flowers', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(214, '2023-04-15', '13:8:54', '/deals/beauty/cosmetics', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(215, '2023-04-15', '13:14:21', '/deals/beauty', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(216, '2023-04-15', '13:20:6', '/deals/accessories/mens-jewelery', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(217, '2023-04-15', '15:24:5', '/deals/accessories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(218, '2023-04-15', '17:29:51', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(219, '2023-04-15', '19:1:40', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(220, '2023-04-15', '19:7:42', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(221, '2023-04-15', '19:55:27', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(222, '2023-04-15', '20:32:28', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(223, '2023-04-15', '21:31:12', '/', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(224, '2023-04-15', '21:35:45', '/deals/stores/momentwish', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(225, '2023-04-15', '22:5:50', '/deals/garden', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(226, '2023-04-15', '22:19:36', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(227, '2023-04-16', '0:40:18', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(228, '2023-04-16', '0:57:45', '/sitemap', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(229, '2023-04-16', '1:10:35', '/deals/stores/all/v', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(230, '2023-04-16', '1:46:7', '/deals/categories', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(231, '2023-04-16', '2:10:3', '/deals/categories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(232, '2023-04-16', '4:8:23', '/deals/stores/stardock', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(233, '2023-04-16', '4:24:6', '/deals/stores/sunshine-jewelry', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(234, '2023-04-16', '4:28:20', '/deals/stores/justfashionnow', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(235, '2023-04-16', '6:35:52', '/deals/stores/all/r', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(236, '2023-04-16', '7:12:12', '/', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '::ffff:127.0.0.1'),
(237, '2023-04-16', '7:24:4', '/deals/categories', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(238, '2023-04-16', '8:6:23', '/deals/stores/hapbee', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(239, '2023-04-16', '10:17:50', '/', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '::ffff:127.0.0.1'),
(240, '2023-04-16', '10:44:4', '/register', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(241, '2023-04-16', '11:29:4', '/deals/stores/popvil', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(242, '2023-04-16', '11:29:6', '/deals/stores/stardock', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(243, '2023-04-16', '12:13:16', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(244, '2023-04-16', '12:14:4', '/register', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(245, '2023-04-16', '12:19:43', '/deals/stores/zchocolat', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(246, '2023-04-16', '12:21:44', '/deals/stores/rexing', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(247, '2023-04-16', '12:23:34', '/deals/stores/elpumps', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(248, '2023-04-16', '12:25:47', '/deals/stores/all/u', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(249, '2023-04-16', '12:28:2', '/deals/stores/all/i', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(250, '2023-04-16', '12:30:26', '/deals/stores/ador', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(251, '2023-04-16', '12:32:1', '/deals/gifts-flowers/gifts', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(252, '2023-04-16', '12:34:1', '/deals/appliances/kitchen-appliances', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(253, '2023-04-16', '12:36:49', '/deals/accessories', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(254, '2023-04-16', '12:38:12', '/contact', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(255, '2023-04-16', '12:42:5', '/deals/stores/popvil', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(256, '2023-04-16', '13:44:4', '/deals/stores/stardock', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(257, '2023-04-16', '14:38:36', '/deals/garden/equipments', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(258, '2023-04-16', '15:13:27', '/deals/stores/goldia', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(259, '2023-04-16', '15:15:45', '/deals/stores/arete_adaptogens', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(260, '2023-04-16', '15:22:7', '/deals/stores/all/n', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(261, '2023-04-16', '15:23:41', '/deals/clothing', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(262, '2023-04-16', '15:26:56', '/deals/appliances/home-appliances', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(263, '2023-04-16', '15:28:43', '/deals/appliances', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(264, '2023-04-17', '0:25:50', '/deals/stores/mobisystems', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(265, '2023-04-17', '1:27:13', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(266, '2023-04-17', '1:30:12', '/deals/stores/claris-housewares', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(267, '2023-04-17', '1:36:21', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(268, '2023-04-17', '1:44:46', '/deals/stores/govee', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1');
INSERT INTO `track_googlebot` (`id`, `date`, `time`, `url`, `bot`, `ip`) VALUES
(269, '2023-04-17', '1:50:48', '/deals/stores/all/e', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(270, '2023-04-17', '1:59:0', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(271, '2023-04-17', '2:3:13', '/deals/department-stores-malls', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(272, '2023-04-17', '2:3:47', '/aboutus', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(273, '2023-04-17', '2:39:8', '/login', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(274, '2023-04-17', '2:39:10', '/deals/categories', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(275, '2023-04-17', '4:9:8', '/login', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(276, '2023-04-17', '4:28:49', '/deals/accessories/handbags', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(277, '2023-04-17', '4:32:59', '/', 'Mozilla/5.0 (compatible; SemrushBot-SI/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(278, '2023-04-17', '5:16:14', '/', 'Xpanse, a Palo Alto Networks company, indexes customer network perimeters. If you have any questions or concerns, please reach out to: scaninfo@paloaltonetworks.com.', '::ffff:127.0.0.1'),
(279, '2023-04-17', '7:53:19', '/', 'Mozilla/5.0 (compatible; SemrushBot-SI/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(280, '2023-04-17', '9:6:5', '/deals/garden/garden-tools', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(281, '2023-04-17', '9:27:3', '/', 'Mozilla/5.0 (compatible; SemrushBot-SI/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(282, '2023-04-17', '9:50:45', '/deals/health-wellness', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(283, '2023-04-17', '10:23:5', '/', 'Mozilla/5.0 (compatible; SemrushBot-SI/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(284, '2023-04-17', '10:37:26', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(285, '2023-04-17', '10:39:22', '/forgot-password', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(286, '2023-04-17', '10:41:21', '/deals/stores/all/p', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(287, '2023-04-17', '10:44:16', '/deals/home/mattress-bedding', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(288, '2023-04-17', '11:20:17', '/deals/stores/sleep-beyond', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(289, '2023-04-17', '11:23:4', '/deals/department-stores-malls/virtual-malls', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(290, '2023-04-17', '11:42:10', '/register', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(291, '2023-04-17', '11:55:43', '/deals/stores/lovelywholesale', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(292, '2023-04-17', '11:57:36', '/deals/stores/all/f', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(293, '2023-04-17', '12:24:45', '/.git/config', 'curl/7.19.7 (x86_64-redhat-linux-gnu) libcurl/7.19.7 NSS/3.44 zlib/1.2.3 libidn/1.18 libssh2/1.4.2', '::ffff:127.0.0.1'),
(294, '2023-04-17', '12:27:10', '/register', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(295, '2023-04-17', '12:43:12', '/deals/gifts-flowers/collectibles', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(296, '2023-04-17', '14:14:38', '/register', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(297, '2023-04-17', '14:18:38', '/deals/stores/all/b', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(298, '2023-04-17', '15:39:12', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(299, '2023-04-17', '16:24:11', '/privacypolicy', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(300, '2023-04-17', '17:9:11', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(301, '2023-04-17', '17:54:11', '/', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(302, '2023-04-17', '18:51:16', '/privacypolicy', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(303, '2023-04-17', '19:50:49', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(304, '2023-04-17', '19:52:57', '/forgot-password', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(305, '2023-04-17', '19:54:15', '/deals/stores/kc-chic-designs', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(306, '2023-04-17', '19:57:35', '/deals/stores/justflowers', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(307, '2023-04-17', '19:57:40', '/deals/stores/appliancesconnection', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(308, '2023-04-17', '19:59:13', '/deals/stores/all/g', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(309, '2023-04-17', '20:1:8', '/deals/stores/all', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(310, '2023-04-17', '20:4:1', '/deals/garden', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(311, '2023-04-17', '23:28:54', '/sitemap', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(312, '2023-04-18', '4:44:18', '/deals/accessories', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(313, '2023-04-18', '4:52:5', '/disclosures', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(314, '2023-04-18', '5:19:39', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(315, '2023-04-18', '5:29:17', '/deals/accessories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(316, '2023-04-18', '5:46:43', '/', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(317, '2023-04-18', '5:51:52', '/deals/categories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(318, '2023-04-18', '6:14:23', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(319, '2023-04-18', '6:36:52', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(320, '2023-04-18', '6:41:35', '/deals', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(321, '2023-04-18', '7:21:54', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(322, '2023-04-18', '7:23:40', '/deals/stores/california-tea-house', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(323, '2023-04-18', '7:25:6', '/deals/health-wellness/weight-loss', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(324, '2023-04-18', '8:24:39', '/deals/computers/accessories-peripherals', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(325, '2023-04-18', '8:51:54', '/deals/categories', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(326, '2023-04-18', '10:22:58', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(327, '2023-04-18', '10:23:15', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(328, '2023-04-18', '10:23:22', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(329, '2023-04-18', '10:23:36', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(330, '2023-04-18', '12:4:7', '/sitemap', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(331, '2023-04-18', '12:26:36', '/sitemap', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.49 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(332, '2023-04-18', '13:8:17', '/privacypolicy', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '::ffff:127.0.0.1'),
(333, '2023-04-18', '13:52:31', '/deals/stores/sylvania', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(334, '2023-04-18', '15:4:39', '/deals/stores/luxe_cosmetics', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(335, '2023-04-18', '16:8:48', '/deals/home/home-decor', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(336, '2023-04-18', '17:4:29', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(337, '2023-04-18', '22:36:42', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(338, '2023-04-18', '23:8:36', '/deals/computers/laptops-computers', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(339, '2023-04-18', '23:10:4', '/deals/clothing/active-wear', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(340, '2023-04-18', '23:13:25', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(341, '2023-04-18', '23:27:42', '/deals', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(342, '2023-04-18', '23:49:15', '/deals/stores/all/x', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(343, '2023-04-18', '23:51:47', '/deals/stores/all/l', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(344, '2023-04-18', '23:56:55', '/deals', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(345, '2023-04-19', '0:6:41', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(346, '2023-04-19', '1:41:23', '/deals/gifts-flowers/collectibles', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(347, '2023-04-19', '2:27:42', '/termsofuse', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(348, '2023-04-19', '3:37:29', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P; Google-AdWords-Express) AppleWebKit/[WEBKIT_VERSION] (KHTML, like Gecko) Chrome/[CHROME_VERSION] Mobile Safari/[WEBKIT_VERSION]', '::ffff:127.0.0.1'),
(349, '2023-04-19', '3:37:29', '/?gclid=258371008', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; Mozilla/5.0, Google-AdWords-Express) Chrome/111.0.5563.146 Safari/537.36', '::ffff:127.0.0.1'),
(350, '2023-04-19', '3:37:29', '/', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; AdsBot-Google; +http://www.google.com/bot.html) Chrome/111.0.5563.146 Safari/537.36', '::ffff:127.0.0.1'),
(351, '2023-04-19', '3:37:29', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P; Google-AdWords-Express) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36', '::ffff:127.0.0.1'),
(352, '2023-04-19', '3:37:29', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P; AdsBot-Google; +http://www.google.com/bot.html) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.146 Mobile Safari/537.36', '::ffff:127.0.0.1'),
(353, '2023-04-19', '3:37:29', '/', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google-AdWords-Express) Chrome/111.0.5563.146 Safari/537.36', '::ffff:127.0.0.1'),
(354, '2023-04-19', '3:38:44', '/', 'AdsBot-Google (+http://www.google.com/adsbot.html)', '::ffff:127.0.0.1'),
(355, '2023-04-19', '3:41:8', '/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1 (compatible; AdsBot-Google-Mobile; +http://www.google.com/mobile/adsbot.html)', '::ffff:127.0.0.1'),
(356, '2023-04-19', '5:37:25', '/', 'Xpanse, a Palo Alto Networks company, indexes customer network perimeters. If you have any questions or concerns, please reach out to: scaninfo@paloaltonetworks.com.', '::ffff:127.0.0.1'),
(357, '2023-04-19', '7:50:46', '/termsofuse', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(358, '2023-04-19', '9:1:34', '/deals/stores/all/a', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(359, '2023-04-19', '9:17:42', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(360, '2023-04-19', '9:17:47', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(361, '2023-04-19', '9:17:52', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(362, '2023-04-19', '9:18:5', '/', 'Mozilla/5.0 (compatible; SiteAuditBot/0.97; +http://www.semrush.com/bot.html)', '::ffff:127.0.0.1'),
(363, '2023-04-19', '9:41:25', '/register', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(364, '2023-04-19', '10:28:8', '/deals/stores/livehome3d', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(365, '2023-04-19', '10:28:16', '/deals/stores/click-grow', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(366, '2023-04-19', '10:30:8', '/deals/stores/all/h', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(367, '2023-04-19', '10:41:25', '/deals/home/home-decor', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(368, '2023-04-19', '11:11:25', '/deals/stores/popvil', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(369, '2023-04-19', '11:42:50', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(370, '2023-04-19', '11:44:3', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(371, '2023-04-19', '11:46:16', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(372, '2023-04-19', '11:46:38', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(373, '2023-04-19', '11:49:24', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(374, '2023-04-19', '11:49:36', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(375, '2023-04-19', '12:0:10', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(376, '2023-04-19', '12:41:25', '/register', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(377, '2023-04-19', '13:11:12', '/deals/stores/appliancesconnection', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(378, '2023-04-19', '14:11:25', '/deals/stores/popvil', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(379, '2023-04-19', '15:0:33', '/deals/stores/appliancesconnection', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(380, '2023-04-19', '16:22:8', '/blog', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(381, '2023-04-19', '17:37:47', '/', 'Xpanse, a Palo Alto Networks company, indexes customer network perimeters. If you have any questions or concerns, please reach out to: scaninfo@paloaltonetworks.com.', '::ffff:127.0.0.1'),
(382, '2023-04-19', '19:22:8', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(383, '2023-04-19', '20:41:49', '/', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(384, '2023-04-19', '21:38:4', '/deals/gifts-flowers/greeting-cards', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(385, '2023-04-19', '23:20:33', '/deals/stores/livehome3d', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(386, '2023-04-20', '1:26:16', '/deals/categories/gifts-flowers/collectibles', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(387, '2023-04-20', '1:36:13', '/deals', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(388, '2023-04-20', '3:22:15', '/deals/stores/all/m', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(389, '2023-04-20', '3:24:12', '/deals/auto/motorcycles', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(390, '2023-04-20', '5:20:25', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(391, '2023-04-20', '5:31:53', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(392, '2023-04-20', '5:32:19', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(393, '2023-04-20', '5:35:0', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(394, '2023-04-20', '5:36:1', '/', 'curl/7.83.1', '::ffff:127.0.0.1'),
(395, '2023-04-20', '8:27:18', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(396, '2023-04-20', '9:17:57', '/deals/accessories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(397, '2023-04-20', '9:57:18', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(398, '2023-04-20', '10:2:57', '/deals/categories', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(399, '2023-04-20', '10:53:46', '/', 'Xpanse, a Palo Alto Networks company, indexes customer network perimeters. If you have any questions or concerns, please reach out to: scaninfo@paloaltonetworks.com.', '::ffff:127.0.0.1'),
(400, '2023-04-20', '11:27:18', '/deals/stores/25home', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(401, '2023-04-20', '11:32:56', '/deals/categories/accessories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(402, '2023-04-20', '11:32:57', '/deals/accessories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(403, '2023-04-20', '12:2:19', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(404, '2023-04-20', '13:0:20', '/deals/accessories/womens-jewelery', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(405, '2023-04-20', '13:9:35', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(406, '2023-04-20', '13:11:15', '/login', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(407, '2023-04-20', '13:12:55', '/deals/stores/beneunder', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(408, '2023-04-20', '13:14:37', '/deals/gifts-flowers/flowers', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(409, '2023-04-20', '13:28:23', '/deals/categories/accessories/womens-jewelery', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(410, '2023-04-20', '14:3:15', '/privacypolicy', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(411, '2023-04-20', '16:1:21', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(412, '2023-04-20', '16:45:45', '/contact', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(413, '2023-04-20', '18:17:57', '/deals/categories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.121 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(414, '2023-04-20', '20:35:4', '/deals/categories', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(415, '2023-04-20', '22:34:32', '/deals/stores/mango-us', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(416, '2023-04-20', '22:36:9', '/deals/home/furniture', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(417, '2023-04-20', '23:14:6', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(418, '2023-04-21', '2:26:7', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(419, '2023-04-21', '4:5:26', '/deals/stores/all/c', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(420, '2023-04-21', '4:48:7', '/deals/categories/categories/accessories', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(421, '2023-04-21', '4:52:16', '/', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(422, '2023-04-21', '4:54:17', '/aboutus', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(423, '2023-04-21', '4:54:19', '/sitemap', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(424, '2023-04-21', '4:54:22', '/contact', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(425, '2023-04-21', '4:54:30', '/privacypolicy', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(426, '2023-04-21', '5:0:7', '/deals/stores/all', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(427, '2023-04-21', '5:0:9', '/deals/stores/sleep-beyond', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(428, '2023-04-21', '5:0:11', '/deals/stores/goldia', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(429, '2023-04-21', '5:0:11', '/deals/computers', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(430, '2023-04-21', '5:0:13', '/deals/stores/momentwish', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(431, '2023-04-21', '5:0:13', '/deals/department-stores-malls', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(432, '2023-04-21', '5:0:14', '/deals/stores/walkingpad', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(433, '2023-04-21', '5:0:15', '/deals/accessories', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(434, '2023-04-21', '5:0:15', '/deals/stores/25home', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(435, '2023-04-21', '5:0:16', '/deals/auto', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(436, '2023-04-21', '5:0:16', '/deals/stores/sunshine-jewelry', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(437, '2023-04-21', '5:0:16', '/deals/stores/click-grow', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(438, '2023-04-21', '5:0:18', '/deals/categories', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(439, '2023-04-21', '5:0:18', '/deals/health-wellness', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(440, '2023-04-21', '5:0:19', '/deals/appliances', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(441, '2023-04-21', '5:0:19', '/deals/clothing', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(442, '2023-04-21', '5:0:19', '/deals/stores/california-tea-house', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(443, '2023-04-21', '5:0:19', '/deals/stores/ador', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(444, '2023-04-21', '5:0:20', '/deals/stores/elpumps', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(445, '2023-04-21', '5:0:20', '/deals/garden', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(446, '2023-04-21', '5:0:22', '/deals', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(447, '2023-04-21', '5:0:22', '/deals/stores/justflowers', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(448, '2023-04-21', '5:0:22', '/deals/stores/eufy', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(449, '2023-04-21', '5:0:23', '/deals/beauty', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(450, '2023-04-21', '5:0:24', '/deals/gifts-flowers', 'IonCrawl (https://www.ionos.de/terms-gtc/faq-crawler-en/)', '::ffff:127.0.0.1'),
(451, '2023-04-21', '6:34:51', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(452, '2023-04-21', '6:59:22', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(453, '2023-04-21', '7:1:18', '/deals/stores/momentwish', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(454, '2023-04-21', '7:3:19', '/deals/stores/all/o', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(455, '2023-04-21', '7:3:41', '/deals/categories', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(456, '2023-04-21', '7:40:18', '/deals/health-wellness', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(457, '2023-04-21', '7:41:26', '/sitemap', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(458, '2023-04-21', '7:42:51', '/deals/stores/all/r', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(459, '2023-04-21', '7:43:57', '/deals/home', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(460, '2023-04-21', '8:14:47', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(461, '2023-04-21', '8:17:45', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(462, '2023-04-21', '8:19:35', '/deals/stores/all/c', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(463, '2023-04-21', '10:47:7', '/deals/health-wellness', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(464, '2023-04-21', '12:17:7', '/deals/health-wellness', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(465, '2023-04-21', '13:2:30', '/sitemap', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(466, '2023-04-21', '13:37:3', '/register', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(467, '2023-04-21', '13:37:5', '/deals/categories/health-wellness', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(468, '2023-04-21', '13:37:5', '/deals/health-wellness', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(469, '2023-04-21', '14:10:3', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(470, '2023-04-21', '14:32:31', '/deals/stores/stardock', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(471, '2023-04-21', '15:36:11', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(472, '2023-04-21', '16:9:24', '/register', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(473, '2023-04-21', '16:16:42', '/deals/home/furniture', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(474, '2023-04-21', '16:51:54', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(475, '2023-04-21', '16:54:15', '/deals/stores/sunshine-jewelry', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(476, '2023-04-21', '17:32:35', '/deals/stores/all/z', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(477, '2023-04-21', '17:35:4', '/deals/stores/all/u', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(478, '2023-04-21', '18:8:18', '/deals/stores/walkingpad', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(479, '2023-04-21', '20:21:57', '/deals/stores/all/d', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(480, '2023-04-21', '20:54:35', '/deals/stores/banggood', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(481, '2023-04-21', '20:56:44', '/deals/gifts-flowers/gifts', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(482, '2023-04-21', '20:57:43', '/deals/garden/seeds-fertilizers', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(483, '2023-04-21', '21:48:40', '/sitemap', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(484, '2023-04-21', '21:57:22', '/deals/auto', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(485, '2023-04-21', '22:29:7', '/deals/health-wellness', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(486, '2023-04-21', '23:18:40', '/deals/stores/stardock', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(487, '2023-04-21', '23:34:44', '/apple-app-site-association', 'AdsBot-Google (+http://www.google.com/adsbot.html)', '::ffff:127.0.0.1'),
(488, '2023-04-21', '23:47:19', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(489, '2023-04-22', '0:44:57', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(490, '2023-04-22', '0:51:53', '/.well-known/apple-app-site-association', 'AdsBot-Google (+http://www.google.com/adsbot.html)', '::ffff:127.0.0.1'),
(491, '2023-04-22', '2:31:54', '/deals/stores/all/k', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(492, '2023-04-22', '2:32:23', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(493, '2023-04-22', '3:14:49', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(494, '2023-04-22', '3:56:41', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(495, '2023-04-22', '4:39:28', '/', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(496, '2023-04-22', '4:40:30', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(497, '2023-04-22', '4:43:15', '/deals/department-stores-malls', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(498, '2023-04-22', '6:22:3', '/deals/stores/ador', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(499, '2023-04-22', '11:29:52', '/deals/appliances/home-appliances', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(500, '2023-04-22', '11:48:10', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(501, '2023-04-22', '11:49:14', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(502, '2023-04-22', '11:53:33', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(503, '2023-04-22', '11:54:24', '/deals/stores/govee', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(504, '2023-04-22', '11:55:19', '/deals/stores/claris-housewares', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(505, '2023-04-22', '11:57:15', '/deals/stores/all/r', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(506, '2023-04-22', '11:58:36', '/deals/stores/all/p', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(507, '2023-04-22', '11:59:55', '/deals/garden/flowers-plants', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(508, '2023-04-22', '12:2:5', '/deals/accessories/handbags', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(509, '2023-04-22', '12:46:11', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(510, '2023-04-22', '12:47:30', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1');
INSERT INTO `track_googlebot` (`id`, `date`, `time`, `url`, `bot`, `ip`) VALUES
(511, '2023-04-22', '12:48:47', '/deals/stores/momentwish', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(512, '2023-04-22', '12:49:40', '/deals/stores/all/c', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(513, '2023-04-22', '15:28:48', '/login', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', '::ffff:127.0.0.1'),
(514, '2023-04-22', '16:56:50', '/apple-app-site-association', 'AdsBot-Google (+http://www.google.com/adsbot.html)', '::ffff:127.0.0.1'),
(515, '2023-04-22', '17:22:51', '/.well-known/apple-app-site-association', 'AdsBot-Google (+http://www.google.com/adsbot.html)', '::ffff:127.0.0.1'),
(516, '2023-04-22', '17:50:8', '/', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(517, '2023-04-22', '19:9:38', '/forgot-password', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(518, '2023-04-22', '19:41:18', '/deals/stores/mobisystems', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(519, '2023-04-22', '19:47:3', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(520, '2023-04-22', '19:50:50', '/deals/gifts-flowers', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(521, '2023-04-22', '20:51:22', '/deals/accessories/mens-jewelery', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(522, '2023-04-22', '21:29:4', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(523, '2023-04-22', '21:30:26', '/deals/stores/all/j', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(524, '2023-04-22', '21:32:12', '/deals/stores/click-grow', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(525, '2023-04-22', '21:33:20', '/aboutus', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(526, '2023-04-22', '22:1:39', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(527, '2023-04-22', '22:2:59', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(528, '2023-04-22', '22:3:55', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(529, '2023-04-22', '23:1:50', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(530, '2023-04-22', '23:3:3', '/deals/stores/all/s', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(531, '2023-04-23', '0:9:55', '/deals/home', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(532, '2023-04-23', '0:40:52', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(533, '2023-04-23', '0:43:16', '/deals/stores/arete_adaptogens', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(534, '2023-04-23', '1:49:27', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(535, '2023-04-23', '2:0:48', '/deals/home/mattress-bedding', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(536, '2023-04-23', '2:34:50', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(537, '2023-04-23', '3:18:8', '/404', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.5615.142 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '::ffff:127.0.0.1'),
(538, '2023-04-23', '3:22:16', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(539, '2023-04-23', '4:35:41', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(540, '2023-04-27', '16:15:46', '/404', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1'),
(541, '2023-04-27', '16:17:32', '/deals/stores/25home', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', '::ffff:127.0.0.1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashback_categories`
--
ALTER TABLE `cashback_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashback_categorytypes`
--
ALTER TABLE `cashback_categorytypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashback_store_type_map`
--
ALTER TABLE `cashback_store_type_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliated_store_id` (`affiliated_store_id`);

--
-- Indexes for table `coupon_details`
--
ALTER TABLE `coupon_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliated_store_id` (`affiliated_store_id`);

--
-- Indexes for table `create_sharerefcode`
--
ALTER TABLE `create_sharerefcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_users`
--
ALTER TABLE `frontend_users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_info`
--
ALTER TABLE `seo_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sharecode_accept_by_user`
--
ALTER TABLE `sharecode_accept_by_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_cat_map`
--
ALTER TABLE `store_cat_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliated_store_id` (`affiliated_store_id`);

--
-- Indexes for table `track_googlebot`
--
ALTER TABLE `track_googlebot`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashback_categories`
--
ALTER TABLE `cashback_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `cashback_categorytypes`
--
ALTER TABLE `cashback_categorytypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cashback_store_type_map`
--
ALTER TABLE `cashback_store_type_map`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2835;

--
-- AUTO_INCREMENT for table `coupon_details`
--
ALTER TABLE `coupon_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563;

--
-- AUTO_INCREMENT for table `create_sharerefcode`
--
ALTER TABLE `create_sharerefcode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `frontend_users`
--
ALTER TABLE `frontend_users`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seo_info`
--
ALTER TABLE `seo_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sharecode_accept_by_user`
--
ALTER TABLE `sharecode_accept_by_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `store_cat_map`
--
ALTER TABLE `store_cat_map`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `track_googlebot`
--
ALTER TABLE `track_googlebot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

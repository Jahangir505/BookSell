-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2019 at 05:40 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s-cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_config`
--

CREATE TABLE `admin_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_config`
--

INSERT INTO `admin_config` (`id`, `type`, `code`, `key`, `value`, `store_id`, `sort`, `detail`) VALUES
(1, '', 'config', 'shop_allow_guest', '0', '1', 11, 'lang::admin.shop_allow_guest'),
(2, '', 'config', 'product_preorder', '1', '1', 18, 'lang::admin.product_preorder'),
(3, '', 'config', 'product_display_out_of_stock', '1', '1', 19, 'lang::admin.product_display_out_of_stock'),
(4, '', 'config', 'product_buy_out_of_stock', '1', '1', 20, 'lang::admin.product_buy_out_of_stock'),
(5, '', 'config', 'show_date_available', '1', '1', 21, 'lang::admin.show_date_available'),
(6, '', 'display', 'product_hot', '6', '1', 0, 'lang::admin.hot_product'),
(7, '', 'display', 'product_new', '6', '1', 0, 'lang::admin.new_product'),
(8, '', 'display', 'product_list', '18', '1', 0, 'lang::admin.list_product'),
(9, '', 'display', 'product_relation', '4', '1', 0, 'lang::admin.relation_product'),
(10, '', 'display', 'product_viewed', '4', '1', 0, 'lang::admin.viewed_product'),
(11, '', 'display', 'item_list', '12', '1', 0, 'lang::admin.item_list'),
(12, '', 'email_action', 'email_action_mode', '1', '1', 0, 'lang::email.email_action.email_action_mode'),
(13, '', 'email_action', 'order_success_to_admin', '1', '1', 1, 'lang::email.email_action.order_success_to_admin'),
(14, '', 'email_action', 'order_success_to_customer', '1', '1', 2, 'lang::email.email_action.order_success_to_cutomer'),
(15, '', 'email_action', 'welcome_customer', '0', '1', 4, 'lang::email.email_action.welcome_customer'),
(16, '', 'email_action', 'contact_to_admin', '1', '1', 6, 'lang::email.email_action.contact_to_admin'),
(17, '', 'email_action', 'email_action_smtp_mode', '0', '1', 6, 'lang::email.email_action.email_action_smtp_mode'),
(18, 'Modules', 'Block', 'LastViewProduct', '0', '1', 0, 'lang::Modules/Block/LastViewProduct.title'),
(19, 'Extensions', 'Payment', 'Cash', '1', '1', 0, 'lang::Extensions/Payment/Cash.title'),
(20, 'Extensions', 'Shipping', 'ShippingStandard', '1', '1', 0, 'lang::Shipping Standard'),
(21, '', 'smtp', 'smtp_host', '', '1', 8, 'lang::email.smtp_host'),
(22, '', 'smtp', 'smtp_user', '', '1', 7, 'lang::email.smtp_user'),
(23, '', 'smtp', 'smtp_password', '', '1', 6, 'lang::email.smtp_password'),
(24, '', 'smtp', 'smtp_security', '', '1', 5, 'lang::email.smtp_security'),
(25, '', 'smtp', 'smtp_port', '', '1', 4, 'lang::email.smtp_port'),
(26, 'Extensions', 'Total', 'Discount', '1', '1', 0, 'lang::Extensions/Total/Discount.title'),
(27, '', 'cache', 'cache_status', '0', '1', 0, ''),
(28, '', 'cache', 'cache_time', '600', '1', 0, ''),
(29, '', 'upload', 'upload_image_size', '2048', '1', 0, ''),
(30, '', 'upload', 'upload_image_thumb_width', '250', '1', 0, ''),
(31, '', 'upload', 'upload_image_thumb_status', '1', '1', 0, ''),
(32, '', 'upload', 'upload_watermark_status', '1', '1', 0, ''),
(33, '', 'upload', 'upload_watermark_path', 'images/watermark.png', '1', 0, ''),
(34, '', 'env', 'SITE_STATUS', 'on', '1', 0, 'lang::env.SITE_STATUS'),
(35, '', 'env', 'SITE_TIMEZONE', 'Asia/Dhaka', '1', 0, 'lang::env.SITE_TIMEZONE'),
(36, '', 'env', 'SITE_LANGUAGE', 'en', '1', 0, 'lang::env.SITE_LANGUAGE'),
(37, '', 'env', 'SITE_CURRENCY', 'TK', '1', 0, 'lang::env.SITE_CURRENCY'),
(38, '', 'env', 'APP_DEBUG', 'off', '1', 0, 'lang::env.APP_DEBUG'),
(39, '', 'env', 'ADMIN_LOG', 'on', '1', 0, 'lang::env.ADMIN_LOG'),
(40, '', 'env', 'ADMIN_LOG_EXP', '', '1', 0, 'lang::env.ADMIN_LOG_EXP'),
(41, '', 'env', 'ADMIN_PREFIX', 'sc_admin', '1', 0, 'lang::env.ADMIN_PREFIX'),
(42, '', 'env', 'ADMIN_NAME', 'Admin', '1', 0, 'lang::env.ADMIN_NAME'),
(43, '', 'env', 'ADMIN_TITLE', 'Administrator', '1', 0, 'lang::env.ADMIN_TITLE'),
(44, '', 'env', 'ADMIN_LOGO', 'Admin', '1', 0, 'lang::env.ADMIN_LOGO'),
(45, '', 'env', 'ADMIN_LOGO_MINI', '<img src=\"/data/logo/favicon.png\">', '1', 0, 'lang::env.ADMIN_LOGO_MINI'),
(46, 'Modules', 'Cms', 'Content', '0', '1', 0, 'lang::Modules/Cms/Content.title');

-- --------------------------------------------------------

--
-- Table structure for table `admin_log`
--

CREATE TABLE `admin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_log`
--

INSERT INTO `admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '[]', '2019-10-25 13:26:10', '2019-10-25 13:26:10'),
(2, 1, 'sc_admin/backup', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '[]', '2019-10-25 13:26:25', '2019-10-25 13:26:25'),
(3, 1, 'sc_admin/backup/generate', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '{\"_token\":\"1wsPr0O9Kp07FYpZzwUsSc26YAoJwqw8xN7FqxWn\"}', '2019-10-25 13:26:30', '2019-10-25 13:26:30'),
(4, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:35:10', '2019-11-01 07:35:10'),
(5, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:35:37', '2019-11-01 07:35:37'),
(6, 1, 'sc_admin/user/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:35:41', '2019-11-01 07:35:41'),
(7, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:36:07', '2019-11-01 07:36:07'),
(8, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"order_status\":\"1\"}', '2019-11-01 07:36:17', '2019-11-01 07:36:17'),
(9, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:37:12', '2019-11-01 07:37:12'),
(10, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:37:18', '2019-11-01 07:37:18'),
(11, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:39:21', '2019-11-01 07:39:21'),
(12, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:39:24', '2019-11-01 07:39:24'),
(13, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:39:35', '2019-11-01 07:39:35'),
(14, 1, 'sc_admin/customer/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:39:50', '2019-11-01 07:39:50'),
(15, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:40:03', '2019-11-01 07:40:03'),
(16, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-01 07:40:06', '2019-11-01 07:40:06'),
(17, 1, 'sc_admin/subscribe', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:40:10', '2019-11-01 07:40:10'),
(18, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 07:49:55', '2019-11-01 07:49:55'),
(19, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:03:24', '2019-11-01 08:03:24'),
(20, 1, 'sc_admin/block_content/edit/7', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:03:39', '2019-11-01 08:03:39'),
(21, 1, 'sc_admin/link', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:04:12', '2019-11-01 08:04:12'),
(22, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:04:30', '2019-11-01 08:04:30'),
(23, 1, 'sc_admin/module/block', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:04:45', '2019-11-01 08:04:45'),
(24, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:04:55', '2019-11-01 08:04:55'),
(25, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"shop_allow_guest\",\"value\":\"0\",\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\"}', '2019-11-01 08:05:04', '2019-11-01 08:05:04'),
(26, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"shop_allow_guest\",\"value\":\"1\",\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\"}', '2019-11-01 08:05:05', '2019-11-01 08:05:05'),
(27, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"shop_allow_guest\",\"value\":\"0\",\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\"}', '2019-11-01 08:05:07', '2019-11-01 08:05:07'),
(28, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"shop_allow_guest\",\"value\":\"1\",\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\"}', '2019-11-01 08:05:08', '2019-11-01 08:05:08'),
(29, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:05:23', '2019-11-01 08:05:23'),
(30, 1, 'sc_admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:05:40', '2019-11-01 08:05:40'),
(31, 1, 'sc_admin/backup', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:05:56', '2019-11-01 08:05:56'),
(32, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:06:11', '2019-11-01 08:06:11'),
(33, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:06:45', '2019-11-01 08:06:45'),
(34, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\",\"order_id\":\"1\"}', '2019-11-01 08:07:20', '2019-11-01 08:07:20'),
(35, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\",\"order_id\":\"1\"}', '2019-11-01 08:07:24', '2019-11-01 08:07:24'),
(36, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\",\"order_id\":\"1\"}', '2019-11-01 08:07:27', '2019-11-01 08:07:27'),
(37, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\",\"order_id\":\"1\"}', '2019-11-01 08:07:32', '2019-11-01 08:07:32'),
(38, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\",\"order_id\":\"1\"}', '2019-11-01 08:07:34', '2019-11-01 08:07:34'),
(39, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\",\"order_id\":\"1\"}', '2019-11-01 08:07:36', '2019-11-01 08:07:36'),
(40, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:07:40', '2019-11-01 08:07:40'),
(41, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-01 08:07:56', '2019-11-01 08:07:56'),
(42, 1, 'sc_admin/order/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:08:13', '2019-11-01 08:08:13'),
(43, 1, 'sc_admin/log', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:08:36', '2019-11-01 08:08:36'),
(44, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:08:59', '2019-11-01 08:08:59'),
(45, 1, 'sc_admin/menu/edit/51', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:09:24', '2019-11-01 08:09:24'),
(46, 1, 'sc_admin/menu/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"id\":\"51\",\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\"}', '2019-11-01 08:10:03', '2019-11-01 08:10:03'),
(47, 1, 'sc_admin/menu/edit/51', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:10:03', '2019-11-01 08:10:03'),
(48, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:10:13', '2019-11-01 08:10:13'),
(49, 1, 'sc_admin/menu/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"parent_id\":\"0\",\"title\":\"API Manager\",\"icon\":\"fa-plug\",\"uri\":\"lang::admin.menu_titles.api_manager\",\"sort\":\"302\",\"_token\":\"g03Ttr3O7sL6eWwN3GKLagPcBwpm8e1ne0UnSxSZ\"}', '2019-11-01 08:10:44', '2019-11-01 08:10:44'),
(50, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:10:44', '2019-11-01 08:10:44'),
(51, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:11:03', '2019-11-01 08:11:03'),
(52, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:11:20', '2019-11-01 08:11:20'),
(53, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:11:24', '2019-11-01 08:11:24'),
(54, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:11:27', '2019-11-01 08:11:27'),
(55, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-01 08:11:30', '2019-11-01 08:11:30'),
(56, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:00:15', '2019-11-02 18:00:15'),
(57, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:00:29', '2019-11-02 18:00:29'),
(58, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:00:45', '2019-11-02 18:00:45'),
(59, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:00:48', '2019-11-02 18:00:48'),
(60, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:01:03', '2019-11-02 18:01:03'),
(61, 1, 'sc_admin/subscribe', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:01:09', '2019-11-02 18:01:09'),
(62, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:01:14', '2019-11-02 18:01:14'),
(63, 1, 'sc_admin/page', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:01:19', '2019-11-02 18:01:19'),
(64, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:01:26', '2019-11-02 18:01:26'),
(65, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:01:34', '2019-11-02 18:01:34'),
(66, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:02:44', '2019-11-02 18:02:44'),
(67, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"banner_top\",\"page\":[\"home\",\"product_list\",\"product_detail\",\"shop_wishlist\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 18:02:56', '2019-11-02 18:02:56'),
(68, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:02:57', '2019-11-02 18:02:57'),
(69, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:03:20', '2019-11-02 18:03:20'),
(70, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"right\",\"page\":[\"home\",\"product_list\",\"product_detail\",\"shop_wishlist\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 18:03:27', '2019-11-02 18:03:27'),
(71, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:03:27', '2019-11-02 18:03:27'),
(72, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:05:02', '2019-11-02 18:05:02'),
(73, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:05:14', '2019-11-02 18:05:14'),
(74, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"left\",\"page\":[\"home\",\"product_list\",\"product_detail\",\"shop_wishlist\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 18:05:20', '2019-11-02 18:05:20'),
(75, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:05:21', '2019-11-02 18:05:21'),
(76, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:05:38', '2019-11-02 18:05:38'),
(77, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"right\",\"page\":[\"home\",\"product_list\",\"product_detail\",\"shop_wishlist\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 18:05:46', '2019-11-02 18:05:46'),
(78, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:05:46', '2019-11-02 18:05:46'),
(79, 1, 'sc_admin/block_content/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:05:55', '2019-11-02 18:05:55'),
(80, 1, 'sc_admin/block_content/edit/6', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Categories\",\"position\":\"left\",\"page\":[\"home\",\"product_list\",\"product_detail\",\"shop_wishlist\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 18:06:02', '2019-11-02 18:06:02'),
(81, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:06:02', '2019-11-02 18:06:02'),
(82, 1, 'sc_admin/block_content/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:06:10', '2019-11-02 18:06:10'),
(83, 1, 'sc_admin/link', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:06:28', '2019-11-02 18:06:28'),
(84, 1, 'sc_admin/link/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:06:48', '2019-11-02 18:06:48'),
(85, 1, 'sc_admin/template', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:07:04', '2019-11-02 18:07:04'),
(86, 1, 'sc_admin/module/block', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:07:17', '2019-11-02 18:07:17'),
(87, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:08:14', '2019-11-02 18:08:14'),
(88, 1, 'sc_admin/user/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:08:18', '2019-11-02 18:08:18'),
(89, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"type\":\"avatar\"}', '2019-11-02 18:08:26', '2019-11-02 18:08:26'),
(90, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1572714508956\"}', '2019-11-02 18:08:29', '2019-11-02 18:08:29'),
(91, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1572714508957\"}', '2019-11-02 18:08:29', '2019-11-02 18:08:29'),
(92, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1572714508958\"}', '2019-11-02 18:08:30', '2019-11-02 18:08:30'),
(93, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"show_list\":\"grid\",\"sort_type\":\"alphabetic\",\"_\":\"1572714508959\"}', '2019-11-02 18:08:54', '2019-11-02 18:08:54'),
(94, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:09:29', '2019-11-02 18:09:29'),
(95, 1, 'sc_admin/role/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:10:10', '2019-11-02 18:10:10'),
(96, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:10:24', '2019-11-02 18:10:24'),
(97, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:10:44', '2019-11-02 18:10:44'),
(98, 1, 'sc_admin/log', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:10:56', '2019-11-02 18:10:56'),
(99, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:11:03', '2019-11-02 18:11:03'),
(100, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:11:07', '2019-11-02 18:11:07'),
(101, 1, 'sc_admin/payment_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:11:10', '2019-11-02 18:11:10'),
(102, 1, 'sc_admin/shipping_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:11:13', '2019-11-02 18:11:13'),
(103, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:11:24', '2019-11-02 18:11:24'),
(104, 1, 'sc_admin/log', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:16:38', '2019-11-02 18:16:38'),
(105, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:24:30', '2019-11-02 18:24:30'),
(106, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:51:58', '2019-11-02 18:51:58'),
(107, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:52:03', '2019-11-02 18:52:03'),
(108, 1, 'sc_admin/user/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:52:06', '2019-11-02 18:52:06'),
(109, 1, 'sc_admin/user/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:54:03', '2019-11-02 18:54:03'),
(110, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:54:08', '2019-11-02 18:54:08'),
(111, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:59:12', '2019-11-02 18:59:12'),
(112, 1, 'sc_admin/permission/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:59:17', '2019-11-02 18:59:17'),
(113, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:59:45', '2019-11-02 18:59:45'),
(114, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:59:53', '2019-11-02 18:59:53'),
(115, 1, 'sc_admin/vendor', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 18:59:59', '2019-11-02 18:59:59'),
(116, 1, 'sc_admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:00:28', '2019-11-02 19:00:28'),
(117, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"SITE_STATUS\",\"value\":\"off\",\"pk\":null,\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 19:00:41', '2019-11-02 19:00:41'),
(118, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"SITE_STATUS\",\"value\":\"on\",\"pk\":null,\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 19:01:03', '2019-11-02 19:01:03'),
(119, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"SITE_TIMEZONE\",\"value\":\"Asia\\/Dhaka\",\"pk\":null,\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 19:01:25', '2019-11-02 19:01:25'),
(120, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:02:19', '2019-11-02 19:02:19'),
(121, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:02:31', '2019-11-02 19:02:31'),
(122, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:02:41', '2019-11-02 19:02:41'),
(123, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"keyword\":\"mobile\",\"search\":null}', '2019-11-02 19:03:08', '2019-11-02 19:03:08'),
(124, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:17', '2019-11-02 19:03:17'),
(125, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:21', '2019-11-02 19:03:21'),
(126, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:24', '2019-11-02 19:03:24'),
(127, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:26', '2019-11-02 19:03:26'),
(128, 1, 'sc_admin/log', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:29', '2019-11-02 19:03:29'),
(129, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:32', '2019-11-02 19:03:32'),
(130, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:03:49', '2019-11-02 19:03:49'),
(131, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"sort_order\":\"id__asc\",\"_pjax\":\"#pjax-container\"}', '2019-11-02 19:04:08', '2019-11-02 19:04:08'),
(132, 1, 'sc_admin/email', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:04:33', '2019-11-02 19:04:33'),
(133, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:05:45', '2019-11-02 19:05:45'),
(134, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:06:05', '2019-11-02 19:06:05'),
(135, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:06:32', '2019-11-02 19:06:32'),
(136, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:06:38', '2019-11-02 19:06:38'),
(137, 1, 'sc_admin/payment_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:06:42', '2019-11-02 19:06:42'),
(138, 1, 'sc_admin/shipping_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:06:49', '2019-11-02 19:06:49'),
(139, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:06:59', '2019-11-02 19:06:59'),
(140, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:08:08', '2019-11-02 19:08:08'),
(141, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"shipping_status\",\"value\":\"3\",\"pk\":\"1\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 19:08:27', '2019-11-02 19:08:27'),
(142, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:08:34', '2019-11-02 19:08:34'),
(143, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"shipping_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"ZlfYl4VLQWFBFtGCwQjhLeOGQmhr1lSOGqs9rIfe\"}', '2019-11-02 19:08:44', '2019-11-02 19:08:44'),
(144, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:10:00', '2019-11-02 19:10:00'),
(145, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:10:03', '2019-11-02 19:10:03'),
(146, 1, 'sc_admin/payment_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:10:08', '2019-11-02 19:10:08'),
(147, 1, 'sc_admin/shipping_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-02 19:10:11', '2019-11-02 19:10:11'),
(148, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:51:53', '2019-11-03 06:51:53'),
(149, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:52:07', '2019-11-03 06:52:07'),
(150, 1, 'sc_admin/vendor', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:53:57', '2019-11-03 06:53:57'),
(151, 1, 'sc_admin/brand', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:54:07', '2019-11-03 06:54:07'),
(152, 1, 'sc_admin/vendor', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:54:15', '2019-11-03 06:54:15'),
(153, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:54:20', '2019-11-03 06:54:20'),
(154, 1, 'sc_admin/category/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:54:24', '2019-11-03 06:54:24'),
(155, 1, 'sc_admin/category/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"descriptions\":{\"en\":{\"name\":\"New Category\",\"keyword\":\"keyword\",\"description\":\"description\"},\"vi\":{\"name\":null,\"keyword\":null,\"description\":null}},\"parent\":\"11\",\"image\":\"\\/data\\/product\\/\\/img-10.jpg\",\"sort\":\"0\",\"top\":\"on\",\"status\":\"on\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 06:55:28', '2019-11-03 06:55:28'),
(156, 1, 'sc_admin/category/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:55:28', '2019-11-03 06:55:28'),
(157, 1, 'sc_admin/category/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"descriptions\":{\"en\":{\"name\":\"New Category\",\"keyword\":\"keyword\",\"description\":\"description\"},\"vi\":{\"name\":\"Name\",\"keyword\":\"keyword\",\"description\":\"description\"}},\"parent\":\"11\",\"image\":\"\\/data\\/product\\/\\/img-10.jpg\",\"sort\":\"0\",\"top\":\"on\",\"status\":\"on\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 06:56:12', '2019-11-03 06:56:12'),
(158, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:56:12', '2019-11-03 06:56:12'),
(159, 1, 'sc_admin/category/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:56:19', '2019-11-03 06:56:19'),
(160, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:56:44', '2019-11-03 06:56:44'),
(161, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:56:46', '2019-11-03 06:56:46'),
(162, 1, 'sc_admin/role/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:56:55', '2019-11-03 06:56:55'),
(163, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:57:34', '2019-11-03 06:57:34'),
(164, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:57:45', '2019-11-03 06:57:45'),
(165, 1, 'sc_admin/payment_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:57:49', '2019-11-03 06:57:49'),
(166, 1, 'sc_admin/shipping_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:57:57', '2019-11-03 06:57:57'),
(167, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:58:20', '2019-11-03 06:58:20'),
(168, 1, 'sc_admin/menu/edit/6', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:59:07', '2019-11-03 06:59:07'),
(169, 1, 'sc_admin/menu/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:59:25', '2019-11-03 06:59:25'),
(170, 1, 'sc_admin/menu/edit/12', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:59:34', '2019-11-03 06:59:34'),
(171, 1, 'sc_admin/menu/edit/13', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:59:40', '2019-11-03 06:59:40'),
(172, 1, 'sc_admin/menu/edit/14', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 06:59:46', '2019-11-03 06:59:46'),
(173, 1, 'sc_admin/menu/edit/55', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:02:33', '2019-11-03 07:02:33'),
(174, 1, 'sc_admin/menu/edit/55', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"parent_id\":\"0\",\"title\":\"API Manager\",\"icon\":\"fa-plug\",\"uri\":\"lang::admin::api\",\"sort\":\"302\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:02:50', '2019-11-03 07:02:50'),
(175, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:02:50', '2019-11-03 07:02:50'),
(176, 1, 'sc_admin/menu/edit/55', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:03:06', '2019-11-03 07:03:06'),
(177, 1, 'sc_admin/menu/edit/55', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"parent_id\":\"0\",\"title\":\"API Manager\",\"icon\":\"fa-plug\",\"uri\":\"lang::admin::api_manager\",\"sort\":\"302\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:03:13', '2019-11-03 07:03:13'),
(178, 1, 'sc_admin/menu', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:03:14', '2019-11-03 07:03:14'),
(179, 1, 'sc_admin/menu/edit/52', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:05:13', '2019-11-03 07:05:13'),
(180, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:05:41', '2019-11-03 07:05:41'),
(181, 1, 'sc_admin/extension/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\",\"key\":\"Discount\",\"group\":\"Total\"}', '2019-11-03 07:05:56', '2019-11-03 07:05:56'),
(182, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 07:05:56', '2019-11-03 07:05:56'),
(183, 1, 'sc_admin/extension/enable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\",\"key\":\"Discount\",\"group\":\"Total\"}', '2019-11-03 07:06:00', '2019-11-03 07:06:00'),
(184, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 07:06:01', '2019-11-03 07:06:01'),
(185, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-11-03 07:06:05', '2019-11-03 07:06:05'),
(186, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:06:05', '2019-11-03 07:06:05'),
(187, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:06:17', '2019-11-03 07:06:17'),
(188, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-11-03 07:06:23', '2019-11-03 07:06:23'),
(189, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:06:23', '2019-11-03 07:06:23'),
(190, 1, 'sc_admin/shop_discount/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:06:34', '2019-11-03 07:06:34'),
(191, 1, 'sc_admin/shop_discount/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"code\":null,\"reward\":null,\"data\":null,\"limit\":\"1\",\"expires_at\":null,\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:06:49', '2019-11-03 07:06:49'),
(192, 1, 'sc_admin/shop_discount/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:06:49', '2019-11-03 07:06:49'),
(193, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"keyword\":\"mobile\",\"search\":null}', '2019-11-03 07:07:24', '2019-11-03 07:07:24'),
(194, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:07:48', '2019-11-03 07:07:48'),
(195, 1, 'sc_admin/order_status/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:07:51', '2019-11-03 07:07:51'),
(196, 1, 'sc_admin/order_status/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"New2\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:07:56', '2019-11-03 07:07:56'),
(197, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:07:56', '2019-11-03 07:07:56'),
(198, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:07:59', '2019-11-03 07:07:59'),
(199, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:08:07', '2019-11-03 07:08:07'),
(200, 1, 'sc_admin/order_status/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:08:10', '2019-11-03 07:08:10'),
(201, 1, 'sc_admin/order_status/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"New\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:08:14', '2019-11-03 07:08:14');
INSERT INTO `admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(202, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:08:14', '2019-11-03 07:08:14'),
(203, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:08:17', '2019-11-03 07:08:17'),
(204, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:08:40', '2019-11-03 07:08:40'),
(205, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"status\",\"value\":\"5\",\"pk\":\"1\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:09:07', '2019-11-03 07:09:07'),
(206, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:09:12', '2019-11-03 07:09:12'),
(207, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"status\",\"value\":\"4\",\"pk\":\"1\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:09:24', '2019-11-03 07:09:24'),
(208, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"order_status\":\"1\"}', '2019-11-03 07:09:30', '2019-11-03 07:09:30'),
(209, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:09:40', '2019-11-03 07:09:40'),
(210, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:09:43', '2019-11-03 07:09:43'),
(211, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"keyword\":null,\"order_status\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-11-03 07:09:49', '2019-11-03 07:09:49'),
(212, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"keyword\":null,\"order_status\":null,\"_pjax\":\"#pjax-container\"}', '2019-11-03 07:09:55', '2019-11-03 07:09:55'),
(213, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:02', '2019-11-03 07:10:02'),
(214, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:04', '2019-11-03 07:10:04'),
(215, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:07', '2019-11-03 07:10:07'),
(216, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:09', '2019-11-03 07:10:09'),
(217, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:12', '2019-11-03 07:10:12'),
(218, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:10:19', '2019-11-03 07:10:19'),
(219, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"order_status\":\"1\"}', '2019-11-03 07:10:23', '2019-11-03 07:10:23'),
(220, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:28', '2019-11-03 07:10:28'),
(221, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:10:35', '2019-11-03 07:10:35'),
(222, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:10:42', '2019-11-03 07:10:42'),
(223, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"order_status\":\"1\"}', '2019-11-03 07:10:46', '2019-11-03 07:10:46'),
(224, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:12', '2019-11-03 07:11:12'),
(225, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:16', '2019-11-03 07:11:16'),
(226, 1, 'sc_admin/vendor', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:19', '2019-11-03 07:11:19'),
(227, 1, 'sc_admin/brand', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:22', '2019-11-03 07:11:22'),
(228, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:28', '2019-11-03 07:11:28'),
(229, 1, 'sc_admin/subscribe', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:31', '2019-11-03 07:11:31'),
(230, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:38', '2019-11-03 07:11:38'),
(231, 1, 'sc_admin/page', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:41', '2019-11-03 07:11:41'),
(232, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:45', '2019-11-03 07:11:45'),
(233, 1, 'sc_admin/banner/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:51', '2019-11-03 07:11:51'),
(234, 1, 'sc_admin/banner/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"image\":\"\\/data\\/banner\\/Main-banner-3-1903x600.jpg\",\"url\":null,\"html\":null,\"sort\":\"1\",\"status\":\"on\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:11:57', '2019-11-03 07:11:57'),
(235, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:11:58', '2019-11-03 07:11:58'),
(236, 1, 'sc_admin/banner/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:12:12', '2019-11-03 07:12:12'),
(237, 1, 'sc_admin/banner/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"image\":\"\\/data\\/banner\\/Main-banner-3-1903x600.jpg\",\"url\":null,\"html\":null,\"sort\":\"0\",\"status\":\"on\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 07:12:19', '2019-11-03 07:12:19'),
(238, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:12:19', '2019-11-03 07:12:19'),
(239, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:12:50', '2019-11-03 07:12:50'),
(240, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:13:02', '2019-11-03 07:13:02'),
(241, 1, 'sc_admin/product/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:13:08', '2019-11-03 07:13:08'),
(242, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"type\":\"product\"}', '2019-11-03 07:14:29', '2019-11-03 07:14:29'),
(243, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"product\",\"_\":\"1572761669489\"}', '2019-11-03 07:14:29', '2019-11-03 07:14:29'),
(244, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"product\",\"_\":\"1572761669490\"}', '2019-11-03 07:14:30', '2019-11-03 07:14:30'),
(245, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"product\",\"sort_type\":\"alphabetic\",\"_\":\"1572761669491\"}', '2019-11-03 07:14:30', '2019-11-03 07:14:30'),
(246, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:14:41', '2019-11-03 07:14:41'),
(247, 1, 'sc_admin/vendor', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:15:02', '2019-11-03 07:15:02'),
(248, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:15:07', '2019-11-03 07:15:07'),
(249, 1, 'sc_admin/brand', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:15:18', '2019-11-03 07:15:18'),
(250, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:15:22', '2019-11-03 07:15:22'),
(251, 1, 'sc_admin/attribute_group', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:15:41', '2019-11-03 07:15:41'),
(252, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:16:10', '2019-11-03 07:16:10'),
(253, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:19:19', '2019-11-03 07:19:19'),
(254, 1, 'sc_admin/user/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:19:23', '2019-11-03 07:19:23'),
(255, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 07:19:36', '2019-11-03 07:19:36'),
(256, 1, 'sc_admin/role/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"ids\":null,\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:43:09', '2019-11-03 08:43:09'),
(257, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 08:43:09', '2019-11-03 08:43:09'),
(258, 1, 'sc_admin/role/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"ids\":null,\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:43:18', '2019-11-03 08:43:18'),
(259, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 08:43:18', '2019-11-03 08:43:18'),
(260, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 08:43:25', '2019-11-03 08:43:25'),
(261, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 08:43:38', '2019-11-03 08:43:38'),
(262, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:43:43', '2019-11-03 08:43:43'),
(263, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"sort_order\":\"id__asc\",\"_pjax\":\"#pjax-container\"}', '2019-11-03 08:44:06', '2019-11-03 08:44:06'),
(264, 1, 'sc_admin/permission/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:44:33', '2019-11-03 08:44:33'),
(265, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"sort_order\":\"id__asc\"}', '2019-11-03 08:44:48', '2019-11-03 08:44:48'),
(266, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:45:33', '2019-11-03 08:45:33'),
(267, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:46:48', '2019-11-03 08:46:48'),
(268, 1, 'sc_admin/user/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:46:50', '2019-11-03 08:46:50'),
(269, 1, 'sc_admin/permission', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:47:04', '2019-11-03 08:47:04'),
(270, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:47:07', '2019-11-03 08:47:07'),
(271, 1, 'sc_admin/role/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:48:33', '2019-11-03 08:48:33'),
(272, 1, 'sc_admin/role/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:49:05', '2019-11-03 08:49:05'),
(273, 1, 'sc_admin/role/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Ameer Hamza\",\"slug\":\"administrator\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:49:15', '2019-11-03 08:49:15'),
(274, 1, 'sc_admin/role/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:49:15', '2019-11-03 08:49:15'),
(275, 1, 'sc_admin/role/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Ameer Hamza\",\"slug\":\"administrator2\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:49:27', '2019-11-03 08:49:27'),
(276, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:49:28', '2019-11-03 08:49:28'),
(277, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:49:41', '2019-11-03 08:49:41'),
(278, 1, 'sc_admin/user/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:49:47', '2019-11-03 08:49:47'),
(279, 1, 'sc_admin/user/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Administrator\",\"username\":\"admin\",\"avatar\":\"\\/admin\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:50:10', '2019-11-03 08:50:10'),
(280, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:50:11', '2019-11-03 08:50:11'),
(281, 1, 'sc_admin/deny', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:50:11', '2019-11-03 08:50:11'),
(282, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:55:56', '2019-11-03 08:55:56'),
(283, 1, 'sc_admin/user/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:56:04', '2019-11-03 08:56:04'),
(284, 1, 'sc_admin/user/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Administrator\",\"username\":\"admin\",\"avatar\":\"\\/admin\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"1\"],\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:56:13', '2019-11-03 08:56:13'),
(285, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:56:13', '2019-11-03 08:56:13'),
(286, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:56:21', '2019-11-03 08:56:21'),
(287, 1, 'sc_admin/role/delete', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"ids\":\"7\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:56:27', '2019-11-03 08:56:27'),
(288, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-03 08:56:28', '2019-11-03 08:56:28'),
(289, 1, 'sc_admin/locale/vi', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:57:20', '2019-11-03 08:57:20'),
(290, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:57:20', '2019-11-03 08:57:20'),
(291, 1, 'sc_admin/locale/en', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:57:36', '2019-11-03 08:57:36'),
(292, 1, 'sc_admin/role', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:57:37', '2019-11-03 08:57:37'),
(293, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:57:55', '2019-11-03 08:57:55'),
(294, 1, 'sc_admin/customer/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:59:28', '2019-11-03 08:59:28'),
(295, 1, 'sc_admin/customer/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"first_name\":\"Ameer\",\"last_name\":\"Hamza\",\"email\":\"hamza.iitju@gmail.com\",\"phone\":\"01744952899\",\"address1\":\"JU\",\"address2\":\"JU\",\"country\":\"BD\",\"password\":\"admin123\",\"status\":\"on\",\"_token\":\"YIta1fxRM2DXovWkfd3USNkQdEl3tMg7tJ0kMdFQ\"}', '2019-11-03 08:59:42', '2019-11-03 08:59:42'),
(296, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 08:59:42', '2019-11-03 08:59:42'),
(297, 1, 'sc_admin/order/detail/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 09:02:29', '2019-11-03 09:02:29'),
(298, 1, 'sc_admin/order/detail/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 09:02:44', '2019-11-03 09:02:44'),
(299, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 09:04:08', '2019-11-03 09:04:08'),
(300, 1, 'sc_admin/product/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 09:04:11', '2019-11-03 09:04:11'),
(301, 1, 'sc_admin/order/detail/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 09:12:25', '2019-11-03 09:12:25'),
(302, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 09:13:01', '2019-11-03 09:13:01'),
(303, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:09:25', '2019-11-03 18:09:25'),
(304, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:10:00', '2019-11-03 18:10:00'),
(305, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:10:35', '2019-11-03 18:10:35'),
(306, 1, 'sc_admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:11:12', '2019-11-03 18:11:12'),
(307, 1, 'sc_admin/email', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:11:55', '2019-11-03 18:11:55'),
(308, 1, 'sc_admin/email_template', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:12:02', '2019-11-03 18:12:02'),
(309, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:12:23', '2019-11-03 18:12:23'),
(310, 1, 'sc_admin/language/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:12:28', '2019-11-03 18:12:28'),
(311, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"type\":\"language\"}', '2019-11-03 18:12:41', '2019-11-03 18:12:41'),
(312, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"language\",\"_\":\"1572801163940\"}', '2019-11-03 18:12:44', '2019-11-03 18:12:44'),
(313, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"language\",\"_\":\"1572801163941\"}', '2019-11-03 18:12:44', '2019-11-03 18:12:44'),
(314, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"language\",\"sort_type\":\"alphabetic\",\"_\":\"1572801163942\"}', '2019-11-03 18:12:45', '2019-11-03 18:12:45'),
(315, 1, 'sc_admin/uploads', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"type\":\"language\"}', '2019-11-03 18:15:17', '2019-11-03 18:15:17'),
(316, 1, 'sc_admin/uploads/folders', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"language\",\"_\":\"1572801317828\"}', '2019-11-03 18:15:18', '2019-11-03 18:15:18'),
(317, 1, 'sc_admin/uploads/errors', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"language\",\"_\":\"1572801317829\"}', '2019-11-03 18:15:18', '2019-11-03 18:15:18'),
(318, 1, 'sc_admin/uploads/jsonitems', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"working_dir\":null,\"type\":\"language\",\"sort_type\":\"alphabetic\",\"_\":\"1572801317830\"}', '2019-11-03 18:15:18', '2019-11-03 18:15:18'),
(319, 1, 'sc_admin/language/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Bangla\",\"code\":\"bn\",\"icon\":\"\\/data\\/language\\/\\/flag_bn.png\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:15:42', '2019-11-03 18:15:42'),
(320, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:15:42', '2019-11-03 18:15:42'),
(321, 1, 'sc_admin/locale/bn', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:15:49', '2019-11-03 18:15:49'),
(322, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:15:50', '2019-11-03 18:15:50'),
(323, 1, 'sc_admin/locale/en', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:16:00', '2019-11-03 18:16:00'),
(324, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:16:01', '2019-11-03 18:16:01'),
(325, 1, 'sc_admin/currency', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:16:34', '2019-11-03 18:16:34'),
(326, 1, 'sc_admin/currency/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:16:38', '2019-11-03 18:16:38'),
(327, 1, 'sc_admin/currency/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Taka\",\"code\":\"TK\",\"symbol\":\"\\u09f3\",\"exchange_rate\":\"1\",\"precision\":\"0\",\"symbol_first\":\"1\",\"thousands\":\",\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:17:42', '2019-11-03 18:17:42'),
(328, 1, 'sc_admin/currency', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:17:42', '2019-11-03 18:17:42'),
(329, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:17:58', '2019-11-03 18:17:58'),
(330, 1, 'sc_admin/currency', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:18:13', '2019-11-03 18:18:13'),
(331, 1, 'sc_admin/locale/bn', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:18:40', '2019-11-03 18:18:40'),
(332, 1, 'sc_admin/currency', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:18:40', '2019-11-03 18:18:40'),
(333, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:18:45', '2019-11-03 18:18:45'),
(334, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:19:07', '2019-11-03 18:19:07'),
(335, 1, 'sc_admin/user', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:19:25', '2019-11-03 18:19:25'),
(336, 1, 'sc_admin/banner', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:19:34', '2019-11-03 18:19:34'),
(337, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:19:39', '2019-11-03 18:19:39'),
(338, 1, 'sc_admin/news/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:19:44', '2019-11-03 18:19:44'),
(339, 1, 'sc_admin/news/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"descriptions\":{\"en\":{\"title\":null,\"keyword\":null,\"description\":null,\"content\":null},\"vi\":{\"title\":null,\"keyword\":null,\"description\":null,\"content\":null},\"bn\":{\"title\":null,\"keyword\":null,\"description\":null,\"content\":null}},\"image\":null,\"sort\":\"0\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:20:10', '2019-11-03 18:20:10'),
(340, 1, 'sc_admin/news/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:20:10', '2019-11-03 18:20:10'),
(341, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:20:35', '2019-11-03 18:20:35'),
(342, 1, 'sc_admin/language/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:20:47', '2019-11-03 18:20:47'),
(343, 1, 'sc_admin/language/edit/2', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Ti\\u1ebfng Vi\\u1ec7t\",\"code\":\"vi\",\"icon\":\"\\/data\\/language\\/flag_vn.png\",\"sort\":\"1\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:21:21', '2019-11-03 18:21:21'),
(344, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:21:21', '2019-11-03 18:21:21'),
(345, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:21:30', '2019-11-03 18:21:30'),
(346, 1, 'sc_admin/news/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:21:33', '2019-11-03 18:21:33'),
(347, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:28:10', '2019-11-03 18:28:10'),
(348, 1, 'sc_admin/locale/en', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:44:16', '2019-11-03 18:44:16'),
(349, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:44:16', '2019-11-03 18:44:16'),
(350, 1, 'sc_admin/locale/bn', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:44:19', '2019-11-03 18:44:19'),
(351, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:44:19', '2019-11-03 18:44:19'),
(352, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:45:03', '2019-11-03 18:45:03'),
(353, 1, 'sc_admin/language/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:45:13', '2019-11-03 18:45:13'),
(354, 1, 'sc_admin/language/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"Bangla\",\"code\":\"bn\",\"icon\":\"\\/data\\/language\\/\\/flag_bn.png\",\"sort\":\"1\",\"status\":\"on\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:45:18', '2019-11-03 18:45:18'),
(355, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:45:19', '2019-11-03 18:45:19'),
(356, 1, 'sc_admin/language/edit/1', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:45:21', '2019-11-03 18:45:21'),
(357, 1, 'sc_admin/language/edit/1', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"English\",\"code\":\"en\",\"icon\":\"\\/data\\/language\\/flag_uk.png\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:45:28', '2019-11-03 18:45:28'),
(358, 1, 'sc_admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:45:28', '2019-11-03 18:45:28'),
(359, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:47:40', '2019-11-03 18:47:40'),
(360, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:48:38', '2019-11-03 18:48:38'),
(361, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"show_date_available\",\"value\":\"0\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:49:24', '2019-11-03 18:49:24'),
(362, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:49:28', '2019-11-03 18:49:28'),
(363, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:49:31', '2019-11-03 18:49:31'),
(364, 1, 'sc_admin/product/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:49:33', '2019-11-03 18:49:33'),
(365, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:49:55', '2019-11-03 18:49:55'),
(366, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '{\"name\":\"show_date_available\",\"value\":\"1\",\"_token\":\"gky2OXwIWUmImZv7Kz8L1Wr38AVRmZ5LG5VRTPef\"}', '2019-11-03 18:49:59', '2019-11-03 18:49:59'),
(367, 1, 'sc_admin/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:50:14', '2019-11-03 18:50:14'),
(368, 1, 'sc_admin/product/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:50:17', '2019-11-03 18:50:17'),
(369, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '[]', '2019-11-03 18:51:20', '2019-11-03 18:51:20'),
(370, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:57:35', '2019-11-07 17:57:35'),
(371, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:57:45', '2019-11-07 17:57:45'),
(372, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:58:12', '2019-11-07 17:58:12'),
(373, 1, 'sc_admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:58:16', '2019-11-07 17:58:16'),
(374, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '{\"name\":\"SITE_CURRENCY\",\"value\":\"TK\",\"pk\":null,\"_token\":\"jo4Q6P56Wh6xFVO66Ugt4VQkzQAjg53KdaFhAYkq\"}', '2019-11-07 17:58:28', '2019-11-07 17:58:28'),
(375, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '{\"name\":\"ADMIN_PREFIX\",\"value\":\"admin\",\"pk\":null,\"_token\":\"jo4Q6P56Wh6xFVO66Ugt4VQkzQAjg53KdaFhAYkq\"}', '2019-11-07 17:58:50', '2019-11-07 17:58:50'),
(376, 1, 'admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:58:50', '2019-11-07 17:58:50'),
(377, 1, 'admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '{\"name\":\"ADMIN_NAME\",\"value\":\"Admin\",\"pk\":null,\"_token\":\"jo4Q6P56Wh6xFVO66Ugt4VQkzQAjg53KdaFhAYkq\"}', '2019-11-07 17:59:02', '2019-11-07 17:59:02'),
(378, 1, 'admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '{\"name\":\"ADMIN_TITLE\",\"value\":\"Administration\",\"pk\":null,\"_token\":\"jo4Q6P56Wh6xFVO66Ugt4VQkzQAjg53KdaFhAYkq\"}', '2019-11-07 17:59:15', '2019-11-07 17:59:15'),
(379, 1, 'admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '{\"name\":\"ADMIN_LOGO\",\"value\":\"Admin\",\"pk\":null,\"_token\":\"jo4Q6P56Wh6xFVO66Ugt4VQkzQAjg53KdaFhAYkq\"}', '2019-11-07 17:59:25', '2019-11-07 17:59:25'),
(380, 1, 'admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '{\"name\":\"ADMIN_TITLE\",\"value\":\"Administrator\",\"pk\":null,\"_token\":\"jo4Q6P56Wh6xFVO66Ugt4VQkzQAjg53KdaFhAYkq\"}', '2019-11-07 17:59:40', '2019-11-07 17:59:40'),
(381, 1, 'admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:59:43', '2019-11-07 17:59:43'),
(382, 1, 'admin/auth/setting', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 17:59:55', '2019-11-07 17:59:55'),
(383, 1, 'admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:00:19', '2019-11-07 18:00:19'),
(384, 1, 'admin/language', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:14:36', '2019-11-07 18:14:36'),
(385, 1, 'admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:14:41', '2019-11-07 18:14:41'),
(386, 1, 'admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:17:25', '2019-11-07 18:17:25'),
(387, 1, 'admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:20:57', '2019-11-07 18:20:57'),
(388, 1, 'admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:56:06', '2019-11-07 18:56:06'),
(389, 1, 'admin/customer/edit/2', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '[]', '2019-11-07 18:56:17', '2019-11-07 18:56:17'),
(390, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 10:12:59', '2019-11-10 10:12:59'),
(391, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 10:13:00', '2019-11-10 10:13:00'),
(392, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:11:51', '2019-11-10 12:11:51'),
(393, 1, 'sc_admin/customer/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:12:07', '2019-11-10 12:12:07'),
(394, 1, 'sc_admin/customer/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"first_name\":\"Ameer\",\"last_name\":\"Hamza\",\"email\":\"hamza.juit@gmail.com\",\"phone\":\"01823801180\",\"address\":\"Address\",\"district\":\"District\",\"upazila\":\"upazila\",\"post\":\"1243\",\"country\":\"BD\",\"occupation\":null,\"educational_institute\":\"IIT\",\"birthdate\":null,\"password\":null,\"status\":\"on\",\"_token\":\"dKYeq59vpHBQEwHBSXh6HuHeUZSUU46DjSVMtBDj\"}', '2019-11-10 12:12:22', '2019-11-10 12:12:22'),
(395, 1, 'sc_admin/customer/edit/3', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:12:22', '2019-11-10 12:12:22'),
(396, 1, 'sc_admin/customer/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"first_name\":\"Ameer\",\"last_name\":\"Hamza\",\"email\":\"hamza.juit@gmail.com\",\"phone\":\"01823801180\",\"address\":\"Address\",\"district\":\"District\",\"upazila\":\"upazila\",\"post\":\"1243\",\"country\":\"BD\",\"occupation\":null,\"educational_institute\":\"IIT-JU\",\"birthdate\":null,\"password\":\"admin123\",\"status\":\"on\",\"_token\":\"dKYeq59vpHBQEwHBSXh6HuHeUZSUU46DjSVMtBDj\"}', '2019-11-10 12:12:42', '2019-11-10 12:12:42'),
(397, 1, 'sc_admin/customer/edit/3', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"first_name\":\"Ameer\",\"last_name\":\"Hamza\",\"email\":\"hamza.juit@gmail.com\",\"phone\":\"01823801180\",\"address\":\"Address\",\"district\":\"District\",\"upazila\":\"upazila\",\"post\":\"1243\",\"country\":\"BD\",\"occupation\":null,\"educational_institute\":\"IIT-JU\",\"birthdate\":null,\"password\":\"admin123\",\"status\":\"on\",\"_token\":\"dKYeq59vpHBQEwHBSXh6HuHeUZSUU46DjSVMtBDj\"}', '2019-11-10 12:12:56', '2019-11-10 12:12:56'),
(398, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:17:02', '2019-11-10 12:17:02');
INSERT INTO `admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(399, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:17:07', '2019-11-10 12:17:07'),
(400, 1, 'sc_admin/customer/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:17:11', '2019-11-10 12:17:11'),
(401, 1, 'sc_admin/customer/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:19:16', '2019-11-10 12:19:16'),
(402, 1, 'sc_admin/customer/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"first_name\":\"Ameer\",\"last_name\":\"Hamza\",\"email\":\"admin@example.com\",\"phone\":\"01823801180\",\"address\":\"Address\",\"district\":\"District\",\"upazila\":\"upazila\",\"post\":\"1243\",\"country\":\"BD\",\"occupation\":\"Occupation\",\"educational_institute\":\"IIT-JU\",\"birthdate\":\"2019-10-30\",\"password\":\"admin123\",\"status\":\"on\",\"_token\":\"dKYeq59vpHBQEwHBSXh6HuHeUZSUU46DjSVMtBDj\"}', '2019-11-10 12:20:09', '2019-11-10 12:20:09'),
(403, 1, 'sc_admin/customer', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:20:09', '2019-11-10 12:20:09'),
(404, 1, 'sc_admin/customer/edit/4', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 12:20:18', '2019-11-10 12:20:18'),
(405, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:31:30', '2019-11-10 13:31:30'),
(406, 1, 'sc_admin/order_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:31:33', '2019-11-10 13:31:33'),
(407, 1, 'sc_admin/payment_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:31:36', '2019-11-10 13:31:36'),
(408, 1, 'sc_admin/shipping_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:31:40', '2019-11-10 13:31:40'),
(409, 1, 'sc_admin/category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:31:50', '2019-11-10 13:31:50'),
(410, 1, 'sc_admin/report/product', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:32:04', '2019-11-10 13:32:04'),
(411, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:49:27', '2019-11-10 13:49:27'),
(412, 1, 'sc_admin/order/detail/4', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:49:53', '2019-11-10 13:49:53'),
(413, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"name\":\"status\",\"value\":\"5\",\"pk\":\"4\",\"_token\":\"N0jnjjPXmmhrZ8CQIh2yTiQzkRyfIo5mt52IZzqP\"}', '2019-11-10 13:50:01', '2019-11-10 13:50:01'),
(414, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 13:50:07', '2019-11-10 13:50:07'),
(415, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 16:12:29', '2019-11-10 16:12:29'),
(416, 1, 'sc_admin/payment_status', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 16:12:38', '2019-11-10 16:12:38'),
(417, 1, 'sc_admin/order', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 16:12:42', '2019-11-10 16:12:42'),
(418, 1, 'sc_admin/order/detail/8', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 16:21:45', '2019-11-10 16:21:45'),
(419, 1, 'sc_admin/order/update', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"name\":\"status\",\"value\":\"5\",\"pk\":\"8\",\"_token\":\"TnmF7fZdPVT3wtyXrhu59eCB7CZ9LnnTm5SFHTZi\"}', '2019-11-10 16:21:56', '2019-11-10 16:21:56'),
(420, 1, 'sc_admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 16:56:22', '2019-11-10 16:56:22'),
(421, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:13:27', '2019-11-10 17:13:27'),
(422, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"name\":\"shop_allow_guest\",\"value\":\"0\",\"_token\":\"EAiwQP2yyAIzANS2JYsNkIKugrHnA0tU8VunpMYr\"}', '2019-11-10 17:13:37', '2019-11-10 17:13:37'),
(423, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:18:25', '2019-11-10 17:18:25'),
(424, 1, 'sc_admin/env', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:18:39', '2019-11-10 17:18:39'),
(425, 1, 'sc_admin/email', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:18:54', '2019-11-10 17:18:54'),
(426, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"name\":\"order_success_to_admin\",\"value\":\"1\",\"_token\":\"znfvuzMNgCBFcj9PKktzuvyNqbKoZNwomlYOFVWV\"}', '2019-11-10 17:19:08', '2019-11-10 17:19:08'),
(427, 1, 'sc_admin/store_value/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"name\":\"order_success_to_customer\",\"value\":\"1\",\"_token\":\"znfvuzMNgCBFcj9PKktzuvyNqbKoZNwomlYOFVWV\"}', '2019-11-10 17:19:09', '2019-11-10 17:19:09'),
(428, 1, 'sc_admin/email_template', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:19:51', '2019-11-10 17:19:51'),
(429, 1, 'sc_admin/store_value', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:20:09', '2019-11-10 17:20:09'),
(430, 1, 'sc_admin/store_info', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:20:13', '2019-11-10 17:20:13'),
(431, 1, 'sc_admin/store_info/update_info', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"name\":\"email\",\"value\":\"hamza.juit@gmail.com\",\"pk\":null,\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\"}', '2019-11-10 17:20:30', '2019-11-10 17:20:30'),
(432, 1, 'sc_admin', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:22:49', '2019-11-10 17:22:49'),
(433, 1, 'sc_admin/module/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:26:12', '2019-11-10 17:26:12'),
(434, 1, 'sc_admin/module/install', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"Content\",\"group\":\"Cms\"}', '2019-11-10 17:26:23', '2019-11-10 17:26:23'),
(435, 1, 'sc_admin/module/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:26:23', '2019-11-10 17:26:23'),
(436, 1, 'sc_admin/module/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:26:36', '2019-11-10 17:26:36'),
(437, 1, 'sc_admin/module/block', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:27:02', '2019-11-10 17:27:02'),
(438, 1, 'sc_admin/module/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:27:16', '2019-11-10 17:27:16'),
(439, 1, 'sc_admin/module/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:27:32', '2019-11-10 17:27:32'),
(440, 1, 'sc_admin/module/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"Content\",\"group\":\"Cms\"}', '2019-11-10 17:27:36', '2019-11-10 17:27:36'),
(441, 1, 'sc_admin/module/cms', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-10 17:27:36', '2019-11-10 17:27:36'),
(442, 1, 'sc_admin/module/block', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:27:47', '2019-11-10 17:27:47'),
(443, 1, 'sc_admin/module/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"LastViewProduct\",\"group\":\"Block\"}', '2019-11-10 17:27:50', '2019-11-10 17:27:50'),
(444, 1, 'sc_admin/module/block', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-10 17:27:50', '2019-11-10 17:27:50'),
(445, 1, 'sc_admin/cms_category', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:28:02', '2019-11-10 17:28:02'),
(446, 1, 'sc_admin/cms_category/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:28:07', '2019-11-10 17:28:07'),
(447, 1, 'sc_admin/cms_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:28:27', '2019-11-10 17:28:27'),
(448, 1, 'sc_admin/cms_content/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:28:30', '2019-11-10 17:28:30'),
(449, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:28:48', '2019-11-10 17:28:48'),
(450, 1, 'sc_admin/locale/bn', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:06', '2019-11-10 17:29:06'),
(451, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:07', '2019-11-10 17:29:07'),
(452, 1, 'sc_admin/locale/en', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:11', '2019-11-10 17:29:11'),
(453, 1, 'sc_admin/news', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:12', '2019-11-10 17:29:12'),
(454, 1, 'sc_admin/extension/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:20', '2019-11-10 17:29:20'),
(455, 1, 'sc_admin/extension/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:35', '2019-11-10 17:29:35'),
(456, 1, 'sc_admin/extension/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:29:59', '2019-11-10 17:29:59'),
(457, 1, 'sc_admin/extension/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"ShippingStandard\",\"group\":\"Shipping\"}', '2019-11-10 17:30:04', '2019-11-10 17:30:04'),
(458, 1, 'sc_admin/extension/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-10 17:30:05', '2019-11-10 17:30:05'),
(459, 1, 'sc_admin/extension/enable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"ShippingStandard\",\"group\":\"Shipping\"}', '2019-11-10 17:30:47', '2019-11-10 17:30:47'),
(460, 1, 'sc_admin/extension/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-10 17:30:48', '2019-11-10 17:30:48'),
(461, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:30:55', '2019-11-10 17:30:55'),
(462, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-11-10 17:31:11', '2019-11-10 17:31:11'),
(463, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:31:11', '2019-11-10 17:31:11'),
(464, 1, 'sc_admin/shop_discount/create', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:31:17', '2019-11-10 17:31:17'),
(465, 1, 'sc_admin/shop_discount/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"code\":\"Discount\",\"reward\":\"1500\",\"type\":\"point\",\"data\":null,\"limit\":\"1\",\"login\":\"on\",\"expires_at\":\"2019-11-30\",\"status\":\"on\",\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\"}', '2019-11-10 17:32:23', '2019-11-10 17:32:23'),
(466, 1, 'sc_admin/shop_discount', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:32:23', '2019-11-10 17:32:23'),
(467, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:33:46', '2019-11-10 17:33:46'),
(468, 1, 'sc_admin/extension/disable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"Discount\",\"group\":\"Total\"}', '2019-11-10 17:33:56', '2019-11-10 17:33:56'),
(469, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-10 17:33:56', '2019-11-10 17:33:56'),
(470, 1, 'sc_admin/extension/enable', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_token\":\"ZHpkLghzl1yevDbOPK0hyANgkDaGbMtqvATSsDv6\",\"key\":\"Discount\",\"group\":\"Total\"}', '2019-11-10 17:34:23', '2019-11-10 17:34:23'),
(471, 1, 'sc_admin/extension/total', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '{\"_pjax\":\"#pjax-container\"}', '2019-11-10 17:34:24', '2019-11-10 17:34:24'),
(472, 1, 'sc_admin/extension/other', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:34:28', '2019-11-10 17:34:28'),
(473, 1, 'sc_admin/extension/shipping', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:34:38', '2019-11-10 17:34:38'),
(474, 1, 'sc_admin/extension/payment', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:34:46', '2019-11-10 17:34:46'),
(475, 1, 'sc_admin/block_content', 'GET', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '[]', '2019-11-10 17:34:54', '2019-11-10 17:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `sort`, `title`, `icon`, `uri`, `type`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 11, 'lang::admin.menu_titles.order_manager', 'fa-cart-arrow-down', '', 0, NULL, NULL, NULL),
(2, 0, 12, 'lang::admin.menu_titles.product_mamager', 'fa-folder-open', '', 0, NULL, NULL, NULL),
(3, 0, 13, 'lang::admin.menu_titles.customer_manager', 'fa-group', '', 0, NULL, NULL, NULL),
(4, 0, 201, 'lang::admin.menu_titles.template_layout', 'fa-object-ungroup', '', 0, NULL, NULL, NULL),
(5, 0, 301, 'lang::admin.menu_titles.config_manager', 'fa-cogs', '', 0, NULL, NULL, NULL),
(6, 0, 10, 'lang::ADMIN SHOP', '', '', 1, NULL, NULL, NULL),
(7, 0, 100, 'lang::ADMIN CONTENT', '', '', 1, NULL, NULL, NULL),
(8, 0, 200, 'lang::ADMIN EXTENSION', '', '', 1, NULL, NULL, NULL),
(9, 0, 300, 'lang::ADMIN SYSTEM', '', '', 1, NULL, NULL, NULL),
(10, 0, 102, 'lang::page.admin.title', 'fa-clone', 'admin::page', 0, NULL, NULL, NULL),
(11, 1, 6, 'lang::shipping_status.admin.title', 'fa-truck', 'admin::shipping_status', 0, NULL, NULL, NULL),
(12, 1, 3, 'lang::order.admin.title', 'fa-shopping-cart', 'admin::order', 0, NULL, NULL, NULL),
(13, 1, 4, 'lang::order_status.admin.title', 'fa-asterisk', 'admin::order_status', 0, NULL, NULL, NULL),
(14, 1, 5, 'lang::payment_status.admin.title', 'fa-recycle', 'admin::payment_status', 0, NULL, NULL, NULL),
(15, 2, 0, 'lang::category.admin.title', 'fa-folder-open-o', 'admin::category', 0, NULL, NULL, NULL),
(16, 2, 0, 'lang::product.admin.title', 'fa-file-photo-o', 'admin::product', 0, NULL, NULL, NULL),
(17, 2, 0, 'lang::vendor.admin.title', 'fa-user-secret', 'admin::vendor', 0, NULL, NULL, NULL),
(18, 2, 0, 'lang::brand.admin.title', 'fa-bank', 'admin::brand', 0, NULL, NULL, NULL),
(19, 2, 0, 'lang::attribute_group.admin.title', 'fa-bars', 'admin::attribute_group', 0, NULL, NULL, NULL),
(20, 3, 0, 'lang::customer.admin.title', 'fa-user', 'admin::customer', 0, NULL, NULL, NULL),
(21, 3, 0, 'lang::subscribe.admin.title', 'fa-user-circle-o', 'admin::subscribe', 0, NULL, NULL, NULL),
(22, 4, 0, 'lang::block_content.admin.title', 'fa-newspaper-o', 'admin::block_content', 0, NULL, NULL, NULL),
(23, 4, 0, 'lang::link.admin.title', 'fa-chrome', 'admin::link', 0, NULL, NULL, NULL),
(24, 4, 0, 'lang::template.admin.title', 'fa-columns', 'admin::template', 0, NULL, NULL, NULL),
(25, 5, 1, 'lang::store_value.admin.title', 'fa-cog', 'admin::store_value', 0, NULL, NULL, NULL),
(26, 5, 2, 'lang::store_info.admin.title', 'fa-cog', 'admin::store_info', 0, NULL, NULL, NULL),
(27, 5, 4, 'lang::admin.menu_titles.email_setting', 'fa-envelope', '', 0, NULL, NULL, NULL),
(28, 27, 0, 'lang::email.admin.title', 'fa-cog', 'admin::email', 0, NULL, NULL, NULL),
(29, 27, 0, 'lang::email_template.admin.title', 'fa-bars', 'admin::email_template', 0, NULL, NULL, NULL),
(30, 5, 5, 'lang::admin.menu_titles.localisation', 'fa-shirtsinbulk', '', 0, NULL, NULL, NULL),
(31, 30, 0, 'lang::language.admin.title', 'fa-pagelines', 'admin::language', 0, NULL, NULL, NULL),
(32, 30, 0, 'lang::currency.admin.title', 'fa-dollar', 'admin::currency', 0, NULL, NULL, NULL),
(33, 0, 101, 'lang::banner.admin.title', 'fa-image', 'admin::banner', 0, NULL, NULL, NULL),
(34, 5, 5, 'lang::backup.admin.title', 'fa-save', 'admin::backup', 0, NULL, NULL, NULL),
(35, 0, 202, 'lang::admin.menu_titles.extensions', 'fa-puzzle-piece', '', 0, NULL, NULL, NULL),
(36, 0, 202, 'lang::admin.menu_titles.modules', 'fa-codepen', '', 0, NULL, NULL, NULL),
(37, 0, 302, 'lang::admin.menu_titles.report_manager', 'fa-pie-chart', '', 0, NULL, NULL, NULL),
(38, 0, 0, 'lang::admin.menu_titles.admin', 'fa-sitemap', '', 0, NULL, NULL, NULL),
(39, 35, 0, 'lang::Extensions/language.Payment', 'fa-money', 'admin::extension/payment', 0, NULL, NULL, NULL),
(40, 35, 0, 'lang::Extensions/language.Shipping', 'fa-ambulance', 'admin::extension/shipping', 0, NULL, NULL, NULL),
(41, 35, 0, 'lang::Extensions/language.Total', 'fa-cog', 'admin::extension/total', 0, NULL, NULL, NULL),
(42, 35, 0, 'lang::Extensions/language.Other', 'fa-circle-thin', 'admin::extension/other', 0, NULL, NULL, NULL),
(43, 36, 0, 'lang::Modules/language.Cms', 'fa-modx', 'admin::module/cms', 0, NULL, NULL, NULL),
(44, 36, 0, 'lang::Modules/language.Block', 'fa-bars', 'admin::module/block', 0, NULL, NULL, NULL),
(45, 36, 0, 'lang::Modules/language.Other', 'fa-bars', 'admin::module/other', 0, NULL, NULL, NULL),
(46, 38, 0, 'lang::admin.menu_titles.users', 'fa-users', 'admin::user', 0, NULL, NULL, NULL),
(47, 38, 0, 'lang::admin.menu_titles.roles', 'fa-user', 'admin::role', 0, NULL, NULL, NULL),
(48, 38, 0, 'lang::admin.menu_titles.permission', 'fa-ban', 'admin::permission', 0, NULL, NULL, NULL),
(49, 38, 0, 'lang::admin.menu_titles.menu', 'fa-bars', 'admin::menu', 0, NULL, NULL, NULL),
(50, 38, 0, 'lang::admin.menu_titles.operation_log', 'fa-history', 'admin::log', 0, NULL, NULL, NULL),
(52, 0, 103, 'lang::news.admin.title', 'fa-file-powerpoint-o', 'admin::news', 0, NULL, NULL, NULL),
(53, 5, 3, 'lang::env.title', 'fa-cog', 'admin::env', 0, NULL, NULL, NULL),
(54, 37, 0, 'lang::admin.menu_titles.report_product', 'fa-bars', 'admin::report/product', 0, NULL, NULL, NULL),
(55, 0, 302, 'API Manager', 'fa-plug', 'lang::admin::api_manager', 0, NULL, '2019-11-01 08:10:44', '2019-11-03 07:03:13'),
(100, 0, 102, 'lang::Modules/language.cms_manager', 'fa-coffee', NULL, 0, NULL, NULL, NULL),
(101, 100, 0, 'lang::Modules/language.cms_category', 'fa-folder-open-o', 'route::admin_cms_category.index', 0, NULL, NULL, NULL),
(102, 100, 0, 'lang::Modules/language.cms_content', 'fa-copy', 'route::admin_cms_content.index', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_permission`
--

CREATE TABLE `admin_menu_permission` (
  `menu_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_permission`
--

CREATE TABLE `admin_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_uri` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permission`
--

INSERT INTO `admin_permission` (`id`, `name`, `slug`, `http_uri`, `created_at`, `updated_at`) VALUES
(1, 'Admin manager', 'admin.manager', 'GET::sc_admin/user,GET::sc_admin/role,GET::sc_admin/permission,ANY::sc_admin/log/*,ANY::sc_admin/menu/*', '2019-10-25 11:21:03', NULL),
(2, 'Dashboard', 'dashboard', 'GET::sc_admin', '2019-10-25 11:21:03', NULL),
(3, 'Auth manager', 'auth.full', 'ANY::sc_admin/auth/*', '2019-10-25 11:21:03', NULL),
(4, 'Setting manager', 'setting.full', 'ANY::sc_admin/store_info/*,ANY::sc_admin/store_value/*,ANY::sc_admin/env/*,ANY::sc_admin/email/*,ANY::sc_admin/email_template/*,ANY::sc_admin/language/*,ANY::sc_admin/currency/*,ANY::sc_admin/backup/*', '2019-10-25 11:21:03', NULL),
(5, 'Upload management', 'upload.full', 'ANY::sc_admin/uploads/*', '2019-10-25 11:21:03', NULL),
(6, 'Module manager', 'module.full', 'ANY::sc_admin/module/**', '2019-10-25 11:21:03', NULL),
(7, 'Extension manager', 'extension.full', 'ANY::sc_admin/extension/**', '2019-10-25 11:21:03', NULL),
(8, 'CMS manager', 'cms.full', 'ANY::sc_admin/page/*,ANY::sc_admin/banner/*,ANY::sc_admin/cms_category/*,ANY::sc_admin/cms_content/*,ANY::sc_admin/news/*', '2019-10-25 11:21:03', NULL),
(11, 'Discount manager', 'discount.full', 'ANY::sc_admin/shop_discount/**', '2019-10-25 11:21:03', NULL),
(14, 'Shipping status', 'shipping_status.full', 'ANY::sc_admin/shipping_status/**', '2019-10-25 11:21:03', NULL),
(15, 'Payment  status', 'payment_status.full', 'ANY::sc_admin/payment_status/**', '2019-10-25 11:21:03', NULL),
(17, 'Customer manager', 'customer.full', 'ANY::sc_admin/customer/*,ANY::sc_admin/subscribe/*', '2019-10-25 11:21:03', NULL),
(18, 'Order status', 'order_status.full', 'ANY::sc_admin/order_status/*', '2019-10-25 11:21:03', NULL),
(19, 'Product manager', 'product.full', 'ANY::sc_admin/category/*,ANY::sc_admin/vendor/*,ANY::sc_admin/brand/*,ANY::sc_admin/attribute_group/*,ANY::sc_admin/product/*', '2019-10-25 11:21:03', NULL),
(20, 'Order Manager', 'order.full', 'ANY::sc_admin/order/*', '2019-10-25 11:21:03', NULL),
(21, 'Report manager', 'report.full', 'ANY::sc_admin/report/*', '2019-10-25 11:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2019-10-25 11:21:03', NULL),
(2, 'Group only View', 'view.all', '2019-10-25 11:21:03', NULL),
(3, 'Manager', 'manager', '2019-10-25 11:21:03', NULL),
(4, 'Cms manager', 'cms', '2019-10-25 11:21:03', NULL),
(5, 'Accountant', 'accountant', '2019-10-25 11:21:03', NULL),
(6, 'Marketing', 'maketing', '2019-10-25 11:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 38, '2019-10-25 11:21:03', NULL),
(2, 38, '2019-10-25 11:21:03', NULL),
(3, 38, '2019-10-25 11:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permission`
--

CREATE TABLE `admin_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permission`
--

INSERT INTO `admin_role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(3, 1, '2019-10-25 11:21:03', NULL),
(3, 2, '2019-10-25 11:21:03', NULL),
(3, 3, '2019-10-25 11:21:03', NULL),
(3, 4, '2019-10-25 11:21:03', NULL),
(3, 5, '2019-10-25 11:21:03', NULL),
(3, 8, '2019-10-25 11:21:03', NULL),
(3, 11, '2019-10-25 11:21:03', NULL),
(3, 14, '2019-10-25 11:21:03', NULL),
(3, 15, '2019-10-25 11:21:03', NULL),
(3, 17, '2019-10-25 11:21:03', NULL),
(3, 18, '2019-10-25 11:21:03', NULL),
(3, 19, '2019-10-25 11:21:03', NULL),
(3, 20, '2019-10-25 11:21:03', NULL),
(3, 21, '2019-10-25 11:21:03', NULL),
(4, 3, '2019-10-25 11:21:03', NULL),
(4, 5, '2019-10-25 11:21:03', NULL),
(4, 8, '2019-10-25 11:21:03', NULL),
(5, 2, '2019-10-25 11:21:03', NULL),
(5, 3, '2019-10-25 11:21:03', NULL),
(5, 20, '2019-10-25 11:21:03', NULL),
(5, 21, '2019-10-25 11:21:03', NULL),
(6, 2, '2019-10-25 11:21:03', NULL),
(6, 3, '2019-10-25 11:21:03', NULL),
(6, 5, '2019-10-25 11:21:03', NULL),
(6, 8, '2019-10-25 11:21:03', NULL),
(6, 11, '2019-10-25 11:21:03', NULL),
(6, 14, '2019-10-25 11:21:03', NULL),
(6, 15, '2019-10-25 11:21:03', NULL),
(6, 17, '2019-10-25 11:21:03', NULL),
(6, 18, '2019-10-25 11:21:03', NULL),
(6, 19, '2019-10-25 11:21:03', NULL),
(6, 20, '2019-10-25 11:21:03', NULL),
(6, 21, '2019-10-25 11:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_user`
--

CREATE TABLE `admin_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_user`
--

INSERT INTO `admin_role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_store`
--

CREATE TABLE `admin_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_status` tinyint(4) NOT NULL DEFAULT 1,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_active` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_store`
--

INSERT INTO `admin_store` (`id`, `logo`, `site_status`, `phone`, `long_phone`, `email`, `time_active`, `address`, `template`) VALUES
(1, '/data/logo/scart-mid.png', 1, '0123456789', 'Support: 0987654321', 'hamza.juit@gmail.com', '', '123st - abc - xyz', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `admin_store_description`
--

CREATE TABLE `admin_store_description` (
  `config_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintain_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_store_description`
--

INSERT INTO `admin_store_description` (`config_id`, `lang`, `title`, `description`, `keyword`, `maintain_content`) VALUES
(1, 'en', 'Demo S-cart : Free Laravel eCommerce for Business', 'Free website shopping cart for business', '', '<center><img src=\"/images/maintenance.png\" />\r\n<h3><span style=\"color:#e74c3c;\"><strong>Sorry! We are currently doing site maintenance!</strong></span></h3>\r\n</center>'),
(1, 'vi', 'Demo S-cart: Mã nguồn website thương mại điện tử miễn phí cho doanh nghiệp', 'Laravel shopping cart for business', '', '<center><img src=\"/images/maintenance.png\" />\r\n<h3><span style=\"color:#e74c3c;\"><strong>Sorry! We are currently doing site maintenance!</strong></span></h3>\r\n</center>');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$JcmAHe5eUZ2rS0jU1GWr/.xhwCnh2RU13qwjTPcqfmtZXjZxcryPO', 'Administrator', '/admin/avatar/user.jpg', 'wCbodPJV06K0rUoF55ITiY5Mhy95lu2Xwb4EjtCC3Bg56fVhHW26BUs0sHaW', '2019-10-25 11:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permission`
--

CREATE TABLE `admin_user_permission` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_category`
--

CREATE TABLE `cms_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_category_description`
--

CREATE TABLE `cms_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_content`
--

CREATE TABLE `cms_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_description`
--

CREATE TABLE `cms_content_description` (
  `cms_content_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_image`
--

CREATE TABLE `cms_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_00_00_v3_create_admin_tables', 1),
(2, '2019_00_00_v3_create_shop_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_standard`
--

CREATE TABLE `shipping_standard` (
  `id` int(10) UNSIGNED NOT NULL,
  `fee` int(11) NOT NULL,
  `shipping_free` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_standard`
--

INSERT INTO `shipping_standard` (`id`, `fee`, `shipping_free`) VALUES
(1, 20000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `shop_api`
--

CREATE TABLE `shop_api` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_default` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_api`
--

INSERT INTO `shop_api` (`id`, `name`, `hidden_default`, `type`) VALUES
(1, 'api_product_list', '', 'secret'),
(2, 'api_product_detail', 'cost,sold,stock,sort', 'private'),
(3, 'api_order_list', '', 'public'),
(4, 'api_order_detail', '', 'secret');

-- --------------------------------------------------------

--
-- Table structure for table `shop_api_process`
--

CREATE TABLE `shop_api_process` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `secret_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_fileds` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_allow` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_deny` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_api_process`
--

INSERT INTO `shop_api_process` (`id`, `api_id`, `secret_key`, `hidden_fileds`, `ip_allow`, `ip_deny`, `exp`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '!CVCBsd$6j9ds3%flh[^d', 'descriptions,cost', '', '127.0.0.11,1233.2.2.3', '2019-12-14 00:00:00', 1, NULL, NULL),
(2, 1, '%GSFf13gkLtP@d', '', '', '', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute_group`
--

CREATE TABLE `shop_attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'radio,select,checkbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_attribute_group`
--

INSERT INTO `shop_attribute_group` (`id`, `name`, `status`, `sort`, `type`) VALUES
(1, 'Color', 1, 1, 'radio'),
(2, 'Size', 1, 2, 'select');

-- --------------------------------------------------------

--
-- Table structure for table `shop_banner`
--

CREATE TABLE `shop_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `click` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_banner`
--

INSERT INTO `shop_banner` (`id`, `image`, `url`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
(1, '/data/banner/Main-banner-1-1903x600.jpg', NULL, '', 1, 0, 0, 1, NULL, NULL),
(2, '/data/banner/Main-banner-3-1903x600.jpg', NULL, NULL, 1, 0, 0, 0, NULL, '2019-11-03 07:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `shop_block_content`
--

CREATE TABLE `shop_block_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_block_content`
--

INSERT INTO `shop_block_content` (`id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`) VALUES
(1, 'Facebook code', 'top', '*', 'html', '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \'//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=934208239994473\';\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));\r\n</script>', 1, 0),
(2, 'Google Analytics', 'header', '*', 'html', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-128658138-1\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n  gtag(\'config\', \'UA-128658138-1\');\r\n</script>', 1, 0),
(3, 'Product special', 'left', 'home,product_list', 'view', 'product_special', 1, 1),
(4, 'Brands', 'left', 'home,item_list', 'view', 'brands_left', 1, 3),
(5, 'Banner home', 'banner_top', 'home', 'view', 'banner_image', 1, 0),
(6, 'Categories', 'left', 'home,product_list,product_detail,shop_wishlist', 'view', 'categories', 1, 4),
(7, 'Product last view', 'left', '*', 'module', 'LastViewProduct', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_brand`
--

CREATE TABLE `shop_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_brand`
--

INSERT INTO `shop_brand` (`id`, `name`, `image`, `url`, `status`, `sort`) VALUES
(1, 'Husq', '/data/brand/01-181x52.png', '', 1, 0),
(2, 'Ideal', '/data/brand/02-181x52.png', '', 1, 0),
(3, 'Apex', '/data/brand/03-181x52.png', '', 1, 0),
(4, 'CST', '/data/brand/04-181x52.png', '', 1, 0),
(5, 'Klein', '/data/brand/05-181x52.png', '', 1, 0),
(6, 'Metabo', '/data/brand/06-181x52.png', '', 1, 0),
(7, 'Avatar', '/data/brand/07-181x52.png', '', 1, 0),
(8, 'Brand KA', '/data/brand/08-181x52.png', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `top` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_category`
--

INSERT INTO `shop_category` (`id`, `image`, `parent`, `top`, `status`, `sort`) VALUES
(1, '/data/category/img-40.jpg', 0, 1, 1, 0),
(2, '/data/category/img-44.jpg', 0, 1, 1, 0),
(3, '/data/category/img-42.jpg', 1, 1, 1, 0),
(4, '/data/category/img-18.jpg', 0, 1, 1, 0),
(5, '/data/category/img-14.jpg', 1, 1, 1, 0),
(6, '/data/category/img-14.jpg', 1, 0, 1, 0),
(7, '/data/category/img-40.jpg', 1, 0, 1, 0),
(8, '/data/category/img-14.jpg', 2, 0, 1, 0),
(9, '/data/category/img-18.jpg', 2, 1, 1, 0),
(10, '/data/category/img-14.jpg', 2, 0, 1, 0),
(11, '/data/category/img-40.jpg', 4, 0, 1, 0),
(12, '/data/category/img-42.jpg4', 4, 0, 1, 3),
(13, '/data/category/img-40.jpg', 4, 0, 1, 3),
(14, '/data/product//img-10.jpg', 11, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category_description`
--

CREATE TABLE `shop_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_category_description`
--

INSERT INTO `shop_category_description` (`category_id`, `lang`, `name`, `keyword`, `description`) VALUES
(1, 'en', 'Electronics', '', ''),
(1, 'vi', 'Thiết bị điện tử', '', ''),
(2, 'en', 'Clothing & Wears', '', ''),
(2, 'vi', 'Quần áo', '', ''),
(3, 'en', 'Mobile', '', ''),
(3, 'vi', 'Điện thoại', '', ''),
(4, 'en', 'Accessaries & Extras', '', ''),
(4, 'vi', 'Phụ kiện ', '', ''),
(5, 'en', 'Computers', '', ''),
(5, 'vi', 'Máy tính', '', ''),
(6, 'en', 'Tablets', '', ''),
(6, 'vi', 'Máy tính bảng', '', ''),
(7, 'en', 'Appliances', '', ''),
(7, 'vi', 'Thiết bị', '', ''),
(8, 'en', 'Men\'s Clothing', '', ''),
(8, 'vi', 'Quần áo nam', '', ''),
(9, 'en', 'Women\'s Clothing', '', ''),
(9, 'vi', 'Quần áo nữ', '', ''),
(10, 'en', 'Kid\'s Wear', '', ''),
(10, 'vi', 'Đồ trẻ em', '', ''),
(11, 'en', 'Mobile Accessaries', '', ''),
(11, 'vi', 'Phụ kiện điện thoại', '', ''),
(12, 'en', 'Women\'s Accessaries', '', ''),
(12, 'vi', 'Phụ kiện nam', '', ''),
(13, 'en', 'Women\'s Accessaries', '', ''),
(13, 'vi', 'Phụ kiện nữ', '', ''),
(14, 'en', 'New Category', 'keyword', 'description'),
(14, 'vi', 'Name', 'keyword', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `shop_country`
--

CREATE TABLE `shop_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_country`
--

INSERT INTO `shop_country` (`id`, `code`, `name`) VALUES
(1, 'AL', 'Albania'),
(2, 'DZ', 'Algeria'),
(3, 'DS', 'American Samoa'),
(4, 'AD', 'Andorra'),
(5, 'AO', 'Angola'),
(6, 'AI', 'Anguilla'),
(7, 'AQ', 'Antarctica'),
(8, 'AG', 'Antigua and Barbuda'),
(9, 'AR', 'Argentina'),
(10, 'AM', 'Armenia'),
(11, 'AW', 'Aruba'),
(12, 'AU', 'Australia'),
(13, 'AT', 'Austria'),
(14, 'AZ', 'Azerbaijan'),
(15, 'BS', 'Bahamas'),
(16, 'BH', 'Bahrain'),
(17, 'BD', 'Bangladesh'),
(18, 'BB', 'Barbados'),
(19, 'BY', 'Belarus'),
(20, 'BE', 'Belgium'),
(21, 'BZ', 'Belize'),
(22, 'BJ', 'Benin'),
(23, 'BM', 'Bermuda'),
(24, 'BT', 'Bhutan'),
(25, 'BO', 'Bolivia'),
(26, 'BA', 'Bosnia and Herzegovina'),
(27, 'BW', 'Botswana'),
(28, 'BV', 'Bouvet Island'),
(29, 'BR', 'Brazil'),
(30, 'IO', 'British Indian Ocean Territory'),
(31, 'BN', 'Brunei Darussalam'),
(32, 'BG', 'Bulgaria'),
(33, 'BF', 'Burkina Faso'),
(34, 'BI', 'Burundi'),
(35, 'KH', 'Cambodia'),
(36, 'CM', 'Cameroon'),
(37, 'CA', 'Canada'),
(38, 'CV', 'Cape Verde'),
(39, 'KY', 'Cayman Islands'),
(40, 'CF', 'Central African Republic'),
(41, 'TD', 'Chad'),
(42, 'CL', 'Chile'),
(43, 'CN', 'China'),
(44, 'CX', 'Christmas Island'),
(45, 'CC', 'Cocos (Keeling) Islands'),
(46, 'CO', 'Colombia'),
(47, 'KM', 'Comoros'),
(48, 'CG', 'Congo'),
(49, 'CK', 'Cook Islands'),
(50, 'CR', 'Costa Rica'),
(51, 'HR', 'Croatia (Hrvatska)'),
(52, 'CU', 'Cuba'),
(53, 'CY', 'Cyprus'),
(54, 'CZ', 'Czech Republic'),
(55, 'DK', 'Denmark'),
(56, 'DJ', 'Djibouti'),
(57, 'DM', 'Dominica'),
(58, 'DO', 'Dominican Republic'),
(59, 'TP', 'East Timor'),
(60, 'EC', 'Ecuador'),
(61, 'EG', 'Egypt'),
(62, 'SV', 'El Salvador'),
(63, 'GQ', 'Equatorial Guinea'),
(64, 'ER', 'Eritrea'),
(65, 'EE', 'Estonia'),
(66, 'ET', 'Ethiopia'),
(67, 'FK', 'Falkland Islands (Malvinas)'),
(68, 'FO', 'Faroe Islands'),
(69, 'FJ', 'Fiji'),
(70, 'FI', 'Finland'),
(71, 'FR', 'France'),
(72, 'FX', 'France, Metropolitan'),
(73, 'GF', 'French Guiana'),
(74, 'PF', 'French Polynesia'),
(75, 'TF', 'French Southern Territories'),
(76, 'GA', 'Gabon'),
(77, 'GM', 'Gambia'),
(78, 'GE', 'Georgia'),
(79, 'DE', 'Germany'),
(80, 'GH', 'Ghana'),
(81, 'GI', 'Gibraltar'),
(82, 'GK', 'Guernsey'),
(83, 'GR', 'Greece'),
(84, 'GL', 'Greenland'),
(85, 'GD', 'Grenada'),
(86, 'GP', 'Guadeloupe'),
(87, 'GU', 'Guam'),
(88, 'GT', 'Guatemala'),
(89, 'GN', 'Guinea'),
(90, 'GW', 'Guinea-Bissau'),
(91, 'GY', 'Guyana'),
(92, 'HT', 'Haiti'),
(93, 'HM', 'Heard and Mc Donald Islands'),
(94, 'HN', 'Honduras'),
(95, 'HK', 'Hong Kong'),
(96, 'HU', 'Hungary'),
(97, 'IS', 'Iceland'),
(98, 'IN', 'India'),
(99, 'IM', 'Isle of Man'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JE', 'Jersey'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'JO', 'Jordan'),
(111, 'KZ', 'Kazakhstan'),
(112, 'KE', 'Kenya'),
(113, 'KI', 'Kiribati'),
(114, 'KP', 'Korea,Democratic People\'s Republic of'),
(115, 'KR', 'Korea, Republic of'),
(116, 'XK', 'Kosovo'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Lao People\'s Democratic Republic'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libyan Arab Jamahiriya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'MH', 'Marshall Islands'),
(137, 'MQ', 'Martinique'),
(138, 'MR', 'Mauritania'),
(139, 'MU', 'Mauritius'),
(140, 'TY', 'Mayotte'),
(141, 'MX', 'Mexico'),
(142, 'FM', 'Micronesia, Federated States of'),
(143, 'MD', 'Moldova, Republic of'),
(144, 'MC', 'Monaco'),
(145, 'MN', 'Mongolia'),
(146, 'ME', 'Montenegro'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'NL', 'Netherlands'),
(155, 'AN', 'Netherlands Antilles'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestine'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua New Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russian Federation'),
(182, 'RW', 'Rwanda'),
(183, 'KN', 'Saint Kitts and Nevis'),
(184, 'LC', 'Saint Lucia'),
(185, 'VC', 'Saint Vincent and the Grenadines'),
(186, 'WS', 'Samoa'),
(187, 'SM', 'San Marino'),
(188, 'ST', 'Sao Tome and Principe'),
(189, 'SA', 'Saudi Arabia'),
(190, 'SN', 'Senegal'),
(191, 'RS', 'Serbia'),
(192, 'SC', 'Seychelles'),
(193, 'SL', 'Sierra Leone'),
(194, 'SG', 'Singapore'),
(195, 'SK', 'Slovakia'),
(196, 'SI', 'Slovenia'),
(197, 'SB', 'Solomon Islands'),
(198, 'SO', 'Somalia'),
(199, 'ZA', 'South Africa'),
(200, 'GS', 'South Georgia South Sandwich Islands'),
(201, 'SS', 'South Sudan'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `shop_currency`
--

CREATE TABLE `shop_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  `precision` tinyint(4) NOT NULL DEFAULT 2,
  `symbol_first` tinyint(4) NOT NULL DEFAULT 0,
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_currency`
--

INSERT INTO `shop_currency` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES
(1, 'USD Dola', 'USD', '$', 1.00, 0, 1, ',', 1, 0),
(2, 'VietNam Dong', 'VND', '₫', 20.00, 0, 0, ',', 1, 1),
(3, 'Taka', 'TK', '৳', 1.00, 0, 1, ',', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_discount`
--

CREATE TABLE `shop_discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int(11) NOT NULL DEFAULT 2,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'point' COMMENT 'point - Point; percent - %',
  `data` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int(11) NOT NULL DEFAULT 1,
  `used` int(11) NOT NULL DEFAULT 0,
  `login` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_discount`
--

INSERT INTO `shop_discount` (`id`, `code`, `reward`, `type`, `data`, `limit`, `used`, `login`, `status`, `expires_at`) VALUES
(1, 'Discount', 1500, 'point', NULL, 1, 1, 1, 1, '2019-11-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shop_discount_user`
--

CREATE TABLE `shop_discount_user` (
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `log` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_discount_user`
--

INSERT INTO `shop_discount_user` (`user_id`, `discount_id`, `log`, `used_at`) VALUES
(1, 3, 'Order #11', '2019-11-10 23:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `shop_email_template`
--

CREATE TABLE `shop_email_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_email_template`
--

INSERT INTO `shop_email_template` (`id`, `name`, `group`, `text`, `status`) VALUES
(1, 'Reset password', 'forgot_password', '<h1 style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:left\">{{$title}}</h1>\r\n<p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left\">{{$reason_sendmail}}</p>\r\n                    <table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;margin:30px auto;padding:0;text-align:center;width:100%\">\r\n                      <tbody><tr>\r\n                        <td align=\"center\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                          <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                            <tbody><tr>\r\n                              <td align=\"center\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                                  <tbody><tr>\r\n                                    <td style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                                      <a href=\"{{$reset_link}}\" class=\"button button-primary\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-radius:3px;color:#fff;display:inline-block;text-decoration:none;background-color:#3097d1;border-top:10px solid #3097d1;border-right:18px solid #3097d1;border-bottom:10px solid #3097d1;border-left:18px solid #3097d1\" target=\"_blank\">{{$reset_button}}</a>\r\n                                    </td>\r\n                                  </tr>\r\n                                </tbody>\r\n                              </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        </td>\r\n                      </tr>\r\n                    </tbody>\r\n                  </table>\r\n                    <p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left\">\r\n                      {{$note_sendmail}}\r\n                    </p>\r\n                    <table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-top:1px solid #edeff2;margin-top:25px;padding-top:25px\">\r\n                    <tbody><tr>\r\n                      <td style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\r\n                        <p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;line-height:1.5em;margin-top:0;text-align:left;font-size:12px\">{{$note_access_link}}: <a href=\"{{$reset_link}}\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#3869d4\" target=\"_blank\">{{$reset_link}}</a></p>\r\n                          </td>\r\n                        </tr>\r\n                      </tbody>\r\n                    </table>', 1),
(2, 'Welcome new customer', 'welcome_customer', '<h1 style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:center\">{{$title}}</h1>\r\n<p style=\"text-align:center;\">Welcome to my site!</p>', 1),
(3, 'Send form contact to admin', 'contact_to_admin', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tr>\r\n        <td>\r\n            <b>Name</b>: {{$name}}<br>\r\n            <b>Email</b>: {{$email}}<br>\r\n            <b>Phone</b>: {{$phone}}<br>\r\n        </td>\r\n    </tr>\r\n</table>\r\n<hr>\r\n<p style=\"text-align: center;\">Content:<br>\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n    <tr>\r\n        <td>{{$content}}</td>\r\n    </tr>\r\n</table>', 1),
(4, 'New order to admin', 'order_success_to_admin', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td>\r\n                                <b>Order ID</b>: {{$orderID}}<br>\r\n                                <b>Customer name</b>: {{$toname}}<br>\r\n                                <b>Email</b>: {{$email}}<br>\r\n                                <b>Address</b>: {{$address}}<br>\r\n                                <b>Phone</b>: {{$phone}}<br>\r\n                                <b>Order note</b>: {{$comment}}\r\n                            </td>\r\n                        </tr>\r\n                    </table>\r\n                    <hr>\r\n                    <p style=\"text-align: center;\">Order detail:<br>\r\n                    ===================================<br></p>\r\n                    <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"1\">\r\n                        {{$orderDetail}}\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Sub total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$subtotal}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Shipping fee</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$shipping}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Discount</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$discount}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$total}}</td>\r\n                        </tr>\r\n                    </table>', 1),
(5, 'New order to customr', 'order_success_to_customer', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td>\r\n                                <b>Order ID</b>: {{$orderID}}<br>\r\n                                <b>Customer name</b>: {{$toname}}<br>\r\n                                <b>Address</b>: {{$address}}<br>\r\n                                <b>Phone</b>: {{$phone}}<br>\r\n                                <b>Order note</b>: {{$comment}}\r\n                            </td>\r\n                        </tr>\r\n                    </table>\r\n                    <hr>\r\n                    <p style=\"text-align: center;\">Order detail:<br>\r\n                    ===================================<br></p>\r\n                    <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"1\">\r\n                        {{$orderDetail}}\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Sub total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$subtotal}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Shipping fee</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$shipping}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Discount</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$discount}}</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"2\"></td>\r\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Total</td>\r\n                            <td colspan=\"2\" align=\"right\">{{$total}}</td>\r\n                        </tr>\r\n                    </table>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_language`
--

CREATE TABLE `shop_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_language`
--

INSERT INTO `shop_language` (`id`, `name`, `code`, `icon`, `status`, `sort`) VALUES
(1, 'English', 'en', '/data/language/flag_uk.png', 1, 0),
(2, 'Tiếng Việt', 'vi', '/data/language/flag_vn.png', 0, 1),
(3, 'Bangla', 'bn', '/data/language//flag_bn.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_layout_page`
--

CREATE TABLE `shop_layout_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_layout_page`
--

INSERT INTO `shop_layout_page` (`id`, `key`, `name`) VALUES
(1, 'home', 'Home page'),
(2, 'product_list', 'Product list'),
(3, 'product_detail', 'Product detail'),
(4, 'shop_cart', 'Shop cart'),
(5, 'shop_account', 'Account'),
(6, 'shop_profile', 'Profile'),
(7, 'shop_compare', 'Compare page'),
(8, 'shop_wishlist', 'Wishlist page'),
(9, 'item_list', 'Item list');

-- --------------------------------------------------------

--
-- Table structure for table `shop_layout_position`
--

CREATE TABLE `shop_layout_position` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_layout_position`
--

INSERT INTO `shop_layout_position` (`id`, `key`, `name`) VALUES
(1, 'meta', 'Meta'),
(2, 'header', 'Header'),
(3, 'top', 'Top'),
(4, 'bottom', 'Bottom'),
(5, 'footer', 'Footer'),
(6, 'left', 'Column left'),
(7, 'right', 'Column right'),
(8, 'banner_top', 'Banner top');

-- --------------------------------------------------------

--
-- Table structure for table `shop_layout_type`
--

CREATE TABLE `shop_layout_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_layout_type`
--

INSERT INTO `shop_layout_type` (`id`, `key`, `name`) VALUES
(1, 'html', 'Html'),
(2, 'view', 'View'),
(3, 'module', 'Module');

-- --------------------------------------------------------

--
-- Table structure for table `shop_link`
--

CREATE TABLE `shop_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_link`
--

INSERT INTO `shop_link` (`id`, `name`, `url`, `target`, `group`, `module`, `status`, `sort`) VALUES
(1, 'lang::front.contact', 'route::pages::contact', '_self', 'menu', '', 1, 3),
(2, 'lang::front.about', 'route::pages::about', '_self', 'menu', '', 1, 4),
(3, 'S-Cart', 'https://bookimind.com', '_blank', 'menu', '', 1, 0),
(4, 'lang::front.my_profile', '/member/login.html', '_self', 'footer', '', 1, 5),
(5, 'lang::front.compare_page', '/compare.html', '_self', 'footer', '', 1, 4),
(6, 'lang::front.wishlist_page', 'route::wishlist', '_self', 'footer', '', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shop_news`
--

CREATE TABLE `shop_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_news_description`
--

CREATE TABLE `shop_news_description` (
  `shop_news_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` int(11) DEFAULT 0,
  `shipping` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `payment_status` int(11) NOT NULL DEFAULT 1,
  `shipping_status` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) DEFAULT 0,
  `total` int(11) DEFAULT 0,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `received` int(11) DEFAULT 0,
  `balance` int(11) DEFAULT 0,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upazila` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_order`
--

INSERT INTO `shop_order` (`id`, `user_id`, `subtotal`, `shipping`, `discount`, `payment_status`, `shipping_status`, `status`, `tax`, `total`, `currency`, `exchange_rate`, `received`, `balance`, `first_name`, `last_name`, `address`, `district`, `upazila`, `post`, `country`, `phone`, `email`, `comment`, `payment_method`, `shipping_method`, `user_agent`, `ip`, `transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 5000, 2000, 0, 1, 1, 1, 0, 7000, 'USD', 1.00, 0, 7000, 'Naruto', 'Kun', 'ADDRESS 1', '', '', '', 'VN', '667151172', 'test@test.com', 'ok', 'Cash', 'ShippingStandard', NULL, NULL, NULL, '2019-10-25 11:21:06', '2019-11-03 07:10:43'),
(2, 2, 15000, 20000, 0, 1, 1, 1, 0, 35000, 'USD', 1.00, 0, 35000, 'Ameer', 'Hamza', 'JU', '', '', '', 'BD', '01744952899', 'hamza.iitju@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '127.0.0.1', NULL, '2019-11-03 09:01:53', '2019-11-03 09:01:53'),
(3, 6, 30000, 20000, 0, 1, 1, 1, 0, 50000, 'TK', 1.00, 0, 50000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01744952899', 'hamza.iit@gmail.com', 'Order New', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 13:48:03', '2019-11-10 13:48:03'),
(4, 6, 30000, 20000, 0, 1, 1, 5, 0, 50000, 'TK', 1.00, 0, 50000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01744952899', 'hamza.iit@gmail.com', 'Order New', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 13:48:33', '2019-11-10 13:50:01'),
(5, 3, 15000, 20000, 0, 1, 1, 1, 0, 35000, 'TK', 1.00, 0, 35000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01744952899', 'hamza.juit@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 15:41:31', '2019-11-10 15:41:31'),
(6, 0, 15000, 20000, 0, 1, 1, 1, 0, 35000, 'TK', 1.00, 0, 35000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01744952899', 'hamza.asdf@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 15:43:17', '2019-11-10 15:43:17'),
(7, 3, 15000, 20000, 0, 1, 1, 1, 0, 35000, 'TK', 1.00, 0, 35000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01744952899', 'hamza.juit@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 15:57:01', '2019-11-10 15:57:01'),
(8, 3, 15000, 20000, 0, 1, 1, 5, 0, 35000, 'TK', 1.00, 0, 35000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01823801180', 'hamza.juit@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 16:11:47', '2019-11-10 16:21:56'),
(9, 3, 15000, 20000, 0, 1, 1, 1, 0, 35000, 'TK', 1.00, 0, 35000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01823801180', 'hamza.juit@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 17:17:58', '2019-11-10 17:17:58'),
(10, 3, 10000, 20000, 0, 1, 1, 1, 0, 30000, 'TK', 1.00, 0, 30000, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01823801180', 'hamza.juit@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 17:20:50', '2019-11-10 17:20:50'),
(11, 3, 30000, 20000, -1500, 1, 1, 1, 0, 48500, 'TK', 1.00, 0, 48500, 'Ameer', 'Hamza', 'Address', 'District', 'upazila', '1243', 'BD', '01823801180', 'hamza.juit@gmail.com', '', 'Cash', 'ShippingStandard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '127.0.0.1', NULL, '2019-11-10 17:33:10', '2019-11-10 17:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_detail`
--

CREATE TABLE `shop_order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `total_price` int(11) NOT NULL DEFAULT 0,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_order_detail`
--

INSERT INTO `shop_order_detail` (`id`, `order_id`, `product_id`, `name`, `price`, `qty`, `total_price`, `sku`, `currency`, `exchange_rate`, `attribute`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Easy Polo Black Edition 1', 5000, 1, 5000, 'ABCZZ', 'USD', 1.00, '[]', NULL, NULL),
(2, 2, 17, 'Easy Polo Black Edition 17', 15000, 1, 15000, 'ALOKK1-AY', 'USD', 1.00, '{\"1\":\"Blue\",\"2\":\"S\"}', '2019-11-03 09:01:53', '2019-11-03 09:01:53'),
(3, 3, 17, 'Easy Polo Black Edition 17', 15000, 2, 30000, 'ALOKK1-AY', 'TK', 1.00, '{\"1\":\"Blue\",\"2\":\"S\"}', '2019-11-10 13:48:03', '2019-11-10 13:48:03'),
(4, 4, 17, 'Easy Polo Black Edition 17', 15000, 2, 30000, 'ALOKK1-AY', 'TK', 1.00, '{\"1\":\"Blue\",\"2\":\"S\"}', '2019-11-10 13:48:33', '2019-11-10 13:48:33'),
(5, 5, 17, 'Easy Polo Black Edition 17', 15000, 1, 15000, 'ALOKK1-AY', 'TK', 1.00, '{\"1\":\"Blue\",\"2\":\"S\"}', '2019-11-10 15:41:31', '2019-11-10 15:41:31'),
(6, 6, 15, 'Easy Polo Black Edition 15', 15000, 1, 15000, 'LCD2004-3D', 'TK', 1.00, '[]', '2019-11-10 15:43:17', '2019-11-10 15:43:17'),
(7, 7, 17, 'Easy Polo Black Edition 17', 15000, 1, 15000, 'ALOKK1-AY', 'TK', 1.00, '{\"1\":\"Blue\",\"2\":\"S\"}', '2019-11-10 15:57:01', '2019-11-10 15:57:01'),
(8, 8, 15, 'Easy Polo Black Edition 15', 15000, 1, 15000, 'LCD2004-3D', 'TK', 1.00, '[]', '2019-11-10 16:11:47', '2019-11-10 16:11:47'),
(9, 9, 15, 'Easy Polo Black Edition 15', 15000, 1, 15000, 'LCD2004-3D', 'TK', 1.00, '[]', '2019-11-10 17:17:58', '2019-11-10 17:17:58'),
(10, 10, 13, 'Easy Polo Black Edition 13', 10000, 1, 10000, '3D-GOLD1.75', 'TK', 1.00, '[]', '2019-11-10 17:20:50', '2019-11-10 17:20:50'),
(11, 11, 14, 'Easy Polo Black Edition 14', 15000, 2, 30000, 'LCD12864-3D', 'TK', 1.00, '[]', '2019-11-10 17:33:10', '2019-11-10 17:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_history`
--

CREATE TABLE `shop_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_order_history`
--

INSERT INTO `shop_order_history` (`id`, `order_id`, `content`, `admin_id`, `user_id`, `order_status_id`, `add_date`) VALUES
(1, 1, 'New order', 0, 1, 1, '2019-10-25 18:21:06'),
(2, 1, 'Change <b>shipping_status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'3\'</span>', 1, 0, 1, '2019-11-03 01:08:27'),
(3, 1, 'Change <b>shipping_status</b> from <span style=\"color:blue\">\'3\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, 1, '2019-11-03 01:08:44'),
(4, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'5\'</span>', 1, 0, 1, '2019-11-03 13:09:07'),
(5, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'5\'</span> to <span style=\"color:red\">\'4\'</span>', 1, 0, 5, '2019-11-03 13:09:24'),
(6, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'4\'</span> to <span style=\"color:red\">\'2\'</span>', 1, 0, 4, '2019-11-03 13:10:19'),
(7, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, 2, '2019-11-03 13:10:43'),
(8, 2, 'New order', 0, 2, 1, '2019-11-03 15:01:53'),
(9, 3, 'New order', 0, 6, 1, '2019-11-10 19:48:03'),
(10, 4, 'New order', 0, 6, 1, '2019-11-10 19:48:33'),
(11, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'5\'</span>', 1, 0, 1, '2019-11-10 19:50:01'),
(12, 5, 'New order', 0, 0, 1, '2019-11-10 21:41:31'),
(13, 6, 'New order', 0, 0, 1, '2019-11-10 21:43:17'),
(14, 7, 'New order', 0, 0, 1, '2019-11-10 21:57:01'),
(15, 8, 'New order', 0, 3, 1, '2019-11-10 22:11:47'),
(16, 8, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'5\'</span>', 1, 0, 1, '2019-11-10 22:21:56'),
(17, 9, 'New order', 0, 3, 1, '2019-11-10 23:17:58'),
(18, 10, 'New order', 0, 3, 1, '2019-11-10 23:20:50'),
(19, 11, 'New order', 0, 3, 1, '2019-11-10 23:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_status`
--

CREATE TABLE `shop_order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_order_status`
--

INSERT INTO `shop_order_status` (`id`, `name`) VALUES
(1, 'New'),
(2, 'Processing'),
(3, 'Hold'),
(4, 'Canceled'),
(5, 'Done'),
(6, 'Failed');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_total`
--

CREATE TABLE `shop_order_total` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  `text` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_order_total`
--

INSERT INTO `shop_order_total` (`id`, `order_id`, `title`, `code`, `value`, `text`, `sort`, `created_at`, `updated_at`) VALUES
(1, 1, 'Subtotal', 'subtotal', 5000, NULL, 1, NULL, NULL),
(2, 1, 'Shipping', 'shipping', 2000, NULL, 10, NULL, NULL),
(3, 1, 'Discount', 'discount', 0, NULL, 20, NULL, NULL),
(4, 1, 'Total', 'total', 7000, NULL, 100, NULL, NULL),
(5, 1, 'Received', 'received', 0, NULL, 200, NULL, NULL),
(6, 2, 'Sub Total', 'subtotal', 15000, '$15,000', 1, '2019-11-03 09:01:53', NULL),
(7, 2, 'Shipping Standard', 'shipping', 20000, '$20,000', 10, '2019-11-03 09:01:53', NULL),
(8, 2, 'Coupon/Discount', 'discount', 0, '$0', 20, '2019-11-03 09:01:53', NULL),
(9, 2, 'Total', 'total', 35000, '$35,000', 100, '2019-11-03 09:01:53', NULL),
(10, 2, 'Received', 'received', 0, '$0', 200, '2019-11-03 09:01:53', NULL),
(11, 3, 'Sub Total', 'subtotal', 30000, '৳30,000', 1, '2019-11-10 13:48:03', NULL),
(12, 3, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 13:48:03', NULL),
(13, 3, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 13:48:03', NULL),
(14, 3, 'Total', 'total', 50000, '৳50,000', 100, '2019-11-10 13:48:03', NULL),
(15, 3, 'Received', 'received', 0, '৳0', 200, '2019-11-10 13:48:03', NULL),
(16, 4, 'Sub Total', 'subtotal', 30000, '৳30,000', 1, '2019-11-10 13:48:33', NULL),
(17, 4, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 13:48:33', NULL),
(18, 4, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 13:48:33', NULL),
(19, 4, 'Total', 'total', 50000, '৳50,000', 100, '2019-11-10 13:48:33', NULL),
(20, 4, 'Received', 'received', 0, '৳0', 200, '2019-11-10 13:48:33', NULL),
(21, 5, 'Sub Total', 'subtotal', 15000, '৳15,000', 1, '2019-11-10 15:41:31', NULL),
(22, 5, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 15:41:31', NULL),
(23, 5, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 15:41:31', NULL),
(24, 5, 'Total', 'total', 35000, '৳35,000', 100, '2019-11-10 15:41:31', NULL),
(25, 5, 'Received', 'received', 0, '৳0', 200, '2019-11-10 15:41:31', NULL),
(26, 6, 'Sub Total', 'subtotal', 15000, '৳15,000', 1, '2019-11-10 15:43:17', NULL),
(27, 6, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 15:43:17', NULL),
(28, 6, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 15:43:17', NULL),
(29, 6, 'Total', 'total', 35000, '৳35,000', 100, '2019-11-10 15:43:17', NULL),
(30, 6, 'Received', 'received', 0, '৳0', 200, '2019-11-10 15:43:17', NULL),
(31, 7, 'Sub Total', 'subtotal', 15000, '৳15,000', 1, '2019-11-10 15:57:01', NULL),
(32, 7, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 15:57:01', NULL),
(33, 7, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 15:57:01', NULL),
(34, 7, 'Total', 'total', 35000, '৳35,000', 100, '2019-11-10 15:57:01', NULL),
(35, 7, 'Received', 'received', 0, '৳0', 200, '2019-11-10 15:57:01', NULL),
(36, 8, 'Sub Total', 'subtotal', 15000, '৳15,000', 1, '2019-11-10 16:11:47', NULL),
(37, 8, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 16:11:47', NULL),
(38, 8, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 16:11:47', NULL),
(39, 8, 'Total', 'total', 35000, '৳35,000', 100, '2019-11-10 16:11:47', NULL),
(40, 8, 'Received', 'received', 0, '৳0', 200, '2019-11-10 16:11:47', NULL),
(41, 9, 'Sub Total', 'subtotal', 15000, '৳15,000', 1, '2019-11-10 17:17:58', NULL),
(42, 9, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 17:17:58', NULL),
(43, 9, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 17:17:58', NULL),
(44, 9, 'Total', 'total', 35000, '৳35,000', 100, '2019-11-10 17:17:58', NULL),
(45, 9, 'Received', 'received', 0, '৳0', 200, '2019-11-10 17:17:58', NULL),
(46, 10, 'Sub Total', 'subtotal', 10000, '৳10,000', 1, '2019-11-10 17:20:50', NULL),
(47, 10, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 17:20:50', NULL),
(48, 10, 'Coupon/Discount', 'discount', 0, '৳0', 20, '2019-11-10 17:20:50', NULL),
(49, 10, 'Total', 'total', 30000, '৳30,000', 100, '2019-11-10 17:20:50', NULL),
(50, 10, 'Received', 'received', 0, '৳0', 200, '2019-11-10 17:20:50', NULL),
(51, 11, 'Sub Total', 'subtotal', 30000, '৳30,000', 1, '2019-11-10 17:33:10', NULL),
(52, 11, 'Shipping Standard', 'shipping', 20000, '৳20,000', 10, '2019-11-10 17:33:10', NULL),
(53, 11, '&lt;b&gt;Coupon/Discount:&lt;/b&gt; Discount', 'discount', -1500, '-৳1,500', 20, '2019-11-10 17:33:10', NULL),
(54, 11, 'Total', 'total', 48500, '৳48,500', 100, '2019-11-10 17:33:10', NULL),
(55, 11, 'Received', 'received', 0, '৳0', 200, '2019-11-10 17:33:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_page`
--

CREATE TABLE `shop_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_page`
--

INSERT INTO `shop_page` (`id`, `image`, `key`, `status`) VALUES
(1, '', 'about', 1),
(2, '', 'contact', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_page_description`
--

CREATE TABLE `shop_page_description` (
  `page_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_page_description`
--

INSERT INTO `shop_page_description` (`page_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
(1, 'en', 'About', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n'),
(1, 'vi', 'Giới thiệu', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n'),
(2, 'en', 'Contact', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n'),
(2, 'vi', 'Liên hệ với chúng tôi', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `shop_payment_status`
--

CREATE TABLE `shop_payment_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_payment_status`
--

INSERT INTO `shop_payment_status` (`id`, `name`) VALUES
(1, 'Unpaid'),
(2, 'Partial payment'),
(3, 'Paid'),
(4, 'Refurn');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT 0,
  `vendor_id` int(11) DEFAULT 0,
  `price` int(11) DEFAULT 0,
  `cost` int(11) DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `sold` int(11) DEFAULT 0,
  `type` tinyint(4) DEFAULT 0,
  `kind` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:single, 1:bundle, 2:group',
  `virtual` tinyint(4) DEFAULT 0 COMMENT '0:physical, 1:download, 2:only view, 3: Service',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `date_lastview` datetime DEFAULT NULL,
  `date_available` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`id`, `sku`, `image`, `brand_id`, `vendor_id`, `price`, `cost`, `stock`, `sold`, `type`, `kind`, `virtual`, `status`, `sort`, `view`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
(1, 'ABCZZ', '/data/product/img-1.jpg', 1, 1, 15000, 10000, 99, 1, 2, 0, 0, 1, 0, 1, '2019-11-10 22:44:51', '2020-02-03', NULL, '2019-11-10 16:44:51'),
(2, 'LEDFAN1', '/data/product/img-4.jpg', 1, 1, 15000, 10000, 100, 0, 1, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(3, 'CLOCKFAN1', '/data/product/img-11.jpg', 2, 1, 15000, 10000, 100, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(4, 'CLOCKFAN2', '/data/product/img-14.jpg', 3, 1, 15000, 10000, 100, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(5, 'CLOCKFAN3', '/data/product/img-15.jpg', 1, 1, 15000, 10000, 100, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(6, 'TMC2208', '/data/product/img-16.jpg', 1, 1, 15000, 10000, 97, 3, 1, 0, 0, 1, 0, 0, NULL, NULL, NULL, '2019-11-10 17:17:58'),
(7, 'FILAMENT', '/data/product/img-17.jpg', 2, 1, 15000, 10000, 94, 6, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, '2019-11-10 17:17:58'),
(8, 'A4988', '/data/product/img-18.jpg', 2, 1, 15000, 10000, 100, 0, 2, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(9, 'ANYCUBIC-P', '/data/product/img-20.jpg', 2, 1, 15000, 10000, 100, 0, 2, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(10, '3DHLFD-P', '/data/product/img-21.jpg', 4, 1, 15000, 10000, 100, 0, 2, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(11, 'SS495A', '/data/product/img-22.jpg', 2, 1, 15000, 10000, 100, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(12, '3D-CARBON1.75', '/data/product/img-23.jpg', 2, 1, 15000, 10000, 100, 0, 2, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL),
(13, '3D-GOLD1.75', '/data/product/img-34.jpg', 3, 1, 10000, 5000, -1, 1, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, '2019-11-10 17:20:50'),
(14, 'LCD12864-3D', '/data/product/img-13.jpg', 3, 1, 15000, 10000, 98, 2, 0, 0, 0, 1, 0, 1, '2019-11-03 00:23:10', NULL, NULL, '2019-11-10 17:33:10'),
(15, 'LCD2004-3D', '/data/product/img-41.jpg', 3, 1, 15000, 10000, 97, 3, 0, 1, 0, 1, 0, 0, NULL, NULL, NULL, '2019-11-10 17:17:58'),
(16, 'RAMPS1.5-3D', '/data/product/img-42.jpg', 2, 1, 0, 0, 0, 0, 0, 2, 0, 1, 0, 4, '2019-11-04 00:31:58', NULL, NULL, '2019-11-03 18:31:58'),
(17, 'ALOKK1-AY', '/data/product/img-26.jpg', 3, 1, 15000, 10000, 93, 7, 0, 0, 0, 1, 0, 9, '2019-11-10 21:56:31', NULL, NULL, '2019-11-10 15:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_attribute`
--

CREATE TABLE `shop_product_attribute` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_attribute`
--

INSERT INTO `shop_product_attribute` (`id`, `name`, `attribute_group_id`, `product_id`, `sort`) VALUES
(1, 'Blue', 1, 17, 0),
(2, 'White', 1, 17, 0),
(3, 'S', 2, 17, 0),
(4, 'XL', 2, 17, 0),
(5, 'Blue', 1, 10, 0),
(6, 'Red', 1, 10, 0),
(7, 'S', 2, 10, 0),
(8, 'M', 2, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_build`
--

CREATE TABLE `shop_product_build` (
  `build_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_build`
--

INSERT INTO `shop_product_build` (`build_id`, `product_id`, `quantity`) VALUES
(15, 6, 1),
(15, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_category`
--

CREATE TABLE `shop_product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_category`
--

INSERT INTO `shop_product_category` (`product_id`, `category_id`) VALUES
(1, 13),
(2, 13),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 12),
(8, 10),
(9, 6),
(10, 11),
(11, 10),
(12, 9),
(13, 5),
(14, 11),
(15, 6),
(16, 9),
(17, 9);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_description`
--

CREATE TABLE `shop_product_description` (
  `product_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_description`
--

INSERT INTO `shop_product_description` (`product_id`, `lang`, `name`, `keyword`, `description`, `content`) VALUES
(1, 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(1, 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(7, 'en', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(7, 'vi', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(8, 'en', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(8, 'vi', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(9, 'en', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(9, 'vi', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(10, 'en', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(10, 'vi', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(11, 'en', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(11, 'vi', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(12, 'en', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(12, 'vi', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(13, 'en', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(13, 'vi', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(14, 'en', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(14, 'vi', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(15, 'en', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(15, 'vi', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(16, 'en', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(16, 'vi', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(17, 'en', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(17, 'vi', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_group`
--

CREATE TABLE `shop_product_group` (
  `group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_group`
--

INSERT INTO `shop_product_group` (`group_id`, `product_id`) VALUES
(16, 1),
(16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_image`
--

CREATE TABLE `shop_product_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_image`
--

INSERT INTO `shop_product_image` (`id`, `image`, `product_id`) VALUES
(1, '/data/product/img-32.jpg', 1),
(2, '/data/product/img-33.jpg', 1),
(3, '/data/product/img-22.jpg', 11),
(4, '/data/product/img-23.jpg', 2),
(5, '/data/product/img-14.jpg', 11),
(6, '/data/product/img-12.jpg', 5),
(7, '/data/product/img-11.jpg', 5),
(8, '/data/product/img-9.jpg', 2),
(9, '/data/product/img-19.jpg', 2),
(10, '/data/product/img-21.jpg', 9),
(11, '/data/product/img-22.jpg', 8),
(12, '/data/product/img-20.jpg', 7),
(13, '/data/product/img-26.jpg', 7),
(14, '/data/product/img-27.jpg', 5),
(15, '/data/product/img-40.jpg', 4),
(16, '/data/product/img-14.jpg', 15),
(17, '/data/product/img-23.jpg', 15),
(18, '/data/product/img-12.jpg', 17),
(19, '/data/product/img-11.jpg', 17),
(20, '/data/product/img-32.jpg', 17);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_promotion`
--

CREATE TABLE `shop_product_promotion` (
  `product_id` int(11) NOT NULL,
  `price_promotion` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status_promotion` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_product_promotion`
--

INSERT INTO `shop_product_promotion` (`product_id`, `price_promotion`, `date_start`, `date_end`, `status_promotion`, `created_at`, `updated_at`) VALUES
(1, 5000, NULL, NULL, 1, NULL, NULL),
(11, 5000, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping`
--

CREATE TABLE `shop_shipping` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  `free` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_shipping`
--

INSERT INTO `shop_shipping` (`id`, `type`, `value`, `free`, `status`) VALUES
(1, 0, 20000, 10000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_status`
--

CREATE TABLE `shop_shipping_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_shipping_status`
--

INSERT INTO `shop_shipping_status` (`id`, `name`) VALUES
(1, 'Not sent'),
(2, 'Sending'),
(3, 'Shipping done');

-- --------------------------------------------------------

--
-- Table structure for table `shop_shoppingcart`
--

CREATE TABLE `shop_shoppingcart` (
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_subscribe`
--

CREATE TABLE `shop_subscribe` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_user`
--

CREATE TABLE `shop_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BN',
  `district` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upazila` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_institute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `group` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_user`
--

INSERT INTO `shop_user` (`id`, `first_name`, `last_name`, `email`, `password`, `address`, `country`, `district`, `upazila`, `post`, `phone`, `educational_institute`, `occupation`, `birthdate`, `remember_token`, `status`, `group`, `created_at`, `updated_at`) VALUES
(1, 'Naruto', 'Kun', 'test@test.com', '$2y$10$s0KTFSMWTPw7utVXyj6Xj.uWmN0O41qgM5ByqfdoA3UzqfKY1tiQ.', 'ADDRESS 1', 'VN', '', '', '', '0667151172', NULL, NULL, NULL, NULL, 1, 1, '2019-10-25 11:21:06', NULL),
(2, 'Ameer', 'Hamza', 'hamza.iitju@gmail.com', '$2y$10$4FCB/Eel7.0ZKLkLbopkwexILxtkocmOzPg3KL4qp8PAmRGIyzMxS', 'JU', 'BD', '', '', '', '01744952899', NULL, NULL, NULL, NULL, 1, 1, '2019-11-01 07:38:45', '2019-11-03 08:59:42'),
(3, 'Ameer', 'Hamza', 'hamza.juit@gmail.com', '$2y$10$I/H4m3v1WJfyxsGTJByn7eY8EEkQHJFHZMB4h5xE4rRpLNGe.gvwi', 'Address', 'BD', 'District', 'upazila', '1243', '01823801180', 'IIT', NULL, NULL, NULL, 1, 1, '2019-11-10 11:37:27', '2019-11-10 11:37:27'),
(4, 'Ameer', 'Hamza', 'admin@example.com', '$2y$10$9Jnhwyp.qWvwKVLNBfIimu82Gikgy9fIrW.N/UilPx/6X2Loni366', 'Address', 'BD', 'District', 'upazila', '1243', '01823801180', 'IIT-JU', 'Occupation', '2019-10-30', NULL, 1, 1, '2019-11-10 12:20:09', '2019-11-10 12:20:09'),
(5, 'Ameer', 'Hamza', 'hamza@gmail.com', '$2y$10$KlPcC4AiI0IwmYe5GYTyjOUj3.QK3eTUCsGSGa1vuSEoCb.UOuH5y', 'Address', 'BD', 'District', 'upazila', '1243', '01744952899', NULL, NULL, NULL, NULL, 1, 1, '2019-11-10 12:21:34', '2019-11-10 12:21:34'),
(6, 'Ameer', 'Hamza', 'hamza.iit@gmail.com', '$2y$10$DgMTVxzwaVFQ/NWoW0nkIuUSQUf0isGkH6zkZUSCQEBbQR7VEaQhG', 'Address', 'BD', 'District', 'upazila', '1243', '01744952899', 'Educational Institute', 'Occupation', '2019-10-30', NULL, 1, 1, '2019-11-10 12:30:35', '2019-11-10 13:50:55'),
(7, 'Ameer', 'Hamza', 'hamza.ju@gmail.com', '$2y$10$xJvDjpx0BFHxyfArcIUKFuSEtYMkkdp5I2GAPnxHoTlIdhtk6SW5K', 'Address', 'BD', 'District', 'upazila', '1243', '01744952899', 'Educational Institute', 'Occupation', '2019-10-29', NULL, 1, 1, '2019-11-10 15:16:29', '2019-11-10 15:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `shop_vendor`
--

CREATE TABLE `shop_vendor` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_vendor`
--

INSERT INTO `shop_vendor` (`id`, `name`, `email`, `phone`, `image`, `address`, `url`, `sort`) VALUES
(1, 'ABC distributor', 'abc@abc.com', '012496657567', '/data/vendor/vendor.png', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_config`
--
ALTER TABLE `admin_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_config_key_unique` (`key`),
  ADD KEY `admin_config_code_index` (`code`);

--
-- Indexes for table `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_permission`
--
ALTER TABLE `admin_menu_permission`
  ADD PRIMARY KEY (`menu_id`,`permission_id`),
  ADD KEY `admin_menu_permission_menu_id_permission_id_index` (`menu_id`,`permission_id`);

--
-- Indexes for table `admin_permission`
--
ALTER TABLE `admin_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permission_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permission_slug_unique` (`slug`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_role_name_unique` (`name`),
  ADD UNIQUE KEY `admin_role_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`),
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permission`
--
ALTER TABLE `admin_role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `admin_role_permission_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_user`
--
ALTER TABLE `admin_role_user`
  ADD KEY `admin_role_user_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_store`
--
ALTER TABLE `admin_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_store_description`
--
ALTER TABLE `admin_store_description`
  ADD PRIMARY KEY (`config_id`,`lang`),
  ADD KEY `admin_store_description_lang_index` (`lang`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_user_username_unique` (`username`);

--
-- Indexes for table `admin_user_permission`
--
ALTER TABLE `admin_user_permission`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `admin_user_permission_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `cms_category`
--
ALTER TABLE `cms_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_category_description`
--
ALTER TABLE `cms_category_description`
  ADD PRIMARY KEY (`category_id`,`lang`);

--
-- Indexes for table `cms_content`
--
ALTER TABLE `cms_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_content_description`
--
ALTER TABLE `cms_content_description`
  ADD PRIMARY KEY (`cms_content_id`,`lang`);

--
-- Indexes for table `cms_image`
--
ALTER TABLE `cms_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `shipping_standard`
--
ALTER TABLE `shipping_standard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_api`
--
ALTER TABLE `shop_api`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_api_name_unique` (`name`);

--
-- Indexes for table `shop_api_process`
--
ALTER TABLE `shop_api_process`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_api_process_secret_key_unique` (`secret_key`);

--
-- Indexes for table `shop_attribute_group`
--
ALTER TABLE `shop_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_banner`
--
ALTER TABLE `shop_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_block_content`
--
ALTER TABLE `shop_block_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_brand`
--
ALTER TABLE `shop_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category_description`
--
ALTER TABLE `shop_category_description`
  ADD PRIMARY KEY (`category_id`,`lang`),
  ADD KEY `shop_category_description_lang_index` (`lang`);

--
-- Indexes for table `shop_country`
--
ALTER TABLE `shop_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_country_code_unique` (`code`);

--
-- Indexes for table `shop_currency`
--
ALTER TABLE `shop_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_currency_code_unique` (`code`);

--
-- Indexes for table `shop_discount`
--
ALTER TABLE `shop_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_discount_code_unique` (`code`);

--
-- Indexes for table `shop_email_template`
--
ALTER TABLE `shop_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_language`
--
ALTER TABLE `shop_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_language_code_unique` (`code`);

--
-- Indexes for table `shop_layout_page`
--
ALTER TABLE `shop_layout_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_layout_page_key_unique` (`key`);

--
-- Indexes for table `shop_layout_position`
--
ALTER TABLE `shop_layout_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_layout_position_key_unique` (`key`);

--
-- Indexes for table `shop_layout_type`
--
ALTER TABLE `shop_layout_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_layout_type_key_unique` (`key`);

--
-- Indexes for table `shop_link`
--
ALTER TABLE `shop_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_news`
--
ALTER TABLE `shop_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_news_description`
--
ALTER TABLE `shop_news_description`
  ADD PRIMARY KEY (`shop_news_id`,`lang`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_history`
--
ALTER TABLE `shop_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_status`
--
ALTER TABLE `shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_total`
--
ALTER TABLE `shop_order_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_page`
--
ALTER TABLE `shop_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_page_key_unique` (`key`);

--
-- Indexes for table `shop_page_description`
--
ALTER TABLE `shop_page_description`
  ADD PRIMARY KEY (`page_id`,`lang`),
  ADD KEY `shop_page_description_lang_index` (`lang`);

--
-- Indexes for table `shop_payment_status`
--
ALTER TABLE `shop_payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_product_sku_unique` (`sku`),
  ADD KEY `shop_product_brand_id_index` (`brand_id`),
  ADD KEY `shop_product_vendor_id_index` (`vendor_id`),
  ADD KEY `shop_product_type_index` (`type`),
  ADD KEY `shop_product_kind_index` (`kind`),
  ADD KEY `shop_product_virtual_index` (`virtual`),
  ADD KEY `shop_product_status_index` (`status`);

--
-- Indexes for table `shop_product_attribute`
--
ALTER TABLE `shop_product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_attribute_product_id_attribute_group_id_index` (`product_id`,`attribute_group_id`);

--
-- Indexes for table `shop_product_build`
--
ALTER TABLE `shop_product_build`
  ADD PRIMARY KEY (`build_id`,`product_id`);

--
-- Indexes for table `shop_product_category`
--
ALTER TABLE `shop_product_category`
  ADD PRIMARY KEY (`product_id`,`category_id`);

--
-- Indexes for table `shop_product_description`
--
ALTER TABLE `shop_product_description`
  ADD PRIMARY KEY (`product_id`,`lang`),
  ADD KEY `shop_product_description_lang_index` (`lang`);

--
-- Indexes for table `shop_product_group`
--
ALTER TABLE `shop_product_group`
  ADD PRIMARY KEY (`group_id`,`product_id`);

--
-- Indexes for table `shop_product_image`
--
ALTER TABLE `shop_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_image_product_id_index` (`product_id`);

--
-- Indexes for table `shop_product_promotion`
--
ALTER TABLE `shop_product_promotion`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shop_shipping`
--
ALTER TABLE `shop_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shipping_status`
--
ALTER TABLE `shop_shipping_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shoppingcart`
--
ALTER TABLE `shop_shoppingcart`
  ADD KEY `shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`);

--
-- Indexes for table `shop_subscribe`
--
ALTER TABLE `shop_subscribe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_subscribe_email_unique` (`email`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_user_email_unique` (`email`);

--
-- Indexes for table `shop_vendor`
--
ALTER TABLE `shop_vendor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_config`
--
ALTER TABLE `admin_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `admin_permission`
--
ALTER TABLE `admin_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_store`
--
ALTER TABLE `admin_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_category`
--
ALTER TABLE `cms_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_content`
--
ALTER TABLE `cms_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_image`
--
ALTER TABLE `cms_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_standard`
--
ALTER TABLE `shipping_standard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_api`
--
ALTER TABLE `shop_api`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_api_process`
--
ALTER TABLE `shop_api_process`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_attribute_group`
--
ALTER TABLE `shop_attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_banner`
--
ALTER TABLE `shop_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_block_content`
--
ALTER TABLE `shop_block_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shop_brand`
--
ALTER TABLE `shop_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shop_country`
--
ALTER TABLE `shop_country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `shop_currency`
--
ALTER TABLE `shop_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_discount`
--
ALTER TABLE `shop_discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_email_template`
--
ALTER TABLE `shop_email_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_language`
--
ALTER TABLE `shop_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_layout_page`
--
ALTER TABLE `shop_layout_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shop_layout_position`
--
ALTER TABLE `shop_layout_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_layout_type`
--
ALTER TABLE `shop_layout_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_link`
--
ALTER TABLE `shop_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_news`
--
ALTER TABLE `shop_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shop_order_history`
--
ALTER TABLE `shop_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `shop_order_status`
--
ALTER TABLE `shop_order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_order_total`
--
ALTER TABLE `shop_order_total`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `shop_page`
--
ALTER TABLE `shop_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_payment_status`
--
ALTER TABLE `shop_payment_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shop_product_attribute`
--
ALTER TABLE `shop_product_attribute`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_product_image`
--
ALTER TABLE `shop_product_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shop_shipping`
--
ALTER TABLE `shop_shipping`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_shipping_status`
--
ALTER TABLE `shop_shipping_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_subscribe`
--
ALTER TABLE `shop_subscribe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shop_vendor`
--
ALTER TABLE `shop_vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2025 at 12:20 AM
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
-- Database: `authtwo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `depos`
--

CREATE TABLE `depos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `depos`
--

INSERT INTO `depos` (`id`, `user_id`, `name`, `location`, `created_at`, `updated_at`) VALUES
(1, 4, 'Tani Depo', 'Dhaka', '2025-11-09 21:28:21', '2025-11-09 21:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `depo_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_01_205815_create_depos_table', 1),
(5, '2025_11_01_205851_create_distributors_table', 1),
(6, '2025_11_07_192218_create_roles_table', 1),
(7, '2025_11_07_194739_create_role_user_table', 1),
(8, '2025_11_08_172956_create_suppliers_table', 1),
(9, '2025_11_09_043719_create_raw_materials_table', 1),
(10, '2025_11_09_062352_create_purchase_tables', 1),
(11, '2025_11_12_051149_create_production_issues_table', 2),
(12, '2025_11_12_051222_create_production_issue_items_table', 2),
(13, '2025_11_12_153242_create_wastages_table', 3),
(14, '2025_11_12_182014_create_products_table', 4),
(15, '2025_11_12_182036_create_product_receives_table', 4),
(18, '2025_11_12_182104_create_product_receive_items_table', 5),
(20, '2025_11_12_182359_create_product_stocks_table', 6),
(23, '2025_11_15_172936_add_unit_price_to_product_stocks_table', 8),
(24, '2025_11_17_041517_add_total_cost_to_product_receives_table', 9),
(25, '2025_11_17_041553_add_total_item_cost_to_product_receive_items_table', 9),
(26, '2025_11_18_043136_add_receiver_id_to_product_receives_table', 10),
(27, '2025_11_14_163130_create_sales_invoices_table', 11),
(28, '2025_11_14_163201_create_sales_invoice_items_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_issues`
--

CREATE TABLE `production_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `issue_number` varchar(255) NOT NULL,
  `factory_name` varchar(255) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_quantity_issued` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_issue_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_issues`
--

INSERT INTO `production_issues` (`id`, `issue_number`, `factory_name`, `issue_date`, `user_id`, `total_quantity_issued`, `total_issue_cost`, `notes`, `created_at`, `updated_at`) VALUES
(1, '1', 'factory one', '2025-11-12', 1, 300.00, 60000.00, 'testing', '2025-11-12 08:24:47', '2025-11-12 08:24:48'),
(2, '7', 'factory one', '2025-11-15', 1, 20.00, 2400.00, 'trying to issue', '2025-11-15 04:48:04', '2025-11-15 04:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `production_issue_items`
--

CREATE TABLE `production_issue_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_issue_id` bigint(20) UNSIGNED NOT NULL,
  `raw_material_id` bigint(20) UNSIGNED NOT NULL,
  `raw_material_stock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `quantity_issued` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,4) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_issue_items`
--

INSERT INTO `production_issue_items` (`id`, `production_issue_id`, `raw_material_id`, `raw_material_stock_id`, `batch_number`, `quantity_issued`, `unit_cost`, `total_cost`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6, '101', 300.00, 200.0000, 60000.00, '2025-11-12 08:24:47', '2025-11-12 08:24:47'),
(2, 2, 2, 5, '333', 20.00, 120.0000, 2400.00, '2025-11-15 04:48:04', '2025-11-15 04:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'pcs',
  `mrp` decimal(15,2) NOT NULL DEFAULT 0.00,
  `retail_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `distributor_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `depo_selling_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `current_stock` decimal(15,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `unit`, `mrp`, `retail_rate`, `distributor_rate`, `depo_selling_price`, `current_stock`, `description`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'product one', '111', 'kg', 300.00, 280.00, 250.00, 220.00, 1200.00, 'product one description', 1, 1, '2025-11-12 13:24:10', '2025-11-15 07:50:50'),
(2, 'product two', '222', 'pcs', 300.00, 250.00, 220.00, 200.00, 1500.00, 'Product two description', 1, 1, '2025-11-12 13:36:11', '2025-11-15 09:09:55'),
(3, 'Product Three', '333', 'kg', 220.00, 200.00, 195.00, 190.00, 1800.00, 'Product Three description', 1, 1, '2025-11-13 08:46:30', '2025-11-15 09:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_receives`
--

CREATE TABLE `product_receives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receive_no` varchar(255) NOT NULL,
  `receive_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `total_received_qty` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `received_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_receives`
--

INSERT INTO `product_receives` (`id`, `receive_no`, `receive_date`, `note`, `total_received_qty`, `total_cost`, `received_by_user_id`, `created_at`, `updated_at`, `receiver_id`) VALUES
(1, 'PR-202511-0001', '2025-11-12', 'note', 500.00, 0.00, 1, '2025-11-12 13:49:03', '2025-11-12 13:49:03', NULL),
(2, 'PR-202511-0002', '2025-11-13', 'note', 900.00, 0.00, 1, '2025-11-13 08:55:45', '2025-11-13 08:55:45', NULL),
(3, 'PR-202511-0003', '2025-11-14', NULL, 400.00, 0.00, 1, '2025-11-13 21:42:54', '2025-11-13 21:42:54', NULL),
(4, 'PR-202511-0004', '2025-11-14', 'Multi product buy', 1000.00, 0.00, 1, '2025-11-13 22:14:54', '2025-11-13 22:14:54', NULL),
(5, 'PR-202511-0005', '2025-11-15', NULL, 100.00, 0.00, 1, '2025-11-15 06:57:52', '2025-11-15 06:57:52', NULL),
(6, 'PR-202511-0006', '2025-11-15', 'Multi product buy', 200.00, 0.00, 1, '2025-11-15 07:50:49', '2025-11-15 07:50:49', NULL),
(7, 'PR-202511-0007', '2025-11-15', NULL, 200.00, 0.00, 1, '2025-11-15 08:15:10', '2025-11-15 08:15:10', NULL),
(8, 'PR-202511-0008', '2025-11-15', 'Multi product buy', 700.00, 0.00, 1, '2025-11-15 09:02:33', '2025-11-15 09:02:33', NULL),
(9, 'PR-202511-0009', '2025-11-15', NULL, 500.00, 0.00, 1, '2025-11-15 09:09:55', '2025-11-15 09:09:55', NULL),
(10, 'PR-2025-0010', '2025-11-17', 'Multi product buy', 700.00, 111000.00, 1, '2025-11-17 10:43:02', '2025-11-17 10:43:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_receive_items`
--

CREATE TABLE `product_receive_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_receive_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `batch_no` varchar(255) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `received_quantity` decimal(15,2) NOT NULL,
  `cost_rate` decimal(15,2) DEFAULT NULL,
  `total_item_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_receive_items`
--

INSERT INTO `product_receive_items` (`id`, `product_receive_id`, `product_id`, `batch_no`, `production_date`, `expiry_date`, `received_quantity`, `cost_rate`, `total_item_cost`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '333', '2025-11-13', '2025-12-30', 900.00, 0.00, 0.00, '2025-11-13 08:55:45', '2025-11-13 08:55:45'),
(2, 3, 3, '333', '2025-11-14', '2025-12-31', 200.00, 150.00, 0.00, '2025-11-13 21:42:54', '2025-11-13 21:42:54'),
(3, 3, 2, '111', NULL, NULL, 200.00, 0.00, 0.00, '2025-11-13 21:42:54', '2025-11-13 21:42:54'),
(4, 4, 1, '111', '2025-11-14', '2026-09-20', 500.00, 200.00, 0.00, '2025-11-13 22:14:54', '2025-11-13 22:14:54'),
(5, 4, 2, '222', '2025-11-14', '2025-12-14', 500.00, 180.00, 0.00, '2025-11-13 22:14:54', '2025-11-13 22:14:54'),
(6, 5, 2, '222', '2025-11-15', '2025-12-19', 100.00, 120.00, 0.00, '2025-11-15 06:57:52', '2025-11-15 06:57:52'),
(7, 6, 1, '111', '2025-11-14', '2025-12-31', 200.00, 300.00, 0.00, '2025-11-15 07:50:50', '2025-11-15 07:50:50'),
(8, 7, 2, '222', '2025-11-15', '2025-11-15', 200.00, 110.00, 0.00, '2025-11-15 08:15:10', '2025-11-15 08:15:10'),
(9, 8, 3, '333', '2025-11-05', '2025-11-30', 700.00, 200.00, 0.00, '2025-11-15 09:02:33', '2025-11-15 09:02:33'),
(10, 9, 2, '111', '2025-11-15', '2026-09-21', 500.00, 100.00, 0.00, '2025-11-15 09:09:55', '2025-11-15 09:09:55'),
(11, 10, 2, '222', '2025-11-15', '2025-11-30', 500.00, 190.00, 95000.00, '2025-11-17 10:43:02', '2025-11-17 10:43:02'),
(12, 10, 1, '222', '2025-11-13', '2025-11-30', 200.00, 80.00, 16000.00, '2025-11-17 10:43:02', '2025-11-17 10:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `available_quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `batch_no`, `expiry_date`, `available_quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 3, '333', '2025-12-30', 1800.00, 120.00, '2025-11-13 08:55:45', '2025-11-15 09:02:34'),
(2, 2, '111', NULL, 700.00, 150.00, '2025-11-13 21:42:54', '2025-11-15 09:09:55'),
(3, 1, '111', '2026-09-20', 700.00, 100.00, '2025-11-13 22:14:54', '2025-11-15 07:50:50'),
(4, 2, '222', '2025-12-14', 800.00, 0.00, '2025-11-13 22:14:54', '2025-11-15 08:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices`
--

CREATE TABLE `purchase_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_invoices`
--

INSERT INTO `purchase_invoices` (`id`, `invoice_number`, `supplier_id`, `invoice_date`, `sub_total`, `discount_amount`, `grand_total`, `notes`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2025-11-10', 1100.00, 10.00, 1100.00, NULL, 1, '2025-11-09 22:20:05', '2025-11-09 22:20:05'),
(2, '2', 1, '2025-11-10', 720.00, 10.00, 720.00, NULL, 1, '2025-11-09 22:22:37', '2025-11-09 22:22:37'),
(3, '3', 2, '2025-11-10', 25000.00, 0.00, 25000.00, NULL, 1, '2025-11-10 00:38:56', '2025-11-10 00:38:56'),
(4, '4', 2, '2025-11-11', 24000.00, 0.00, 24000.00, NULL, 1, '2025-11-11 10:45:48', '2025-11-11 10:45:48'),
(5, '5', 2, '2025-11-12', 100000.00, 0.00, 100000.00, NULL, 1, '2025-11-12 00:34:16', '2025-11-12 00:34:16'),
(6, '6', 1, '2025-11-12', 30000.00, 0.00, 30000.00, 'material 3', 1, '2025-11-12 08:12:32', '2025-11-12 08:12:32'),
(7, '7', 2, '2025-11-15', 100000.00, 100.00, 99900.00, 'Trying', 1, '2025-11-15 04:52:14', '2025-11-15 04:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `raw_materials`
--

CREATE TABLE `raw_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_of_measure` varchar(255) NOT NULL COMMENT 'e.g., KG, Litre, Pcs',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_materials`
--

INSERT INTO `raw_materials` (`id`, `name`, `unit_of_measure`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Raw material 3', 'Pcs', 'This is raw material 3 description.', '2025-11-09 21:30:15', '2025-11-09 21:30:15'),
(2, 'Sugar', 'KG', 'Granulated white sugar', '2025-10-01 02:00:00', '2025-10-01 02:00:00'),
(3, 'Yeast', 'Pcs', 'Active dry yeast sachets', '2025-10-01 02:00:00', '2025-10-01 02:00:00'),
(4, 'Vanilla Essence', 'Litre', 'Synthetic vanilla flavoring', '2025-10-01 02:00:00', '2025-10-01 02:00:00'),
(5, 'Wheat Flour', 'KG', 'High-quality bread flour (Type 00)', '2025-10-01 02:00:00', '2025-10-01 02:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `raw_material_purchase_items`
--

CREATE TABLE `raw_material_purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_invoice_id` bigint(20) UNSIGNED NOT NULL,
  `raw_material_id` bigint(20) UNSIGNED NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_material_purchase_items`
--

INSERT INTO `raw_material_purchase_items` (`id`, `purchase_invoice_id`, `raw_material_id`, `batch_number`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1110', 3.00, 300.00, 900.00, '2025-11-09 22:20:05', '2025-11-09 22:20:05'),
(2, 1, 2, '1111', 2.00, 100.00, 200.00, '2025-11-09 22:20:06', '2025-11-09 22:20:06'),
(3, 2, 5, '1112', 6.00, 120.00, 720.00, '2025-11-09 22:22:37', '2025-11-09 22:22:37'),
(4, 3, 4, '1233', 500.00, 50.00, 25000.00, '2025-11-10 00:38:56', '2025-11-10 00:38:56'),
(5, 4, 2, '333', 200.00, 120.00, 24000.00, '2025-11-11 10:45:48', '2025-11-11 10:45:48'),
(6, 5, 1, '101', 500.00, 200.00, 100000.00, '2025-11-12 00:34:16', '2025-11-12 00:34:16'),
(7, 6, 1, '444', 200.00, 150.00, 30000.00, '2025-11-12 08:12:33', '2025-11-12 08:12:33'),
(8, 7, 2, '333', 500.00, 120.00, 60000.00, '2025-11-15 04:52:15', '2025-11-15 04:52:15'),
(9, 7, 1, '444', 500.00, 80.00, 40000.00, '2025-11-15 04:52:15', '2025-11-15 04:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `raw_material_stocks`
--

CREATE TABLE `raw_material_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `raw_material_id` bigint(20) UNSIGNED NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `stock_quantity` decimal(10,2) NOT NULL,
  `average_purchase_price` decimal(10,2) NOT NULL,
  `last_in_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_material_stocks`
--

INSERT INTO `raw_material_stocks` (`id`, `raw_material_id`, `batch_number`, `stock_quantity`, `average_purchase_price`, `last_in_date`, `created_at`, `updated_at`) VALUES
(1, 1, '1110', 3.00, 300.00, '2025-11-10', '2025-11-09 22:20:06', '2025-11-09 22:20:06'),
(2, 2, '1111', 2.00, 100.00, '2025-11-10', '2025-11-09 22:20:06', '2025-11-09 22:20:06'),
(3, 5, '1112', 6.00, 120.00, '2025-11-10', '2025-11-09 22:22:37', '2025-11-09 22:22:37'),
(4, 4, '1233', 450.00, 50.00, '2025-11-10', '2025-11-10 00:38:56', '2025-11-12 11:22:40'),
(5, 2, '333', 650.00, 120.00, '2025-11-15', '2025-11-11 10:45:48', '2025-11-15 05:20:35'),
(6, 1, '101', 190.00, 200.00, '2025-11-12', '2025-11-12 00:34:16', '2025-11-12 11:19:22'),
(7, 1, '444', 700.00, 100.00, '2025-11-15', '2025-11-12 08:12:33', '2025-11-15 04:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin', 'Full access to the system.', 1, '2025-11-09 00:27:55', '2025-11-09 00:27:55'),
(2, 'Depo Manager', 'depo', 'Depo level stock and distributor management.', 1, '2025-11-09 00:27:55', '2025-11-09 00:27:55'),
(3, 'Distributor', 'distributor', 'Manages sales and customers.', 1, '2025-11-09 00:27:55', '2025-11-09 00:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices`
--

CREATE TABLE `sales_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `depo_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Pending','Approved','Canceled') NOT NULL DEFAULT 'Pending',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_invoices`
--

INSERT INTO `sales_invoices` (`id`, `invoice_no`, `invoice_date`, `total_amount`, `user_id`, `depo_id`, `status`, `approved_by`, `approved_at`, `cancellation_reason`, `created_at`, `updated_at`) VALUES
(1, 'INV-001', '2025-11-18', 17000.00, 1, 1, 'Pending', NULL, NULL, NULL, '2025-11-18 15:41:26', '2025-11-18 15:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_items`
--

CREATE TABLE `sales_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_stock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_invoice_items`
--

INSERT INTO `sales_invoice_items` (`id`, `sales_invoice_id`, `product_id`, `product_stock_id`, `quantity`, `unit_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 100, 170.00, 17000.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AeSTnMh2WVAHHimXRSZFRL2EfPj5mlOYHa97AhDd', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZXdIeFNqM01nV29lWVBrVmpNV2lFUElzVDlraHNVcWVBUm05UmFkRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdXBlcmFkbWluL3dhc3RhZ2UiO3M6NToicm91dGUiO3M6MjQ6InN1cGVyYWRtaW4ud2FzdGFnZS5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1763398485),
('tagwFc3I66hzIy22LPUOCHM2dqonx5Jg6CwsL4Z4', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS1hOdXBFTFp1ckY1ekdhajB6MUZIdGN2U3V5elF5eVloNkhkVWkxayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZXBvL2Rhc2hib2FyZCI7czo1OiJyb3V0ZSI7czoxNDoiZGVwby5kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1763228458),
('UzqdUTzoHXVBmby113QY3u0vb3Jy7w1usIeGa781', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRm1KTThMQjg2NDg4blBYaGdQTzFNalZxa3lHUlI2UWlmZVNwRzl3ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdXBlcmFkbWluL3Byb2R1Y3QtcmVjZWl2ZXMvY3JlYXRlIjtzOjU6InJvdXRlIjtzOjM0OiJzdXBlcmFkbWluLnByb2R1Y3QtcmVjZWl2ZXMuY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1763359756);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'supplier 1', 'ELity', '09876543', 'elite@gmail.com', 'Cumilla', 'active', '2025-11-09 00:57:48', '2025-11-09 00:57:48'),
(2, 'Supplier 3', 'Arshi', '0987654321', 'arshi@gmail.com', 'Dhaka', 'active', '2025-11-09 21:27:02', '2025-11-09 21:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 'sup@gmail.com', NULL, '$2y$12$u/8JV03x4ULHFJc4QfcT8uAeIQBW5ih5nnwIdj2zCkj/Ic9LWCvbW', NULL, 'active', '2025-11-09 00:27:55', '2025-11-09 00:27:55'),
(2, 'Depot', 'depo@gmail.com', NULL, '$2y$12$r5EJ1/vyJYNnKLFWs7BV7.JNNrzrLCsCoKOgs2yzSa9Dz1Kakkn6W', NULL, 'active', '2025-11-09 00:27:56', '2025-11-09 00:27:56'),
(3, 'Distributor', 'dist@gmail.com', NULL, '$2y$12$qcVc4byd7rkvQYIcKYtrquM4.E0lqYgwPIkyzGw2Jiol78EyEH3HO', NULL, 'active', '2025-11-09 00:27:56', '2025-11-09 00:27:56'),
(4, 'Tani', 'tani@gmail.com', NULL, '$2y$12$yZ8CN2wfV3pRzvl5wpkm6.vE60VYBKnQoWmKVvK9LzZ0sE3aaJe/S', NULL, 'active', '2025-11-09 21:28:21', '2025-11-09 21:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `wastages`
--

CREATE TABLE `wastages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wastage_date` date NOT NULL,
  `raw_material_id` bigint(20) UNSIGNED NOT NULL,
  `raw_material_stock_id` bigint(20) UNSIGNED NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `quantity_wasted` decimal(10,3) NOT NULL,
  `unit_cost` decimal(10,4) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `reason` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wastages`
--

INSERT INTO `wastages` (`id`, `wastage_date`, `raw_material_id`, `raw_material_stock_id`, `batch_number`, `quantity_wasted`, `unit_cost`, `total_cost`, `reason`, `user_id`, `created_at`, `updated_at`) VALUES
(3, '2025-11-12', 2, 5, '333', 10.000, 120.0000, 1200.00, 'dont know', 1, '2025-11-12 11:16:55', '2025-11-12 11:16:55'),
(4, '2025-11-12', 1, 6, '101', 10.000, 200.0000, 2000.00, 'dont know', 1, '2025-11-12 11:19:22', '2025-11-12 11:19:22'),
(5, '2025-11-12', 4, 4, '1233', 50.000, 50.0000, 2500.00, 'dont know', 1, '2025-11-12 11:22:40', '2025-11-12 11:22:40'),
(6, '2025-11-15', 2, 5, '333', 20.000, 120.0000, 2400.00, 'dont know', 1, '2025-11-15 05:20:35', '2025-11-15 05:20:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `depos`
--
ALTER TABLE `depos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depos_user_id_foreign` (`user_id`);

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distributors_user_id_foreign` (`user_id`),
  ADD KEY `distributors_depo_id_foreign` (`depo_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `production_issues`
--
ALTER TABLE `production_issues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `production_issues_issue_number_unique` (`issue_number`),
  ADD KEY `production_issues_user_id_foreign` (`user_id`);

--
-- Indexes for table `production_issue_items`
--
ALTER TABLE `production_issue_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_issue_items_production_issue_id_foreign` (`production_issue_id`),
  ADD KEY `production_issue_items_raw_material_id_foreign` (`raw_material_id`),
  ADD KEY `production_issue_items_raw_material_stock_id_foreign` (`raw_material_stock_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_created_by_foreign` (`created_by`);

--
-- Indexes for table `product_receives`
--
ALTER TABLE `product_receives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_receives_receive_no_unique` (`receive_no`),
  ADD KEY `product_receives_received_by_user_id_foreign` (`received_by_user_id`),
  ADD KEY `product_receives_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `product_receive_items`
--
ALTER TABLE `product_receive_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_receive_items_product_receive_id_foreign` (`product_receive_id`),
  ADD KEY `product_receive_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_stocks_product_id_batch_no_unique` (`product_id`,`batch_no`);

--
-- Indexes for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `purchase_invoices_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchase_invoices_user_id_foreign` (`user_id`);

--
-- Indexes for table `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `raw_materials_name_unique` (`name`);

--
-- Indexes for table `raw_material_purchase_items`
--
ALTER TABLE `raw_material_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_batch_unique` (`purchase_invoice_id`,`raw_material_id`,`batch_number`),
  ADD KEY `raw_material_purchase_items_raw_material_id_foreign` (`raw_material_id`);

--
-- Indexes for table `raw_material_stocks`
--
ALTER TABLE `raw_material_stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `raw_material_stocks_raw_material_id_batch_number_unique` (`raw_material_id`,`batch_number`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_user_role_id_user_id_unique` (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoices_invoice_no_unique` (`invoice_no`),
  ADD KEY `sales_invoices_user_id_foreign` (`user_id`),
  ADD KEY `sales_invoices_depo_id_foreign` (`depo_id`),
  ADD KEY `sales_invoices_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_invoice_items_sales_invoice_id_foreign` (`sales_invoice_id`),
  ADD KEY `sales_invoice_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_name_unique` (`name`),
  ADD KEY `suppliers_status_index` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_status_index` (`status`);

--
-- Indexes for table `wastages`
--
ALTER TABLE `wastages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wastages_raw_material_id_foreign` (`raw_material_id`),
  ADD KEY `wastages_raw_material_stock_id_foreign` (`raw_material_stock_id`),
  ADD KEY `wastages_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `depos`
--
ALTER TABLE `depos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `distributors`
--
ALTER TABLE `distributors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `production_issues`
--
ALTER TABLE `production_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `production_issue_items`
--
ALTER TABLE `production_issue_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_receives`
--
ALTER TABLE `product_receives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_receive_items`
--
ALTER TABLE `product_receive_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `raw_materials`
--
ALTER TABLE `raw_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `raw_material_purchase_items`
--
ALTER TABLE `raw_material_purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `raw_material_stocks`
--
ALTER TABLE `raw_material_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wastages`
--
ALTER TABLE `wastages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `depos`
--
ALTER TABLE `depos`
  ADD CONSTRAINT `depos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `distributors`
--
ALTER TABLE `distributors`
  ADD CONSTRAINT `distributors_depo_id_foreign` FOREIGN KEY (`depo_id`) REFERENCES `depos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `distributors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `production_issues`
--
ALTER TABLE `production_issues`
  ADD CONSTRAINT `production_issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `production_issue_items`
--
ALTER TABLE `production_issue_items`
  ADD CONSTRAINT `production_issue_items_production_issue_id_foreign` FOREIGN KEY (`production_issue_id`) REFERENCES `production_issues` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_issue_items_raw_material_id_foreign` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`id`),
  ADD CONSTRAINT `production_issue_items_raw_material_stock_id_foreign` FOREIGN KEY (`raw_material_stock_id`) REFERENCES `raw_material_stocks` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_receives`
--
ALTER TABLE `product_receives`
  ADD CONSTRAINT `product_receives_received_by_user_id_foreign` FOREIGN KEY (`received_by_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_receives_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_receive_items`
--
ALTER TABLE `product_receive_items`
  ADD CONSTRAINT `product_receive_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_receive_items_product_receive_id_foreign` FOREIGN KEY (`product_receive_id`) REFERENCES `product_receives` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  ADD CONSTRAINT `purchase_invoices_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchase_invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `raw_material_purchase_items`
--
ALTER TABLE `raw_material_purchase_items`
  ADD CONSTRAINT `raw_material_purchase_items_purchase_invoice_id_foreign` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `raw_material_purchase_items_raw_material_id_foreign` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`id`);

--
-- Constraints for table `raw_material_stocks`
--
ALTER TABLE `raw_material_stocks`
  ADD CONSTRAINT `raw_material_stocks_raw_material_id_foreign` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  ADD CONSTRAINT `sales_invoices_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_invoices_depo_id_foreign` FOREIGN KEY (`depo_id`) REFERENCES `depos` (`id`),
  ADD CONSTRAINT `sales_invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  ADD CONSTRAINT `sales_invoice_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sales_invoice_items_sales_invoice_id_foreign` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wastages`
--
ALTER TABLE `wastages`
  ADD CONSTRAINT `wastages_raw_material_id_foreign` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`id`),
  ADD CONSTRAINT `wastages_raw_material_stock_id_foreign` FOREIGN KEY (`raw_material_stock_id`) REFERENCES `raw_material_stocks` (`id`),
  ADD CONSTRAINT `wastages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

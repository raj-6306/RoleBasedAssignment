-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2025 at 03:00 PM
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
-- Database: `laravel`
--

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_31_061607_create_permission_tables', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(9, '2016_06_01_000004_create_oauth_clients_table', 2),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(11, '2025_07_31_104140_add_soft_deletes_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(14, 'App\\Models\\User', 7),
(16, 'App\\Models\\User', 14),
(16, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Ozjjplg3aozrDPAM5GwIL9m32S3kEKM2EYwlxFjW', NULL, 'http://localhost', 1, 0, 0, '2025-07-31 02:19:45', '2025-07-31 02:19:45'),
(2, NULL, 'Laravel Password Grant Client', '7khwZrD43A1lC8YFRZIVuJ8qFgXW0EVAevxti4EQ', 'users', 'http://localhost', 0, 1, 0, '2025-07-31 02:19:45', '2025-07-31 02:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-07-31 02:19:45', '2025-07-31 02:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(37, 'user.create', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(38, 'user.view', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(39, 'user.update', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(40, 'user.delete', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(41, 'user.view_own', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(42, 'user.update_own', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(43, 'user.delete_own', 'web', '2025-08-03 06:21:39', '2025-08-03 06:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(7, 'App\\Models\\User', 1, 'UserAccessToken', 'ae690a8410e84bd13aeae40b8a20498224024c0206e74852ddcd8952b1e1e160', '[\"*\"]', '2025-07-31 05:21:03', NULL, '2025-07-31 04:50:39', '2025-07-31 05:21:03'),
(8, 'App\\Models\\User', 1, 'UserAccessToken', 'e4b2fea7aac9e9267790bddd7ee0514ea0ff15dba669043fe03cfbf3e3a86b80', '[\"*\"]', '2025-08-02 12:02:52', NULL, '2025-08-02 11:34:33', '2025-08-02 12:02:52'),
(9, 'App\\Models\\User', 7, 'UserAccessToken', '17df6e8eae8a7377eaf4d14755c2bbea5a27f6ed73597768a5bb500a915825ba', '[\"*\"]', '2025-08-02 12:28:46', NULL, '2025-08-02 12:09:30', '2025-08-02 12:28:46'),
(10, 'App\\Models\\User', 7, 'UserAccessToken', '29a87f0874d78d6acfee5b92f22cd2c01bd48969832044adb6320ea735d011cf', '[\"*\"]', NULL, NULL, '2025-08-02 12:15:44', '2025-08-02 12:15:44'),
(11, 'App\\Models\\User', 7, 'UserAccessToken', 'cb036a61f394b1c53c458c5e0a5dc37807b99909b41404e6feb99ebbafb722b9', '[\"*\"]', '2025-08-03 02:37:34', NULL, '2025-08-02 12:17:35', '2025-08-03 02:37:34'),
(12, 'App\\Models\\User', 7, 'UserAccessToken', '33c4e34991834c26c289c3ea7728b6020cec55ada631ef90bce171f1fd691b8a', '[\"*\"]', NULL, NULL, '2025-08-03 02:29:38', '2025-08-03 02:29:38'),
(13, 'App\\Models\\User', 7, 'UserAccessToken', '384845362725201e509711d370c31ae4f80c2ca8ffa925ea22fa4551124daea4', '[\"*\"]', '2025-08-03 03:08:00', NULL, '2025-08-03 02:38:22', '2025-08-03 03:08:00'),
(14, 'App\\Models\\User', 7, 'UserAccessToken', 'a4837e45a83aa09e0be7abfa52f35ef118285157fa96902f79171eddba2a5e21', '[\"*\"]', NULL, NULL, '2025-08-03 03:05:09', '2025-08-03 03:05:09'),
(15, 'App\\Models\\User', 7, 'UserAccessToken', '55b2d92cbf2e571df73709bcc021f5602b53cfe27896a63a5476d0e6728d64ac', '[\"*\"]', NULL, NULL, '2025-08-03 03:05:11', '2025-08-03 03:05:11'),
(16, 'App\\Models\\User', 7, 'UserAccessToken', 'c07e5ad1cf4fa7242f0b46d39aaef6df178445aa735d7e96069f835477384f9e', '[\"*\"]', '2025-08-03 03:22:34', NULL, '2025-08-03 03:08:08', '2025-08-03 03:22:34'),
(17, 'App\\Models\\User', 7, 'UserAccessToken', '5f2c9912879986f981100634b915f66e1c5f11f1a121a0b33d781e8a6c4633ef', '[\"*\"]', '2025-08-03 06:42:46', NULL, '2025-08-03 03:22:55', '2025-08-03 06:42:46'),
(18, 'App\\Models\\User', 13, 'UserAccessToken', 'd08727cb9a715e1074bccc9a1b755d6f62fd08d9bcdc94454ce0a894386261fe', '[\"*\"]', NULL, NULL, '2025-08-03 03:40:59', '2025-08-03 03:40:59'),
(19, 'App\\Models\\User', 13, 'UserAccessToken', '46416726fbfdb800c142e94b609017a88111ec65cb74fd567e83309392b9e343', '[\"*\"]', '2025-08-03 06:09:17', NULL, '2025-08-03 05:47:44', '2025-08-03 06:09:17'),
(20, 'App\\Models\\User', 13, 'UserAccessToken', 'd4e938e08092e53e95b974c6cfc89a23a3d01b56a05d9242619f32e31195b59b', '[\"*\"]', '2025-08-03 06:07:09', NULL, '2025-08-03 06:06:53', '2025-08-03 06:07:09'),
(21, 'App\\Models\\User', 7, 'UserAccessToken', 'ad68139205578542697c0beb6475199ed5eb811062f1a47417c91780df78cd2f', '[\"*\"]', '2025-08-03 06:22:27', NULL, '2025-08-03 06:09:24', '2025-08-03 06:22:27'),
(22, 'App\\Models\\User', 13, 'UserAccessToken', '5b792b1c9543eaacfa4864b4d0259eb60a53d134b69c50c871dcad638a83c2b8', '[\"*\"]', '2025-08-03 06:10:50', NULL, '2025-08-03 06:10:12', '2025-08-03 06:10:50'),
(23, 'App\\Models\\User', 13, 'UserAccessToken', '35a601657d1676a9fe90601f10aa4f5d978054dc7291c13d27f8db73cbce8d99', '[\"*\"]', '2025-08-03 06:37:52', NULL, '2025-08-03 06:22:46', '2025-08-03 06:37:52'),
(24, 'App\\Models\\User', 13, 'UserAccessToken', 'da034ff714e132466e4959967f79a9bdfe1f0851152759544410dfc04ea59d07', '[\"*\"]', NULL, NULL, '2025-08-03 06:36:24', '2025-08-03 06:36:24'),
(25, 'App\\Models\\User', 13, 'UserAccessToken', '438d78a3cce73cad766b31b53709628c37b1cb85af306321aaaf79d85340a00b', '[\"*\"]', '2025-08-03 06:38:43', NULL, '2025-08-03 06:37:59', '2025-08-03 06:38:43'),
(26, 'App\\Models\\User', 13, 'UserAccessToken', '1d0147018f16d407e3acfa1ec810f435398f3cc9dea9072c9f621a93719146f8', '[\"*\"]', '2025-08-03 06:41:19', NULL, '2025-08-03 06:39:31', '2025-08-03 06:41:19'),
(27, 'App\\Models\\User', 15, 'UserAccessToken', '5f68a761222bd6d3e8b1293eed12f6bcef5c72e100402e63c3f0daff320212af', '[\"*\"]', '2025-08-03 06:44:43', NULL, '2025-08-03 06:43:20', '2025-08-03 06:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(14, 'SuperAdmin', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(15, 'Admin', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45'),
(16, 'User', 'web', '2025-08-03 06:18:45', '2025-08-03 06:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(37, 15),
(38, 15),
(39, 15),
(40, 15),
(41, 16),
(42, 16),
(43, 16);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Alice', 'alice@example.com', NULL, '$2y$10$dUQRrYWxUaBsM3WFrR.vjOs0UmQb01FVm.2pYjFTgVB3yd3VHFvSW', NULL, '2025-07-31 04:52:27', '2025-07-31 04:52:27', NULL),
(3, 'Amit Singh', 'amit@gmail.com', NULL, '$2y$10$esJb7BtC656iTrvEJpewhOhQzI9ewV0GIuCTYtU3nLhAdrbdlB1wy', NULL, '2025-07-31 04:52:27', '2025-07-31 05:21:03', '2025-07-31 05:21:03'),
(7, 'Admin User', 'admin@gmail.com', '2025-08-02 12:07:01', '$2y$10$DIOIy5bM/1rbJJxmidHhiexx1PRBuYEAN.MR8fvpm9HxzjwDG3uui', NULL, '2025-08-02 12:07:01', '2025-08-02 12:07:01', NULL),
(8, 'John Doe', 'john@example.com', NULL, '$2y$10$ZARdvmtNFXVb00cmusveNe/UlgvbiwV0N6D8bK5pwQgwsiN5mXCrq', NULL, '2025-08-03 02:58:56', '2025-08-03 02:58:56', NULL),
(9, 'Jane Smith', 'jane@example.com', NULL, '$2y$10$JUyFubjs9J66rmpMLRaHeeWmPRi6DhwDuDx4mjKfayqxmqZTQu/PO', NULL, '2025-08-03 02:58:56', '2025-08-03 02:58:56', NULL),
(10, 'David Miller', 'david.miller@example.com', NULL, '$2y$10$nxytEeDYZZAFeTw.h7fFBOmeIhAL1OCxPkElYgCc5qR1ddZOr7m6W', NULL, '2025-08-03 03:25:54', '2025-08-03 03:25:54', NULL),
(11, 'Emma Watson', 'emma.watson@example.com', NULL, '$2y$10$dUI2Mi40EzwSg6CKRLPjIejuFw8EPYrQGWHZhXwNmbtAoPL5T4Wli', NULL, '2025-08-03 03:25:54', '2025-08-03 03:25:54', NULL),
(12, 'Franklin Lee', 'frank.lee@example.com', NULL, '$2y$10$.9czYVs6XIy6VKTUpBhphui2pxyw7N0.W.0B271ocMlsq9WBBAn0O', NULL, '2025-08-03 03:25:54', '2025-08-03 03:25:54', NULL),
(13, 'warner bros', 'warner@example.com', NULL, '$2y$10$AvYyaERlCpeu6DOOiJT7VOVLE3eqlCZS2uOFlt4Fv9a28qfVuZqxq', NULL, '2025-08-03 03:40:28', '2025-08-03 06:01:46', NULL),
(14, 'Tom Hardy', 'tom.hardy@example.com', NULL, '$2y$10$RTsXD6Gdy3ujz1KU9wnk2uvVKwjoqEuNCtBnnAdjBPiKCbWhmra7i', NULL, '2025-08-03 06:42:46', '2025-08-03 06:42:46', NULL),
(15, 'Shane Warne', 'warner123@gmail.com', NULL, '$2y$10$TzdXwPWfmru81Xn10XbGJe9eSW.qRg7xypIgwfyRUln2Zkw0drxP.', NULL, '2025-08-03 06:42:46', '2025-08-03 06:44:44', '2025-08-03 06:44:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

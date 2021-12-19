-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2021 at 10:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`user_id`, `follower_id`, `created_at`, `updated_at`) VALUES
(5, 2, '2021-12-18 02:37:48', '2021-12-18 02:37:48'),
(5, 1, '2021-12-18 02:50:12', '2021-12-18 02:50:12'),
(3, 2, '2021-12-18 03:16:16', '2021-12-18 03:16:16'),
(3, 4, '2021-12-18 03:16:16', '2021-12-18 03:16:16'),
(3, 5, '2021-12-18 03:16:17', '2021-12-18 03:16:17');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2021_12_17_171542_create_posts_table', 1),
(3, '2021_12_17_171605_create_followers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_content`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'Hello', 1, '2021-12-18 01:53:24', '2021-12-18 01:53:24'),
(2, 'Second', 1, '2021-12-18 01:53:58', '2021-12-18 01:53:58'),
(3, 'Ajay', 1, '2021-12-18 03:35:15', '2021-12-18 03:35:15'),
(4, 'Rahul', 3, '2021-12-18 03:36:31', '2021-12-18 03:36:31'),
(5, 'Aman', 2, '2021-12-18 03:40:02', '2021-12-18 03:40:02'),
(6, 'Post 1', 1, '2021-12-18 05:20:49', '2021-12-18 05:20:49'),
(7, 'Post 2', 1, '2021-12-18 05:21:57', '2021-12-18 05:21:57'),
(8, 'Post 3', 1, '2021-12-18 05:27:39', '2021-12-18 05:27:39'),
(9, 'Post 4', 1, '2021-12-18 05:37:50', '2021-12-18 05:37:50'),
(10, 'Post 5', 1, '2021-12-19 03:08:10', '2021-12-19 03:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'ajay', 'ajay@gmail.com', '1234567890', '2021-12-17 11:59:51', '2021-12-17 11:59:51'),
(2, 'aman', 'aman@gmail.com', '1234567890', '2021-12-17 12:49:22', '2021-12-17 12:49:22'),
(3, 'rahul', 'rahul@gmail.com', '1234567890', '2021-12-18 02:36:30', '2021-12-18 02:36:30'),
(4, 'kiran', 'kiran@gmail.com', '1234567890', '2021-12-18 02:36:51', '2021-12-18 02:36:51'),
(5, 'khushi', 'khushi@gmail.com', '1234567890', '2021-12-18 02:37:22', '2021-12-18 02:37:22'),
(6, 'Sahil', 'sahil@gmail.com', '1234567890', '2021-12-18 04:47:40', '2021-12-18 04:47:40'),
(7, 'Mukesh', 'mukesh@gmail.com', '1234567890', '2021-12-19 01:29:11', '2021-12-19 01:29:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD KEY `followers_user_id_foreign` (`user_id`),
  ADD KEY `followers_follower_id_foreign` (`follower_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

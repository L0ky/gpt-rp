-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jun 09, 2023 at 07:40 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.17

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
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversation_id` bigint UNSIGNED DEFAULT NULL,
  `univers_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `name`, `description`, `created_at`, `updated_at`, `conversation_id`, `univers_id`) VALUES
(4, 'Gandalf', 'Gandalf est un puissant et sage magicien, originaire des Royaumes du Milieu de l\'univers culte du Seigneur des Anneaux. Il est reconnu pour sa grande sagesse et ses pouvoirs magiques.', '2023-06-06 11:32:53', '2023-06-06 11:32:53', NULL, 1),
(5, 'Frodon', 'Frodon est un homme courageux et loyal issus de la Terre du Milieu. Ses aventures ont commencé lorsqu\'il a accepté une quête pour détruire l\'Anneau Unique, qui contenait une puissance maléfique.', '2023-06-06 11:33:35', '2023-06-06 11:33:35', NULL, 1),
(6, 'Saruman', 'Saruman était un grand et puissant sorcier qui était connu comme étant le principal allié des Seigneurs des Anneaux. Il résidait dans les Tours de Sorcellerie à Orthanc, où il a passé des années à apprendre et à étudier l\'utilisation de ses pouvoirs magiques.', '2023-06-07 08:23:19', '2023-06-07 08:23:19', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  `character_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `created_at`, `updated_at`, `user_id`, `character_id`) VALUES
(1, '2023-06-06 12:06:27', '2023-06-06 12:06:27', 1, 5),
(2, '2023-06-07 08:24:25', '2023-06-07 08:24:25', 1, 5),
(3, '2023-06-07 09:10:17', '2023-06-07 09:10:17', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `character_id` bigint UNSIGNED DEFAULT NULL,
  `conversation_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `character_id`, `conversation_id`, `created_at`, `updated_at`, `content`) VALUES
(1, 1, NULL, 1, '2023-06-06 13:17:14', '2023-06-06 13:17:14', 'Bonjour Frodon, quand retourne-tu au mordor ?'),
(2, NULL, 5, 1, '2023-06-06 13:17:14', '2023-06-06 13:17:14', ' Bonjour ! Je n\'ai pas encore décidé de mon retour au Mordor, mais je sais que ce sera bientôt. Je suis prêt à affronter tous les dangers et je ferai tout mon possible pour accomplir ma quête.'),
(3, 1, NULL, 1, '2023-06-06 13:46:42', '2023-06-06 13:46:42', 'Tu ira avec qui ?'),
(4, NULL, 5, 1, '2023-06-06 13:46:42', '2023-06-06 13:46:42', ' Je partirai avec un groupe d\'amis et de compagnons qui s\'appellent \"Les Neuf Compagnons\". Ils ont tous des noms distincts, tels que Sam Gamgee, Merry, Pippin et Aragorn. Nous devons travailler ensemble pour surmonter les dangers et les obstacles qui nous attendent.'),
(5, 1, NULL, 1, '2023-06-06 13:47:13', '2023-06-06 13:47:13', 'Tu y vas avec eux pour faire quoi déjà ?'),
(6, NULL, 5, 1, '2023-06-06 13:47:13', '2023-06-06 13:47:13', ' Je vais avec eux pour détruire l\'anneau unique et sa puissance maléfique avant qu\'elle ne menace la Terre du Milieu.'),
(7, 1, NULL, 1, '2023-06-06 15:03:35', '2023-06-06 15:03:35', 'Qui est ton meilleur ami ?'),
(9, 1, NULL, 1, '2023-06-08 19:28:04', '2023-06-08 19:28:04', 'z'),
(10, NULL, 5, 1, '2023-06-08 19:28:04', '2023-06-08 19:28:04', ' Je suis désolé, je ne connais pas ce que vous voulez dire.');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_24_090958_create_characters_table', 1),
(6, '2023_02_24_091139_create_universes_table', 1),
(7, '2023_02_24_091546_create_conversations_table', 1),
(8, '2023_02_24_091627_create_messages_table', 1),
(9, '2023_02_24_092340_add_characters_foreign_id', 1),
(10, '2023_02_24_093120_add_column_content_message_table', 1),
(11, '2023_02_24_160743_add_users_foreign_id', 1),
(12, '2023_06_05_135022_add_column_characterid_and_userid', 1),
(13, '2023_06_06_073223_add_column_description_for_characters_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(38, 'App\\Models\\User', 2, 'apiToken', '70b1c7e547f9125845443ea52279a91e74a30f9a49e170cbb18c265ef563925c', '[\"*\"]', '2023-06-08 12:29:42', '2023-06-08 12:52:17', '2023-06-08 11:52:17', '2023-06-08 12:29:42'),
(40, 'App\\Models\\User', 3, 'apiToken', '387258fb067b6dedba7ac1e8e2ce3d45b8fc5a7e66672536696bff8aff619b5d', '[\"*\"]', '2023-06-08 14:41:57', '2023-06-08 15:41:48', '2023-06-08 14:41:48', '2023-06-08 14:41:57'),
(42, 'App\\Models\\User', 3, 'apiToken', '70779da13a5615bf82ae4acea7c4135e8fb441f6e410631a2a3c6c40f62afc7d', '[\"*\"]', '2023-06-08 14:45:55', '2023-06-08 15:45:37', '2023-06-08 14:45:37', '2023-06-08 14:45:55'),
(43, 'App\\Models\\User', 3, 'apiToken', '83081d3b46bbc048a92c0aea2f7a9eb4cc1e5e2d440fd5b478c6c1c0cf7a7c1c', '[\"*\"]', '2023-06-08 14:50:55', '2023-06-08 15:47:29', '2023-06-08 14:47:29', '2023-06-08 14:50:55'),
(44, 'App\\Models\\User', 6, 'apiToken', '5266e48ae198266ac83160609edef82cc6427a4e8bb78ea7e82d0b0cfebdc87a', '[\"*\"]', '2023-06-08 14:52:16', '2023-06-08 15:52:13', '2023-06-08 14:52:13', '2023-06-08 14:52:16'),
(45, 'App\\Models\\User', 7, 'apiToken', '56d072a0b12ad064f12a3924de1fd8490ff9f6bb40ed8f2dd624a8f8611e9c13', '[\"*\"]', '2023-06-08 14:56:09', '2023-06-08 15:52:59', '2023-06-08 14:52:59', '2023-06-08 14:56:09'),
(47, 'App\\Models\\User', 8, 'apiToken', 'd86582a9dadddd21d631e4a3791779724fa4d429380cefda6eed19e93c4f6dd4', '[\"*\"]', '2023-06-08 14:57:48', '2023-06-08 15:57:25', '2023-06-08 14:57:25', '2023-06-08 14:57:48'),
(49, 'App\\Models\\User', 9, 'apiToken', '5472d0a0da193523fcd37f9040e055ab56284e1a42afd3f99a1ec322706df42c', '[\"*\"]', '2023-06-08 15:04:32', '2023-06-08 16:03:31', '2023-06-08 15:03:31', '2023-06-08 15:04:32'),
(52, 'App\\Models\\User', 11, 'apiToken', '98c4ff5216813635e99a43b6c475d3e72fddbcc3bb721ccd9462919898bff6cf', '[\"*\"]', '2023-06-08 19:23:31', '2023-06-08 20:23:22', '2023-06-08 19:23:22', '2023-06-08 19:23:31'),
(53, 'App\\Models\\User', 10, 'apiToken', '83e4e090b6db8fb9803abdc061fb09d941c44806a6c4fbb02888a088d151dcfb', '[\"*\"]', '2023-06-08 19:27:54', '2023-06-08 20:24:06', '2023-06-08 19:24:06', '2023-06-08 19:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `universes`
--

CREATE TABLE `universes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universes`
--

INSERT INTO `universes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'seigneur des anneaux', '2023-06-06 10:05:14', '2023-06-07 09:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversation_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `conversation_id`) VALUES
(1, 'admin', '$2y$10$KKIN1yrJfX/2g0WmEVmAH.nD0uUVXDIZ5FDmILc2VwdoHTpoVQiyO', 'admin@admin.com', 'John', 'Doe', NULL, NULL, '2023-06-06 10:05:05', '2023-06-06 10:05:05', NULL),
(10, 'testEdit2', '$2y$10$RnZoD11NXNsPj6xw4DirsuEXoeRYqBOPAbYwRU66ClbYrWJJlbweW', 'test@test.com', 'John', 'Doe', NULL, NULL, '2023-06-08 15:07:41', '2023-06-08 19:24:13', NULL),
(11, 'john', '$2y$10$foqIgF7pG5GUACYKGWg8OOQeIs73dtwQQRFqCbQGe49tsSlVDaLuG', 'john@doe.com', 'John', 'Doe', NULL, NULL, '2023-06-08 19:23:03', '2023-06-08 19:23:03', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `characters_conversation_id_foreign` (`conversation_id`),
  ADD KEY `characters_univers_id_foreign` (`univers_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_character_id_foreign` (`character_id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `universes`
--
ALTER TABLE `universes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_conversation_id_foreign` (`conversation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `universes`
--
ALTER TABLE `universes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`),
  ADD CONSTRAINT `characters_univers_id_foreign` FOREIGN KEY (`univers_id`) REFERENCES `universes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_character_id_foreign` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`),
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Feb 2021 pada 15.49
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_forum`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `content`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'composer create-project --prefer-dist laravel/laravel projectName \"5.8.*\"', 1, 'App\\forum', '2021-02-01 05:53:52', '2021-02-01 05:53:52'),
(2, 2, 'kalau mau install versi2 sebelum current version tinggal diganti aja kan itu angkanya sesuai yg diinginkan?', 1, 'App\\Comment', '2021-02-01 05:54:30', '2021-02-01 05:54:30'),
(3, 1, 'bujur bonorrrrr', 1, 'App\\Comment', '2021-02-01 05:54:53', '2021-02-01 05:54:53'),
(4, 2, 'sip dah, terima kasih broooo', 1, 'App\\Comment', '2021-02-01 05:55:13', '2021-02-01 05:55:13'),
(5, 1, 'sama-sama nang!', 1, 'App\\Comment', '2021-02-01 05:55:29', '2021-02-01 05:55:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `forums`
--

CREATE TABLE `forums` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forums`
--

INSERT INTO `forums` (`id`, `user_id`, `title`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 'How to install Laravel 5.8.', 'how-to-install-laravel-58', '<pre>\r\n<code>$ composer create-project --prefer-dist laravel/laravel=\"5.8.*\" larastart</code></pre>\r\n\r\n<p>it&#39;s not working and I tried some other ways too but not worked for me</p>', NULL, '2021-02-01 05:53:28', '2021-02-02 15:58:06'),
(3, 2, 'Questions tagged [perl]', 'questions-tagged-perl', '<p>Perl is a procedural, high-level, general-purpose, dynamic programming language, known for its native support of regular expressions and string parsing capabilities. Please use this tag for questions about Perl in general. For things related to the new (but related) language Raku (formerly &quot;Perl 6&quot;), please use the raku tag. For Perl-style regular expressions in other languages, use the regex tag, or, if they are based on the PCRE library, the pcre tag.</p>', NULL, '2021-02-03 19:39:01', '2021-02-03 19:39:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum_tag`
--

CREATE TABLE `forum_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `forum_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forum_tag`
--

INSERT INTO `forum_tag` (`id`, `forum_id`, `tag_id`) VALUES
(1, 1, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_01_26_123658_create_forums_table', 2),
(4, '2021_01_27_131953_create_tags_table', 3),
(5, '2021_01_27_132058_create_forum_tag_table', 3),
(6, '2021_02_01_023959_create_comments_table', 4),
(7, '2021_02_02_000202_create_views_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', NULL, NULL),
(2, 'JavaScript', 'javascript', NULL, NULL),
(3, 'Perl', 'perl', '2021-02-02 16:23:45', '2021-02-04 23:22:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Arya Rizky Sandi', 'aryarzsandi@gmail.com', '$2y$10$/y6xWB3P6exBs9guEG9UceotTKoVeTtOsqw9fKOvZAXt5.mN6gWhe', 'wZ65YU5mQpSFJF8nAztHCVeZ8N0xjHC6756UGIljT6RIVIIse7SCCljKsyUh', '2021-01-25 22:29:48', '2021-01-25 22:29:48'),
(2, 'Kristianto Wibowo', 'krisspensev@gmail.com', '$2y$10$XZP8pobZcDgaJ2zJ/0iy3.bXGbhxSkcbkw2ZJx4ClEm.kDq.SqhJu', 'hH4m3dATkd9Z3CJJoie7NDIl4PpzUBpXmvn207Ve1qr2TvCgJrUVovSe1L4T', '2021-02-01 00:37:42', '2021-02-01 00:37:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `views`
--

CREATE TABLE `views` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitable_id` bigint(20) UNSIGNED NOT NULL,
  `visitable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `forum_tag`
--
ALTER TABLE `forum_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `forum_tag`
--
ALTER TABLE `forum_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `views`
--
ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

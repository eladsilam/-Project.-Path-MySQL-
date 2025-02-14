-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 03:20 PM
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
-- Database: `final_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `author_id`, `created_at`) VALUES
(1, 'Will patch work?', 'We are trying to patch', 1, '2025-02-14 11:34:56'),
(2, 'Healthy Eating Habits', 'Eating healthy is crucial for longevity...', 2, '2025-02-14 11:34:56'),
(3, 'Travel Guide to Japan', 'Japan offers a mix of tradition and modernity...', 3, '2025-02-14 11:34:56'),
(4, 'Understanding Blockchain', 'Blockchain technology is revolutionizing finance...', 4, '2025-02-14 11:34:56'),
(5, 'The Benefits of Meditation', 'Meditation improves mental and physical health...', 5, '2025-02-14 11:34:56'),
(6, 'Top 10 Programming Languages', 'Which programming languages are most in demand?', 1, '2025-02-14 11:34:56'),
(7, 'Space Exploration in 2025', 'NASA and SpaceX are planning new missions...', 2, '2025-02-14 11:34:56'),
(8, 'How to Start a Business', 'Entrepreneurship requires dedication and strategy...', 3, '2025-02-14 11:34:56'),
(9, 'Elad&&Shai Last Shot', 'We are trying to post new article', 4, '2025-02-14 11:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `password_hash` text NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'user1', 'user1@example.com', '$2a$10$qbYurh0UPy6wAlrU80mHA.mUR5aIKbf73yZnbYMpbHbLBTHZqD5gS', 'admin', '2025-02-14 11:34:56'),
(2, 'user2', 'user2@example.com', '$2a$10$zHE46d9NrzijDouzow/cXeXprUXpljSPuEh/FT4.LFf9WIAe9DMSu', 'user', '2025-02-14 11:34:56'),
(3, 'user3', 'user3@example.com', '$2a$10$1kkrhD4LhHeRSNdlVUSJg.nOfhGlEdPxwAsRu2zAahxYFIjWerqSG', 'user', '2025-02-14 11:34:56'),
(4, 'user4', 'user4@example.com', '$2a$10$Fj4DPHUBptP7UKkn6lV8rWTeG27cpQFx2UtgoRc.t6QLD4F45BQCa', 'user', '2025-02-14 11:34:56'),
(5, 'user5', 'user5@example.com', '$2a$10$u0F67v1AC8OFYgkxXRGwWkL7mXnb7h5DN1.mj9L.VLv.TbZkzJHga', 'user', '2025-02-14 11:34:56'),
(6, 'shaisalem15', 'eladsila8@gmail.com', '$2b$10$tmi1a59lR1uwaQD21f3s0.b7jCJfgIg9dXAhvh4zDtC2llbgU2jvm', 'admin', '2025-02-14 13:24:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_author` (`author_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING HASH,
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

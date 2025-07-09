-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2025 at 03:57 PM
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
-- Database: `orient_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2b$10$PrKLmOXoTcv9XVyZYz5QnO2MRgJYamAuTixVCnhftIF.o/IT2IfDy');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Main','Collection') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`) VALUES
(1, 'Wallpaper', 'Main'),
(2, 'Office', 'Collection'),
(3, 'Residential', 'Collection'),
(4, 'Kids', 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `message`, `created_at`) VALUES
(1, 'khubaib', 'khubaibintariq123@gmail.com', '+92 0000000003000000', 'no', '2025-07-05 05:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `wallpapers`
--

CREATE TABLE `wallpapers` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL,
  `image4` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallpapers`
--

INSERT INTO `wallpapers` (`id`, `title`, `image`, `price`, `created_at`, `category_id`, `image2`, `image3`, `image4`) VALUES
(6, 'Wallpaper', '1751651805628-k4.png', '125.00 Dhs/sqm', '2025-07-04 17:56:45', 1, '', '', ''),
(7, 'Wallpaper', '1751651847060-k4.png', '125.00 Dhs/sqm', '2025-07-04 17:57:27', 1, '', '', ''),
(8, 'Wallpaper', '1751651905385-k4.png', '125.00 Dhs/sqm', '2025-07-04 17:58:25', 1, '', '', ''),
(10, 'Wallpaper', '1751652004225-k4.png', '125.00 Dhs/sqm', '2025-07-04 18:00:04', 2, '', '', ''),
(12, 'Wallpaper', '1751652038864-k4.png', '125.00 Dhs/sqm', '2025-07-04 18:00:38', 2, '', '', ''),
(13, 'Wallpaper', '1751652568330-img6.jpg', '145.00 Dhs/sqm', '2025-07-04 18:09:28', 2, '', '', ''),
(14, 'Wallpaper', '1751692429658-k4.png', '150Dhs', '2025-07-04 18:52:54', 3, '', '', ''),
(15, 'Wallpaper', '1751719158646-A-C Installation & Maintenance.jpg', '180Dhs', '2025-07-04 19:03:22', 4, '1751719158745-A-C Cleaning.jpg', '1751719158822-400-Gsm-Matt-Laminated.jpg', '1751719158832-350-Gsm-Matt-Laminated.jpg'),
(16, 'hello', '1751711511579-A-C Installation & Maintenance.jpg', '120Dhs', '2025-07-05 10:31:51', 1, '', '', ''),
(18, 'hello', '1751719088032-A-C Cleaning.jpg', '120Dhs', '2025-07-05 12:15:37', 2, '1751717737644-A4-Size-Flyer.jpg', '1751717737713-350-Gsm-Matt-Laminated.jpg', '1751717737732-400-Gsm-Matt-Laminated.jpg'),
(19, 'Wallpaper', '1751723559142-download.webp', '120Dhs', '2025-07-05 13:52:39', 1, '1751723559145-download (13).png', '1751723559148-A-C Cleaning.jpg', '1751723559228-A-C Installation & Maintenance.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wallpaper_categories`
--

CREATE TABLE `wallpaper_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallpapers`
--
ALTER TABLE `wallpapers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallpapers_ibfk_1` (`category_id`);

--
-- Indexes for table `wallpaper_categories`
--
ALTER TABLE `wallpaper_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallpapers`
--
ALTER TABLE `wallpapers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wallpaper_categories`
--
ALTER TABLE `wallpaper_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wallpapers`
--
ALTER TABLE `wallpapers`
  ADD CONSTRAINT `wallpapers_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

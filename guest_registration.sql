-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 06, 2025 at 05:36 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `guest_registration`
--

DROP TABLE IF EXISTS `guest_registration`;
CREATE TABLE IF NOT EXISTS `guest_registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(50) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `countryCodePhone` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `emergencyName` varchar(100) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `countryCodeEmergency` varchar(10) NOT NULL,
  `emergencyContact` varchar(15) NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `roomType` varchar(50) NOT NULL,
  `guests` int NOT NULL,
  `temperature` int DEFAULT '24',
  `countryCodeBilling` varchar(10) NOT NULL,
  `billingContact` varchar(15) NOT NULL,
  `aadhaarPath` varchar(255) NOT NULL,
  `photoPath` varchar(255) NOT NULL,
  `termsAccepted` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guest_registration`
--

INSERT INTO `guest_registration` (`id`, `language`, `firstName`, `lastName`, `email`, `nationality`, `countryCodePhone`, `phone`, `emergencyName`, `relationship`, `countryCodeEmergency`, `emergencyContact`, `checkIn`, `checkOut`, `roomType`, `guests`, `temperature`, `countryCodeBilling`, `billingContact`, `aadhaarPath`, `photoPath`, `termsAccepted`, `created_at`) VALUES
(1, 'hindi', 'srushti', 'sindhur', 'srushti@gmail.com', 'usa', '+91', '1234567890', '344444444434', 'wife', '+91', '5455222222', '2025-11-06', '2025-11-28', '0', 2, 24, '+91', '1234567890', 'uploads/1762450114_aadhaar_WhatsApp Image 2025-11-06 at 10.04.15 PM.jpeg', 'uploads/1762450114_photo_OIP.webp', 1, '2025-11-06 17:28:34'),
(2, 'english', 'srushti', 'sindhur', 'srushti@gmail.com', 'india', '+91', '1234567890', '344444444434', 'wife', '+91', '5455222222', '2025-11-06', '2025-11-28', '0', 1, 21, '+91', '1234567890', 'uploads/1762450365_aadhaar_WhatsApp Image 2025-11-06 at 10.04.15 PM.jpeg', 'uploads/1762450365_photo_Module-2 QB 2025-26.pdf', 1, '2025-11-06 17:32:45');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

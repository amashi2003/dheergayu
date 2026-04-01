-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2026 at 12:53 PM
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
-- Database: `dheergayu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_no` varchar(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `appointment_datetime` datetime NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `reason` varchar(255) DEFAULT NULL,
  `actions` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_no`, `patient_name`, `appointment_datetime`, `status`, `reason`, `actions`) VALUES
(1, 'P001', 'Nimal Perera', '2025-10-20 09:30:00', 'Cancelled', 'yes', 'Edit/Delete'),
(3, 'P024', 'Ruwani Jayasuriya', '2025-10-22 08:45:00', 'Cancelled', 'Not available', 'View'),
(4, 'P105', 'Tharindu de Alwis', '2025-10-22 15:30:00', 'Cancelled', 'I want', 'Edit/Delete'),
(5, 'P030', 'Anusha Perera', '2025-11-02 10:00:00', 'Cancelled', 'not available', NULL),
(8, 'P110', 'Ravi Kumar', '2025-11-01 11:00:00', 'Cancelled', 'dsada', NULL),
(9, 'P112', 'Kasun Liyanage', '2025-10-27 11:00:00', 'Completed', 'Follow-up for back pain', 'View/Edit'),
(10, 'P070', 'Nimal Malwaththe', '2025-11-03 10:30:00', 'Completed', 'New Registration', NULL),
(11, 'P090', 'Anushan Herath', '2025-11-02 10:00:00', 'Completed', '', NULL),
(12, 'P099', 'Nayana Kumari', '2025-11-03 10:20:00', 'Cancelled', 'not aavailable', NULL),
(13, 'P111', 'Sewmi Nadeesha', '2025-11-02 11:40:00', 'Completed', '', NULL),
(14, 'P100', 'Saneetha Silva', '2025-11-04 11:00:00', 'Completed', '', NULL),
(18, 'P116', 'Tharushi Dilhani', '2025-11-08 09:45:00', 'Pending', 'Consultation for hair loss', 'View/Edit'),
(34, 'P116', 'Tharushi Dilhani', '2025-11-08 09:45:00', 'Pending', 'Consultation for hair loss', NULL),
(35, 'P120', 'Ishara Fernando', '2025-11-09 10:30:00', 'Pending', 'Back pain checkup', NULL),
(36, 'P121', 'Chathura Silva', '2025-11-10 09:00:00', 'Pending', 'Routine follow-up', NULL),
(37, 'P122', 'Roshani Perera', '2025-11-12 11:15:00', 'Pending', 'Skin treatment consultation', NULL),
(38, 'P123', 'Amal Gunasekara', '2025-11-13 14:00:00', 'Pending', 'New consultation', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `batch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `mfd` date NOT NULL,
  `exp` date NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `status` enum('Good','Expiring Soon','Expired') DEFAULT 'Good',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`batch_id`, `product_id`, `batch_number`, `quantity`, `mfd`, `exp`, `supplier`, `status`, `created_at`, `updated_at`) VALUES
(13, 1, 'PSP001', 13, '2024-03-10', '2026-03-10', 'Herbal Supplies Co.', 'Good', '2025-10-16 06:49:20', '2025-10-19 06:13:11'),
(14, 2, 'ASM001', 14, '2024-01-01', '2026-01-01', 'Ayurvedic Traders', 'Good', '2025-10-16 06:49:20', '2025-10-17 09:55:40'),
(16, 4, 'DMR001', 21, '2024-02-10', '2026-02-10', 'Herbal Supplies Co.', 'Good', '2025-10-16 06:49:20', '2025-10-19 06:13:27'),
(17, 5, 'KHC001', 6, '2024-01-20', '2026-01-20', 'Ayurvedic Traders', 'Good', '2025-10-16 06:49:20', '2025-10-16 06:49:20'),
(18, 6, 'NEO001', 23, '2024-02-20', '2026-02-20', 'Natural Extracts Ltd.', 'Good', '2025-10-16 06:49:20', '2025-10-17 09:58:02'),
(20, 8, 'NRO001', 22, '2024-03-05', '2026-03-05', 'Ayurvedic Traders', 'Good', '2025-10-16 06:49:20', '2025-10-16 06:49:20'),
(37, 7, 'PTL001', 12, '2025-10-19', '2025-11-05', 'Ayurvedic Traders', 'Expiring Soon', '2025-10-19 06:03:01', '2025-10-19 06:03:01'),
(42, 3, 'SDP001', 12, '2025-10-22', '2027-10-18', 'Ayurvedic Traders', 'Good', '2025-10-22 05:58:01', '2025-10-22 05:58:01'),
(48, 2, 'ASM004', 10, '2025-10-15', '2025-10-30', 'Ayurvedic Traders', 'Expiring Soon', '2025-10-23 09:59:35', '2025-10-23 09:59:49'),
(49, 2, 'ASM005', 10, '2025-10-22', '2025-10-29', 'Herbal Supplies Co.', 'Expiring Soon', '2025-10-23 16:30:49', '2025-10-23 16:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID from users table (NULL for guests)',
  `session_id` varchar(100) DEFAULT NULL COMMENT 'Session ID for guest users',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'amt66ordiusrg1ene15dq0843c', '2026-03-30 17:43:45', '2026-03-30 17:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_type` enum('patient','admin') NOT NULL DEFAULT 'admin',
  `product_name` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `product_type`, `product_name`, `price`, `quantity`, `image`, `added_at`) VALUES
(1, 1, 53, 'patient', 'Asamodagam Spirit', 650.00, 1, '/dheergayu/public/assets/images/Admin/asamodagam.jpg', '2026-03-30 17:43:45'),
(2, 1, 50, 'patient', 'Paspanguwa Pack', 850.00, 1, '/dheergayu/public/assets/images/Admin/paspanguwa.jpeg', '2026-03-30 17:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `consultationforms`
--

CREATE TABLE `consultationforms` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `personal_products` text DEFAULT NULL,
  `recommended_treatment` text DEFAULT NULL,
  `question_1` text DEFAULT NULL,
  `question_2` text DEFAULT NULL,
  `question_3` text DEFAULT NULL,
  `question_4` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `patient_no` varchar(20) NOT NULL,
  `last_visit_date` date DEFAULT NULL,
  `total_visits` int(11) DEFAULT 0,
  `contact_info` varchar(20) DEFAULT NULL,
  `check_patient_vitals` tinyint(1) DEFAULT 0,
  `review_previous_medications` tinyint(1) DEFAULT 0,
  `update_patient_history` tinyint(1) DEFAULT 0,
  `follow_up_appointment` tinyint(1) DEFAULT 0,
  `send_to_pharmacy` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `appointment_id` int(11) DEFAULT NULL,
  `treatment_booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultationforms`
--

INSERT INTO `consultationforms` (`id`, `first_name`, `last_name`, `age`, `diagnosis`, `gender`, `personal_products`, `recommended_treatment`, `question_1`, `question_2`, `question_3`, `question_4`, `notes`, `patient_no`, `last_visit_date`, `total_visits`, `contact_info`, `check_patient_vitals`, `review_previous_medications`, `update_patient_history`, `follow_up_appointment`, `send_to_pharmacy`, `created_at`, `updated_at`, `appointment_id`, `treatment_booking_id`) VALUES
(9, 'Kasun', 'Liyanage', 34, 'Chronic lower back pain', 'Male', '[{\"product\":\"Pinda Thailaya\",\"qty\":2}]', 'Daily massage and yoga stretches', '', '', '', '', 'Avoid heavy lifting', '1012', '2025-09-25', 2, '0776543210', 1, 1, 1, 1, 1, '2025-10-17 04:21:07', '2025-10-17 04:21:07', 9, NULL),
(21, 'Anushan', 'Herath', 42, 'Headache', 'Male', '[{\"product\":\"Siddhalepa Balm\",\"qty\":1},{\"product\":\"Pinda Thailaya\",\"qty\":1}]', 'Massage', '', '', '', '', '', '', '0000-00-00', 0, '0', 0, 0, 0, 0, 0, '2025-10-19 13:14:37', '2025-10-22 07:12:43', 11, NULL),
(22, 'Saneetha', 'Silva', 21, 'asdasd', 'Male', '[{\"product\":\"Dashamoolarishta\",\"qty\":1}]', 'gdfs', '', '', '', '', '', '', '0000-00-00', 0, '0', 0, 0, 0, 0, 0, '2025-10-22 05:24:31', '2025-10-22 07:21:03', 14, NULL),
(24, 'Nimal', 'Malwaththe', 35, 'fever', 'Male', '[{\"product\":\"Kothalahimbutu Capsules\",\"qty\":2},{\"product\":\"Asamodagam Spirit\",\"qty\":2}]', 'Panchakarma', '', '', '', '', '', '', '0000-00-00', 0, '0', 0, 0, 0, 0, 0, '2025-10-23 08:57:17', '2025-10-23 11:24:20', 10, NULL),
(25, 'Sewmi', 'Nadeesha', 23, 'fever', 'Female', '[{\"product\":\"Neem Oil\",\"qty\":2},{\"product\":\"Kothalahimbutu Capsules\",\"qty\":2}]', 'Shirodhara', '', '', '', '', 'gyjygy', '', '0000-00-00', 0, '0', 0, 0, 0, 0, 0, '2025-10-23 09:57:33', '2025-10-23 11:09:22', 13, NULL),
(38, 'Sarah', 'Perera', 23, 'ytyfyt ftyifytfi ftiytf', '', '[{\"product\":\"Asamodagam Spirit\",\"qty\":1}]', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 0, NULL, 0, 0, 0, 0, 0, '2026-01-19 06:10:41', '2026-01-19 06:10:41', 29, NULL),
(39, 'Sarah', 'Perera', 23, 'nj;in', '', '[{\"product\":\"Asamodagam Spirit\",\"qty\":1}]', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 0, NULL, 0, 0, 0, 0, 0, '2026-01-19 07:32:56', '2026-01-19 07:32:56', 30, NULL),
(40, 'Amashi', 'Perera', 22, 'qwer qwer qwer', '', '[{\"product\":\"Asamodagam Spirit\",\"qty\":3}]', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 0, NULL, 0, 0, 0, 0, 0, '2026-01-20 05:48:10', '2026-01-20 05:48:10', 31, NULL),
(41, 'Amashi', 'Perera', 23, 'qqqq', '', '[{\"product\":\"Asamodagam Spirit\",\"qty\":1}]', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 0, NULL, 0, 0, 0, 0, 0, '2026-01-20 08:15:18', '2026-01-20 08:15:18', 33, NULL),
(42, 'Sarah', 'Perera', 23, 'dwdwfw', '', '[{\"product\":\"Asamodagam Spirit\",\"qty\":1}]', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 0, NULL, 0, 0, 0, 0, 0, '2026-01-20 11:13:02', '2026-01-20 11:13:02', 34, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `patient_no` varchar(20) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `treatment_type` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `duration` int(11) DEFAULT 60,
  `patient_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `treatment_fee` decimal(10,2) DEFAULT 2000.00,
  `status` varchar(20) DEFAULT 'Pending',
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'Pending',
  `transaction_id` varchar(100) DEFAULT NULL,
  `session_number` int(11) DEFAULT 1,
  `total_sessions` int(11) DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`id`, `doctor_id`, `doctor_name`, `patient_no`, `patient_id`, `treatment_type`, `appointment_date`, `appointment_time`, `duration`, `patient_name`, `email`, `phone`, `age`, `gender`, `treatment_fee`, `status`, `payment_method`, `payment_status`, `transaction_id`, `session_number`, `total_sessions`, `notes`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, 'P0002', 3, 'General Consultation', '2025-10-23', '08:00:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '1234567898', 21, '0', 2000.00, 'Cancelled', 'onsite', 'Pending', NULL, 1, 1, NULL, '2025-10-22 00:23:21', '2026-01-14 05:18:54'),
(5, NULL, NULL, 'P0005', 5, 'General Consultation', '2025-10-24', '08:00:00', 60, 'Damsi Jayawarna', 'patient3@gmail.com', '0712345678', 21, '0', 2000.00, 'Cancelled', 'onsite', 'Pending', NULL, 1, 1, NULL, '2025-10-22 01:36:38', '2026-01-14 05:18:54'),
(7, NULL, NULL, 'P0007', 6, 'General Consultation', '2025-10-24', '16:00:00', 60, 'Deshani Anjula', 'patient4@gmail.com', '0772345678', 21, '0', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2025-10-22 01:46:04', '2026-01-14 05:18:54'),
(13, NULL, NULL, 'P0013', 3, 'General Consultation', '2026-01-06', '10:00:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '0712345677', 20, '0', 2000.00, 'Cancelled', 'onsite', 'Pending', NULL, 1, 1, NULL, '2025-11-27 12:02:25', '2026-01-14 05:18:54'),
(14, NULL, NULL, 'P0014', 3, 'General Consultation', '2026-01-10', '16:00:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '0712203807', 21, '0', 2000.00, 'Cancelled', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-10 09:05:42', '2026-01-20 05:44:03'),
(15, NULL, NULL, 'P0015', 3, 'General Consultation', '2026-01-13', '08:00:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '1234567898', 21, '0', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-12 03:44:25', '2026-01-14 05:18:54'),
(16, NULL, NULL, NULL, 3, 'General Consultation', '2026-01-15', '09:30:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '1234567898', 21, '0', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-14 06:07:55', '2026-01-14 06:07:55'),
(17, NULL, NULL, NULL, 3, 'General Consultation', '2026-01-15', '12:00:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '1234567898', 21, '0', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-14 06:17:45', '2026-01-14 06:17:45'),
(18, NULL, NULL, NULL, 3, 'General Consultation', '2026-01-15', '09:00:00', 60, 'Amashi Vithanage', 'patient1@gmail.com', '1234567898', 21, '0', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-14 06:27:08', '2026-01-14 06:27:08'),
(19, 13, 'Dr. Silva', 'P0016', 3, 'General Consultation', '2026-01-19', '09:00:00', 60, '0', 'patient1@gmail.com', '1234567892', 21, 'Female', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-16 11:28:11', '2026-01-17 10:42:31'),
(21, 15, 'Dr. Perera', 'P0017', 6, 'General Consultation', '2026-01-20', '11:00:00', 60, '0', 'patient4@gmail.com', '1234567891', 21, 'Female', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-16 12:09:10', '2026-01-17 10:42:31'),
(22, 13, 'Dr. Silva', 'P0018', 3, 'General Consultation', '2026-01-21', '09:00:00', 60, '0', 'patient1@gmail.com', '1234567898', 21, 'Female', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-16 17:11:57', '2026-01-17 10:42:31'),
(27, 13, 'Dr. Silva', 'P0019', 3, 'General Consultation', '2026-01-19', '09:30:00', 60, '0', 'patient1@gmail.com', '123456789', 21, 'Female', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-17 06:06:00', '2026-01-17 10:42:31'),
(28, 13, 'Dr. Silva', 'P0020', 3, 'General Consultation', '2026-01-19', '11:30:00', 60, '0', 'patient1@gmail.com', '1234567897', 21, 'Female', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-17 06:07:12', '2026-01-17 10:42:31'),
(29, 13, 'Dr. Silva', 'P0021', 3, 'General Consultation', '2026-01-19', '12:00:00', 60, '0', 'patient1@gmail.com', '1234567898', 23, 'Female', 2000.00, 'Completed', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-17 10:52:04', '2026-01-19 06:10:41'),
(30, 13, 'Dr. Silva', 'P0022', 3, 'General Consultation', '2026-01-21', '09:30:00', 60, '0', 'patient1@gmail.com', '1234567898', 23, 'Female', 2000.00, 'Completed', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-19 07:31:55', '2026-01-19 07:32:56'),
(31, 13, 'Dr. Silva', 'P0023', 3, 'General Consultation', '2026-01-21', '10:00:00', 60, '0', 'patient1@gmail.com', '1234567898', 22, 'Female', 2000.00, 'Completed', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-20 05:44:43', '2026-01-20 05:48:10'),
(32, 13, 'Dr. Silva', 'P0024', 3, 'General Consultation', '2026-01-23', '09:00:00', 60, '0', 'patient1@gmail.com', '1234567898', 23, 'Female', 2000.00, 'Pending', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-20 08:10:54', '2026-01-20 08:10:54'),
(33, 13, 'Dr. Silva', 'P0025', 3, 'General Consultation', '2026-01-21', '10:30:00', 60, '0', 'patient1@gmail.com', '1234567898', 23, 'Female', 2000.00, 'Completed', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-20 08:13:56', '2026-01-20 08:15:18'),
(34, 13, 'Dr. Silva', 'P0026', 3, 'General Consultation', '2026-01-23', '09:30:00', 60, '0', 'patient1@gmail.com', '1234456789', 23, 'Female', 2000.00, 'Completed', 'onsite', 'Pending', NULL, 1, 1, NULL, '2026-01-20 11:07:34', '2026-01-20 11:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `status` enum('new','read','replied','archived') DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_suppliers`
--

CREATE TABLE `delete_suppliers` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delete_suppliers`
--

INSERT INTO `delete_suppliers` (`id`, `supplier_name`, `contact_person`, `phone`, `email`, `deleted_at`) VALUES
(1, 'ABCc', 'abbc', '0741155161', 'zaharapreena1@gmail.com', '2025-10-23 16:44:20'),
(2, 'eqwe', 'Amashi Vithanage', '0742440377', 'amashiimayav@gmail.com', '2025-10-23 16:52:09'),
(3, 'sdsad', 'Amashi Vithanage', '0742440377', 'amashiimayav@gmail.com', '2025-10-23 16:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule`
--

CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedule`
--

INSERT INTO `doctor_schedule` (`id`, `doctor_id`, `doctor_name`, `day_of_week`, `start_time`, `end_time`, `is_active`, `created_at`) VALUES
(1, 13, 'Dr. Silva', 'Monday', '09:00:00', '13:00:00', 1, '2026-01-14 05:18:54'),
(2, 13, 'Dr. Silva', 'Wednesday', '09:00:00', '13:00:00', 1, '2026-01-14 05:18:54'),
(3, 13, 'Dr. Silva', 'Friday', '09:00:00', '13:00:00', 1, '2026-01-14 05:18:54'),
(4, 15, 'Dr. Perera', 'Tuesday', '09:00:00', '13:00:00', 1, '2026-01-14 05:18:54'),
(5, 15, 'Dr. Perera', 'Thursday', '09:00:00', '13:00:00', 1, '2026-01-14 05:18:54'),
(6, 15, 'Dr. Perera', 'Saturday', '09:00:00', '13:00:00', 1, '2026-01-14 05:18:54'),
(7, 14, 'Dr. Fernando', 'Monday', '15:00:00', '18:00:00', 1, '2026-01-14 05:18:54'),
(8, 14, 'Dr. Fernando', 'Tuesday', '15:00:00', '18:00:00', 1, '2026-01-14 05:18:54'),
(9, 14, 'Dr. Fernando', 'Thursday', '15:00:00', '18:00:00', 1, '2026-01-14 05:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `expired_batches`
--

CREATE TABLE `expired_batches` (
  `batch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `mfd` date NOT NULL,
  `exp` date NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `status` enum('Good','Expiring Soon','Expired') DEFAULT 'Good',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expired_batches`
--

INSERT INTO `expired_batches` (`batch_id`, `product_id`, `batch_number`, `quantity`, `mfd`, `exp`, `supplier`, `status`, `created_at`, `updated_at`) VALUES
(41, 2, 'ASM002', 10, '2025-10-22', '2025-10-23', 'Ayurvedic Traders', 'Expired', '2025-10-22 05:44:56', '2025-10-23 03:49:55'),
(43, 3, 'SDP002', 12, '2025-10-21', '2025-10-21', 'Ayurvedic Traders', 'Expired', '2025-10-22 00:43:32', '2025-10-22 00:43:32'),
(46, 2, 'ASM002', 12, '2025-10-07', '2025-10-23', 'Ayurvedic Traders', 'Expired', '2025-10-23 07:08:16', '2025-10-23 07:08:40'),
(47, 2, 'ASM003', 11, '2025-10-07', '2025-10-23', 'Ayurvedic Traders', 'Expired', '2025-10-23 08:59:20', '2025-10-23 09:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) DEFAULT 'LKR',
  `payment_method` varchar(50) DEFAULT 'payhere',
  `status` enum('pending','paid','failed','cancelled') DEFAULT 'pending',
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `delivery_city` varchar(100) DEFAULT NULL,
  `order_items` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `nic` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `first_name`, `last_name`, `dob`, `nic`, `email`, `password`, `created_at`) VALUES
(3, 'Amashi', 'Vithanage', '1999-01-12', '200371911688', 'patient1@gmail.com', '$2y$10$Y07M.6ETDBYe.mA2kR6fzeCiK./YNkoyE5Id/YFif5frwPAFi.sAa', '2025-10-12 10:48:51'),
(4, 'Amal', 'Perera', '1946-12-30', '200372911684', 'patient2@gmail.com', '$2y$10$r7RXC3ULfSJZP1X9a9UFLOQBGISmi24ipzTXkmQotu0mDRN.pbZ1O', '2025-10-13 06:41:06'),
(5, 'Damsi', 'Jayawarna', '2003-03-05', '200312345678', 'patient3@gmail.com', '$2y$10$VAn6flfsHx7J0D/tVak.4.YGy5t2DB34VcXVLIW9cxjLoJFNPMl.m', '2025-10-22 01:34:40'),
(6, 'Deshani', 'Anjula', '2003-07-24', '200398765432', 'patient4@gmail.com', '$2y$10$KeY7BlYzTD/rAZW5Y34Kee4RzCgBKQZ.3iMZfvwyNkhsH73pgZNKO', '2025-10-22 01:45:00'),
(14, 'Zahara', 'Preena', '2003-02-05', '200372321682', 'patient5@gmail.com', '$2y$10$ihr9J0xCuBlasuPsndTkSe0Nk4Y18Z4e.34wsZBoJqQdSyzRApab2', '2025-10-23 17:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `patient_deleted_accounts`
--

CREATE TABLE `patient_deleted_accounts` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `emergency_contact` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `current_medications` text DEFAULT NULL,
  `chronic_conditions` text DEFAULT NULL,
  `preferred_language` varchar(5) DEFAULT NULL,
  `preferred_time` varchar(20) DEFAULT NULL,
  `email_notifications` tinyint(1) DEFAULT 1,
  `sms_notifications` tinyint(1) DEFAULT 1,
  `marketing_communications` tinyint(1) DEFAULT 0,
  `allow_data_improvement` tinyint(1) DEFAULT 1,
  `share_research_data` tinyint(1) DEFAULT 0,
  `original_created_at` datetime DEFAULT NULL,
  `deactivated_at` datetime DEFAULT current_timestamp(),
  `deactivation_reason` text DEFAULT NULL,
  `deactivated_by_user` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `emergency_contact` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `current_medications` text DEFAULT NULL,
  `chronic_conditions` text DEFAULT NULL,
  `preferred_language` varchar(10) DEFAULT 'en',
  `preferred_time` varchar(20) DEFAULT 'morning',
  `email_notifications` tinyint(1) DEFAULT 1,
  `sms_notifications` tinyint(1) DEFAULT 1,
  `marketing_communications` tinyint(1) DEFAULT 0,
  `allow_data_improvement` tinyint(1) DEFAULT 1,
  `share_research_data` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account_status` enum('active','deactivated') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`id`, `patient_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `nic`, `email`, `phone`, `emergency_contact`, `address`, `blood_type`, `weight`, `allergies`, `current_medications`, `chronic_conditions`, `preferred_language`, `preferred_time`, `email_notifications`, `sms_notifications`, `marketing_communications`, `allow_data_improvement`, `share_research_data`, `created_at`, `updated_at`, `account_status`) VALUES
(3, 3, 'Amashi ', 'Vithanage', '2006-05-17', 'Female', '', 'patient1@gmail.com', '', '', '', NULL, NULL, NULL, NULL, NULL, 'en', 'morning', 1, 1, 0, 1, 0, '2025-10-23 08:18:35', '2026-01-09 02:36:34', 'active'),
(4, 5, 'Damsi Jayawarna', '', NULL, NULL, NULL, 'patient3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 'morning', 1, 1, 0, 1, 0, '2025-11-27 13:27:51', '2025-11-27 13:27:51', 'active'),
(7, 13, 'A Sliva', '', NULL, NULL, NULL, 'doctor1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 'morning', 1, 1, 0, 1, 0, '2026-01-15 12:17:40', '2026-01-15 12:17:40', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `patient_products`
--

CREATE TABLE `patient_products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_products`
--

INSERT INTO `patient_products` (`product_id`, `name`, `price`, `description`, `image`, `created_at`) VALUES
(50, 'Paspanguwa Pack (Patient)', 850.00, 'A traditional herbal remedy for digestive health and overall wellness.', 'images/paspanguwa.jpeg', '2026-03-30 17:34:42'),
(51, 'Samahan Herbal Drink', 1200.00, 'An Ayurvedic herbal drink used to support immunity...', 'images/Samahan.jpg', '2026-03-30 17:34:42'),
(52, 'Siddhalepa Herbal Balm', 450.00, 'A popular Ayurvedic balm used for headaches, muscl...', 'images/siddhalepa.png', '2026-03-30 17:34:42'),
(53, 'Asamodagam Spirit', 650.00, 'A traditional Ayurvedic herbal tonic used to suppo...', 'images/asamodagam.jpg', '2026-03-30 17:34:42'),
(54, 'Dashamoolarishta', 750.00, 'A traditional tonic to support digestion and enhance overall health.', 'images/Dashamoolarishta.jpeg', '2026-03-30 17:34:42'),
(55, 'Kothalahimbutu Capsules', 1200.00, 'Capsules made from Kothalahimbutu herb to enhance wellness.', 'images/Kothalahimbutu Capsules.jpeg', '2026-03-30 17:34:42'),
(56, 'Neem Oil', 380.00, 'Pure neem oil for skin care, hair care, and general health.', 'images/Neem Oil.jpg', '2026-03-30 17:34:42'),
(57, 'Pinda Thailaya', 550.00, 'Therapeutic oil for joint and muscle pain relief.', 'images/Pinda Thailaya.jpeg', '2026-03-30 17:34:42'),
(58, 'Nirgundi Oil', 480.00, 'Nirgundi oil for effective pain relief and inflammation.', 'images/Nirgundi Oil.jpg', '2026-03-30 17:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `description`, `image`, `product_type`, `created_at`) VALUES
(1, 'Paspanguwa Pack', 850.00, 'A traditional herbal remedy for digestive health and overall wellness.', 'images/paspanguwa.jpeg', 'admin', '2025-10-16 06:44:07'),
(2, 'Asamodagam Spirit', 650.00, 'A potent herbal formulation to boost immunity and energy levels naturally.', 'images/asamodagam.jpg', 'admin', '2025-10-16 06:44:07'),
(3, 'Siddhalepa Balm', 450.00, 'Herbal balm for fast relief from headaches and muscle pain.', 'images/siddhalepa.png', 'admin', '2025-10-16 06:44:07'),
(4, 'Dashamoolarishta', 750.00, 'A traditional tonic to support digestion and enhance immunity.', 'images/Dashamoolarishta.jpeg', 'admin', '2025-10-16 06:44:07'),
(5, 'Kothalahimbutu Capsules', 1200.00, 'Capsules made from Kothalahimbutu herb to enhance stamina and vitality.', 'images/Kothalahimbutu Capsules.jpeg', 'admin', '2025-10-16 06:44:07'),
(6, 'Neem Oil', 380.00, 'Pure neem oil for skin care, hair care, and general wellness.', 'images/Neem Oil.jpg', 'admin', '2025-10-16 06:44:07'),
(7, 'Pinda Thailaya', 550.00, 'Therapeutic oil for joint and muscle pain relief.', 'images/Pinda Thailaya.jpeg', 'admin', '2025-10-16 06:44:07'),
(8, 'Nirgundi Oil', 480.00, 'Nirgundi oil for effective pain relief and inflammation reduction.', 'images/Nirgundi Oil.jpg', 'admin', '2025-10-16 06:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_requests`
--

CREATE TABLE `product_requests` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `status` enum('pending','delivered') NOT NULL DEFAULT 'pending',
  `pharmacist_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_requests`
--

INSERT INTO `product_requests` (`id`, `product_name`, `quantity`, `supplier_id`, `request_date`, `status`, `pharmacist_id`, `created_at`, `updated_at`) VALUES
(2, 'Neem Oil', 12, 7, '2025-11-20', 'pending', 3, '2025-11-20 15:52:03', '2025-11-20 15:52:03'),
(3, 'Paspanguwa Pack', 20, 7, '2025-11-27', 'pending', 5, '2025-11-27 08:23:45', '2025-11-27 08:23:45'),
(4, 'Asamodagam Spirit', 25, 7, '2025-11-27', 'pending', 5, '2025-11-27 09:07:06', '2025-11-27 09:07:06'),
(5, 'Neem Oil', 10, 7, '2025-11-27', 'pending', 5, '2025-11-27 10:00:23', '2025-11-27 10:00:23'),
(6, 'Nirgundi Oil', 30, 6, '2025-11-27', 'pending', 5, '2025-11-27 13:22:41', '2025-11-27 13:22:41'),
(7, 'Asamodagam Spirit', 15, 6, '2025-12-08', 'delivered', 6, '2025-12-08 17:44:33', '2025-12-08 18:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `slot_locks`
--

CREATE TABLE `slot_locks` (
  `id` int(11) NOT NULL,
  `slot_date` date NOT NULL,
  `slot_time` time NOT NULL,
  `locked_by` int(11) NOT NULL,
  `locked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT (current_timestamp() + interval 5 minute)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slot_locks`
--

INSERT INTO `slot_locks` (`id`, `slot_date`, `slot_time`, `locked_by`, `locked_at`, `expires_at`) VALUES
(13, '2026-01-12', '10:00:00', 3, '2026-01-12 03:43:56', '2026-01-12 03:48:56'),
(14, '2026-01-13', '08:00:00', 3, '2026-01-12 03:44:07', '2026-01-12 03:49:07'),
(15, '2026-01-13', '10:00:00', 3, '2026-01-12 03:46:34', '2026-01-12 03:51:34'),
(16, '2026-01-12', '11:00:00', 3, '2026-01-12 03:47:51', '2026-01-12 03:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `contact_person`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Herbal Supplies Co.', 'Mr. Sunil Perera', '0711234567', 'sunil@herbalsupplies.lk', '2025-10-23 10:55:41', '2025-10-23 11:02:36'),
(2, 'Ayurvedic Traders', 'Mrs. Nadeesha Silva', '0779876543', 'nadeesha@ayutraders.lk', '2025-10-23 10:55:41', '2025-10-23 10:55:41'),
(3, 'Natural Extracts Ltd.', 'Mr. Amal Fernando', '0765558899', 'amal@naturalextracts.lk', '2025-10-23 10:55:41', '2025-10-23 10:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_bookings`
--

CREATE TABLE `treatment_bookings` (
  `booking_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Pending','Confirmed','Completed','Cancelled') DEFAULT 'Pending',
  `cancellation_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_bookings`
--

INSERT INTO `treatment_bookings` (`booking_id`, `patient_id`, `treatment_id`, `slot_id`, `booking_date`, `description`, `status`, `cancellation_reason`, `created_at`, `updated_at`) VALUES
(1, 13, 2, 25, '2026-01-21', '', 'Pending', NULL, '2026-01-17 10:58:46', NULL),
(2, 13, 2, 25, '2026-01-23', '', 'Pending', NULL, '2026-01-17 10:59:16', NULL),
(3, 13, 2, 25, '2026-01-19', '', 'Pending', NULL, '2026-01-17 12:34:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_list`
--

CREATE TABLE `treatment_list` (
  `treatment_id` int(11) NOT NULL,
  `treatment_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_list`
--

INSERT INTO `treatment_list` (`treatment_id`, `treatment_name`, `description`, `duration`, `price`, `image`, `status`) VALUES
(1, 'Full Steam Treatment', 'Complete body steam therapy with herbal infusions for deep relaxation and detoxification', '60 minutes', 6000.00, '/dheergayu/public/assets/images/Patient/head-massage.jpg', 'Active'),
(2, 'Shiro Dhara', 'Gentle oil flow on forehead to calm the mind, relieve stress and promote deep relaxation', '45 minutes', 4500.00, '/dheergayu/public/assets/images/Patient/shirodhara1.jpg', 'Active'),
(3, 'Head Treatment', 'Specialized Ayurvedic head massage and therapy to relieve tension and promote mental clarity', '40 minutes', 3000.00, '/dheergayu/public/assets/images/Patient/head-massage2.png', 'Active'),
(4, 'Eye Treatment', 'Soothing eye care treatment with herbal applications to reduce strain and improve vision health', '45 minutes', 2000.00, '/dheergayu/public/assets/images/Patient/eye.jpg', 'Active'),
(5, 'Nasya Treatment', 'Traditional nasal administration of herbal oils for respiratory wellness and sinus relief', '45 minutes', 4500.00, '/dheergayu/public/assets/images/Patient/nasya.jpg', 'Active'),
(6, 'Fat Burn Treatment', 'Specialized Ayurvedic treatment combining massage and herbal applications for weight reduction', '50 minutes', 3000.00, '/dheergayu/public/assets/images/Patient/fat-burn.jpg', 'Active'),
(7, 'Foot Treatment', 'Therapeutic foot massage with herbal oils to improve circulation and overall wellness', '45 minutes', 3000.00, '/dheergayu/public/assets/images/Patient/foot.jpg', 'Active'),
(8, 'Facial Treatment', 'Ayurvedic facial using natural herbs and oils for glowing, healthy skin and deep nourishment', '50 minutes', 3000.00, '/dheergayu/public/assets/images/Patient/facial.jpg', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_plans`
--

CREATE TABLE `treatment_plans` (
  `plan_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `treatment_name` varchar(150) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `total_sessions` int(11) NOT NULL,
  `sessions_per_week` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Confirmed','InProgress','Completed','Cancelled') DEFAULT 'Pending',
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `change_requested` tinyint(1) DEFAULT 0,
  `change_reason` text DEFAULT NULL,
  `payment_status` enum('Pending','Partial','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_plans`
--

INSERT INTO `treatment_plans` (`plan_id`, `appointment_id`, `patient_id`, `treatment_id`, `treatment_name`, `diagnosis`, `total_sessions`, `sessions_per_week`, `start_date`, `total_cost`, `status`, `confirmed_at`, `change_requested`, `change_reason`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 29, 3, 2, NULL, 'pitta', 5, 2, '2026-01-26', 22500.00, '', NULL, 0, NULL, 'Pending', '2026-01-19 06:10:41', '2026-01-19 07:12:49'),
(2, 30, 3, 2, NULL, 'uihi', 5, 2, '2026-01-21', 22500.00, '', NULL, 1, 'session 2 need to be changed', 'Pending', '2026-01-19 07:32:56', '2026-01-19 09:07:42'),
(3, 31, 3, 2, NULL, 'pitta', 5, 2, '2026-01-23', 22500.00, 'Confirmed', '2026-01-20 06:12:41', 0, NULL, 'Pending', '2026-01-20 05:48:10', '2026-01-20 06:12:41'),
(4, 33, 3, 2, NULL, 'pitta', 5, 2, '2026-01-22', 22500.00, 'Confirmed', '2026-01-20 08:20:27', 0, NULL, 'Pending', '2026-01-20 08:15:18', '2026-01-20 08:20:27'),
(5, 34, 3, 2, NULL, 'pitta', 5, 2, '2026-01-23', 22500.00, 'Pending', NULL, 0, NULL, 'Pending', '2026-01-20 11:13:02', '2026-01-20 11:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_sessions`
--

CREATE TABLE `treatment_sessions` (
  `session_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `session_number` int(11) NOT NULL,
  `session_date` date NOT NULL,
  `session_time` time NOT NULL,
  `assigned_staff_id` int(11) DEFAULT NULL,
  `status` enum('Pending','Confirmed','InProgress','Completed','Cancelled') DEFAULT 'Pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_sessions`
--

INSERT INTO `treatment_sessions` (`session_id`, `plan_id`, `session_number`, `session_date`, `session_time`, `assigned_staff_id`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-01-26', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 06:10:41', '2026-01-19 06:10:41'),
(2, 1, 2, '2026-01-29', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 06:10:41', '2026-01-19 06:10:41'),
(3, 1, 3, '2026-02-04', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 06:10:41', '2026-01-19 06:10:41'),
(4, 1, 4, '2026-02-07', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 06:10:41', '2026-01-19 06:10:41'),
(5, 1, 5, '2026-02-10', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 06:10:41', '2026-01-19 06:10:41'),
(6, 2, 1, '2026-01-21', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 07:32:56', '2026-01-19 07:32:56'),
(7, 2, 2, '2026-01-24', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 07:32:56', '2026-01-19 07:32:56'),
(8, 2, 3, '2026-01-27', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 07:32:56', '2026-01-19 07:32:56'),
(9, 2, 4, '2026-01-30', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 07:32:56', '2026-01-19 07:32:56'),
(10, 2, 5, '2026-02-02', '09:00:00', NULL, 'Pending', NULL, '2026-01-19 07:32:56', '2026-01-19 07:32:56'),
(11, 3, 1, '2026-01-23', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 05:48:10', '2026-01-20 06:12:41'),
(12, 3, 2, '2026-01-27', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 05:48:10', '2026-01-20 06:12:41'),
(13, 3, 3, '2026-01-29', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 05:48:10', '2026-01-20 06:12:41'),
(14, 3, 4, '2026-02-04', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 05:48:10', '2026-01-20 06:12:41'),
(15, 3, 5, '2026-02-07', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 05:48:10', '2026-01-20 06:12:41'),
(16, 4, 1, '2026-01-22', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 08:15:18', '2026-01-20 08:20:27'),
(17, 4, 2, '2026-01-24', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 08:15:18', '2026-01-20 08:20:27'),
(18, 4, 3, '2026-01-31', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 08:15:18', '2026-01-20 08:20:27'),
(19, 4, 4, '2026-02-03', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 08:15:18', '2026-01-20 08:20:27'),
(20, 4, 5, '2026-02-06', '09:00:00', NULL, 'Confirmed', NULL, '2026-01-20 08:15:18', '2026-01-20 08:20:27'),
(21, 5, 1, '2026-01-23', '09:00:00', NULL, 'Pending', NULL, '2026-01-20 11:13:02', '2026-01-20 11:13:02'),
(22, 5, 2, '2026-01-27', '09:00:00', NULL, 'Pending', NULL, '2026-01-20 11:13:02', '2026-01-20 11:15:21'),
(23, 5, 3, '2026-01-29', '09:00:00', NULL, 'Pending', NULL, '2026-01-20 11:13:02', '2026-01-20 11:13:02'),
(24, 5, 4, '2026-02-04', '09:00:00', NULL, 'Pending', NULL, '2026-01-20 11:13:02', '2026-01-20 11:13:02'),
(25, 5, 5, '2026-02-07', '09:00:00', NULL, 'Pending', NULL, '2026-01-20 11:13:02', '2026-01-20 11:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_slots`
--

CREATE TABLE `treatment_slots` (
  `slot_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `slot_time` time NOT NULL,
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '0=Sunday, 6=Saturday, NULL=all days',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_slots`
--

INSERT INTO `treatment_slots` (`slot_id`, `treatment_id`, `slot_time`, `day_of_week`, `is_active`, `created_at`) VALUES
(1, 1, '09:00:00', NULL, 1, '2026-01-15 04:25:59'),
(2, 1, '10:00:00', NULL, 1, '2026-01-15 04:25:59'),
(3, 1, '11:00:00', NULL, 1, '2026-01-15 04:25:59'),
(4, 1, '14:00:00', NULL, 1, '2026-01-15 04:25:59'),
(5, 1, '15:00:00', NULL, 1, '2026-01-15 04:25:59'),
(6, 1, '16:00:00', NULL, 1, '2026-01-15 04:25:59'),
(7, 1, '17:00:00', NULL, 1, '2026-01-15 04:25:59'),
(8, 1, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(9, 2, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(10, 3, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(11, 4, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(12, 5, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(13, 6, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(14, 7, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(15, 8, '09:00:00', NULL, 1, '2026-01-15 09:42:16'),
(16, 1, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(17, 2, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(18, 3, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(19, 4, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(20, 5, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(21, 6, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(22, 7, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(23, 8, '10:00:00', NULL, 1, '2026-01-15 09:42:16'),
(24, 1, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(25, 2, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(26, 3, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(27, 4, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(28, 5, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(29, 6, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(30, 7, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(31, 8, '11:00:00', NULL, 1, '2026-01-15 09:42:16'),
(32, 1, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(33, 2, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(34, 3, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(35, 4, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(36, 5, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(37, 6, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(38, 7, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(39, 8, '14:00:00', NULL, 1, '2026-01-15 09:42:16'),
(40, 1, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(41, 2, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(42, 3, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(43, 4, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(44, 5, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(45, 6, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(46, 7, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(47, 8, '15:00:00', NULL, 1, '2026-01-15 09:42:16'),
(48, 1, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(49, 2, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(50, 3, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(51, 4, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(52, 5, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(53, 6, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(54, 7, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(55, 8, '16:00:00', NULL, 1, '2026-01-15 09:42:16'),
(56, 1, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(57, 2, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(58, 3, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(59, 4, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(60, 5, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(61, 6, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(62, 7, '17:00:00', NULL, 1, '2026-01-15 09:42:16'),
(63, 8, '17:00:00', NULL, 1, '2026-01-15 09:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` enum('pharmacist','doctor','staff','admin') NOT NULL,
  `certification_verified` tinyint(1) DEFAULT 0,
  `must_change_password` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Active',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `role`, `certification_verified`, `must_change_password`, `created_at`, `status`, `reg_date`) VALUES
(2, NULL, 'Kamal', 'Silva', 'staff1@gmail.com', '$2y$10$FtQljuIrL1HT/gAcQo3ho.3jfYhSx6SF6BGeEKvk9QVVlwLqswtQe', '0742440321', 'staff', 0, 1, '2025-10-12 10:42:53', 'Active', '2025-10-11 18:30:00'),
(3, NULL, 'Sarah', 'Perera', 'pharmacist1@gmail.com', '$2y$10$Za2bXz8s0aTweo1JH.A5BeBCYMwfMJyRyNJEu4BmeOYCJxujPsL7W', '0742420377', 'pharmacist', 0, 1, '2025-10-12 10:44:33', 'Active', '2025-10-11 18:30:00'),
(4, NULL, 'Nuwan', 'Vithana', 'admindheergayu@gmail.com', '$2y$10$Ev0xZtWqbHixuuNBCBY1x.V2NgOrWE7cVIpZxUyYy8QlIqkC/Eo5a', '0732440377', 'admin', 0, 1, '2025-10-12 10:45:34', 'Active', '2025-10-11 18:30:00'),
(5, NULL, 'Saman', 'Kumara', 'saman@gmail.com', '$2y$10$a78hWVWWR7aR230t2F8lfuapUZURQo7MkS5Bm8VHRjcELvnCvqQAK', '0742440377', 'staff', 0, 1, '2025-10-17 11:40:28', 'Active', '2025-10-16 18:30:00'),
(9, NULL, 'abc', 'ass', 'staff5@gmail.com', '$2y$10$OOt7/X926gWtNr8YUvkgAO9P3cibSBYslkP4ycVMTMPTPiwyOaycy', '0742450377', 'staff', 0, 1, '2025-10-20 04:59:10', 'Active', '2025-10-19 18:30:00'),
(13, NULL, 'A', 'Sliva', 'doctor1@gmail.com', '$2y$10$/RMbLGJBdHyqejKYvUJ.QOWH5RSDhynvIVPauHTz0ucLaPkepX.LO', '1234567890', 'doctor', 0, 1, '2026-01-15 06:56:26', 'Active', '2026-01-14 18:30:00'),
(14, NULL, 'B', 'Fernando', 'doctor2@gmail.com', '$2y$10$f40vq46bHG9sMXTBEx/UOu1zArCmMXy5Cmhgk/qzqog6JCp0l/pz.', '1234567890', 'doctor', 0, 1, '2026-01-15 06:57:06', 'Active', '2026-01-14 18:30:00'),
(15, NULL, 'C', 'Perera', 'doctor3@gmail.com', '$2y$10$R4v5WkLdvDgTvb70AbnjTe1IrHXCqaRAn0K4ZIig7pwgmQuCr5KjK', '1234567890', 'doctor', 0, 1, '2026-01-15 06:58:06', 'Active', '2026-01-14 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`batch_id`),
  ADD UNIQUE KEY `batch_number` (`batch_number`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_session_id` (`session_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `idx_cart_id` (`cart_id`),
  ADD KEY `idx_product` (`product_id`,`product_type`);

--
-- Indexes for table `consultationforms`
--
ALTER TABLE `consultationforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment` (`appointment_id`),
  ADD KEY `fk_treatment_booking` (`treatment_booking_id`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `delete_suppliers`
--
ALTER TABLE `delete_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_doctor_day_time` (`doctor_id`,`day_of_week`,`start_time`);

--
-- Indexes for table `expired_batches`
--
ALTER TABLE `expired_batches`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `patient_deleted_accounts`
--
ALTER TABLE `patient_deleted_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_patient_id` (`patient_id`),
  ADD KEY `idx_deactivated_at` (`deactivated_at`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD KEY `idx_patient_id` (`patient_id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_nic` (`nic`),
  ADD KEY `idx_account_status` (`account_status`);

--
-- Indexes for table `patient_products`
--
ALTER TABLE `patient_products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `product_requests`
--
ALTER TABLE `product_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_supplier` (`supplier_id`),
  ADD KEY `idx_pharmacist` (`pharmacist_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `slot_locks`
--
ALTER TABLE `slot_locks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_slot` (`slot_date`,`slot_time`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_supplier_name` (`supplier_name`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `treatment_bookings`
--
ALTER TABLE `treatment_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `treatment_id` (`treatment_id`),
  ADD KEY `slot_id` (`slot_id`),
  ADD KEY `booking_date` (`booking_date`),
  ADD KEY `status` (`status`),
  ADD KEY `idx_patient_status` (`patient_id`,`status`),
  ADD KEY `idx_date_status` (`booking_date`,`status`);

--
-- Indexes for table `treatment_list`
--
ALTER TABLE `treatment_list`
  ADD PRIMARY KEY (`treatment_id`);

--
-- Indexes for table `treatment_plans`
--
ALTER TABLE `treatment_plans`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `idx_patient` (`patient_id`),
  ADD KEY `idx_appointment` (`appointment_id`),
  ADD KEY `treatment_id` (`treatment_id`);

--
-- Indexes for table `treatment_sessions`
--
ALTER TABLE `treatment_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `idx_plan` (`plan_id`),
  ADD KEY `idx_date` (`session_date`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `assigned_staff_id` (`assigned_staff_id`);

--
-- Indexes for table `treatment_slots`
--
ALTER TABLE `treatment_slots`
  ADD PRIMARY KEY (`slot_id`),
  ADD KEY `treatment_id` (`treatment_id`),
  ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consultationforms`
--
ALTER TABLE `consultationforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delete_suppliers`
--
ALTER TABLE `delete_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `expired_batches`
--
ALTER TABLE `expired_batches`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `patient_deleted_accounts`
--
ALTER TABLE `patient_deleted_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_info`
--
ALTER TABLE `patient_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patient_products`
--
ALTER TABLE `patient_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_requests`
--
ALTER TABLE `product_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slot_locks`
--
ALTER TABLE `slot_locks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `treatment_bookings`
--
ALTER TABLE `treatment_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `treatment_list`
--
ALTER TABLE `treatment_list`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `treatment_plans`
--
ALTER TABLE `treatment_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `treatment_sessions`
--
ALTER TABLE `treatment_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `treatment_slots`
--
ALTER TABLE `treatment_slots`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE;

--
-- Constraints for table `consultationforms`
--
ALTER TABLE `consultationforms`
  ADD CONSTRAINT `fk_treatment_booking` FOREIGN KEY (`treatment_booking_id`) REFERENCES `treatment_bookings` (`booking_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD CONSTRAINT `fk_patient_info_users` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `treatment_plans`
--
ALTER TABLE `treatment_plans`
  ADD CONSTRAINT `treatment_plans_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `treatment_plans_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatment_list` (`treatment_id`);

--
-- Constraints for table `treatment_sessions`
--
ALTER TABLE `treatment_sessions`
  ADD CONSTRAINT `treatment_sessions_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `treatment_plans` (`plan_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `treatment_sessions_ibfk_2` FOREIGN KEY (`assigned_staff_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

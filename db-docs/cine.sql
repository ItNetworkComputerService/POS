-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 20, 2022 at 01:39 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cine`
--

-- --------------------------------------------------------

--
-- Table structure for table `buys_item`
--

CREATE TABLE `buys_item` (
  `bill_id` bigint(15) NOT NULL,
  `bill_date` varchar(100) NOT NULL,
  `bill_no` varchar(100) NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `bill_number` int(2) NOT NULL,
  `bill_price` decimal(10,2) NOT NULL,
  `recorder` varchar(30) NOT NULL,
  `recorder_time` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` bigint(13) NOT NULL,
  `cust_code` varchar(50) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `cust_phone` varchar(100) NOT NULL,
  `cust_address` varchar(255) NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_code`, `cust_name`, `cust_phone`, `cust_address`, `comment`) VALUES
(1, '0001', 'พรรณวลัย  พฤทธิ์เศวต', '065-3962452', '80/49 ถนนเสนานิคม1 (ม.เสนานิเวศน์โครงการ1) แขวงจรเข้บัว เขตลาดพร้าว กรุงเทพมหานคร 10230', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` bigint(13) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` decimal(10,0) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `order_item_status` int(1) NOT NULL DEFAULT '0',
  `order_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rec_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prefix`
--

CREATE TABLE `prefix` (
  `prefix_id` int(1) NOT NULL,
  `prefix_name` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prefix`
--

INSERT INTO `prefix` (`prefix_id`, `prefix_name`) VALUES
(1, 'นาย'),
(2, 'นาง'),
(3, 'นางสาว'),
(4, 'ว่าที่ร้อยตรี');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `brand_id` int(2) NOT NULL,
  `categories_id` int(2) NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `uID` int(3) NOT NULL,
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rate2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `active` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `product_id`, `product_name`, `product_image`, `brand_id`, `categories_id`, `quantity`, `uID`, `rate`, `rate2`, `active`, `status`) VALUES
(1, 'SA-401-S', 'กางเกงเก็บทรง Size S', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(2, 'SA-401-M', 'กางเกงเก็บทรง Size M', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(3, 'SA-401-L', 'กางเกงเก็บทรง Size L', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(4, 'SA-401-XL', 'กางเกงเก็บทรง Size XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(5, 'SA-401-2XL', 'กางเกงเก็บทรง Size 2XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(6, 'SA-401-3XL', 'กางเกงเก็บทรง Size 3XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(7, 'SA-401-4XL', 'กางเกงเก็บทรง Size 4XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(8, 'SA-401-5XL', 'กางเกงเก็บทรง Size 5XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(9, 'SA-401-6XL', 'กางเกงเก็บทรง Size 6XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(10, 'SA-401-7XL', 'กางเกงเก็บทรง Size 7XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(11, 'SA-401-8XL', 'กางเกงเก็บทรง Size 8XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(12, 'SA-401-9XL', 'กางเกงเก็บทรง Size 9XL', '', 1, 1, '36', 2, '750.00', '1190.00', 1, 1),
(13, 'JA-501-S', 'กางเกงยีนส์ Size S', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(14, 'JA-501-M', 'กางเกงยีนส์  Size M', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(15, 'JA-501-L', 'กางเกงยีนส์  Size L', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(16, 'JA-501-XL', 'กางเกงยีนส์ XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(17, 'JA-501-2XL', 'กางเกงยีนส์ 2XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(18, 'JA-501-3XL', 'กางเกงยีนส์ 3XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(19, 'JA-501-4XL', 'กางเกงยีนส์ 4XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(20, 'JA-501-5XL', 'กางเกงยีนส์ 5XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(21, 'JA-501-6XL', 'กางเกงยีนส์ 6XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(22, 'JA-501-7XL', 'กางเกงยีนส์ 7XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1),
(23, 'JA-501-9XL', 'กางเกงยีนส์ 9XL', '', 1, 1, '36', 2, '750.00', '1290.00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `transaction` bigint(13) NOT NULL DEFAULT '0',
  `ref_docinv` bigint(13) NOT NULL DEFAULT '0',
  `IDCust` bigint(13) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `payment_type` int(1) NOT NULL,
  `payment_status` int(1) NOT NULL,
  `sales_status` int(1) NOT NULL DEFAULT '1',
  `sale_channel_id` int(2) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `sales_date`, `sales_time`, `transaction`, `ref_docinv`, `IDCust`, `sub_total`, `vat`, `grand_total`, `payment_type`, `payment_status`, `sales_status`, `sale_channel_id`, `username`) VALUES
(1, '2022-02-13', '20:52:43', 1005, 65020000001005, 1, '2803.74', '196.26', '3000.00', 1, 1, 1, 3, '1101'),
(2, '2022-02-13', '21:07:55', 1006, 65020000001006, 1, '1401.87', '98.13', '1500.00', 1, 1, 1, 3, '1101'),
(3, '2022-02-13', '21:08:36', 1007, 65020000001007, 1, '2102.80', '147.20', '2250.00', 1, 1, 1, 6, '1101'),
(4, '2022-02-13', '22:35:30', 1008, 65020000001008, 1, '2803.74', '196.26', '3000.00', 1, 1, 1, 5, '1101'),
(5, '2022-02-14', '21:06:25', 1009, 65020000001009, 1, '2102.80', '147.20', '2250.00', 1, 1, 1, 2, '1101'),
(6, '2022-02-14', '21:42:01', 1010, 65020000001010, 1, '4205.61', '294.39', '4500.00', 1, 1, 1, 5, '1101'),
(7, '2022-02-15', '21:03:39', 1011, 65020000001011, 1, '2102.80', '147.20', '2250.00', 1, 1, 1, 1, '1101'),
(8, '2022-02-15', '21:08:04', 1012, 65020000001012, 1, '3504.67', '245.33', '3750.00', 1, 1, 1, 3, '1101'),
(9, '2022-02-20', '20:07:36', 1013, 65020000001013, 1, '2803.74', '196.26', '3000.00', 1, 1, 1, 1, '1101');

-- --------------------------------------------------------

--
-- Table structure for table `sales_channel`
--

CREATE TABLE `sales_channel` (
  `sale_channel_id` int(2) NOT NULL,
  `sale_channel` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_channel`
--

INSERT INTO `sales_channel` (`sale_channel_id`, `sale_channel`) VALUES
(1, 'Lazada'),
(2, 'Shopee'),
(3, 'Line@'),
(4, 'Facebook'),
(5, 'Website'),
(6, 'Booth'),
(7, 'Shop');

-- --------------------------------------------------------

--
-- Table structure for table `sales_item`
--

CREATE TABLE `sales_item` (
  `sales_item_id` int(11) NOT NULL,
  `sales_id` bigint(13) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` decimal(10,0) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `sales_item_status` int(1) NOT NULL DEFAULT '0',
  `sales_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rec_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales_item`
--

INSERT INTO `sales_item` (`sales_item_id`, `sales_id`, `product_id`, `quantity`, `rate`, `total`, `discount`, `sales_item_status`, `sales_timestamp`, `rec_username`) VALUES
(1, 1005, 5, '2', '750.00', '1500.00', '0.00', 1, '2022-02-13 15:23:55', '1101'),
(2, 1005, 2, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 15:23:58', '1101'),
(3, 1005, 1, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 15:24:00', '1101'),
(4, 1006, 2, '2', '750.00', '1500.00', '0.00', 1, '2022-02-13 14:07:49', '1101'),
(7, 1007, 11, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 14:08:33', '1101'),
(6, 1007, 4, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 14:08:29', '1101'),
(5, 1007, 10, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 14:08:25', '1101'),
(10, 1008, 4, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 15:35:18', '1101'),
(9, 1008, 1, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 15:35:14', '1101'),
(8, 1008, 3, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 15:35:08', '1101'),
(11, 1008, 5, '1', '750.00', '750.00', '0.00', 1, '2022-02-13 15:35:27', '1101'),
(13, 1009, 5, '1', '750.00', '750.00', '0.00', 1, '2022-02-14 14:06:14', '1101'),
(12, 1009, 6, '2', '750.00', '1500.00', '0.00', 1, '2022-02-14 14:06:20', '1101'),
(17, 1010, 9, '1', '750.00', '750.00', '0.00', 1, '2022-02-14 14:41:49', '1101'),
(16, 1010, 1, '1', '750.00', '750.00', '0.00', 1, '2022-02-14 14:41:40', '1101'),
(15, 1010, 5, '1', '750.00', '750.00', '0.00', 1, '2022-02-14 14:41:36', '1101'),
(14, 1010, 11, '2', '750.00', '1500.00', '0.00', 1, '2022-02-14 14:41:43', '1101'),
(18, 1010, 12, '1', '750.00', '750.00', '0.00', 1, '2022-02-14 14:41:54', '1101'),
(21, 1011, 16, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:03:37', '1101'),
(20, 1011, 21, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:03:31', '1101'),
(19, 1011, 8, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:03:27', '1101'),
(26, 1012, 5, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:07:34', '1101'),
(25, 1012, 15, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:06:04', '1101'),
(24, 1012, 20, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:06:00', '1101'),
(23, 1012, 4, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:05:57', '1101'),
(22, 1012, 1, '1', '750.00', '750.00', '0.00', 1, '2022-02-15 14:05:53', '1101'),
(30, 1013, 23, '1', '750.00', '750.00', '0.00', 1, '2022-02-20 13:07:26', '1101'),
(29, 1013, 15, '1', '750.00', '750.00', '0.00', 1, '2022-02-20 13:07:16', '1101'),
(28, 1013, 11, '1', '750.00', '750.00', '0.00', 1, '2022-02-20 13:07:12', '1101'),
(27, 1013, 18, '1', '750.00', '750.00', '0.00', 1, '2022-02-20 13:07:09', '1101');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transID` int(11) NOT NULL,
  `transType` int(1) NOT NULL,
  `transNumber` bigint(13) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transID`, `transType`, `transNumber`) VALUES
(1, 1, 1000),
(2, 2, 1013);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `uID` int(3) NOT NULL,
  `unitName` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`uID`, `unitName`) VALUES
(1, 'Null'),
(2, 'Piece'),
(3, 'Set'),
(4, 'Pair'),
(5, 'Carat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prefix_id` int(1) NOT NULL,
  `fname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `prefix_id`, `fname`, `lname`, `email`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'ดูแล', 'ระบบดี', 'service@localhost.com', 9),
(2, '1101', 'c6bff625bdb0393992c9d4db0c6bbe45', 1, 'เซลล์1', 'เซลล์1', 'test@localhost.com', 1),
(3, '1102', 'c667d53acd899a97a85de0c201ba99be', 1, 'เซลล์2', 'ขาย2', 'sales2@localhost.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buys_item`
--
ALTER TABLE `buys_item`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_channel`
--
ALTER TABLE `sales_channel`
  ADD PRIMARY KEY (`sale_channel_id`);

--
-- Indexes for table `sales_item`
--
ALTER TABLE `sales_item`
  ADD PRIMARY KEY (`sales_item_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transID`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`uID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buys_item`
--
ALTER TABLE `buys_item`
  MODIFY `bill_id` bigint(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` bigint(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales_channel`
--
ALTER TABLE `sales_channel`
  MODIFY `sale_channel_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_item`
--
ALTER TABLE `sales_item`
  MODIFY `sales_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `uID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

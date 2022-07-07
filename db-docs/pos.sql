-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2022 at 05:43 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT '0',
  `categories_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`) VALUES
(1, 'Hardware', 1, 1),
(2, 'Software', 1, 1),
(3, 'เบ็ดเตล็ด', 1, 1),
(4, 'วัสดุก่อสร้าง', 1, 1);

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
(1, 'C0001', 'นายเอกชัย สิมมาหลวง', '0845199890', '527/6  ซ.โนนพิบูลย์ ต.หมากแข้ง อ.เมือง จ.อุดรธานี 41000 หมายเลขประจำตัวผู้เสียภาษี : 1101400073313', ''),
(2, '123', 'น้าไก่', '0843257614', 'โพนนาเรียง', ''),
(3, '123', 'ลุงมูล', '013652895', 'หนองแมว', ''),
(4, '015', 'พ่อพร  ', '0843257614', 'บ้านโพน', ''),
(5, '015', 'พ่อพร  ', '0843257614', 'บ้านโพน', '');

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
  `rec_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
(13, '0130', 'ทรายโขง', '', 1, 4, '50000', 1, '450.00', '450.00', 1, 1),
(12, '0129', 'หิน', '', 1, 4, '10000', 1, '6.00', '6.00', 1, 1),
(6, '0123', 'อิฐบล็อก', '', 1, 3, '200', 1, '6.00', '6.00', 1, 1),
(7, '0124', 'อิฐกันสาด', '', 1, 3, '30', 1, '135.00', '135.00', 1, 1),
(8, '0125', 'ิอิฐช่องลม', '', 1, 3, '100', 1, '10.00', '10.00', 1, 1),
(9, '0126', 'อิฐโปร่ง', '', 1, 4, '5000', 1, '10.00', '10.00', 1, 1),
(10, '0127', 'ิอิฐแดง  4  รู', '', 1, 4, '5000', 1, '4.00', '10.00', 1, 1),
(11, '0128', 'ิอิฐแดง  2  รู', '', 1, 4, '50000', 1, '1.50', '1.50', 1, 1);

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
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `sales_date`, `sales_time`, `transaction`, `ref_docinv`, `IDCust`, `sub_total`, `vat`, `grand_total`, `payment_type`, `payment_status`, `sales_status`, `sale_channel_id`, `username`) VALUES
(1, '2022-05-07', '10:22:33', 1047, 65050000001047, 1, '22233.64', '1.00', '23790.00', 1, 1, 1, 7, '1101'),
(2, '2022-05-07', '10:59:35', 1048, 65050000001048, 1, '15214.95', '1.00', '16280.00', 1, 1, 1, 2, '1101'),
(3, '2022-05-07', '13:51:37', 0, 65050000001049, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(4, '2022-05-07', '14:17:39', 0, 65050000001050, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(5, '2022-05-07', '14:21:04', 0, 65050000001051, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(6, '2022-05-07', '14:28:28', 0, 65050000001052, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(7, '2022-05-07', '14:35:28', 1053, 65050000001053, 2, '141.12', '9.88', '151.00', 1, 1, 1, 0, '1101'),
(8, '2022-05-07', '14:37:13', 0, 65050000001054, 2, '141.12', '9.88', '151.00', 1, 1, 1, 0, '1101'),
(9, '2022-05-07', '14:50:02', 0, 65050000001055, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(10, '2022-05-20', '15:50:20', 1056, 65050000001056, 4, '3.74', '0.26', '4.00', 1, 1, 1, 0, '1101'),
(11, '2022-05-31', '19:18:16', 1057, 65050000001057, 1, '18.69', '1.31', '20.00', 1, 1, 1, 0, '1101'),
(12, '2022-06-01', '08:43:15', 0, 65060000001058, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(13, '2022-06-01', '08:45:17', 0, 65060000001059, 0, '0.00', '0.00', '0.00', 1, 1, 1, 0, '1101'),
(14, '2022-06-01', '16:31:31', 1060, 65060000001060, 1, '5.61', '0.39', '6.00', 1, 1, 1, 7, 'admin');

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
  `rec_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_item`
--

INSERT INTO `sales_item` (`sales_item_id`, `sales_id`, `product_id`, `quantity`, `rate`, `total`, `discount`, `sales_item_status`, `sales_timestamp`, `rec_username`) VALUES
(72, 1047, 2, '1', '18900.00', '18900.00', '0.00', 1, '2022-05-07 03:22:22', '1101'),
(71, 1047, 3, '1', '4890.00', '4890.00', '0.00', 1, '2022-05-07 03:21:59', '1101'),
(73, 1048, 1, '1', '11200.00', '11200.00', '0.00', 1, '2022-05-07 03:59:13', '1101'),
(74, 1048, 4, '1', '5080.00', '5080.00', '0.00', 1, '2022-05-07 03:59:19', '1101'),
(76, 1053, 8, '1', '10.00', '10.00', '0.00', 1, '2022-05-07 07:34:40', '1101'),
(75, 1053, 7, '1', '135.00', '135.00', '0.00', 1, '2022-05-07 07:33:40', '1101'),
(77, 1053, 6, '1', '6.00', '6.00', '0.00', 1, '2022-05-07 07:35:21', '1101'),
(78, 1056, 10, '1', '4.00', '4.00', '0.00', 1, '2022-05-20 08:48:32', '1101'),
(81, 1057, 9, '1', '10.00', '10.00', '0.00', 1, '2022-05-31 12:17:29', '1101'),
(80, 1057, 8, '1', '10.00', '10.00', '0.00', 1, '2022-05-31 12:17:15', '1101'),
(82, 1060, 6, '1', '6.00', '6.00', '0.00', 1, '2022-06-01 09:31:27', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transID` int(11) NOT NULL,
  `transType` int(1) NOT NULL,
  `transNumber` bigint(13) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transID`, `transType`, `transNumber`) VALUES
(1, 1, 1000),
(2, 2, 1060);

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
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prefix_id` int(1) NOT NULL,
  `fname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` bigint(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sales_channel`
--
ALTER TABLE `sales_channel`
  MODIFY `sale_channel_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_item`
--
ALTER TABLE `sales_item`
  MODIFY `sales_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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

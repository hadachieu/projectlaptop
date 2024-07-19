-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 04:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `email`, `user`, `pass`, `tel`, `address`, `role`) VALUES
(1, 'admin@fpt.edu.vn', 'admin', '1', '1', '1', 1),
(2, 'hadachieu140504@gmail.com', 'hieu', '1', '1', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pay` tinyint(2) NOT NULL COMMENT '1. Thanh toán trực tiếp\r\n2. Thanh toán online',
  `date` datetime NOT NULL,
  `total_money` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1. Đơn hàng mới\r\n2. Đang xử lý\r\n3. Đang giao hàng\r\n4. Đã giao hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `iduser`, `name`, `address`, `tel`, `email`, `pay`, `date`, `total_money`, `status`) VALUES
(3, 1, 'admin', '1', '1', 'admin@fpt.edu.vn', 1, '2024-01-26 22:09:20', 98, 0),
(4, 1, 'admin', '1', '1', 'admin@fpt.edu.vn', 1, '2024-01-26 22:11:10', 98, 0),
(5, 2, 'hieu', '1', '1', 'hadachieu140504@gmail.com', 1, '2024-01-27 13:25:16', 49, 0),
(6, 1, 'admin', '1', '1', 'admin@fpt.edu.vn', 1, '2024-02-25 10:44:41', 150, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `pay` tinyint(2) NOT NULL,
  `date` datetime NOT NULL,
  `total` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `idbill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `iduser`, `name`, `address`, `tel`, `email`, `name_product`, `img`, `quantity`, `pay`, `date`, `total`, `total_money`, `status`, `idbill`) VALUES
(1, 1, 'admin', '1', '1', 'admin@fpt.edu.vn', '', 'dell.jpg', 2, 1, '2024-01-26 22:11:10', 0, 49, 0, 4),
(2, 2, 'hieu', '1', '1', 'hadachieu140504@gmail.com', '', 'dell.jpg', 1, 1, '2024-01-27 13:25:16', 0, 49, 0, 5),
(3, 1, 'admin', '1', '1', 'admin@fpt.edu.vn', '', 'dell.jpg', 1, 1, '2024-02-25 10:44:41', 0, 50, 0, 6),
(4, 1, 'admin', '1', '1', 'admin@fpt.edu.vn', '', 'mac.jpg', 1, 1, '2024-02-25 10:44:41', 0, 100, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `idbill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `iduser`, `idproduct`, `img`, `name`, `price`, `quantity`, `total_money`, `idbill`) VALUES
(4, 1, 5, 'dell.jpg', 'Dell1', 49, 2, 49, 3),
(5, 1, 5, 'dell.jpg', 'Dell1', 49, 2, 49, 4),
(6, 2, 5, 'dell.jpg', 'Dell1', 49, 1, 49, 5),
(7, 1, 3, 'dell.jpg', 'Dell', 50, 1, 50, 6),
(8, 1, 2, 'mac.jpg', 'Mac', 100, 1, 100, 6);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Dell'),
(2, 'Macbook');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `iduser`, `idproduct`, `content`, `date`) VALUES
(2, 1, 2, 'Đẹp 1', '2023-11-26 20:03:22'),
(3, 1, 2, 'Đẹp 2', '2023-11-26 20:03:28'),
(5, 1, 3, '1', '2024-02-02 19:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `describe` text NOT NULL,
  `idcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `img`, `price`, `describe`, `idcategory`) VALUES
(2, 'Mac', 'mac.jpg', 100, 'Đẹp', 2),
(3, 'Dell', 'dell.jpg', 50, 'Cũng đẹp', 1),
(4, 'Mac 1', 'mac.jpg', 99, 'qq', 2),
(5, 'Dell11', 'dell.jpg', 49, 'a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_bill_detail_bill` (`idbill`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_cart_account` (`iduser`),
  ADD KEY `lk_cart_product` (`idproduct`),
  ADD KEY `lk_cart_bill` (`idbill`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_comment_account` (`iduser`),
  ADD KEY `lk_comment_product` (`idproduct`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_product_category` (`idcategory`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `lk_bill_detail_bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `lk_cart_account` FOREIGN KEY (`iduser`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `lk_cart_bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `lk_cart_product` FOREIGN KEY (`idproduct`) REFERENCES `product` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `lk_comment_account` FOREIGN KEY (`iduser`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `lk_comment_product` FOREIGN KEY (`idproduct`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `lk_product_category` FOREIGN KEY (`idcategory`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

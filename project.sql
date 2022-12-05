-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2022 at 01:18 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `passwd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `passwd`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `ID` int(11) NOT NULL,
  `dest` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`ID`, `dest`) VALUES
(1, 'Mumbai'),
(2, 'Pune'),
(3, 'abc'),
(4, 'nashik');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `did` int(11) NOT NULL,
  `dname` varchar(30) NOT NULL,
  `dmob` char(10) NOT NULL,
  `dest` varchar(20) DEFAULT NULL,
  `dstatus` varchar(15) NOT NULL,
  `emob` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`did`, `dname`, `dmob`, `dest`, `dstatus`, `emob`) VALUES
(1, 'xyz', '1231', 'Mumbai', 'Occupied', '34782'),
(2, 'abc', '1232', 'Pune', 'Occupied', '84512'),
(9, 'ascii', '669669', 'Mumbai', 'Occupied', '9966213'),
(10, 'smk', '4123485', 'Mumbai', 'Available', '');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `ID` int(11) NOT NULL,
  `ename` varchar(30) NOT NULL,
  `emob` char(10) NOT NULL,
  `dest` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `remark` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`ID`, `ename`, `emob`, `dest`, `date`, `time`, `remark`) VALUES
(7, 'adfc', '34782', 'Mumbai', '2022-03-03', '11:46:00', 'Accepted'),
(8, 'ghbvc', '5423', 'Mumbai', '2022-03-02', '11:46:00', 'Rejected'),
(9, 'abc', '88877', 'Pune', '2022-03-02', '12:44:00', 'Rejected'),
(11, 'acac', '7652', 'Mumbai', '2022-03-02', '13:12:00', 'Rejected'),
(12, 'yuascv', '9966213', 'Mumbai', '2022-03-02', '18:43:00', 'Accepted'),
(13, 'eofinew', '841632', 'Mumbai', '2022-03-08', '18:43:00', 'Rejected'),
(14, 'jks v', '51323', 'Mumbai', '2022-03-02', '18:45:00', 'Rejected');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`did`),
  ADD UNIQUE KEY `dmob` (`dmob`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `emob` (`emob`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

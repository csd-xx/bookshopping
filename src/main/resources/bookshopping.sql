/*
Navicat MySQL Data Transfer

Source Server         : csd
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : bookshopping

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-05-06 18:02:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '男', '1995-4-3', '563909410@qq.com', '1123');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(20) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `publishing` varchar(50) NOT NULL,
  `publishtime` varchar(20) NOT NULL,
  `bookpic` varchar(50) NOT NULL,
  `bookprice` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `remark` varchar(50) NOT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `book` VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `book` VALUES ('3', '3', '3', '3', '3', '3', '3', '3', '3', '3');
INSERT INTO `book` VALUES ('4', '4', '1', '4', '4', '4', '4', '4', '4', '4');
INSERT INTO `book` VALUES ('5', '5', '2', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `book` VALUES ('6', '6', '3', '6', '6', '6', '6', '6', '6', '6');
INSERT INTO `book` VALUES ('7', '7', '1', '7', '7', '7', '7', '7', '7', '7');
INSERT INTO `book` VALUES ('8', '8', '2', '8', '8', '8', '8', '8', '8', '8');
INSERT INTO `book` VALUES ('9', '9', '3', '9', '9', '9', '9', '9', '9', '9');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `cnname` varchar(50) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1');
INSERT INTO `category` VALUES ('2', '2');
INSERT INTO `category` VALUES ('3', '3');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderdetailid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `booknum` int(11) NOT NULL,
  PRIMARY KEY (`orderdetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '1', '1', '3');
INSERT INTO `orderdetail` VALUES ('2', '2', '2', '3');
INSERT INTO `orderdetail` VALUES ('3', '3', '3', '3');
INSERT INTO `orderdetail` VALUES ('4', '1', '2', '3');
INSERT INTO `orderdetail` VALUES ('5', '1', '3', '4');
INSERT INTO `orderdetail` VALUES ('6', '2', '6', '6');
INSERT INTO `orderdetail` VALUES ('7', '3', '5', '7');
INSERT INTO `orderdetail` VALUES ('8', '8', '8', '1');
INSERT INTO `orderdetail` VALUES ('9', '11', '1', '1');
INSERT INTO `orderdetail` VALUES ('10', '11', '3', '1');
INSERT INTO `orderdetail` VALUES ('11', '12', '2', '1');
INSERT INTO `orderdetail` VALUES ('12', '12', '5', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `ordertime` varchar(20) NOT NULL,
  `orderprice` float(10,0) NOT NULL,
  `orderremark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '12-12-21', '43', 'qweq');
INSERT INTO `orders` VALUES ('2', '1', '12-12-21', '342', 'qwer');
INSERT INTO `orders` VALUES ('3', '2', '12-12-21', '345', 'wew');
INSERT INTO `orders` VALUES ('4', '2', '12-12-21', '654', 'fsdfs');
INSERT INTO `orders` VALUES ('5', '3', '12-12-21', '123', 'dgft');
INSERT INTO `orders` VALUES ('6', '3', '12-12-21', '456', 'bgfd');
INSERT INTO `orders` VALUES ('7', '1', '2016-05-06 14:38:27', '4', null);
INSERT INTO `orders` VALUES ('8', '1', '2016-05-06 14:55:20', '8', null);
INSERT INTO `orders` VALUES ('9', '1', '2016-05-06 15:08:33', '9', null);
INSERT INTO `orders` VALUES ('10', '1', '2016-05-06 15:15:35', '7', null);
INSERT INTO `orders` VALUES ('11', '2', '2016-05-06 15:26:52', '4', null);
INSERT INTO `orders` VALUES ('12', '1', '2016-05-06 16:49:59', '7', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1', '1', '2', '2', '1');
INSERT INTO `user` VALUES ('2', '2', '2', '2', '2', '2', '2');
INSERT INTO `user` VALUES ('3', '3', '3', '3', '3', '3', '3');
INSERT INTO `user` VALUES ('4', '4', '4', '4', '4', '4', '4');
INSERT INTO `user` VALUES ('5', '5', '5', '5', '5', '5', '5');
INSERT INTO `user` VALUES ('6', '6', '6', '6', '6', '6', '6');
INSERT INTO `user` VALUES ('7', '7', '7', '7', '7', '7', '7');
INSERT INTO `user` VALUES ('8', '8', '8', '8', '8', '8', '8');
INSERT INTO `user` VALUES ('9', '9', '9', '9', '9', '9', '9');

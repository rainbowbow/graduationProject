/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-28 15:00:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product_record
-- ----------------------------
DROP TABLE IF EXISTS `product_record`;
CREATE TABLE `product_record` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(200) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_money` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_record
-- ----------------------------
INSERT INTO `product_record` VALUES ('1', 'apple', '5.00', '100', '1', 'mm', '2017-02-03 00:00:00', '21', '500');
INSERT INTO `product_record` VALUES ('3', '3', '3.00', '3', '3', '3', '2017-01-01 00:00:00', '3', '3');
INSERT INTO `product_record` VALUES ('4', '3', '4.00', '4', '4', '4', '2013-01-10 00:00:00', '2', '2');

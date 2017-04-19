/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-19 16:18:30
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
  `order_time` datetime DEFAULT NULL,
  `total_money` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_record
-- ----------------------------
INSERT INTO `product_record` VALUES ('1', 'apple', '5.00', '100', '1', '2017-02-03 00:00:00', '500', '福建省', '喵喵', '11');
INSERT INTO `product_record` VALUES ('3', '3', '3.00', '31', '3', '2017-01-01 00:00:00', '3', '漳浦县', '小喵', '34');
INSERT INTO `product_record` VALUES ('20', '花生', '7.79', '99', '4', '2017-04-19 14:59:36', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850');
INSERT INTO `product_record` VALUES ('21', 'bigApple', '3.00', '1', '4', '2017-04-19 14:59:36', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850');
INSERT INTO `product_record` VALUES ('22', '花生', '7.79', '9', '4', '2017-04-19 15:01:03', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('23', 'bigApple', '3.00', '1', '4', '2017-04-19 15:01:03', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('24', '花生', '7.79', '99', '4', '2017-04-19 15:03:35', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850');
INSERT INTO `product_record` VALUES ('25', 'bigApple', '3.00', '1', '4', '2017-04-19 15:03:35', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850');
INSERT INTO `product_record` VALUES ('26', 'orange', '5.80', '1', '4', '2017-04-19 15:06:42', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('27', '花生', '7.79', '1', '4', '2017-04-19 15:06:42', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('28', '花生', '7.79', '1', '4', '2017-04-19 15:15:48', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('29', 'orange', '5.80', '1', '4', '2017-04-19 15:15:48', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('30', '花生', '7.79', '1', '4', '2017-04-19 15:20:04', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');
INSERT INTO `product_record` VALUES ('31', 'orange', '5.80', '1', '4', '2017-04-19 15:20:04', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110');

/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-19 16:18:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_detail` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '4', '新港城', '0', '林小妙', '18450051850', '福建省漳州市漳浦县');
INSERT INTO `address` VALUES ('3', '4', '福州市大学城福建工程学院北区', '1', '喵喵', '110', '福建省福州市闽侯县');
INSERT INTO `address` VALUES ('7', '4', 'null33', '0', '12而发热', '额问问33', '');
INSERT INTO `address` VALUES ('9', '3', '22', '1', '哈哈哈', '110', null);

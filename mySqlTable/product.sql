/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-28 15:00:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `price` double(6,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `type` int(255) NOT NULL COMMENT '1:在售 0：库存',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', 'bea', '7.00', '200', null, '0');
INSERT INTO `product` VALUES ('5', '花生', '7.79', '400', '新鲜的花生', '1');
INSERT INTO `product` VALUES ('22', 'bigApple', '3.00', '3', '', '0');
INSERT INTO `product` VALUES ('23', '33', '33.00', '33', '', '1');
INSERT INTO `product` VALUES ('24', '22', '22.00', '22', '', '1');
INSERT INTO `product` VALUES ('27', '111', '11.00', '111', '', '1');

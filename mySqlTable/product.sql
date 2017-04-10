/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-10 17:36:24
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
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', '豆子', '7.00', '2001', '', '1', 'bean.png');
INSERT INTO `product` VALUES ('5', '花生', '7.79', '400', '新鲜的花生', '1', 'peanut.png');
INSERT INTO `product` VALUES ('22', 'bigApple', '3.00', '3', '', '0', 'apple.png');
INSERT INTO `product` VALUES ('28', 'orange', '5.80', '200', '', '1', 'orange.png');
INSERT INTO `product` VALUES ('29', 'potato', '1.80', '111', null, '1', 'potato.png');

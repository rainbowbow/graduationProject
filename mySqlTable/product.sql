/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-19 16:18:22
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', '豆子', '7.00', '2001', '', '0', 'bean.png');
INSERT INTO `product` VALUES ('5', '花生', '7.79', '398', '新鲜的花生', '1', 'peanut.png');
INSERT INTO `product` VALUES ('6', '2211', '111.00', '1111', '11', '0', 'potato.png');
INSERT INTO `product` VALUES ('22', 'bigApple', '3.00', '0', '', '1', 'apple.png');
INSERT INTO `product` VALUES ('28', 'orange', '5.80', '199', '', '1', 'orange.png');

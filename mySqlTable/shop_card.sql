/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-28 15:00:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shop_card
-- ----------------------------
DROP TABLE IF EXISTS `shop_card`;
CREATE TABLE `shop_card` (
  `shop_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '0:失效商品；1：正常产品',
  PRIMARY KEY (`shop_card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shop_card
-- ----------------------------
INSERT INTO `shop_card` VALUES ('1', '1', '1', '11', '1');
INSERT INTO `shop_card` VALUES ('2', '4', '22', '1', '1');
INSERT INTO `shop_card` VALUES ('3', '4', '2', '1', '1');

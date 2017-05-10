/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-10 14:52:15
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
  `type` int(11) DEFAULT NULL COMMENT '1:默认',
  `address_name` varchar(255) DEFAULT NULL,
  `address_phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('14', '4', '新港城', '0', '小鱼儿', '18450051824', '福建省漳州市漳浦县');
INSERT INTO `address` VALUES ('15', '4', '古雷镇', '1', '林小喵', '1845005150', '福建省漳州市漳浦县');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', '豆子', '7.00', '19991', '', '0', '1492942660706bean.png');
INSERT INTO `product` VALUES ('5', '花生', '7.79', '57', '新鲜的花生', '1', 'peanut.png');
INSERT INTO `product` VALUES ('22', 'bigApple', '3.00', '1', '', '0', 'apple.png');
INSERT INTO `product` VALUES ('28', 'orange', '5.80', '1', '', '0', 'orange.png');
INSERT INTO `product` VALUES ('30', '芒果', '21.00', '22', '22', '1', 'product.png');
INSERT INTO `product` VALUES ('33', '11', '11.00', '11', '1', '0', 'product.png');
INSERT INTO `product` VALUES ('34', '苦瓜', '3.30', '100', '', '1', '1493197173370.png');
INSERT INTO `product` VALUES ('35', '土豆', '2.50', '100', '', '1', '1493197256350.png');

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
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '1:正常订单 0：表示用户删除了的，用户不可见',
  `state` varchar(255) DEFAULT NULL COMMENT '订单状态；0：表示未配送，用户可取消；1：表示配送中，用户不能取消；2:失效订单，被用户取消了的订单',
  `product_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_record
-- ----------------------------
INSERT INTO `product_record` VALUES ('1', 'apple', '5.00', '100', '1', '2017-02-03 00:00:00', '500', '福建省', '喵喵', '11', '1', '0', null);
INSERT INTO `product_record` VALUES ('3', '3', '3.00', '31', '3', '2017-01-01 00:00:00', '3', '漳浦县', '小喵', '34', '1', '0', null);
INSERT INTO `product_record` VALUES ('20', '花生', '7.79', '99', '4', '2017-04-19 14:59:36', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850', '0', '1', '5');
INSERT INTO `product_record` VALUES ('21', 'bigApple', '3.00', '1', '4', '2017-04-19 14:59:36', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850', '0', '1', '22');
INSERT INTO `product_record` VALUES ('22', '花生', '7.79', '9', '4', '2017-04-19 15:01:03', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110', '0', '1', '5');
INSERT INTO `product_record` VALUES ('23', 'bigApple', '3.00', '1', '4', '2017-04-19 15:01:03', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110', '0', '1', '22');
INSERT INTO `product_record` VALUES ('24', '花生', '7.79', '99', '4', '2017-04-19 15:03:35', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850', '1', '1', '5');
INSERT INTO `product_record` VALUES ('25', 'bigApple', '3.00', '1', '4', '2017-04-19 15:03:35', null, '福建省漳州市漳浦县新港城', '林小妙', '18450051850', '1', '1', '22');
INSERT INTO `product_record` VALUES ('26', 'orange', '5.80', '1', '4', '2017-04-19 15:06:42', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110', '1', '1', null);
INSERT INTO `product_record` VALUES ('27', '花生', '7.79', '2', '4', '2017-04-26 09:13:48', null, '天津市天津市市辖区和平区11', '小五', '11', '1', '2', '5');
INSERT INTO `product_record` VALUES ('28', 'orange', '5.80', '1', '4', '2017-04-26 09:13:48', null, '天津市天津市市辖区和平区11', '小五', '11', '1', '2', '28');
INSERT INTO `product_record` VALUES ('29', 'orange', '5.80', '1', '4', '2017-04-26 09:14:18', null, '福建省福州市闽侯县福州市大学城福建工程学院北区', '喵喵', '110', '1', '0', '28');
INSERT INTO `product_record` VALUES ('30', 'orange', '5.80', '1', '4', '2017-04-26 15:49:24', null, '北京市北京市市辖区东城区福州市大学城福建工程学院北区', '16', '11111111116', '1', '0', '28');
INSERT INTO `product_record` VALUES ('31', 'bigApple', '3.00', '21', '4', '2017-04-27 10:51:33', null, '新港城', '林小妙', '18450051850', '0', '0', '22');
INSERT INTO `product_record` VALUES ('32', '花生', '7.79', '223', '4', '2017-04-27 11:15:15', null, '新港城', '林小妙', '18450051850', '1', '1', '5');
INSERT INTO `product_record` VALUES ('33', 'orange', '5.80', '1', '4', '2017-04-27 11:31:52', null, '新港城', '林小妙', '18450051850', '0', '0', '28');
INSERT INTO `product_record` VALUES ('34', '花生', '7.79', '9', '4', '2017-04-27 11:33:11', null, '北京市北京市市辖区东城区福州市大学城福建工程', '16', '11111111116', '0', '2', '5');
INSERT INTO `product_record` VALUES ('35', 'bigApple', '3.00', '1', '4', '2017-04-27 11:33:41', null, '北京市北京市市辖区东城区福州市大学城福建工程', '16', '11111111116', '1', '1', '22');
INSERT INTO `product_record` VALUES ('36', '芒果', '21.00', '2', '4', '2017-04-27 11:34:34', null, '新港城', '林小妙', '18450051850', '1', '1', '30');
INSERT INTO `product_record` VALUES ('37', '花生', '7.79', '1', '4', '2017-04-27 17:16:12', null, '福建省漳州市漳浦县新港城', '小鱼儿', '18450051824', '0', '2', '5');
INSERT INTO `product_record` VALUES ('38', '花生', '7.79', '1', '4', '2017-05-03 10:22:05', null, '福建省漳州市漳浦县古雷镇', '林小喵', '1845005150', '1', '0', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_card
-- ----------------------------
INSERT INTO `shop_card` VALUES ('1', '1', '1', '11', '1');
INSERT INTO `shop_card` VALUES ('2', '4', '2', '62', null);
INSERT INTO `shop_card` VALUES ('9', '4', '6', '1', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `praise_rate` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '0:admin; 11:user;  12:blackUser',
  `img_url` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'miao', '0', '福建', '11', '11', '1149923618@qq.com', '1', null, '0', '1493284619433.png', 'admin');
INSERT INTO `user` VALUES ('2', '喵喵', '0', '新港城', '18450051850', '18', '1149923618@qq.com', '1', '非常好', '12', '20170421103509.png', 'user');
INSERT INTO `user` VALUES ('3', '哈哈', '1', '工程', '111', '22', '11', '1', null, '11', '20170421103509.png', 'user');
INSERT INTO `user` VALUES ('4', 'mm', '0', 'hh', '11', '18', '1149923618@qq.com', '1', null, '11', '1493778162989.png', 'user');
INSERT INTO `user` VALUES ('8', 'm', '0', '', '11111111111', '18', '1111@qq.com', '1', null, '11', '1493283131580.png', 'user');
INSERT INTO `user` VALUES ('9', 'mmm', '0', '', '11111111111', '18', '', '1', null, '11', '1493283719094.png', null);
INSERT INTO `user` VALUES ('10', '111', '1', '1', '11111111111', '11', '111@qq.com', '1', null, '11', '1493283997673.png', null);
INSERT INTO `user` VALUES ('11', '12', '1', '', '11111111111', '11', '', '1', null, '11', '1493284425989.png', null);

/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-19 16:18:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `praise_rate` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '0:admin; 11:user;  12:blackUser',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'miao', '0', '福建', '11', '11', '1', '1', null, '0');
INSERT INTO `user` VALUES ('2', '喵喵', '0', '新港城', '18450051850', '18', '1149923618@qq.com', '1', '非常好', '0');
INSERT INTO `user` VALUES ('3', '哈哈', '1', '工程', '111', '22', '11', '1', null, '11');
INSERT INTO `user` VALUES ('4', 'mm', '0', 'hh', '11', '18', '77', '1', null, '11');

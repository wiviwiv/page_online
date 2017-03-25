/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : pageoline

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-03-25 12:33:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for page_content
-- ----------------------------
DROP TABLE IF EXISTS `page_content`;
CREATE TABLE `page_content` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `Content_status` smallint(3) NOT NULL DEFAULT '201',
  `content_start` int(10) NOT NULL,
  `content_last_end` int(10) NOT NULL,
  `content_text` mediumtext NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `page_ids` (`pid`),
  CONSTRAINT `page_ids` FOREIGN KEY (`pid`) REFERENCES `page_info` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_content
-- ----------------------------

-- ----------------------------
-- Table structure for page_group
-- ----------------------------
DROP TABLE IF EXISTS `page_group`;
CREATE TABLE `page_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `group_status` smallint(3) NOT NULL DEFAULT '200',
  `Group_description` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_group
-- ----------------------------
INSERT INTO `page_group` VALUES ('1', '默认课程', '200', '默认的测试课程组');

-- ----------------------------
-- Table structure for page_info
-- ----------------------------
DROP TABLE IF EXISTS `page_info`;
CREATE TABLE `page_info` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(100) NOT NULL DEFAULT '未命名课程',
  `page_direction` varchar(255) NOT NULL DEFAULT '没有说明',
  `page_type` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `Page_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `start_time` int(10) NOT NULL,
  `page_status` smallint(3) NOT NULL DEFAULT '201',
  `page_group_id` int(10) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `page_direction` (`page_direction`),
  KEY `users_ids` (`uid`),
  KEY `group_ids` (`page_group_id`),
  CONSTRAINT `group_ids` FOREIGN KEY (`page_group_id`) REFERENCES `page_group` (`gid`),
  CONSTRAINT `users_ids` FOREIGN KEY (`uid`) REFERENCES `user_login` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_info
-- ----------------------------
INSERT INTO `page_info` VALUES ('1', '未命名课程', '没有说明', '0', '1000', '0.00', '1443205000', '201', '1');

-- ----------------------------
-- Table structure for page_order
-- ----------------------------
DROP TABLE IF EXISTS `page_order`;
CREATE TABLE `page_order` (
  `oid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `order_num` varchar(32) NOT NULL,
  `order_much` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Order_description` varchar(32) NOT NULL DEFAULT '正常购买',
  `order_status` smallint(3) NOT NULL DEFAULT '201',
  `order_start` int(10) NOT NULL,
  `order_end` int(10) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `u_id` (`uid`),
  KEY `page_infos` (`pid`),
  CONSTRAINT `page_infos` FOREIGN KEY (`pid`) REFERENCES `page_info` (`pid`),
  CONSTRAINT `u_id` FOREIGN KEY (`uid`) REFERENCES `user_login` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_order
-- ----------------------------

-- ----------------------------
-- Table structure for page_result
-- ----------------------------
DROP TABLE IF EXISTS `page_result`;
CREATE TABLE `page_result` (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `page_score_all` decimal(10,1) NOT NULL,
  `page_score_count` int(10) NOT NULL,
  `Page_view_count` int(10) NOT NULL,
  `Page_user_count` int(10) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `p_info` (`pid`),
  CONSTRAINT `p_info` FOREIGN KEY (`pid`) REFERENCES `page_info` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_result
-- ----------------------------
INSERT INTO `page_result` VALUES ('1', '1', '9.6', '0', '0', '0');

-- ----------------------------
-- Table structure for study_group
-- ----------------------------
DROP TABLE IF EXISTS `study_group`;
CREATE TABLE `study_group` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `S_title` varchar(50) NOT NULL DEFAULT '未定义学习小组',
  `S_description` varchar(255) NOT NULL DEFAULT '好好学习，天天向上',
  `s_start` int(10) NOT NULL,
  `s_end` int(10) NOT NULL,
  `s_status` smallint(3) NOT NULL DEFAULT '201',
  PRIMARY KEY (`sid`),
  KEY `page_info` (`pid`),
  CONSTRAINT `page_info` FOREIGN KEY (`pid`) REFERENCES `page_info` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of study_group
-- ----------------------------

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `identity_type` tinyint(1) NOT NULL DEFAULT '1',
  `Identifier` varchar(255) NOT NULL,
  `last_time` int(10) NOT NULL,
  `last_source` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `uid` (`uid`),
  CONSTRAINT `user_login` FOREIGN KEY (`uid`) REFERENCES `user_login` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `gid` smallint(2) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) NOT NULL,
  `group_type` tinyint(2) NOT NULL,
  `group_status` smallint(3) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '预注册用户', '0', '200');
INSERT INTO `user_group` VALUES ('2', '普通用户组', '1', '200');
INSERT INTO `user_group` VALUES ('3', '课程管理员组', '2', '200');
INSERT INTO `user_group` VALUES ('4', '区域管理员', '3', '200');
INSERT INTO `user_group` VALUES ('5', '超级管理员组', '4', '200');

-- ----------------------------
-- Table structure for user_in_stady
-- ----------------------------
DROP TABLE IF EXISTS `user_in_stady`;
CREATE TABLE `user_in_stady` (
  `iind` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `u_start` int(10) NOT NULL,
  `u_end` int(10) NOT NULL,
  `u_status` smallint(3) NOT NULL DEFAULT '201',
  PRIMARY KEY (`iind`),
  KEY `user_info` (`uid`),
  KEY `sid` (`sid`),
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `study_group` (`sid`),
  CONSTRAINT `user_info` FOREIGN KEY (`uid`) REFERENCES `user_login` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_in_stady
-- ----------------------------

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `user_email` varchar(32) NOT NULL,
  `user_status` smallint(3) NOT NULL DEFAULT '302',
  `group_id` smallint(1) NOT NULL DEFAULT '1',
  `user_activeCode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_email` (`user_email`),
  KEY `user_name` (`user_name`),
  KEY `groupid` (`group_id`),
  CONSTRAINT `group` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('1000', 'wivwiv', 'bigpar@qq.com', '302', '1', '60182892b22266c47b617c40a67795ce');

-- ----------------------------
-- Table structure for user_ways
-- ----------------------------
DROP TABLE IF EXISTS `user_ways`;
CREATE TABLE `user_ways` (
  `wid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `way_start` int(10) NOT NULL,
  `way_last` int(10) NOT NULL,
  `way_bye` smallint(3) NOT NULL,
  `way_much` smallint(3) NOT NULL,
  `way_status` smallint(3) NOT NULL DEFAULT '200',
  PRIMARY KEY (`wid`),
  KEY `user_id` (`uid`),
  KEY `p_id` (`pid`),
  CONSTRAINT `p_id` FOREIGN KEY (`pid`) REFERENCES `page_info` (`pid`),
  CONSTRAINT `user_id` FOREIGN KEY (`uid`) REFERENCES `user_login` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_ways
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : heima_ssm

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-06-10 09:24:11
*/
use heima_ssm ;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS 'member';
CREATE TABLE `member` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phonenum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(32) NOT NULL,
  `ordernum` varchar(20) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peoplecount` int(11) DEFAULT NULL,
  `orderdesc` varchar(500) DEFAULT NULL,
  `paytype` int(11) DEFAULT NULL,
  `orderstatus` int(11) DEFAULT NULL,
  `productid` varchar(32) DEFAULT NULL,
  `memberid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2019-06-07 20:39:57', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderid` varchar(32) NOT NULL,
  `travellerid` varchar(32) NOT NULL,
  PRIMARY KEY (`orderid`,`travellerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(32) NOT NULL,
  `permissionname` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('B1085B6C6F0B472591A8B1D95B0918A9', '查询用户', '/user/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(32) NOT NULL,
  `productnum` varchar(50) DEFAULT NULL,
  `productname` varchar(50) DEFAULT NULL,
  `cityname` varchar(50) DEFAULT NULL,
  `departuretime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productprice` double DEFAULT NULL,
  `productdesc` varchar(500) DEFAULT NULL,
  `productstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', '2019-06-07 20:39:58', '1800', '魔都我来了', '0');
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2019-06-07 20:39:58', '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2019-06-07 20:39:58', '1200', '不错的旅行', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `rolename` varchar(50) DEFAULT NULL,
  `roledesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('65F020BDB61B4A4D8ACFD42A78A55D58', '法师', '法师法师');
INSERT INTO `role` VALUES ('7FA3B97C9AB74A0DA51637F32FDC20C9', '坦克', '坦克坦克');
INSERT INTO `role` VALUES ('9FEE089E58E34603A13D85A45B026B8F', '辅助', '辅助辅助');
INSERT INTO `role` VALUES ('B40562699D2049759B08B464B0C0EF49', '战士', '战士战士');
INSERT INTO `role` VALUES ('E5C9A859F1624607B99907549F6ECACE', '刺客', '刺客刺客');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionid` varchar(32) NOT NULL,
  `roleid` varchar(32) NOT NULL,
  PRIMARY KEY (`permissionid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('B1085B6C6F0B472591A8B1D95B0918A9', 'B40562699D2049759B08B464B0C0EF49');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` varchar(32) NOT NULL,
  `visittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executiontime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phonenum` varchar(20) DEFAULT NULL,
  `credentialstype` int(11) DEFAULT NULL,
  `credentialsnum` varchar(50) DEFAULT NULL,
  `travellertype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(32) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phonenum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3B25D9E58D7A4176A6498D24389E0ECA', '18967092313@163.com', '孙策', '$2a$10$SSsu4z55UHUKGFps.XRYNuaduev2ugfQ4WvK2ZetWlJ9KPSM.5Z5.', '18967092313', '1');
INSERT INTO `users` VALUES ('454620A66C684AC9BC4DBF6F0CBD5257', '18609991222@163.com', '亚瑟', '$2a$10$zBRWPRE03ufZ8K9.XqXvtO/eDOMCG8vw6lM6Qk2MMRjNVQUT9gIuq', '18609991222', '1');
INSERT INTO `users` VALUES ('46F8CC8305354A93B40DA898F6BBECE5', '18843093216@163.com', '程咬金', '$2a$10$ARBJqgfqX7QJZzgxJx0GfueyKglhoIMQIfrBU0WC1EgULSgpzk66i', '18843093216', '1');
INSERT INTO `users` VALUES ('744364E087E246B1BCAFE08778712229', '18823560912@163.com', '李白', '$2a$10$lnuCM1GorHsfqaiduIUGGeUHAmeAlegeegllLlkDUeqHkqPdWmRXm', '18823560912', '1');
INSERT INTO `users` VALUES ('BDC95679C40D4A23AF05D7B36A880F91', '18934210976@163.com', '张良', '$2a$10$kggu6gh4V3PCYj5HoxW0ee92mUrb9gZtoEEpyq0y1Q6PQlJk54zUe', '18934210976', '1');
INSERT INTO `users` VALUES ('BF73624542E9411B801F2AC1DED52E8D', '18890234512@163.com', '庄周', '$2a$10$C4/5.iXLy4GRNe0fzUv/f.XpotcXWaAQMFir2WafbEdoSsSLTJyV6', '18890234512', '1');
INSERT INTO `users` VALUES ('DD719334F24C4C4FA647FCDCFACD6BA2', 'admin@163.com', 'admin', '$2a$10$tpbfsmoPlYC82Vk4Pv9fxO6YSa0LMbMb8Uju.Juo1k6XDEfmOb55O', 'admin', '1');
INSERT INTO `users` VALUES ('E314B74AC5974B06AD13C734689128DE', '13534512097@163.com', '典韦', '$2a$10$mHmg9vUnHHoa7BmwJVZK1O6jNLeGbeBw/w/a9OeRxaq.iFMRcz4fC', '13534512097', '1');
INSERT INTO `users` VALUES ('F8A7A1C1DAFD45C8906BC042B206B132', '18965459023@163.com', '孙悟空', '$2a$10$KLh0ywD5xmmqSLLXNkKfIOPaejTT2WRd9jQYzWEIv.bjs6B7j.LaO', '18965459023', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userid` varchar(32) NOT NULL,
  `roleid` varchar(32) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('46F8CC8305354A93B40DA898F6BBECE5', '7FA3B97C9AB74A0DA51637F32FDC20C9');
INSERT INTO `users_role` VALUES ('46F8CC8305354A93B40DA898F6BBECE5', 'B40562699D2049759B08B464B0C0EF49');
INSERT INTO `users_role` VALUES ('BDC95679C40D4A23AF05D7B36A880F91', '65F020BDB61B4A4D8ACFD42A78A55D58');
INSERT INTO `users_role` VALUES ('BF73624542E9411B801F2AC1DED52E8D', '7FA3B97C9AB74A0DA51637F32FDC20C9');
INSERT INTO `users_role` VALUES ('BF73624542E9411B801F2AC1DED52E8D', '9FEE089E58E34603A13D85A45B026B8F');
INSERT INTO `users_role` VALUES ('DD719334F24C4C4FA647FCDCFACD6BA2', '65F020BDB61B4A4D8ACFD42A78A55D58');
INSERT INTO `users_role` VALUES ('DD719334F24C4C4FA647FCDCFACD6BA2', '7FA3B97C9AB74A0DA51637F32FDC20C9');
INSERT INTO `users_role` VALUES ('DD719334F24C4C4FA647FCDCFACD6BA2', '9FEE089E58E34603A13D85A45B026B8F');
INSERT INTO `users_role` VALUES ('DD719334F24C4C4FA647FCDCFACD6BA2', 'B40562699D2049759B08B464B0C0EF49');
INSERT INTO `users_role` VALUES ('DD719334F24C4C4FA647FCDCFACD6BA2', 'E5C9A859F1624607B99907549F6ECACE');
INSERT INTO `users_role` VALUES ('E314B74AC5974B06AD13C734689128DE', '7FA3B97C9AB74A0DA51637F32FDC20C9');
INSERT INTO `users_role` VALUES ('E314B74AC5974B06AD13C734689128DE', 'B40562699D2049759B08B464B0C0EF49');
INSERT INTO `users_role` VALUES ('F8A7A1C1DAFD45C8906BC042B206B132', 'B40562699D2049759B08B464B0C0EF49');
INSERT INTO `users_role` VALUES ('F8A7A1C1DAFD45C8906BC042B206B132', 'E5C9A859F1624607B99907549F6ECACE');

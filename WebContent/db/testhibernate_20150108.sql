/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : testhibernate

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2015-01-08 17:29:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address_many2one`
-- ----------------------------
DROP TABLE IF EXISTS `address_many2one`;
CREATE TABLE `address_many2one` (
  `id` int(11) NOT NULL auto_increment,
  `street_name` varchar(40) default NULL,
  `city_name` varchar(40) default NULL,
  `state_name` varchar(40) default NULL,
  `zipcode` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_many2one
-- ----------------------------
INSERT INTO `address_many2one` VALUES ('1', 'Kondapur', 'Hyderabad', 'AP', '532');

-- ----------------------------
-- Table structure for `address_one2one`
-- ----------------------------
DROP TABLE IF EXISTS `address_one2one`;
CREATE TABLE `address_one2one` (
  `id` int(11) NOT NULL auto_increment,
  `street_name` varchar(40) default NULL,
  `city_name` varchar(40) default NULL,
  `state_name` varchar(40) default NULL,
  `zipcode` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_one2one
-- ----------------------------
INSERT INTO `address_one2one` VALUES ('3', 'Kondapur', 'Hyderabad', 'AP', '532');
INSERT INTO `address_one2one` VALUES ('4', 'Saharanpur', 'Ambehta', 'UP', '111');

-- ----------------------------
-- Table structure for `certificate`
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(30) default NULL,
  `employee_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate
-- ----------------------------

-- ----------------------------
-- Table structure for `certificate_list`
-- ----------------------------
DROP TABLE IF EXISTS `certificate_list`;
CREATE TABLE `certificate_list` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(30) default NULL,
  `idx` int(11) default NULL,
  `employee_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK73395E66AB2589A8` (`employee_id`),
  CONSTRAINT `FK73395E66AB2589A8` FOREIGN KEY (`employee_id`) REFERENCES `employee_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate_list
-- ----------------------------
INSERT INTO `certificate_list` VALUES ('1', 'MCA', '0', '1');
INSERT INTO `certificate_list` VALUES ('2', 'MBA', '1', '1');
INSERT INTO `certificate_list` VALUES ('3', 'PMP', '2', '1');

-- ----------------------------
-- Table structure for `certificate_many2many`
-- ----------------------------
DROP TABLE IF EXISTS `certificate_many2many`;
CREATE TABLE `certificate_many2many` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate_many2many
-- ----------------------------
INSERT INTO `certificate_many2many` VALUES ('4', 'MBA');
INSERT INTO `certificate_many2many` VALUES ('5', 'PMP');
INSERT INTO `certificate_many2many` VALUES ('6', 'MCA');

-- ----------------------------
-- Table structure for `certificate_one2many`
-- ----------------------------
DROP TABLE IF EXISTS `certificate_one2many`;
CREATE TABLE `certificate_one2many` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(30) default NULL,
  `employee_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK877B70D35A43AE35` (`employee_id`),
  CONSTRAINT `FK877B70D35A43AE35` FOREIGN KEY (`employee_id`) REFERENCES `employee_one2many` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate_one2many
-- ----------------------------
INSERT INTO `certificate_one2many` VALUES ('6', 'MBA', '3');
INSERT INTO `certificate_one2many` VALUES ('7', 'PMP', '3');
INSERT INTO `certificate_one2many` VALUES ('8', 'MCA', '3');

-- ----------------------------
-- Table structure for `certificate_set`
-- ----------------------------
DROP TABLE IF EXISTS `certificate_set`;
CREATE TABLE `certificate_set` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(30) default NULL,
  `employee_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKBF9B17A95161C30` (`employee_id`),
  CONSTRAINT `FKBF9B17A95161C30` FOREIGN KEY (`employee_id`) REFERENCES `employee_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate_set
-- ----------------------------
INSERT INTO `certificate_set` VALUES ('11', 'MBA', '5');
INSERT INTO `certificate_set` VALUES ('12', 'PMP', '5');
INSERT INTO `certificate_set` VALUES ('13', 'MCA', '5');

-- ----------------------------
-- Table structure for `certificate_sortedset`
-- ----------------------------
DROP TABLE IF EXISTS `certificate_sortedset`;
CREATE TABLE `certificate_sortedset` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(30) default NULL,
  `employee_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKA2C0B9DBE0D12B3` (`employee_id`),
  CONSTRAINT `FKA2C0B9DBE0D12B3` FOREIGN KEY (`employee_id`) REFERENCES `employee_sortedset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate_sortedset
-- ----------------------------
INSERT INTO `certificate_sortedset` VALUES ('1', 'MBA', '1');
INSERT INTO `certificate_sortedset` VALUES ('2', 'MCA', '1');
INSERT INTO `certificate_sortedset` VALUES ('3', 'PMP', '1');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('6', 'Zara', 'Ali', '5000');
INSERT INTO `employee` VALUES ('8', 'John', 'Paul', '10000');

-- ----------------------------
-- Table structure for `employee_annotations`
-- ----------------------------
DROP TABLE IF EXISTS `employee_annotations`;
CREATE TABLE `employee_annotations` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_annotations
-- ----------------------------
INSERT INTO `employee_annotations` VALUES ('1', 'Zara', 'Ali', '5000');
INSERT INTO `employee_annotations` VALUES ('3', 'John', 'Paul', '10000');

-- ----------------------------
-- Table structure for `employee_list`
-- ----------------------------
DROP TABLE IF EXISTS `employee_list`;
CREATE TABLE `employee_list` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_list
-- ----------------------------
INSERT INTO `employee_list` VALUES ('1', 'Manoj', 'Kumar', '5000');

-- ----------------------------
-- Table structure for `employee_many2many`
-- ----------------------------
DROP TABLE IF EXISTS `employee_many2many`;
CREATE TABLE `employee_many2many` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_many2many
-- ----------------------------
INSERT INTO `employee_many2many` VALUES ('3', 'Manoj', 'Kumar', '5000');

-- ----------------------------
-- Table structure for `employee_many2one`
-- ----------------------------
DROP TABLE IF EXISTS `employee_many2one`;
CREATE TABLE `employee_many2one` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  `address` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK365FA224D908FBAB` (`address`),
  CONSTRAINT `FK365FA224D908FBAB` FOREIGN KEY (`address`) REFERENCES `address_many2one` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_many2one
-- ----------------------------
INSERT INTO `employee_many2one` VALUES ('1', 'Manoj', 'Kumar', '5000', '1');

-- ----------------------------
-- Table structure for `employee_one2many`
-- ----------------------------
DROP TABLE IF EXISTS `employee_one2many`;
CREATE TABLE `employee_one2many` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_one2many
-- ----------------------------
INSERT INTO `employee_one2many` VALUES ('3', 'Manoj', 'Kumar', '5000');

-- ----------------------------
-- Table structure for `employee_one2one`
-- ----------------------------
DROP TABLE IF EXISTS `employee_one2one`;
CREATE TABLE `employee_one2one` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  `address` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK91B07B89E110D7AA` (`address`),
  CONSTRAINT `FK91B07B89E110D7AA` FOREIGN KEY (`address`) REFERENCES `address_one2one` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_one2one
-- ----------------------------
INSERT INTO `employee_one2one` VALUES ('1', 'Manoj', 'Kumar', '5000', '3');
INSERT INTO `employee_one2one` VALUES ('2', 'Dilip', 'Kumar', '3000', '4');

-- ----------------------------
-- Table structure for `employee_set`
-- ----------------------------
DROP TABLE IF EXISTS `employee_set`;
CREATE TABLE `employee_set` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_set
-- ----------------------------
INSERT INTO `employee_set` VALUES ('5', 'Manoj', 'Kumar', '5000');

-- ----------------------------
-- Table structure for `employee_sortedset`
-- ----------------------------
DROP TABLE IF EXISTS `employee_sortedset`;
CREATE TABLE `employee_sortedset` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `salary` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_sortedset
-- ----------------------------
INSERT INTO `employee_sortedset` VALUES ('1', 'Manoj', 'Kumar', '5000');

-- ----------------------------
-- Table structure for `emp_cert_many2many`
-- ----------------------------
DROP TABLE IF EXISTS `emp_cert_many2many`;
CREATE TABLE `emp_cert_many2many` (
  `employee_id` int(11) NOT NULL,
  `certificate_id` int(11) NOT NULL,
  PRIMARY KEY  (`employee_id`,`certificate_id`),
  KEY `FK25A656AE6D962DAE` (`certificate_id`),
  KEY `FK25A656AE706F97E0` (`employee_id`),
  CONSTRAINT `FK25A656AE706F97E0` FOREIGN KEY (`employee_id`) REFERENCES `employee_many2many` (`id`),
  CONSTRAINT `FK25A656AE6D962DAE` FOREIGN KEY (`certificate_id`) REFERENCES `certificate_many2many` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_cert_many2many
-- ----------------------------
INSERT INTO `emp_cert_many2many` VALUES ('3', '4');
INSERT INTO `emp_cert_many2many` VALUES ('3', '5');
INSERT INTO `emp_cert_many2many` VALUES ('3', '6');

/*
Navicat MySQL Data Transfer

Source Server         : lampp
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : open_judge

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-09-01 22:19:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`admin_id`,`admin_user`,`admin_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Open Judge Admin', 'sample@example.com', null);

-- ----------------------------
-- Table structure for `bulk_user_package`
-- ----------------------------
DROP TABLE IF EXISTS `bulk_user_package`;
CREATE TABLE `bulk_user_package` (
  `bulk_user_package_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bulk_user_package_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contest_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bulk_user_package_id`),
  KEY `bulkuser_cont_FK1` (`contest_id`),
  CONSTRAINT `bulkuser_cont_FK1` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bulk_user_package
-- ----------------------------

-- ----------------------------
-- Table structure for `bulk_user_rel`
-- ----------------------------
DROP TABLE IF EXISTS `bulk_user_rel`;
CREATE TABLE `bulk_user_rel` (
  `bulk_user_rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `bulk_user_package_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bulk_user_rel_id`),
  KEY `bulk_rel_bulk_FK1` (`bulk_user_package_id`),
  KEY `bul_rel_user_FK2` (`user_id`),
  CONSTRAINT `bul_rel_user_FK2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bulk_rel_bulk_FK1` FOREIGN KEY (`bulk_user_package_id`) REFERENCES `bulk_user_package` (`bulk_user_package_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bulk_user_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'geometry');
INSERT INTO `category` VALUES ('2', 'greedy');
INSERT INTO `category` VALUES ('3', 'dp');
INSERT INTO `category` VALUES ('4', 'implementation');
INSERT INTO `category` VALUES ('5', 'math');
INSERT INTO `category` VALUES ('6', 'ds');
INSERT INTO `category` VALUES ('7', 'graph');
INSERT INTO `category` VALUES ('8', 'number theory');
INSERT INTO `category` VALUES ('9', 'game theory');
INSERT INTO `category` VALUES ('10', 'string');

-- ----------------------------
-- Table structure for `clarification`
-- ----------------------------
DROP TABLE IF EXISTS `clarification`;
CREATE TABLE `clarification` (
  `clarification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clarification_question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clarification_reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clarification_status` tinyint(2) NOT NULL DEFAULT '0',
  `clarification_time` datetime NOT NULL,
  `contest_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `judge_id` int(10) unsigned DEFAULT NULL,
  `problem_id` int(10) unsigned DEFAULT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`clarification_id`),
  KEY `clar_user_FK1` (`user_id`),
  KEY `clar_judge_FK2` (`judge_id`),
  KEY `clar_prob_FK3` (`problem_id`),
  KEY `clar_cont_FK4` (`contest_id`),
  KEY `clar_admin_FK1` (`admin_id`),
  CONSTRAINT `clar_admin_FK1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clar_cont_FK4` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clar_judge_FK2` FOREIGN KEY (`judge_id`) REFERENCES `judge` (`judge_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clar_prob_FK3` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clar_user_FK1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clarification
-- ----------------------------

-- ----------------------------
-- Table structure for `contest`
-- ----------------------------
DROP TABLE IF EXISTS `contest`;
CREATE TABLE `contest` (
  `contest_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contest_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contest_type` tinyint(2) NOT NULL DEFAULT '0',
  `contest_pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contest_start` datetime NOT NULL,
  `contest_end` datetime NOT NULL,
  `contest_status` tinyint(2) DEFAULT '-1',
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contest
-- ----------------------------

-- ----------------------------
-- Table structure for `judge`
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge` (
  `judge_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judge_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `judge_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `judge_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `judge_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `judge_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`judge_id`,`judge_user`,`judge_email`),
  KEY `judge_id` (`judge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of judge
-- ----------------------------

-- ----------------------------
-- Table structure for `judge_cont_rel`
-- ----------------------------
DROP TABLE IF EXISTS `judge_cont_rel`;
CREATE TABLE `judge_cont_rel` (
  `judge_cont_rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judge_id` int(10) unsigned NOT NULL,
  `contest_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`judge_cont_rel_id`),
  KEY `judge_cont_judge_FK1` (`judge_id`),
  KEY `judge_cont_cont_FK2` (`contest_id`),
  CONSTRAINT `judge_cont_cont_FK2` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_cont_judge_FK1` FOREIGN KEY (`judge_id`) REFERENCES `judge` (`judge_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of judge_cont_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'GNU C11');
INSERT INTO `language` VALUES ('2', 'GNU C++14');

-- ----------------------------
-- Table structure for `prob_cat_rel`
-- ----------------------------
DROP TABLE IF EXISTS `prob_cat_rel`;
CREATE TABLE `prob_cat_rel` (
  `prob_cat_rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `problem_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`prob_cat_rel_id`),
  KEY `prob_cat_cat_FK1` (`category_id`),
  KEY `prob_cat_prob_FK2` (`problem_id`),
  CONSTRAINT `prob_cat_cat_FK1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prob_cat_prob_FK2` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of prob_cat_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `prob_cont_rel`
-- ----------------------------
DROP TABLE IF EXISTS `prob_cont_rel`;
CREATE TABLE `prob_cont_rel` (
  `prob_cont_rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(10) unsigned NOT NULL,
  `contest_id` int(10) unsigned NOT NULL,
  `prob_cont_rel_order` int(10) unsigned NOT NULL,
  `prob_cont_tried` int(11) NOT NULL DEFAULT '0',
  `prob_cont_solved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`prob_cont_rel_id`),
  KEY `prob_cont_prob_FK1` (`problem_id`),
  KEY `prob_cont_cont_FK2` (`contest_id`),
  CONSTRAINT `prob_cont_cont_FK2` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prob_cont_prob_FK1` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of prob_cont_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `problem`
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `problem_level` tinyint(2) DEFAULT NULL,
  `problem_time_limit` int(10) NOT NULL,
  `problem_memory_limit` int(10) NOT NULL,
  `problem_input_channel` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_output_channel` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `problem_input` longtext COLLATE utf8_unicode_ci NOT NULL,
  `problem_output` longtext COLLATE utf8_unicode_ci NOT NULL,
  `problem_sample_input` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_sample_output` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `problem_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_add_date` datetime NOT NULL,
  `problem_judge_input` longtext COLLATE utf8_unicode_ci,
  `problem_judge_output` longtext COLLATE utf8_unicode_ci NOT NULL,
  `problem_io_type` tinyint(2) NOT NULL DEFAULT '0',
  `problem_hint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_setter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_status` tinyint(2) NOT NULL DEFAULT '0',
  `problem_special_judge` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of problem
-- ----------------------------

-- ----------------------------
-- Table structure for `rank`
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `rank_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contest_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rank_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank_solved` tinyint(4) NOT NULL DEFAULT '0',
  `rank_penalty` int(11) NOT NULL DEFAULT '0',
  `rank_disqualified` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`rank_id`),
  KEY `rank_contest_FK1` (`contest_id`),
  KEY `rank_user_FK2` (`user_id`),
  CONSTRAINT `rank_contest_FK1` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rank_user_FK2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rank
-- ----------------------------

-- ----------------------------
-- Table structure for `submission`
-- ----------------------------
DROP TABLE IF EXISTS `submission`;
CREATE TABLE `submission` (
  `submission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `contest_id` int(10) unsigned DEFAULT NULL,
  `submission_source` blob NOT NULL,
  `submission_type` tinyint(4) NOT NULL DEFAULT '0',
  `submission_time` datetime NOT NULL,
  `submission_status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_result` tinyint(2) DEFAULT NULL,
  `language_id` int(10) unsigned NOT NULL,
  `submission_tle` float NOT NULL,
  PRIMARY KEY (`submission_id`),
  KEY `sub_prob_FK1` (`problem_id`),
  KEY `sub_user_FK2` (`user_id`),
  KEY `sub_cont_FK3` (`contest_id`),
  KEY `sub_lang_FK4` (`language_id`),
  CONSTRAINT `sub_cont_FK3` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_lang_FK4` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_prob_FK1` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_user_FK2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of submission
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `user_status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`,`user_handle`,`user_email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('26', 'ranklist', '5ed5c7d7358c2b0066a4f48f1c826159', 'Ranklist', 'sample@example.com', '1234567890', '0', '1');

-- ----------------------------
-- Table structure for `user_cont_rel`
-- ----------------------------
DROP TABLE IF EXISTS `user_cont_rel`;
CREATE TABLE `user_cont_rel` (
  `user_cont_rel` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `contest_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_cont_rel`),
  KEY `user_cont_user_FK1` (`user_id`),
  KEY `user_cont_cont_FK2` (`contest_id`),
  CONSTRAINT `user_cont_cont_FK2` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_cont_user_FK1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_cont_rel
-- ----------------------------

-- ----------------------------
-- View structure for `prob_for_display`
-- ----------------------------
DROP VIEW IF EXISTS `prob_for_display`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prob_for_display` AS select `problem`.`problem_id` AS `problem_id`,`problem`.`problem_name` AS `problem_name`,`problem`.`problem_level` AS `problem_level`,`problem`.`problem_time_limit` AS `problem_time_limit`,`problem`.`problem_memory_limit` AS `problem_memory_limit`,`problem`.`problem_input_channel` AS `problem_input_channel`,`problem`.`problem_output_channel` AS `problem_output_channel`,`problem`.`problem_description` AS `problem_description`,`problem`.`problem_input` AS `problem_input`,`problem`.`problem_output` AS `problem_output`,`problem`.`problem_sample_input` AS `problem_sample_input`,`problem`.`problem_sample_output` AS `problem_sample_output`,`problem`.`problem_image` AS `problem_image`,`problem`.`problem_add_date` AS `problem_add_date`,`problem`.`problem_io_type` AS `problem_io_type`,`problem`.`problem_hint` AS `problem_hint`,`problem`.`problem_setter` AS `problem_setter`,`problem`.`problem_status` AS `problem_status`,`problem`.`problem_special_judge` AS `problem_special_judge` from `problem` ;

-- ----------------------------
-- View structure for `submissions_without_source`
-- ----------------------------
DROP VIEW IF EXISTS `submissions_without_source`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `submissions_without_source` AS select `submission`.`submission_id` AS `submission_id`,`submission`.`problem_id` AS `problem_id`,`submission`.`user_id` AS `user_id`,`submission`.`contest_id` AS `contest_id`,`submission`.`submission_type` AS `submission_type`,`submission`.`submission_time` AS `submission_time`,`submission`.`submission_status` AS `submission_status`,`submission`.`submission_result` AS `submission_result`,`submission`.`language_id` AS `language_id`,`submission`.`submission_tle` AS `submission_tle` from `submission` ;

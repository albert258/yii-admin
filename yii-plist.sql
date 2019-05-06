/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : yii-plist

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-05-05 20:14:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('用户', '2', '1557049248');
INSERT INTO `auth_assignment` VALUES ('超级管理员', '1', '1557037722');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1557037640', '1557037640');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/site/captcha', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/site/login', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/site/logout', '2', null, null, null, '1557037641', '1557037641');
INSERT INTO `auth_item` VALUES ('/user/*', '2', null, null, null, '1557043518', '1557043518');
INSERT INTO `auth_item` VALUES ('/user/activate', '2', null, null, null, '1557044223', '1557044223');
INSERT INTO `auth_item` VALUES ('/user/change-password', '2', null, null, null, '1557056254', '1557056254');
INSERT INTO `auth_item` VALUES ('/user/create', '2', null, null, null, '1557050272', '1557050272');
INSERT INTO `auth_item` VALUES ('/user/delete', '2', null, null, null, '1557043518', '1557043518');
INSERT INTO `auth_item` VALUES ('/user/index', '2', null, null, null, '1557043518', '1557043518');
INSERT INTO `auth_item` VALUES ('/user/validate-form', '2', null, null, null, '1557053362', '1557053362');
INSERT INTO `auth_item` VALUES ('/user/view', '2', null, null, null, '1557043518', '1557043518');
INSERT INTO `auth_item` VALUES ('普通用户', '2', '普通用户', null, null, '1557049327', '1557049327');
INSERT INTO `auth_item` VALUES ('用户', '1', '普通用户', null, null, '1557043570', '1557049430');
INSERT INTO `auth_item` VALUES ('超级权限', '2', '超级权限', null, null, '1557037679', '1557037679');
INSERT INTO `auth_item` VALUES ('超级管理员', '1', '超级管理员', null, null, '1557037667', '1557037667');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('超级权限', '/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/user/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/user/reset-identity');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/debug/user/set-identity');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/site/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/site/*');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/site/error');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/site/error');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/site/index');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/site/index');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/site/login');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/site/login');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/*');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/activate');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/user/change-password');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/change-password');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/create');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/delete');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/index');
INSERT INTO `auth_item_child` VALUES ('普通用户', '/user/validate-form');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/validate-form');
INSERT INTO `auth_item_child` VALUES ('超级权限', '/user/view');
INSERT INTO `auth_item_child` VALUES ('用户', '普通用户');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '超级权限');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '权限管理', null, null, '1', 0x7B2269636F6E223A226661732066612D6B6579222C2276697369626C65223A747275657D);
INSERT INTO `menu` VALUES ('2', '管理员列表', '10', '/user/index', '1', '');
INSERT INTO `menu` VALUES ('3', '角色列表', '1', '/admin/role/index', '2', 0x7B2269636F6E223A226661722066612D757365722D636972636C65222C2276697369626C65223A747275657D);
INSERT INTO `menu` VALUES ('4', '权限列表', '1', '/admin/permission/index', '3', '');
INSERT INTO `menu` VALUES ('5', '路由列表', '1', '/admin/route/index', '4', '');
INSERT INTO `menu` VALUES ('6', '规则列表', '1', '/admin/rule/index', '5', '');
INSERT INTO `menu` VALUES ('7', '权限分配', '1', '/admin/assignment/index', '6', '');
INSERT INTO `menu` VALUES ('9', '菜单管理', '1', '/admin/menu/index', '7', '');
INSERT INTO `menu` VALUES ('10', '管理员', null, null, '2', '');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1557036989');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1557036990');
INSERT INTO `migration` VALUES ('m160312_050000_create_user', '1557036991');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1557037014');
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', '1557037014');
INSERT INTO `migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', '1557037014');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '3ZISIVV6uEVqeERclKeBzokbl5PhyoYG', '$2y$13$JWHrdfMwCVZWC/WDDtHc1uS9UK1SENoUWEDvT7tybTrzHSLv13H2a', null, 'albert@pkking.ph', '10', '1557037167', '1557037167');
INSERT INTO `user` VALUES ('2', 'test', 'Oi64Ir1JDyLfppN-utN4TYn2omQU50rR', '$2y$13$e0fKRS39/3SBOxjVh6rYWudC1n342WPcOA0g2WYbvWjx7ivTiuY9a', null, 'test@122.com', '10', '1557048842', '1557055679');

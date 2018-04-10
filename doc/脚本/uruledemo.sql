/*
Navicat MySQL Data Transfer

Source Server         : local-mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : uruledemo

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-10 10:23:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bdf2_company
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_company`;
CREATE TABLE `bdf2_company` (
  `ID_` varchar(60) NOT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_company
-- ----------------------------
INSERT INTO `bdf2_company` VALUES ('bstek', '上海锐道有限公司', '上海锐道');

-- ----------------------------
-- Table structure for bdf2_component
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_component`;
CREATE TABLE `bdf2_component` (
  `ID_` varchar(60) NOT NULL,
  `COMPONENT_ID_` varchar(60) NOT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_component
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_dept
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_dept`;
CREATE TABLE `bdf2_dept` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_dept
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_group
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_group`;
CREATE TABLE `bdf2_group` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_group
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_group_member
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_group_member`;
CREATE TABLE `bdf2_group_member` (
  `ID_` varchar(60) NOT NULL,
  `DEPT_ID_` varchar(60) DEFAULT NULL,
  `GROUP_ID_` varchar(60) DEFAULT NULL,
  `POSITION_ID_` varchar(60) DEFAULT NULL,
  `USERNAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_group_member
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_message
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_message`;
CREATE TABLE `bdf2_message` (
  `ID_` varchar(60) NOT NULL,
  `CONTENT_` longtext NOT NULL,
  `READ_` bit(1) NOT NULL,
  `RECEIVER_` varchar(60) NOT NULL,
  `REPLY_` bit(1) DEFAULT NULL,
  `SEND_DATE_` datetime DEFAULT NULL,
  `SENDER_` varchar(60) NOT NULL,
  `TAGS_` varchar(100) DEFAULT NULL,
  `TITLE_` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_message
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_message_template
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_message_template`;
CREATE TABLE `bdf2_message_template` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CONTENT_` longtext,
  `NAME_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_message_template
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_position
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_position`;
CREATE TABLE `bdf2_position` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_position
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_role
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_role`;
CREATE TABLE `bdf2_role` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `CREATE_USER_` varchar(60) DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `ENABLED_` bit(1) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_role
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_role_member
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_role_member`;
CREATE TABLE `bdf2_role_member` (
  `ID_` varchar(60) NOT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DEPT_ID_` varchar(60) DEFAULT NULL,
  `GRANTED_` bit(1) DEFAULT NULL,
  `POSITION_ID_` varchar(60) DEFAULT NULL,
  `ROLE_ID_` varchar(60) DEFAULT NULL,
  `USERNAME_` varchar(60) DEFAULT NULL,
  `GROUP_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK79BEE4326C254D1D` (`GROUP_ID_`),
  CONSTRAINT `FK79BEE4326C254D1D` FOREIGN KEY (`GROUP_ID_`) REFERENCES `bdf2_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_role_member
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_role_resource`;
CREATE TABLE `bdf2_role_resource` (
  `ID_` varchar(60) NOT NULL,
  `PACKAGE_ID_` varchar(60) DEFAULT NULL,
  `ROLE_ID_` varchar(60) DEFAULT NULL,
  `URL_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_url
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_url`;
CREATE TABLE `bdf2_url` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) NOT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `FOR_NAVIGATION_` bit(1) NOT NULL,
  `ICON_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) NOT NULL,
  `ORDER_` int(11) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  `SYSTEM_ID_` varchar(60) DEFAULT NULL,
  `URL_` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_url
-- ----------------------------
INSERT INTO `bdf2_url` VALUES ('0588fbe1-235d-4148-806d-9363ae2d76fa', 'bstek', null, '', 'url(skin>common/icons.gif) -102px -21px', '角色成员维护', '4', '8fcc1507-6f34-45b4-8ccd-56cf9c269bfe', null, 'bdf2.core.view.role.member.RoleMemberMaintain.d');
INSERT INTO `bdf2_url` VALUES ('2694d2c9-8026-49b1-81c7-94c268172cfb', 'bstek', null, '', 'url(skin>common/icons.gif) -262px -100px', 'URL权限维护', '2', '8fcc1507-6f34-45b4-8ccd-56cf9c269bfe', null, 'bdf2.core.view.role.url.RoleUrlMaintain.d');
INSERT INTO `bdf2_url` VALUES ('41378826-09df-4e05-8dbd-e738bb43c5b9', 'bstek', null, '', 'url(skin>common/icons.gif) -100px -20px', '系统默认基本信息维护', '1', 'root-bstek', null, null);
INSERT INTO `bdf2_url` VALUES ('5167b430-75cb-4ec5-b7af-d1e0c94587f6', 'bstek', null, '', 'url(skin>common/icons.gif) -42px -41px', '部门维护', '3', '41378826-09df-4e05-8dbd-e738bb43c5b9', null, 'bdf2.core.view.dept.DeptMaintain.d');
INSERT INTO `bdf2_url` VALUES ('606350e4-96e8-4f42-a14f-6d970dca5c15', 'bstek', null, '', 'url(skin>common/icons.gif) -142px -101px', '用户维护', '2', '41378826-09df-4e05-8dbd-e738bb43c5b9', null, 'bdf2.core.view.user.UserMaintain.d');
INSERT INTO `bdf2_url` VALUES ('6a8b2423-cd6b-4ad3-aa90-d38691f6e3b2', 'bstek', null, '', 'url(skin>common/icons.gif) -262px -41px', '岗位维护', '4', '41378826-09df-4e05-8dbd-e738bb43c5b9', null, 'bdf2.core.view.position.PositionMaintain.d');
INSERT INTO `bdf2_url` VALUES ('7462d64e-512b-4e6a-8700-bd63ce544c7b', 'bstek', null, '', 'url(skin>common/icons.gif) -302px -61px', '消息模版维护', '5', '41378826-09df-4e05-8dbd-e738bb43c5b9', null, 'bdf2.core.view.messagetemplate.MessageTemplateMaintain.d');
INSERT INTO `bdf2_url` VALUES ('8fcc1507-6f34-45b4-8ccd-56cf9c269bfe', 'bstek', null, '', 'url(skin>common/icons.gif) -42px -41px', '权限管理', '2', 'root-bstek', null, null);
INSERT INTO `bdf2_url` VALUES ('ac1090f9-6ec3-4061-ba87-a814c47ee9a0', 'bstek', null, '', 'url(skin>common/icons.gif) -62px -141px', '菜单维护', '1', '41378826-09df-4e05-8dbd-e738bb43c5b9', null, 'bdf2.core.view.url.UrlMaintain.d');
INSERT INTO `bdf2_url` VALUES ('ef6c741b-a21a-4d09-bc6f-f97176ac2e5a', 'bstek', null, '', 'url(skin>common/icons.gif) -181px -41px', '组件权限维护', '3', '8fcc1507-6f34-45b4-8ccd-56cf9c269bfe', null, 'bdf2.core.view.role.component.RoleComponentMaintain.d');
INSERT INTO `bdf2_url` VALUES ('f5116b37-48cc-4857-9d85-f36ee6da8bef', 'bstek', null, '', 'url(skin>common/icons.gif) -240px -80px', '角色维护', '1', '8fcc1507-6f34-45b4-8ccd-56cf9c269bfe', null, 'bdf2.core.view.role.RoleMaintain.d');
INSERT INTO `bdf2_url` VALUES ('fdd37d16-0628-4c9e-85b8-a4246231b72d', 'bstek', null, '', 'url(skin>common/icons.gif) -101px -121px', '群组维护', '5', '8fcc1507-6f34-45b4-8ccd-56cf9c269bfe', null, 'bdf2.core.view.group.GroupMaintain.d');
INSERT INTO `bdf2_url` VALUES ('root-bstek', 'bstek', null, '', 'url(skin>common/icons.gif) -102px -101px', '系统管理', '1', null, null, null);

-- ----------------------------
-- Table structure for bdf2_url_component
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_url_component`;
CREATE TABLE `bdf2_url_component` (
  `ID_` varchar(60) NOT NULL,
  `AUTHORITY_TYPE_` varchar(10) NOT NULL,
  `ROLE_ID_` varchar(60) DEFAULT NULL,
  `URL_ID_` varchar(60) DEFAULT NULL,
  `COMPONENT_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FKFCFBDBDCD4C56CC` (`COMPONENT_ID_`),
  CONSTRAINT `FKFCFBDBDCD4C56CC` FOREIGN KEY (`COMPONENT_ID_`) REFERENCES `bdf2_component` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_url_component
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_user
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user`;
CREATE TABLE `bdf2_user` (
  `USERNAME_` varchar(60) NOT NULL,
  `ADDRESS_` varchar(120) DEFAULT NULL,
  `ADMINISTRATOR_` bit(1) NOT NULL,
  `BIRTHDAY_` datetime DEFAULT NULL,
  `CNAME_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) NOT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `EMAIL_` varchar(60) DEFAULT NULL,
  `ENABLED_` bit(1) NOT NULL,
  `ENAME_` varchar(60) DEFAULT NULL,
  `MALE_` bit(1) NOT NULL,
  `MOBILE_` varchar(20) DEFAULT NULL,
  `PASSWORD_` varchar(70) NOT NULL,
  `SALT_` varchar(10) NOT NULL,
  PRIMARY KEY (`USERNAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_user
-- ----------------------------
INSERT INTO `bdf2_user` VALUES ('admin', null, '', null, '系统管理员', 'bstek', null, 'xxxx@xxxx.com', '', 'administrator', '', '18917888888', '5aebf90d7ae1c5097b87138ef2b43e9b061a89c9', '418');

-- ----------------------------
-- Table structure for bdf2_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user_dept`;
CREATE TABLE `bdf2_user_dept` (
  `ID_` varchar(60) NOT NULL,
  `DEPT_ID_` varchar(60) NOT NULL,
  `USERNAME_` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_user_dept
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_user_position
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user_position`;
CREATE TABLE `bdf2_user_position` (
  `ID_` varchar(60) NOT NULL,
  `POSITION_ID_` varchar(60) NOT NULL,
  `USERNAME_` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_user_position
-- ----------------------------

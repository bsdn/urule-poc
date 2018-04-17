/*
Navicat MySQL Data Transfer

Source Server         : local-mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : uruledemo

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-17 16:07:45
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

-- ----------------------------
-- Table structure for poc_flowdire
-- ----------------------------
DROP TABLE IF EXISTS `poc_flowdire`;
CREATE TABLE `poc_flowdire` (
  `UUID_` varchar(40) NOT NULL,
  `CHANNEL_ONE_` varchar(40) DEFAULT NULL,
  `CHANNEL_TWO_` varchar(40) DEFAULT NULL,
  `CLIENT_PROPERTY_` varchar(40) DEFAULT NULL,
  `CUSTOMER_` varchar(40) DEFAULT NULL,
  `DISTRIBUTOR_` varchar(40) DEFAULT NULL,
  `FIRST_CUSTOMER_NAME_` varchar(40) DEFAULT NULL,
  `FIRST_CUSTOMER_NUMBER_` varchar(40) DEFAULT NULL,
  `MATCHING_CUSTOMERS_` varchar(40) DEFAULT NULL,
  `MONEY_` varchar(40) DEFAULT NULL,
  `MONTH_` varchar(255) DEFAULT NULL,
  `NUMBER_` varchar(40) DEFAULT NULL,
  `OFFICE_` varchar(40) DEFAULT NULL,
  `PACKET_NUMBER_` varchar(40) DEFAULT NULL,
  `PRODUCT_` varchar(255) DEFAULT NULL,
  `PRODUCT_Id_` varchar(40) DEFAULT NULL,
  `PROVINCIAL_AREA_` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`UUID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_flowdire
-- ----------------------------
INSERT INTO `poc_flowdire` VALUES ('1', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '9812', '5', '14.873', '1010', '1784', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('10', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '944', '5', '0.785', '1010', '472', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('100', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '246.4', '4', '0.14', '1010', '28', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('1000', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '589.6', '12', '0.551', '1010', '44', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1001', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '三级经销商', '134', '12', '0.125', '1010', '10', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1002', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '201', '12', '0.188', '1010', '15', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1003', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2907.8', '12', '2.716', '1010', '217', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1004', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '三级经销商', '53.6', '12', '0.05', '1010', '4', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1005', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1259.6', '12', '1.176', '1010', '94', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1006', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '12', '12', '0.017', '1010', '2', '氨酚烷胺颗粒  12袋/盒*120盒', '10001001700', '北京');
INSERT INTO `poc_flowdire` VALUES ('1007', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '30', '12', '0.042', '1010', '5', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('1008', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '708', '12', '0.984', '1010', '118', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('1009', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '6', '12', '0.008', '1010', '1', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('101', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '4374', '4', '0.81', '1010', '162', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('1010', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '348', '12', '0.484', '1010', '58', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('1011', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '2336', '12', '2.439', '1010', '292', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1012', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '8048', '12', '8.409', '1010', '1006', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1013', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '三级经销商', '672', '12', '0.7', '1010', '84', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1014', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '5000', '12', '5.216', '1010', '625', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1015', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '264', '12', '0.275', '1010', '33', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1016', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '三级经销商', '368', '12', '0.383', '1010', '46', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1017', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '3112', '12', '3.244', '1010', '389', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('1018', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '商业配送KA', '-42', '12', '-0.02', '1010', '-4', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1019', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '1974', '12', '0.94', '1010', '188', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('102', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '-202.4', '4', '-0.115', '1010', '-23', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('1020', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '非协议经销商', '105', '12', '0.05', '1010', '10', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1021', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '商业配送KA', '126', '12', '0.06', '1010', '12', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1022', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '1753.5', '12', '0.835', '1010', '167', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1023', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '315', '12', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1024', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2541', '12', '1.21', '1010', '242', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1025', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '157.5', '12', '0.075', '1010', '15', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1026', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2058', '12', '0.98', '1010', '196', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1027', '82', '分销', '二级', '万家瑞', '3972457', '四季春', '100000', '未分配的', '364.8', '12', '0.166', '1010', '20', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('1028', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '114.4', '12', '0.065', '1010', '13', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('1029', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '440', '12', '0.25', '1010', '50', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('103', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '7496.5', '4', '11.366', '1010', '1363', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('1030', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '470', '12', '0.208', '1010', '25', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('1031', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1372.4', '12', '0.608', '1010', '73', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('1032', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '376', '12', '0.167', '1010', '20', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('1033', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '752', '12', '0.333', '1010', '40', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('1034', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '163', '12', '0.166', '1010', '20', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('1035', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '18247.85', '12', '18.655', '1010', '2239', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('1036', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '7473.55', '12', '7.639', '1010', '917', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('1037', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '489', '12', '0.5', '1010', '60', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('1038', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '三级经销商', '1222.5', '12', '1.25', '1010', '150', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('1039', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '10016.35', '12', '10.243', '1010', '1229', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('104', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '503.84', '4', '0.839', '1010', '67', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1040', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '655.2', '12', '0.759', '1010', '91', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('1041', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '266.4', '12', '0.309', '1010', '37', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('1042', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2124', '12', '2.459', '1010', '295', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('1043', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '18.5', '12', '0.025', '1010', '5', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('1044', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '726', '12', '1.099', '1010', '132', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('1045', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '7.52', '12', '0.013', '1010', '1', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1046', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '90', '12', '0.063', '1010', '5', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('1047', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '1079.2', '12', '0.636', '1010', '76', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('1048', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '65', '12', '0.05', '1010', '5', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('1049', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '227.8', '12', '0.213', '1010', '17', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('105', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1527.6', '4', '1.426', '1010', '114', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1050', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '656.6', '12', '0.611', '1010', '49', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1051', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '3510', '12', '0.65', '1010', '130', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('1052', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '262.5', '12', '0.125', '1010', '25', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1053', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '609', '12', '0.29', '1010', '58', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1054', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '未分配的', '31.5', '12', '0.015', '1010', '3', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1055', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '1574.4', '12', '1.028', '1010', '123', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('1056', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '未分配的', '25.6', '12', '0.017', '1010', '2', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('1057', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '202.4', '12', '0.115', '1010', '23', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('1058', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '93.94', '12', '0.022', '1010', '7', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('1059', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '1771.44', '12', '0.413', '1010', '132', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('106', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '配送平台', '4200', '4', '2', '1010', '400', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('1060', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '21.6', '12', '0.013', '1010', '3', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('107', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '41916', '4', '19.96', '1010', '3992', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('108', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '8715', '4', '4.15', '1010', '830', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('109', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '11812.5', '4', '5.625', '1010', '1125', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('11', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '11414', '5', '9.51', '1010', '5707', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('110', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '19005', '4', '9.05', '1010', '1810', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('111', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1235.09', '4', '0.943', '1010', '113', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('112', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '-9104.69', '4', '-6.944', '1010', '-833', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('113', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-535.57', '4', '-0.409', '1010', '-49', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('114', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '-4481.3', '4', '-3.413', '1010', '-410', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('115', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '27907.2', '4', '12.751', '1010', '1530', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('116', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '22617.6', '4', '10.333', '1010', '1240', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('117', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '11582.4', '4', '5.293', '1010', '635', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('118', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '5289.6', '4', '2.417', '1010', '290', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('119', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '225.5', '4', '0.342', '1010', '41', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('12', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '720', '5', '0.6', '1010', '360', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('120', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '682', '4', '1.034', '1010', '124', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('121', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1155', '4', '1.75', '1010', '210', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('122', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2623.5', '4', '3.977', '1010', '477', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('123', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '503.84', '4', '0.838', '1010', '67', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('124', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '142.88', '4', '0.238', '1010', '19', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('125', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '428.8', '4', '0.403', '1010', '32', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('126', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '482.4', '4', '0.451', '1010', '36', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('127', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '3309.8', '4', '3.091', '1010', '247', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('128', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '11140.5', '4', '5.305', '1010', '1061', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('129', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '20002.5', '4', '9.525', '1010', '1905', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('13', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2126', '5', '1.771', '1010', '1063', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('130', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '12673.5', '4', '6.035', '1010', '1207', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('131', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '21042', '4', '10.02', '1010', '2004', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('132', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '40992', '4', '19.52', '1010', '3904', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('133', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '374', '4', '0.566', '1010', '68', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('134', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '110', '4', '0.166', '1010', '20', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('135', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '561', '4', '0.85', '1010', '102', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('136', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '275', '4', '0.417', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('137', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '142.88', '4', '0.237', '1010', '19', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('138', '84', '商配KA', '二级', '凯尔康大药房', '3007883', '四季春', '100000', '未分配的', '536', '4', '0.5', '1010', '40', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('139', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '281.4', '4', '0.262', '1010', '21', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('14', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1107', '5', '0.205', '1010', '41', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('140', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '120.6', '4', '0.113', '1010', '9', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('141', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '134', '4', '0.125', '1010', '10', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('142', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '1340', '4', '1.246', '1010', '100', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('143', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '241.5', '4', '0.115', '1010', '23', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('144', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '525', '4', '0.25', '1010', '50', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('145', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '10500', '4', '5', '1010', '1000', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('146', '84', '商配KA', '二级', '永安堂连锁有限责任公司', '5027724', '四季春', '100000', '未分配的', '6300', '4', '3', '1010', '600', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('147', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '1050', '4', '0.5', '1010', '100', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('148', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '10150.4', '4', '6.609', '1010', '793', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('149', '84', '商配KA', '二级', '国达药房连锁', '5047913', '四季春', '100000', '未分配的', '256', '4', '0.167', '1010', '20', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('15', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '320827.5', '5', '152.775', '1010', '30555', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('150', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '6321.6', '3', '14.639', '1010', '1756', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('151', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '7449', '3', '19.1', '1010', '1910', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('152', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '240', '3', '0.2', '1010', '120', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('153', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '-6', '3', '-0.005', '1010', '-3', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('154', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '1848', '3', '1.544', '1010', '924', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('155', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3812.4', '3', '8.828', '1010', '1059', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('156', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '612', '3', '1.416', '1010', '170', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('157', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '648', '3', '1.5', '1010', '180', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('158', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1890', '3', '4.377', '1010', '525', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('159', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '5584.8', '3', '14.32', '1010', '1432', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('16', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '74907', '5', '35.67', '1010', '7134', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('160', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '581.1', '3', '1.49', '1010', '149', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('161', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '815.1', '3', '2.09', '1010', '209', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('162', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '-135', '3', '-0.025', '1010', '-5', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('163', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '14426.5', '3', '21.862', '1010', '2623', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('164', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '661.76', '3', '1.103', '1010', '88', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('165', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '5400.2', '3', '5.042', '1010', '403', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('166', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '配送平台', '11235', '3', '5.35', '1010', '1070', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('167', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '25021.5', '3', '11.915', '1010', '2383', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('168', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2677.85', '3', '2.042', '1010', '245', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('169', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '4208.05', '3', '3.209', '1010', '385', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('17', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '53497.5', '5', '25.475', '1010', '5095', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('170', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '3563.18', '3', '2.716', '1010', '326', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('171', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '4481.3', '3', '3.415', '1010', '410', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('172', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '-3300', '3', '-5', '1010', '-600', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('173', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '4972', '3', '7.54', '1010', '904', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('174', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '4658.5', '3', '7.063', '1010', '847', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('175', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1567.5', '3', '2.374', '1010', '285', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('176', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2887.5', '3', '4.375', '1010', '525', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('177', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '503.84', '3', '0.84', '1010', '67', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('178', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '60.16', '3', '0.1', '1010', '8', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('179', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3484', '3', '3.262', '1010', '260', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('18', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '45255', '5', '21.55', '1010', '4310', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('180', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '3792.2', '3', '3.542', '1010', '283', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('181', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2733.6', '3', '2.553', '1010', '204', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('182', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '3969', '3', '1.89', '1010', '378', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('183', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '15487.5', '3', '7.375', '1010', '1475', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('184', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '10941', '3', '5.21', '1010', '1042', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('185', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '3202.5', '3', '1.525', '1010', '305', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('186', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '5764.5', '3', '2.745', '1010', '549', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('187', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '143', '3', '0.217', '1010', '26', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('188', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '616', '3', '0.934', '1010', '112', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('189', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '275', '3', '0.417', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('19', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '7902.39', '5', '6.027', '1010', '723', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('190', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '390.5', '3', '0.591', '1010', '71', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('191', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '255.68', '3', '0.425', '1010', '34', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('192', '84', '商配KA', '二级', '凯尔康大药房', '3007883', '四季春', '100000', '未分配的', '1072', '3', '1.001', '1010', '80', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('193', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '26.8', '3', '0.025', '1010', '2', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('194', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '495.8', '3', '0.464', '1010', '37', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('195', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '1340', '3', '1.246', '1010', '100', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('196', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '157.5', '3', '0.075', '1010', '15', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('197', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '756', '3', '0.36', '1010', '72', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('198', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '210', '3', '0.1', '1010', '20', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('199', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '210', '3', '0.1', '1010', '20', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('2', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '7113.6', '5', '16.466', '1010', '1976', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('20', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '-4699.9', '5', '-3.583', '1010', '-430', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('200', '84', '商配KA', '二级', '国达药房连锁', '5047913', '四季春', '100000', '未分配的', '315', '3', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('201', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '64', '3', '0.042', '1010', '5', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('202', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '5836.8', '3', '3.802', '1010', '456', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('203', '84', '商配KA', '二级', '国达药房连锁', '5047913', '四季春', '100000', '未分配的', '179.2', '3', '0.117', '1010', '14', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('204', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1353.6', '2', '3.134', '1010', '376', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('205', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3334.5', '2', '8.55', '1010', '855', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('206', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '20', '2', '0.017', '1010', '10', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('207', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '694', '2', '0.578', '1010', '347', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('208', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '5785.2', '2', '13.398', '1010', '1607', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('209', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '597.6', '2', '1.384', '1010', '166', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('21', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-3519.46', '5', '-2.682', '1010', '-322', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('210', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1512', '2', '3.5', '1010', '420', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('211', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2206.8', '2', '5.107', '1010', '613', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('212', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3716.7', '2', '9.53', '1010', '953', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('213', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '276.9', '2', '0.71', '1010', '71', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('214', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '889.2', '2', '2.28', '1010', '228', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('215', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '75.6', '2', '0.175', '1010', '21', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('216', '84', '商配KA', '二级', '凯尔康大药房', '3007883', '四季春', '100000', '未分配的', '19.5', '2', '0.05', '1010', '5', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('217', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '23.4', '2', '0.06', '1010', '6', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('218', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '159.9', '2', '0.41', '1010', '41', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('219', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '-81', '2', '-0.015', '1010', '-3', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('22', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '-4415.72', '5', '-3.365', '1010', '-404', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('220', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '14333', '2', '21.717', '1010', '2606', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('221', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '774.56', '2', '1.288', '1010', '103', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('222', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2961.4', '2', '2.767', '1010', '221', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('223', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '55261.5', '2', '26.315', '1010', '5263', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('224', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '601.15', '2', '0.459', '1010', '55', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('225', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '2022.05', '2', '1.543', '1010', '185', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('226', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '1366.25', '2', '1.043', '1010', '125', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('227', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2459.25', '2', '1.876', '1010', '225', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('228', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '3300', '2', '5', '1010', '600', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('229', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '5148', '2', '7.801', '1010', '936', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('23', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '70752.96', '5', '32.326', '1010', '3879', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('230', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1287', '2', '1.949', '1010', '234', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('231', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1265', '2', '1.916', '1010', '230', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('232', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1908.5', '2', '2.892', '1010', '347', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('233', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '684.32', '2', '1.14', '1010', '91', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('234', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '37.6', '2', '0.063', '1010', '5', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('235', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '2747', '2', '2.566', '1010', '205', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('236', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '3256.2', '2', '3.04', '1010', '243', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('237', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2921.2', '2', '2.73', '1010', '218', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('238', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '2236.5', '2', '1.065', '1010', '213', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('239', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '10489.5', '2', '4.995', '1010', '999', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('24', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '129868.8', '5', '59.336', '1010', '7120', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('240', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '16212', '2', '7.72', '1010', '1544', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('241', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '2551.5', '2', '1.215', '1010', '243', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('242', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '14091', '2', '6.71', '1010', '1342', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('243', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '93.5', '2', '0.142', '1010', '17', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('244', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '242', '2', '0.369', '1010', '44', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('245', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '330', '2', '0.501', '1010', '60', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('246', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '27.5', '2', '0.042', '1010', '5', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('247', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '82.72', '2', '0.138', '1010', '11', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('248', '84', '商配KA', '二级', '凯尔康大药房', '3007883', '四季春', '100000', '未分配的', '3618', '2', '3.375', '1010', '270', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('249', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '160.8', '2', '0.15', '1010', '12', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('25', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '58459.2', '5', '26.713', '1010', '3205', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('250', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '214.4', '2', '0.2', '1010', '16', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('251', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '93.8', '2', '0.088', '1010', '7', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('252', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '105', '2', '0.05', '1010', '10', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('253', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '157.5', '2', '0.075', '1010', '15', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('254', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '105', '2', '0.05', '1010', '10', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('255', '84', '商配KA', '二级', '凯尔康大药房', '3007883', '四季春', '100000', '未分配的', '384', '2', '0.25', '1010', '30', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('256', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '128', '2', '0.084', '1010', '10', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('257', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '4608', '2', '2.999', '1010', '360', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('258', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '未分配的', '25.6', '2', '0.017', '1010', '2', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('259', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '17064', '1', '39.501', '1010', '4740', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('26', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '51072', '5', '23.333', '1010', '2800', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('260', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '6033.3', '1', '15.47', '1010', '1547', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('261', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2048', '1', '1.703', '1010', '1024', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('262', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2400', '1', '2.002', '1010', '1200', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('263', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '12582', '1', '29.127', '1010', '3495', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('264', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1810.8', '1', '4.197', '1010', '503', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('265', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1602', '1', '3.708', '1010', '445', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('266', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '223.2', '1', '0.517', '1010', '62', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('267', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '6555.9', '1', '16.81', '1010', '1681', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('268', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '249.6', '1', '0.64', '1010', '64', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('269', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '11.7', '1', '0.03', '1010', '3', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('27', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '79.2', '5', '0.045', '1010', '9', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('270', '07', '控销商务', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '135', '1', '0.025', '1010', '5', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('271', '07', '控销商务', '二级', '同丰堂经营', '101731', '四季春', '100000', '未分配的', '176', '1', '0.1', '1010', '20', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('272', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '12897.5', '1', '19.541', '1010', '2345', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('273', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '857.28', '1', '1.424', '1010', '114', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('274', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '10925', '1', '11.888', '1010', '950', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('275', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '配送平台', '1050', '1', '0.5', '1010', '100', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('276', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '-262.5', '1', '-0.125', '1010', '-25', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('277', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1005.56', '1', '0.766', '1010', '92', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('278', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '1202.3', '1', '0.917', '1010', '110', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('279', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-2481.11', '1', '-1.893', '1010', '-227', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('28', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '794.22', '5', '0.775', '1010', '93', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('280', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '1366.25', '1', '1.043', '1010', '125', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('281', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '11', '1', '0.017', '1010', '2', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('282', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '11478.5', '1', '17.387', '1010', '2087', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('283', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2728', '1', '4.138', '1010', '496', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('284', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1831.5', '1', '2.774', '1010', '333', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('285', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '4609', '1', '6.985', '1010', '838', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('286', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '293.28', '1', '0.489', '1010', '39', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('287', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '188', '1', '0.313', '1010', '25', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('288', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '3607', '1', '3.902', '1010', '312', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('289', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '885.5', '1', '0.96', '1010', '77', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('29', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '563.64', '5', '0.55', '1010', '66', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('290', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '1071', '1', '0.51', '1010', '102', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('291', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '5124', '1', '2.44', '1010', '488', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('292', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '3885', '1', '1.85', '1010', '370', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('293', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1260', '1', '0.6', '1010', '120', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('294', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '配送平台', '525', '1', '0.25', '1010', '50', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('295', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2383.5', '1', '1.135', '1010', '227', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('296', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '55', '1', '0.083', '1010', '10', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('297', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '275', '1', '0.416', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('298', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '550', '1', '0.834', '1010', '100', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('299', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '1375', '1', '2.083', '1010', '250', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('3', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '36', '5', '0.083', '1010', '10', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('30', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '1624.31', '5', '1.584', '1010', '190.2', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('300', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '357.5', '1', '0.544', '1010', '65', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('301', '84', '商配KA', '二级', '凯尔康大药房', '3007883', '四季春', '100000', '未分配的', '1656', '1', '1.802', '1010', '144', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('302', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '287.5', '1', '0.314', '1010', '25', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('303', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '92', '1', '0.1', '1010', '8', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('304', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '34.5', '1', '0.037', '1010', '3', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('305', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '1179.2', '1', '1.1', '1010', '88', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('306', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '157.5', '1', '0.075', '1010', '15', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('307', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '262.5', '1', '0.125', '1010', '25', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('308', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '52.5', '1', '0.025', '1010', '5', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('309', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '1176', '1', '0.56', '1010', '112', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('31', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '37', '5', '0.05', '1010', '10', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('310', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '64', '1', '0.042', '1010', '5', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('311', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '64', '1', '0.042', '1010', '5', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('312', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3340.8', '6', '7.732', '1010', '928', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('313', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1056.9', '6', '2.71', '1010', '271', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('314', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2752', '6', '3.582', '1010', '215', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('315', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '688', '6', '0.573', '1010', '344', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('316', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '7082', '6', '5.901', '1010', '3541', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('317', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '880', '6', '0.732', '1010', '440', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('318', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '3076', '6', '2.562', '1010', '1538', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('319', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1947.12', '6', '1.901', '1010', '228', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('32', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '481', '5', '0.65', '1010', '130', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('320', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '614.88', '6', '0.599', '1010', '72', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('321', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '2169.16', '6', '2.116', '1010', '254', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('322', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '4398.1', '6', '4.292', '1010', '515', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('323', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '85.1', '6', '0.115', '1010', '23', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('324', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '136.9', '6', '0.185', '1010', '37', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('325', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '48.1', '6', '0.065', '1010', '13', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('326', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '11.1', '6', '0.015', '1010', '3', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('327', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '640.8', '6', '1.485', '1010', '178', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('328', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '792', '6', '1.833', '1010', '220', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('329', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1224', '6', '2.836', '1010', '340', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('33', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '151.7', '5', '0.205', '1010', '41', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('330', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3151.2', '6', '8.08', '1010', '808', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('331', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '292.5', '6', '0.75', '1010', '75', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('332', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '487.5', '6', '1.25', '1010', '125', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('333', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '200', '6', '0.167', '1010', '100', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('334', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '2688', '6', '2', '1010', '160', '红花注射液 100克*3支*80盒', '10006000601', '北京');
INSERT INTO `poc_flowdire` VALUES ('335', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '129.5', '6', '0.175', '1010', '35', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('336', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2535', '6', '1.95', '1010', '195', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('337', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '7128', '6', '1.32', '1010', '264', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('338', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '167.2', '6', '0.095', '1010', '19', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('339', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '2860', '6', '2.2', '1010', '220', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('34', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '59.2', '5', '0.08', '1010', '16', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('340', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '6297.5', '6', '9.54', '1010', '1145', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('341', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '配送平台', '203.04', '6', '0.338', '1010', '27', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('342', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '879.84', '6', '1.463', '1010', '117', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('343', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3390.2', '6', '3.165', '1010', '253', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('344', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '70', '6', '0.05', '1010', '10', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('345', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '250393.5', '6', '119.235', '1010', '23847', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('346', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '124908', '6', '59.48', '1010', '11896', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('347', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '65646', '6', '31.26', '1010', '6252', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('348', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '79716', '6', '37.96', '1010', '7592', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('349', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '配送平台', '13116', '6', '10', '1010', '1200', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('35', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3300', '5', '5', '1010', '600', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('350', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1967.4', '6', '1.5', '1010', '180', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('351', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '371.62', '6', '0.283', '1010', '34', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('352', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-2765.29', '6', '-2.105', '1010', '-253', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('353', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '8962.6', '6', '6.833', '1010', '820', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('354', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '191556.48', '6', '87.518', '1010', '10502', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('355', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '157593.6', '6', '72.004', '1010', '8640', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('356', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '158505.6', '6', '72.424', '1010', '8690', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('357', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '97492.8', '6', '44.541', '1010', '5345', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('358', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3157', '6', '4.785', '1010', '574', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('359', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2079', '6', '3.154', '1010', '378', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('36', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1567.5', '5', '2.374', '1010', '285', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('360', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1958', '6', '2.967', '1010', '356', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('361', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1666.5', '6', '2.523', '1010', '303', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('362', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '526.4', '6', '0.876', '1010', '70', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('363', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '127.84', '6', '0.213', '1010', '17', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('364', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2211', '6', '2.065', '1010', '165', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('365', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '67', '6', '0.063', '1010', '5', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('366', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2224.4', '6', '2.078', '1010', '166', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('367', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '77049', '6', '36.69', '1010', '7338', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('368', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '138841.5', '6', '66.115', '1010', '13223', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('369', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '92967', '6', '44.27', '1010', '8854', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('37', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2436.5', '5', '3.693', '1010', '443', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('370', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '61467', '6', '29.27', '1010', '5854', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('371', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '配送平台', '16800', '6', '8', '1010', '1600', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('372', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '94615.5', '6', '45.055', '1010', '9011', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('373', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '8937.6', '6', '4.083', '1010', '490', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('374', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '1182.5', '6', '1.79', '1010', '215', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('375', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '55', '6', '0.083', '1010', '10', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('376', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '44', '6', '0.067', '1010', '8', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('377', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '1128', '6', '1.878', '1010', '150', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('378', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '964.8', '6', '0.9', '1010', '72', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('379', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '268', '6', '0.25', '1010', '20', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('38', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '316.8', '5', '0.735', '1010', '88', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('380', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '630', '6', '0.3', '1010', '60', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('381', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '19530', '6', '9.3', '1010', '1860', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('382', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '22890', '6', '10.9', '1010', '2180', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('383', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '44096', '6', '28.708', '1010', '3445', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('384', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '38528', '6', '25.088', '1010', '3010', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('385', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '未分配的', '1920', '6', '1.249', '1010', '150', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('386', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '30080', '6', '19.583', '1010', '2350', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('387', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '37376', '6', '24.333', '1010', '2920', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('388', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1864.8', '7', '4.317', '1010', '518', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('389', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3712', '7', '4.833', '1010', '290', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('39', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1051.2', '5', '2.433', '1010', '292', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('390', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2256', '7', '1.881', '1010', '1128', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('391', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '7692', '7', '6.411', '1010', '3846', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('392', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '572', '7', '0.477', '1010', '286', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('393', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '716', '7', '0.598', '1010', '358', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('394', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '3516', '7', '2.929', '1010', '1758', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('395', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2211.86', '7', '2.157', '1010', '259', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('396', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '409.92', '7', '0.4', '1010', '48', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('397', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '1315.16', '7', '1.283', '1010', '154', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('398', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '3416', '7', '3.333', '1010', '400', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('399', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '37', '7', '0.05', '1010', '10', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('4', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4804.8', '5', '12.32', '1010', '1232', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('40', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1882.8', '5', '4.361', '1010', '523', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('400', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '25.9', '7', '0.035', '1010', '7', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('401', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '96.2', '7', '0.13', '1010', '26', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('402', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '33.3', '7', '0.045', '1010', '9', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('403', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '277.2', '7', '0.642', '1010', '77', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('404', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '432', '7', '1', '1010', '120', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('405', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1051.2', '7', '2.435', '1010', '292', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('406', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '409.5', '7', '1.05', '1010', '105', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('407', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1462.5', '7', '3.75', '1010', '375', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('408', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '160', '7', '0.133', '1010', '80', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('409', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '18.5', '7', '0.025', '1010', '5', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('41', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '2219.1', '5', '5.69', '1010', '569', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('410', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '598', '7', '0.46', '1010', '46', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('411', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2080', '7', '1.6', '1010', '160', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('412', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3537', '7', '0.655', '1010', '131', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('413', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1909.6', '7', '1.085', '1010', '217', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('414', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '425', '7', '0.417', '1010', '50', '感冒清热颗粒 3克*10袋*1100盒', '10001001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('415', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '88', '7', '0.05', '1010', '10', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('416', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '275', '7', '0.417', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('417', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4675', '7', '7.082', '1010', '850', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('418', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1293.44', '7', '2.152', '1010', '172', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('419', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '90', '7', '0.063', '1010', '5', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('42', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '276.9', '5', '0.71', '1010', '71', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('420', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1916.2', '7', '1.787', '1010', '143', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('421', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '63', '7', '0.051', '1010', '6', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '10001006300', '北京');
INSERT INTO `poc_flowdire` VALUES ('422', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '6930', '7', '3.3', '1010', '660', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('423', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '423171', '7', '201.51', '1010', '40302', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('424', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '142170', '7', '67.7', '1010', '13540', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('425', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '14910', '7', '7.1', '1010', '1420', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('426', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '100590', '7', '47.9', '1010', '9580', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('427', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '120487.5', '7', '57.375', '1010', '11475', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('428', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-3432.02', '7', '-2.616', '1010', '-314', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('429', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '52476.48', '7', '23.975', '1010', '2877', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('43', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1735.5', '5', '4.45', '1010', '445', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('430', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '324799.68', '7', '148.393', '1010', '17807', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('431', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '70698.24', '7', '32.301', '1010', '3876', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('432', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '57091.2', '7', '26.084', '1010', '3130', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('433', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '136289.28', '7', '62.27', '1010', '7472', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('434', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '148181.76', '7', '67.7', '1010', '8124', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('435', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '338.4', '7', '0.195', '1010', '47', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('436', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3305.5', '7', '5.014', '1010', '601', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('437', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '3679.5', '7', '5.577', '1010', '669', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('438', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '2211', '7', '3.349', '1010', '402', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('439', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1166', '7', '1.766', '1010', '212', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('44', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '421.12', '5', '0.702', '1010', '56', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('440', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '353.44', '7', '0.589', '1010', '47', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('441', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '150.4', '7', '0.25', '1010', '20', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('442', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1165.8', '7', '1.089', '1010', '87', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('443', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '-201', '7', '-0.187', '1010', '-15', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('444', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1943', '7', '1.814', '1010', '145', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('445', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '81816', '7', '38.96', '1010', '7792', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('446', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '135555', '7', '64.55', '1010', '12910', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('447', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '142558.5', '7', '67.885', '1010', '13577', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('448', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '31311', '7', '14.91', '1010', '2982', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('449', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '80031', '7', '38.11', '1010', '7622', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('45', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '188', '5', '0.313', '1010', '25', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('450', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '36.48', '7', '0.016', '1010', '2', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('451', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '14774.4', '7', '6.749', '1010', '810', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('452', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '379.5', '7', '0.575', '1010', '69', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('453', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '192.5', '7', '0.291', '1010', '35', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('454', '84', '商配KA', '二级', '永生堂连锁', '3927748', '四季春', '100000', '未分配的', '66', '7', '0.1', '1010', '12', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('455', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '112.8', '7', '0.186', '1010', '15', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('456', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '402', '7', '0.375', '1010', '30', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('457', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '2394', '7', '1.14', '1010', '228', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('458', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '1659', '7', '0.79', '1010', '158', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('459', '84', '商配KA', '二级', '永民康技术', '3147117', '四季春', '100000', '未分配的', '262.5', '7', '0.125', '1010', '25', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('46', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2867.6', '5', '2.679', '1010', '214', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('460', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '28192.5', '7', '13.425', '1010', '2685', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('461', '84', '商配KA', '二级', '天津市弘济药店', '3839390', '四季春', '100000', '未分配的', '42315', '7', '20.15', '1010', '4030', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('462', '84', '商配KA', '二级', '敬仁堂连锁', '3839438', '四季春', '100000', '未分配的', '1260', '7', '0.6', '1010', '120', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('463', '84', '商配KA', '二级', '永生堂连锁', '3927748', '四季春', '100000', '未分配的', '9870', '7', '4.7', '1010', '940', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('464', '84', '商配KA', '二级', '明医堂达药房', '4020008', '四季春', '100000', '未分配的', '105', '7', '0.05', '1010', '10', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('465', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '105556.5', '7', '50.265', '1010', '10053', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('466', '84', '商配KA', '二级', '京海康佰馨有限责任公司', '3144982', '四季春', '100000', '未分配的', '128', '7', '0.083', '1010', '10', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('467', '84', '商配KA', '二级', '永生堂连锁', '3927748', '四季春', '100000', '未分配的', '2432', '7', '1.583', '1010', '190', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('468', '84', '商配KA', '二级', '明医堂达药房', '4020008', '四季春', '100000', '未分配的', '3072', '7', '2', '1010', '240', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('469', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '47641.6', '7', '31.017', '1010', '3722', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('47', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '260', '5', '0.217', '1010', '130', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('470', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '24896', '7', '16.21', '1010', '1945', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('471', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '18.24', '7', '0.008', '1010', '1', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('472', '84', '商配KA', '二级', '明医堂达药房', '4020008', '四季春', '100000', '未分配的', '108', '7', '0.063', '1010', '15', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('473', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '528', '8', '0.802', '1010', '96', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('474', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '233.12', '8', '0.389', '1010', '31', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('475', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '696.8', '8', '0.651', '1010', '52', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('476', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '882', '8', '0.42', '1010', '84', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('477', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '36.48', '8', '0.016', '1010', '2', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('478', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '1342', '8', '2.034', '1010', '244', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('479', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '7.2', '8', '0.017', '1010', '2', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('48', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '37044', '5', '17.64', '1010', '3528', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('480', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '26.8', '8', '0.025', '1010', '2', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('481', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '26265.6', '8', '12', '1010', '1440', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('482', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '632.5', '8', '0.957', '1010', '115', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('483', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '990', '8', '0.688', '1010', '55', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('484', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '763.8', '8', '0.713', '1010', '57', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('485', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '140', '8', '0.1', '1010', '20', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('486', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '3307.5', '8', '1.575', '1010', '315', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('487', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '44', '8', '0.067', '1010', '8', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('488', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1391.5', '8', '2.108', '1010', '253', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('489', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '82.5', '8', '0.125', '1010', '15', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('49', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '117841.5', '5', '56.115', '1010', '11223', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('490', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '412.5', '8', '0.624', '1010', '75', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('491', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1485', '8', '2.252', '1010', '270', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('492', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1248.5', '8', '1.892', '1010', '227', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('493', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '432', '8', '1', '1010', '120', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('494', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4046.4', '8', '9.367', '1010', '1124', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('495', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '72', '8', '0.166', '1010', '20', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('496', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '896.4', '8', '2.079', '1010', '249', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('497', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '180', '8', '0.417', '1010', '50', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('498', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '-22.56', '8', '-0.037', '1010', '-3', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('499', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '127.84', '8', '0.213', '1010', '17', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('5', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '714.4', '5', '1.189', '1010', '95', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('50', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '118534.5', '5', '56.445', '1010', '11289', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('500', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '518.88', '8', '0.866', '1010', '69', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('501', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '22.56', '8', '0.037', '1010', '3', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('502', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '36', '8', '0.025', '1010', '2', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('503', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '12.8', '8', '0.017', '1010', '1', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('504', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '128', '8', '0.167', '1010', '10', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('505', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1920', '8', '2.5', '1010', '150', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('506', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '390', '8', '0.3', '1010', '30', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('507', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '26', '8', '0.02', '1010', '2', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('508', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '130', '8', '0.1', '1010', '10', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('509', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '650', '8', '0.5', '1010', '50', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('51', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '44583', '5', '21.23', '1010', '4246', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('510', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1072', '8', '1', '1010', '80', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('511', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '348.4', '8', '0.325', '1010', '26', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('512', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '134', '8', '0.125', '1010', '10', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('513', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1567.8', '8', '1.467', '1010', '117', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('514', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '268', '8', '0.25', '1010', '20', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('515', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '35', '8', '0.025', '1010', '5', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('516', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '35', '8', '0.025', '1010', '5', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('517', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '84', '8', '0.067', '1010', '8', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '10001006300', '北京');
INSERT INTO `poc_flowdire` VALUES ('518', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '21', '8', '0.017', '1010', '2', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '10001006300', '北京');
INSERT INTO `poc_flowdire` VALUES ('519', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '304', '8', '0.253', '1010', '152', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('52', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '131134.5', '5', '62.445', '1010', '12489', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('520', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '96', '8', '0.079', '1010', '48', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('521', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '48', '8', '0.04', '1010', '24', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('522', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '590', '8', '0.492', '1010', '295', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('523', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '120', '8', '0.1', '1010', '60', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('524', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '74', '8', '0.062', '1010', '37', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('525', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2134', '8', '1.778', '1010', '1067', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('526', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '4', '8', '0.003', '1010', '2', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('527', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '10', '8', '0.008', '1010', '5', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('528', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '128', '8', '0.107', '1010', '64', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('529', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '832', '8', '0.693', '1010', '416', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('53', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '188.7', '5', '0.255', '1010', '51', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('530', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '6044', '8', '5.037', '1010', '3022', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('531', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '628', '8', '0.524', '1010', '314', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('532', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '460', '8', '0.384', '1010', '230', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('533', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '288', '8', '0.239', '1010', '144', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('534', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '148', '8', '0.123', '1010', '74', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('535', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '100', '8', '0.083', '1010', '50', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('536', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '1100', '8', '0.917', '1010', '550', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('537', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '13338', '8', '2.47', '1010', '494', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('538', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '27', '8', '0.005', '1010', '1', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('539', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1050', '8', '0.5', '1010', '100', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('54', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '74', '5', '0.1', '1010', '20', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('540', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '210', '8', '0.1', '1010', '20', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('541', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2467.5', '8', '1.175', '1010', '235', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('542', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '84157.5', '8', '40.075', '1010', '8015', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('543', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '105', '8', '0.05', '1010', '10', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('544', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '9187.5', '8', '4.375', '1010', '875', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('545', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '17850', '8', '8.5', '1010', '1700', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('546', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '1050', '8', '0.5', '1010', '100', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('547', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '11182.5', '8', '5.325', '1010', '1065', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('548', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '12810', '8', '6.1', '1010', '1220', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('549', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4242', '8', '2.02', '1010', '404', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('55', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '33', '5', '0.05', '1010', '6', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('550', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '52.5', '8', '0.025', '1010', '5', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('551', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '52.5', '8', '0.025', '1010', '5', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('552', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2688', '8', '1.28', '1010', '256', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('553', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '2520', '8', '1.2', '1010', '240', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('554', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '315', '8', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('555', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '1470', '8', '0.7', '1010', '140', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('556', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2793', '8', '1.33', '1010', '266', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('557', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '24213', '8', '11.53', '1010', '2306', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('558', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '-231', '8', '-0.11', '1010', '-22', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('559', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '20580', '8', '9.8', '1010', '1960', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('56', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '313.5', '5', '0.475', '1010', '57', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('560', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '4515', '8', '2.15', '1010', '430', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('561', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '9418.5', '8', '4.485', '1010', '897', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('562', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '1260', '8', '0.6', '1010', '120', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('563', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '6300', '8', '3', '1010', '600', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('564', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-207.67', '8', '-0.158', '1010', '-19', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('565', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '-2382.74', '8', '-1.816', '1010', '-218', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('566', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '10.93', '8', '0.008', '1010', '1', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('567', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '218.6', '8', '0.167', '1010', '20', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('568', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '547.2', '8', '0.25', '1010', '30', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('569', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '26995.2', '8', '12.335', '1010', '1480', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('57', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '55', '5', '0.083', '1010', '10', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('570', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '33196.8', '8', '15.167', '1010', '1820', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('571', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '19152', '8', '8.75', '1010', '1050', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('572', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '65572.8', '8', '29.965', '1010', '3595', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('573', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '41769.6', '8', '19.084', '1010', '2290', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('574', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '54.72', '8', '0.025', '1010', '3', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('575', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '10032', '8', '4.583', '1010', '550', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('576', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '4012.8', '8', '1.833', '1010', '220', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('577', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '6566.4', '8', '3', '1010', '360', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('578', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '13680', '8', '6.251', '1010', '750', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('579', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '912', '8', '0.417', '1010', '50', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('58', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '286', '5', '0.433', '1010', '52', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('580', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '35203.2', '8', '16.085', '1010', '1930', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('581', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '8755.2', '8', '4', '1010', '480', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('582', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4924.8', '8', '2.25', '1010', '270', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('583', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '7296', '8', '3.334', '1010', '400', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('584', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '2371.2', '8', '1.084', '1010', '130', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('585', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '334.4', '8', '0.19', '1010', '38', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('586', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '369.6', '8', '0.21', '1010', '42', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('587', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '220', '8', '0.125', '1010', '25', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('588', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2135', '8', '2.083', '1010', '250', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('589', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '42.7', '8', '0.042', '1010', '5', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('59', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '110', '5', '0.167', '1010', '20', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('590', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '341.6', '8', '0.333', '1010', '40', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('591', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2135', '8', '2.084', '1010', '250', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('592', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '614.88', '8', '0.6', '1010', '72', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('593', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '85.4', '8', '0.083', '1010', '10', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('594', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '85.4', '8', '0.083', '1010', '10', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('595', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '37', '8', '0.05', '1010', '10', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('596', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '11.1', '8', '0.015', '1010', '3', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('597', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '7.4', '8', '0.01', '1010', '2', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('598', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '37', '8', '0.05', '1010', '10', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('599', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '18.5', '8', '0.025', '1010', '5', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('6', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3840', '5', '5', '1010', '300', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('60', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '30.08', '5', '0.05', '1010', '4', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('600', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '321.9', '8', '0.435', '1010', '87', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('601', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '81.4', '8', '0.11', '1010', '22', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('602', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3.7', '8', '0.005', '1010', '1', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('603', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '37', '8', '0.05', '1010', '10', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('604', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '14.4', '8', '0.008', '1010', '2', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('605', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '100.8', '8', '0.059', '1010', '14', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('606', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '216', '8', '0.125', '1010', '30', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('607', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '非协议经销商', '21', '8', '0.01', '1010', '2', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('608', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '配送平台', '4200', '8', '2', '1010', '400', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('609', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '商业配送KA', '99', '8', '0.15', '1010', '18', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('61', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '214.4', '5', '0.202', '1010', '16', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('610', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '110', '8', '0.166', '1010', '20', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('611', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '385', '8', '0.584', '1010', '70', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('612', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '37.6', '8', '0.063', '1010', '5', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('613', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '商业配送KA', '-13.4', '8', '-0.013', '1010', '-1', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('614', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '134', '8', '0.126', '1010', '10', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('615', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '294.8', '8', '0.276', '1010', '22', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('616', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '商业配送KA', '1365', '8', '0.65', '1010', '130', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('617', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '商业配送KA', '525', '8', '0.25', '1010', '50', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('618', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '-357', '8', '-0.17', '1010', '-34', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('619', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '1270.5', '8', '0.605', '1010', '121', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('62', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '174.2', '5', '0.162', '1010', '13', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('620', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '55', '8', '0.083', '1010', '10', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('621', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '55', '8', '0.083', '1010', '10', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('622', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '93.5', '8', '0.142', '1010', '17', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('623', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '27.5', '8', '0.042', '1010', '5', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('624', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '1243', '8', '1.885', '1010', '226', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('625', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1292.5', '8', '1.957', '1010', '235', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('626', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '181.5', '8', '0.275', '1010', '33', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('627', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '55', '8', '0.083', '1010', '10', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('628', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '2200', '8', '3.334', '1010', '400', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('629', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '935', '8', '1.417', '1010', '170', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('63', '84', '商配KA', '二级', '医保中洋达药房', '3007898', '四季春', '100000', '未分配的', '441', '5', '0.21', '1010', '42', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('630', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1072.5', '8', '1.627', '1010', '195', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('631', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '11', '8', '0.017', '1010', '2', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('632', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '1468.5', '8', '2.229', '1010', '267', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('633', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1204.5', '8', '1.828', '1010', '219', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('634', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '27.5', '8', '0.042', '1010', '5', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('635', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '253', '8', '0.384', '1010', '46', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('636', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '110', '8', '0.167', '1010', '20', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('637', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '110', '8', '0.166', '1010', '20', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('638', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '275', '8', '0.415', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('639', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '11', '8', '0.017', '1010', '2', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('64', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '1050', '5', '0.5', '1010', '100', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('640', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '27.5', '8', '0.042', '1010', '5', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('641', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '61.2', '8', '0.142', '1010', '17', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('642', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '259.2', '8', '0.602', '1010', '72', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('643', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '180', '8', '0.417', '1010', '50', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('644', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '36', '8', '0.083', '1010', '10', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('645', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '262.8', '8', '0.608', '1010', '73', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('646', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '36', '8', '0.084', '1010', '10', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('647', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '36', '8', '0.083', '1010', '10', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('648', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '277.2', '8', '0.643', '1010', '77', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('649', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '18', '8', '0.042', '1010', '5', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('65', '84', '商配KA', '二级', '新龙集团京芝堂（）连锁', '3026347', '四季春', '100000', '未分配的', '3360', '5', '1.6', '1010', '320', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('650', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '1458', '8', '3.375', '1010', '405', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('651', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '18', '8', '0.042', '1010', '5', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('652', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '14.4', '8', '0.033', '1010', '4', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('653', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '105.28', '8', '0.175', '1010', '14', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('654', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '112.8', '8', '0.188', '1010', '15', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('655', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '22.56', '8', '0.037', '1010', '3', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('656', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '473.76', '8', '0.787', '1010', '63', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('657', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '82.72', '8', '0.136', '1010', '11', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('658', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '768', '8', '1', '1010', '60', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('659', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1902.8', '8', '1.778', '1010', '142', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('66', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '1575', '5', '0.75', '1010', '150', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('660', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '938', '8', '0.876', '1010', '70', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('661', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '321.6', '8', '0.301', '1010', '24', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('662', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '53.6', '8', '0.05', '1010', '4', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('663', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '683.4', '8', '0.638', '1010', '51', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('664', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '67', '8', '0.063', '1010', '5', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('665', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '442.2', '8', '0.414', '1010', '33', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('666', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '40.2', '8', '0.037', '1010', '3', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('667', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '335', '8', '0.313', '1010', '25', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('668', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '40', '8', '0.033', '1010', '20', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('669', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '420', '8', '0.2', '1010', '40', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('67', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '25662', '5', '12.22', '1010', '2444', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('670', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '262.5', '8', '0.125', '1010', '25', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('671', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '630', '8', '0.3', '1010', '60', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('672', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '210', '8', '0.1', '1010', '20', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('673', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '336', '8', '0.16', '1010', '32', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('674', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '31.5', '8', '0.015', '1010', '3', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('675', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '840', '8', '0.4', '1010', '80', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('676', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '4420.5', '8', '2.105', '1010', '421', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('677', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2404.5', '8', '1.145', '1010', '229', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('678', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '3790.5', '8', '1.805', '1010', '361', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('679', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3234', '8', '1.54', '1010', '308', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('68', '84', '商配KA', '二级', '国达药房连锁', '5047913', '四季春', '100000', '未分配的', '22417.5', '5', '10.675', '1010', '2135', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('680', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2163', '8', '1.03', '1010', '206', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('681', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '4830', '8', '2.3', '1010', '460', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('682', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1291.5', '8', '0.615', '1010', '123', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('683', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '315', '8', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('684', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1050', '8', '0.5', '1010', '100', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('685', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3780', '8', '1.8', '1010', '360', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('686', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '4368', '8', '2.08', '1010', '416', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('687', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '892.5', '8', '0.425', '1010', '85', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('688', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '882', '8', '0.42', '1010', '84', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('689', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '6132', '8', '2.92', '1010', '584', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('69', '84', '商配KA', '二级', '好得快', '5051085', '四季春', '100000', '未分配的', '2100', '5', '1', '1010', '200', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('690', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '4000.5', '8', '1.905', '1010', '381', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('691', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '4851', '8', '2.31', '1010', '462', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('692', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '231', '8', '0.11', '1010', '22', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('693', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '157.5', '8', '0.075', '1010', '15', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('694', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1365', '8', '0.65', '1010', '130', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('695', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '8505', '8', '4.05', '1010', '810', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('696', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '4095', '8', '1.95', '1010', '390', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('697', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '10867.5', '8', '5.175', '1010', '1035', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('698', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '4336.5', '8', '2.065', '1010', '413', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('699', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '1575', '8', '0.75', '1010', '150', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('7', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '42.5', '5', '0.042', '1010', '5', '感冒清热颗粒 3克*10袋*1100盒', '10001001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('70', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '未分配的', '-76.8', '5', '-0.05', '1010', '-6', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('700', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '7717.5', '8', '3.675', '1010', '735', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('701', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '3990', '8', '1.9', '1010', '380', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('702', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '4560', '8', '2.083', '1010', '250', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('703', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '37', '8', '0.05', '1010', '10', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('704', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '11.1', '8', '0.015', '1010', '3', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('705', '84', '商配KA', '二级', '永安复星', '3145423', '四季春', '100000', '商业配送KA', '4200', '8', '2', '1010', '400', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('706', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '385', '8', '0.582', '1010', '70', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('707', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '670', '8', '0.626', '1010', '50', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('708', '84', '商配KA', '二级', '明医堂达药房', '4020008', '四季春', '100000', '未分配的', '52.5', '8', '0.025', '1010', '5', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('709', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '2037', '8', '0.97', '1010', '194', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('71', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '30592', '5', '19.924', '1010', '2390', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('710', '84', '商配KA', '二级', '正济堂连锁超市', '3661944', '四季春', '100000', '未分配的', '525', '8', '0.25', '1010', '50', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('711', '84', '商配KA', '二级', '永安堂连锁有限责任公司', '5027724', '四季春', '100000', '未分配的', '4200', '8', '2', '1010', '400', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('712', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '3780', '8', '1.8', '1010', '360', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('713', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '5017.6', '8', '3.266', '1010', '392', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('714', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '1932.8', '8', '1.259', '1010', '151', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('715', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '未分配的', '5568', '8', '3.623', '1010', '435', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('716', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '27434', '9', '41.567', '1010', '4988', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('717', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '13345.2', '9', '30.895', '1010', '3707', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('718', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '18', '9', '0.042', '1010', '5', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('719', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '3263.68', '9', '5.425', '1010', '434', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('72', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '未分配的', '2304', '5', '1.5', '1010', '180', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('720', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '90', '9', '0.063', '1010', '5', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('721', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '4608', '9', '6.001', '1010', '360', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('722', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '3840', '9', '5', '1010', '300', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('723', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '34', '9', '0.034', '1010', '4', '感冒清热颗粒 3克*10袋*1100盒', '10001001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('724', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '182', '9', '0.14', '1010', '14', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('725', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '4160', '9', '3.2', '1010', '320', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('726', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '11711.6', '9', '10.929', '1010', '874', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('727', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '105', '9', '0.075', '1010', '15', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('728', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '367.5', '9', '0.293', '1010', '35', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '10001006300', '北京');
INSERT INTO `poc_flowdire` VALUES ('729', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '-416', '9', '-0.347', '1010', '-208', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('73', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '未分配的', '64128', '5', '41.768', '1010', '5010', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('730', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '15632', '9', '13.029', '1010', '7816', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('731', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '', '160', '9', '0.133', '1010', '80', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('732', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '562', '9', '0.469', '1010', '281', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('733', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '4286', '9', '3.573', '1010', '2143', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('734', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '13554', '9', '2.51', '1010', '502', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('735', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '12054', '9', '5.74', '1010', '1148', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('736', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '1102.5', '9', '0.525', '1010', '105', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('737', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '997.5', '9', '0.475', '1010', '95', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('738', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '1470', '9', '0.7', '1010', '140', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('739', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '0', '9', '-0.001', '1010', '0', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('74', '84', '商配KA', '二级', '国达药房连锁', '5047913', '四季春', '100000', '未分配的', '22003.2', '5', '14.326', '1010', '1719', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('740', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '546.5', '9', '0.417', '1010', '50', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('741', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '13114.56', '9', '5.992', '1010', '719', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('742', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '5016', '9', '2.292', '1010', '275', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('743', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '', '364.8', '9', '0.167', '1010', '20', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('744', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '1094.4', '9', '0.5', '1010', '60', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('745', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '364.8', '9', '0.167', '1010', '20', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('746', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '1196.8', '9', '0.68', '1010', '136', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('747', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '3006.08', '9', '2.934', '1010', '352', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('748', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '1161.44', '9', '1.132', '1010', '136', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('749', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '3492.86', '9', '3.407', '1010', '409', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('75', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '7340.4', '4', '16.994', '1010', '2039', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('750', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '77.7', '9', '0.105', '1010', '21', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('751', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '266.4', '9', '0.36', '1010', '72', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('752', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '62.9', '9', '0.085', '1010', '17', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('753', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '237.6', '9', '0.139', '1010', '33', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('754', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '5126', '9', '7.77', '1010', '932', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('755', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '5841', '9', '8.852', '1010', '1062', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('756', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '4840', '9', '7.332', '1010', '880', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('757', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '3261.5', '9', '4.945', '1010', '593', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('758', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '2235.6', '9', '5.174', '1010', '621', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('759', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '1116', '9', '2.583', '1010', '310', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('76', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3346.2', '4', '8.58', '1010', '858', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('760', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '468', '9', '1.084', '1010', '130', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('761', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '406.08', '9', '0.675', '1010', '54', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('762', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '37.6', '9', '0.062', '1010', '5', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('763', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '-13.4', '9', '-0.012', '1010', '-1', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('764', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '2237.8', '9', '2.091', '1010', '167', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('765', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '1433.8', '9', '1.34', '1010', '107', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('766', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '380', '9', '0.317', '1010', '190', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('767', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '', '3979.5', '9', '1.895', '1010', '379', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('768', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '2856', '9', '1.36', '1010', '272', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('769', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '1554', '9', '0.74', '1010', '148', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('77', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2048', '4', '2.667', '1010', '160', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('770', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '2845.5', '9', '1.355', '1010', '271', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('771', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '5502', '9', '2.62', '1010', '524', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('772', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '182.4', '9', '0.083', '1010', '10', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('773', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '880', '9', '0.5', '1010', '100', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('774', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '55.5', '9', '0.075', '1010', '15', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('775', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '473', '9', '0.715', '1010', '86', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('776', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '52.64', '9', '0.087', '1010', '7', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('777', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '52', '9', '0.04', '1010', '4', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('778', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '482.4', '9', '0.45', '1010', '36', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('779', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '', '670', '9', '0.625', '1010', '50', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('78', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2048', '4', '2.667', '1010', '160', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('780', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '9477', '9', '1.755', '1010', '351', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('781', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '315', '9', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('782', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '', '756', '9', '0.36', '1010', '72', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('783', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '', '2483.2', '9', '1.618', '1010', '194', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('784', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '52.8', '9', '0.03', '1010', '6', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('785', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '53993.5', '11', '81.805', '1010', '9817', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('786', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '13888.8', '11', '32.15', '1010', '3858', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('787', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '2023.2', '11', '4.683', '1010', '562', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('788', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '1729.6', '11', '2.873', '1010', '230', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('789', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '2808', '11', '1.952', '1010', '156', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('79', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '5592', '4', '4.655', '1010', '2796', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('790', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '4800', '11', '6.249', '1010', '375', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('791', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '569.5', '11', '0.56', '1010', '67', '感冒清热颗粒 3克*10袋*1100盒', '10001001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('792', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '5296.6', '11', '3.111', '1010', '373', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('793', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '4433', '11', '3.41', '1010', '341', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('794', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '2860', '11', '2.2', '1010', '220', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('795', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '19135.2', '11', '17.854', '1010', '1428', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('796', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '7326', '11', '10.179', '1010', '1221', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('797', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '2359', '11', '1.685', '1010', '337', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('798', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '178.5', '11', '0.143', '1010', '17', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '10001006300', '北京');
INSERT INTO `poc_flowdire` VALUES ('799', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '1904', '11', '1.583', '1010', '952', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('8', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '910', '5', '0.7', '1010', '70', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('80', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '10914', '4', '9.093', '1010', '5457', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('800', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '8896', '11', '7.416', '1010', '4448', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('801', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '', '700', '11', '0.582', '1010', '350', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('802', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '680', '11', '0.567', '1010', '340', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('803', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '4220', '11', '3.515', '1010', '2110', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('804', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '12096', '11', '2.24', '1010', '448', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('805', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '35136', '11', '39.487', '1010', '4737', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('806', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '-48174', '11', '-22.94', '1010', '-4588', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('807', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '94.5', '11', '0.045', '1010', '9', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('808', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '157.5', '11', '0.075', '1010', '15', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('809', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '735', '11', '0.35', '1010', '70', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('81', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '520', '4', '0.433', '1010', '260', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('810', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '4984.08', '11', '3.802', '1010', '456', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('811', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '5956.85', '11', '4.54', '1010', '545', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('812', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '6109.87', '11', '4.656', '1010', '559', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('813', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '693.12', '11', '0.315', '1010', '38', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('814', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '', '364.8', '11', '0.167', '1010', '20', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('815', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '638.4', '11', '0.292', '1010', '35', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('816', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '273.6', '11', '0.125', '1010', '15', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('817', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '2807.2', '11', '1.595', '1010', '319', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('818', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '5965.05', '11', '1.427', '1010', '455', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('819', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '3893.67', '11', '0.928', '1010', '297', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('82', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '6796', '4', '5.668', '1010', '3398', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('820', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '7162.8', '11', '3.176', '1010', '381', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('821', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '44393.05', '11', '45.395', '1010', '5447', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('822', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '7293.6', '11', '8.442', '1010', '1013', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('823', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '3381.84', '11', '3.302', '1010', '396', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('824', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '', '2109.38', '11', '2.057', '1010', '247', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('825', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '3578.26', '11', '3.491', '1010', '419', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('826', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '218.3', '11', '0.295', '1010', '59', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('827', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '', '55.5', '11', '0.075', '1010', '15', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('828', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '', '2217.6', '11', '1.285', '1010', '308', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('829', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '', '275', '11', '0.417', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('83', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1110.2', '4', '1.082', '1010', '130', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('830', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '9812', '11', '14.869', '1010', '1784', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('831', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '6924.5', '11', '10.497', '1010', '1259', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('832', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '4004', '11', '6.064', '1010', '728', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('833', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '3514.5', '11', '5.328', '1010', '639', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('834', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '1497.6', '11', '3.468', '1010', '416', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('835', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '1476', '11', '3.416', '1010', '410', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('836', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '3078', '11', '7.127', '1010', '855', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('837', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '23.4', '11', '0.06', '1010', '6', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('838', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '60.16', '11', '0.1', '1010', '8', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('839', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '180.48', '11', '0.3', '1010', '24', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('84', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '461.16', '4', '0.45', '1010', '54', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('840', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '64', '11', '0.083', '1010', '5', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('841', '82', '分销', '二级', '红惠', '3146952', '四季春', '100000', '', '768', '11', '1', '1010', '60', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('842', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '142', '11', '0.083', '1010', '10', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('843', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '284', '11', '0.166', '1010', '20', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('844', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '670', '11', '0.628', '1010', '50', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('845', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '1728.6', '11', '1.617', '1010', '129', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('846', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '4301.4', '11', '4.016', '1010', '321', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('847', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '192', '11', '0.267', '1010', '32', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('848', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '220', '11', '0.183', '1010', '110', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('849', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '', '2608', '11', '2.957', '1010', '354', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('85', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '1306.62', '4', '1.275', '1010', '153', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('850', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '6635', '11', '7.396', '1010', '886', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('851', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '4347', '11', '4.776', '1010', '572', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('852', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '70', '11', '0.083', '1010', '10', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('853', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '2451', '11', '2.745', '1010', '329', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('854', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '', '-20895', '11', '-9.95', '1010', '-1990', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('855', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '1995', '11', '0.95', '1010', '190', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('856', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '2257.5', '11', '1.075', '1010', '215', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('857', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '2824.5', '11', '1.345', '1010', '269', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('858', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '6219.17', '11', '4.743', '1010', '569', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('859', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '91.2', '11', '0.042', '1010', '5', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('86', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '1878.8', '4', '1.832', '1010', '220', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('860', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '2106.94', '11', '0.492', '1010', '157', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('861', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '1959.32', '11', '0.458', '1010', '146', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('862', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '864.8', '11', '0.385', '1010', '46', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('863', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '770.8', '11', '0.343', '1010', '41', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('864', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '639.2', '11', '0.283', '1010', '34', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('865', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '', '10277.15', '11', '10.513', '1010', '1261', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('866', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '6218.45', '11', '6.355', '1010', '763', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('867', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '896.5', '11', '0.915', '1010', '110', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('868', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '4816.65', '11', '4.926', '1010', '591', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('869', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '', '72', '11', '0.083', '1010', '10', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('87', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '151.7', '4', '0.205', '1010', '41', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('870', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '', '216', '11', '0.25', '1010', '30', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('871', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '', '626.4', '11', '0.725', '1010', '87', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('872', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '', '66.6', '11', '0.09', '1010', '18', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('873', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '715', '11', '1.077', '1010', '130', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('874', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '45.12', '11', '0.074', '1010', '6', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('875', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '568', '11', '0.335', '1010', '40', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('876', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '39', '11', '0.03', '1010', '3', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('877', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '120.6', '11', '0.113', '1010', '9', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('878', '84', '商配KA', '二级', '嘉事堂连锁药店', '5045669', '四季春', '100000', '', '656.6', '11', '0.611', '1010', '49', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('879', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '', '246', '11', '0.342', '1010', '41', '氨酚烷胺颗粒  12袋/盒*120盒', '10001001700', '北京');
INSERT INTO `poc_flowdire` VALUES ('88', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '11.1', '4', '0.015', '1010', '3', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('880', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '7560', '11', '1.4', '1010', '280', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('881', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '283.5', '11', '0.135', '1010', '27', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('882', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '', '420', '11', '0.2', '1010', '40', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('883', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '', '115.5', '11', '0.055', '1010', '11', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('884', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '', '1267.2', '11', '0.828', '1010', '99', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('885', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '', '38.4', '11', '0.025', '1010', '3', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('886', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '52.8', '11', '0.03', '1010', '6', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('887', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '-26.84', '11', '-0.007', '1010', '-2', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('888', '84', '商配KA', '二级', '金象大药房连锁有限责任公司', '5027725', '四季春', '100000', '', '764.94', '11', '0.178', '1010', '57', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('889', '84', '商配KA', '二级', '德威治连锁有限责任公司', '5027764', '四季春', '100000', '', '187.88', '11', '0.044', '1010', '14', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('89', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '70.3', '4', '0.095', '1010', '19', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('890', '84', '商配KA', '二级', '好药师达药房连锁', '3007902', '四季春', '100000', '', '14.4', '11', '0.008', '1010', '2', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('891', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '852.5', '12', '1.292', '1010', '155', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('892', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '660', '12', '1', '1010', '120', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('893', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '335.5', '12', '0.507', '1010', '61', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('894', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '14795', '12', '22.417', '1010', '2690', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('895', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议一级经销商', '3300', '12', '5', '1010', '600', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('896', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '12496', '12', '18.937', '1010', '2272', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('897', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '432', '12', '1', '1010', '120', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('898', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '7344', '12', '17', '1010', '2040', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('899', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议一级经销商', '8640', '12', '20', '1010', '2400', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('9', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3510.8', '5', '3.283', '1010', '262', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('90', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '284.4', '4', '0.659', '1010', '79', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('900', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '12456', '12', '28.835', '1010', '3460', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('901', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '112.8', '12', '0.188', '1010', '15', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('902', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '37.6', '12', '0.063', '1010', '5', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('903', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '556.48', '12', '0.929', '1010', '74', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('904', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '13230', '12', '9.188', '1010', '735', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('905', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '1530', '12', '1.064', '1010', '85', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('906', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1566', '12', '1.089', '1010', '87', '清肺化痰颗粒 3克*15袋*80盒', '10001000709', '北京');
INSERT INTO `poc_flowdire` VALUES ('907', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '3072', '12', '4', '1010', '240', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('908', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '9049.6', '12', '11.782', '1010', '707', '板蓝根颗粒 10克*100袋*30包', '10001000800', '北京');
INSERT INTO `poc_flowdire` VALUES ('909', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3111', '12', '3.051', '1010', '366', '感冒清热颗粒 3克*10袋*1100盒', '10001001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('91', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '360', '4', '0.833', '1010', '100', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('910', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '1121.8', '12', '0.661', '1010', '79', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('911', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '667.4', '12', '0.393', '1010', '47', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('912', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '65', '12', '0.05', '1010', '5', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('913', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '65', '12', '0.05', '1010', '5', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('914', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1105', '12', '0.85', '1010', '85', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('915', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '1950', '12', '1.5', '1010', '150', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('916', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '5735.2', '12', '5.351', '1010', '428', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('917', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '5360', '12', '5', '1010', '400', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('918', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '938', '12', '0.876', '1010', '70', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('919', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '3752', '12', '3.5', '1010', '280', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('92', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2073.6', '4', '4.802', '1010', '576', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('920', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1514.2', '12', '1.416', '1010', '113', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');
INSERT INTO `poc_flowdire` VALUES ('921', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '-42', '12', '-0.058', '1010', '-7', '氨酚烷胺颗粒  12袋/盒*120盒', '10001001700', '北京');
INSERT INTO `poc_flowdire` VALUES ('922', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '30', '12', '0.042', '1010', '5', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('923', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '720', '12', '1', '1010', '120', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('924', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4608', '12', '6.402', '1010', '768', '氨酚烷胺颗粒  10袋/盒*1100盒', '10001001702', '北京');
INSERT INTO `poc_flowdire` VALUES ('925', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '238', '12', '0.17', '1010', '34', '咳喘灵颗粒 2克*3袋*1000盒', '10001003201', '北京');
INSERT INTO `poc_flowdire` VALUES ('926', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '105', '12', '0.085', '1010', '10', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '10001006300', '北京');
INSERT INTO `poc_flowdire` VALUES ('927', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4032', '12', '3.359', '1010', '2016', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('928', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '10694', '12', '8.912', '1010', '5347', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('929', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '726', '12', '0.603', '1010', '363', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('93', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '3174.6', '4', '8.14', '1010', '814', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('930', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '1166', '12', '0.971', '1010', '583', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('931', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '2508', '12', '2.085', '1010', '1254', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('932', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '22140', '12', '4.1', '1010', '820', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('933', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4860', '12', '0.9', '1010', '180', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('934', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '10400', '12', '10.833', '1010', '1300', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('935', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '13440', '12', '14', '1010', '1680', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('936', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议一级经销商', '4800', '12', '5', '1010', '600', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('937', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4064', '12', '4.247', '1010', '508', '三维亚油酸胶丸I 100粒*1100瓶', '10005000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('938', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '315', '12', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('939', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '42052.5', '12', '20.025', '1010', '4005', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('94', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '257.4', '4', '0.66', '1010', '66', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('940', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '1648.5', '12', '0.785', '1010', '157', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('941', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '2100', '12', '1', '1010', '200', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('942', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '5670', '12', '2.7', '1010', '540', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('943', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '766.5', '12', '0.365', '1010', '73', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('944', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '315', '12', '0.15', '1010', '30', '铜绿颗粒 0.45克*12粒*2板*1000盒', '10005000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('945', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '2677.85', '12', '2.042', '1010', '245', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('946', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '240.46', '12', '0.184', '1010', '22', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('947', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '218.6', '12', '0.168', '1010', '20', '铜绿颗粒 0.45克*12粒*3板*1100盒', '10005000512', '北京');
INSERT INTO `poc_flowdire` VALUES ('948', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '-24806.4', '12', '-11.333', '1010', '-1360', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('949', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '-2152.32', '12', '-0.983', '1010', '-118', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('95', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '1240.2', '4', '3.18', '1010', '318', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('950', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '912', '12', '0.417', '1010', '50', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('951', '01', '商务', '一级', '华润商业集团', '100004', '华润商业集团', '100004', '未分配的', '1276.8', '12', '0.584', '1010', '70', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('952', '01', '商务', '一级', '科园信海经营', '100253', '科园信海经营', '100253', '未分配的', '-12950.4', '12', '-5.917', '1010', '-710', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('953', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '364.8', '12', '0.166', '1010', '20', '铜绿颗粒 0.45克*12粒*4板*1100盒', '10005000514', '北京');
INSERT INTO `poc_flowdire` VALUES ('954', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '246.4', '12', '0.14', '1010', '28', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('955', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '商业配送KA', '167.2', '12', '0.095', '1010', '19', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('956', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '440', '12', '0.25', '1010', '50', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('957', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '4004', '12', '2.275', '1010', '455', '感冒颗粒 12粒*2板*1000盒', '10005000600', '北京');
INSERT INTO `poc_flowdire` VALUES ('958', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '91.77', '12', '0.022', '1010', '7', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('959', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '-196.65', '12', '-0.047', '1010', '-15', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('96', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '20', '4', '0.017', '1010', '10', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '10002000101', '北京');
INSERT INTO `poc_flowdire` VALUES ('960', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '367.08', '12', '0.087', '1010', '28', '清开灵软颗粒 0.4克*12粒*1板*320盒', '10005000700', '北京');
INSERT INTO `poc_flowdire` VALUES ('961', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '2632', '12', '1.167', '1010', '140', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('962', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3948', '12', '1.751', '1010', '210', '参麦注射液 10克*5支*1100盒', '10006000100', '北京');
INSERT INTO `poc_flowdire` VALUES ('963', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '4890', '12', '5', '1010', '600', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('964', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '10269', '12', '10.5', '1010', '1260', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('965', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议一级经销商', '14670', '12', '15', '1010', '1800', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('966', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '26161.5', '12', '26.745', '1010', '3210', '四物注射液 10克*5支*1100盒', '10006000201', '北京');
INSERT INTO `poc_flowdire` VALUES ('967', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '三级经销商', '-280.8', '12', '-0.325', '1010', '-39', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('968', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '协议二级非基药配送商', '2592', '12', '3', '1010', '360', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('969', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '2721.6', '12', '3.15', '1010', '378', '黄芪注射液 10克*5支*1100盒', '10006000901', '北京');
INSERT INTO `poc_flowdire` VALUES ('97', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '436.6', '4', '0.59', '1010', '118', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('970', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '3373.3', '12', '3.292', '1010', '395', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('971', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '512.4', '12', '0.5', '1010', '60', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('972', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '3535.56', '12', '3.45', '1010', '414', '灯盏注射液 10克*5支*1100盒', '10006001100', '北京');
INSERT INTO `poc_flowdire` VALUES ('973', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '111', '12', '0.15', '1010', '30', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('974', '01', '商务', '一级', '四药控股', '100957', '四药控股', '100957', '未分配的', '3.7', '12', '0.005', '1010', '1', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('975', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '59.2', '12', '0.08', '1010', '16', '柴胡注射液 2克*10支*1000盒', '10006001900', '北京');
INSERT INTO `poc_flowdire` VALUES ('976', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '非协议经销商', '3492', '12', '2.021', '1010', '485', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('977', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '338.4', '12', '0.196', '1010', '47', '涩肠止泻散 4克*3袋*240盒', '10009000202', '北京');
INSERT INTO `poc_flowdire` VALUES ('978', '82', '分销', '二级', '丰瑞龙翔', '100112', '四季春', '100000', '未分配的', '275', '12', '0.417', '1010', '50', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('979', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '商业配送KA', '99', '12', '0.15', '1010', '18', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('98', '01', '商务', '一级', '嘉事堂', '1002856', '嘉事堂', '1002856', '未分配的', '1040', '4', '0.8', '1010', '80', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('980', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '未分配的', '11363', '12', '17.222', '1010', '2066', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('981', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '638', '12', '0.967', '1010', '116', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('982', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '5929', '12', '8.984', '1010', '1078', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('983', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '2090', '12', '3.168', '1010', '380', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('984', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '三级经销商', '660', '12', '1.001', '1010', '120', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('985', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '1804', '12', '2.737', '1010', '328', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('986', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '2315.5', '12', '3.512', '1010', '421', '氨酚黄那敏颗粒  100袋/盒*1100盒', '10001000113', '北京');
INSERT INTO `poc_flowdire` VALUES ('987', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '2602.8', '12', '6.026', '1010', '723', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('988', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '2124', '12', '4.917', '1010', '590', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('989', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '三级经销商', '792', '12', '1.833', '1010', '220', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('99', '01', '商务', '一级', '四季春', '100000', '四季春', '100000', '未分配的', '1215', '4', '0.225', '1010', '45', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '10002000301', '北京');
INSERT INTO `poc_flowdire` VALUES ('990', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '4845.6', '12', '11.218', '1010', '1346', '氨酚那敏颗粒 100袋/盒*1100盒', '10001000306', '北京');
INSERT INTO `poc_flowdire` VALUES ('991', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '11.7', '12', '0.03', '1010', '3', '酚氨咖敏颗粒 5克*100袋*100包', '10001000402', '北京');
INSERT INTO `poc_flowdire` VALUES ('992', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '商业配送KA', '7.52', '12', '0.013', '1010', '1', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('993', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '203.04', '12', '0.337', '1010', '27', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('994', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '商业配送KA', '7.52', '12', '0.013', '1010', '1', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('995', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '22.56', '12', '0.037', '1010', '3', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '10001000500', '北京');
INSERT INTO `poc_flowdire` VALUES ('996', '82', '分销', '二级', '悦康源通', '1001288', '四季春', '100000', '未分配的', '355', '12', '0.208', '1010', '25', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('997', '82', '分销', '二级', '华润新龙（）', '1003145', '四季春', '100000', '未分配的', '255.6', '12', '0.15', '1010', '18', '解郁安神颗粒 5克*10袋*1100盒', '10001001200', '北京');
INSERT INTO `poc_flowdire` VALUES ('998', '82', '分销', '二级', '天力泽', '1002859', '四季春', '100000', '未分配的', '65', '12', '0.05', '1010', '5', '益母草颗粒 15克*4袋*40盒', '10001001401', '北京');
INSERT INTO `poc_flowdire` VALUES ('999', '82', '分销', '二级', '凯宏鑫有限责任公司', '1000001', '四季春', '100000', '商业配送KA', '335', '12', '0.313', '1010', '25', '通脉颗粒 4克*4袋*80盒', '10001001500', '北京');

-- ----------------------------
-- Table structure for poc_flowdire_analysis
-- ----------------------------
DROP TABLE IF EXISTS `poc_flowdire_analysis`;
CREATE TABLE `poc_flowdire_analysis` (
  `ID_` varchar(40) NOT NULL,
  `FLOW_DIRE_APRI1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_APRI2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_AUG1` int(11) DEFAULT NULL,
  `FLOW_DIRE_AUG2` int(11) DEFAULT NULL,
  `FLOW_DIRE_DEC1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_DEC2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_FEB1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_FEB2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_JAN1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_JAN2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_JUL1` int(11) DEFAULT NULL,
  `FLOW_DIRE_JUL2` int(11) DEFAULT NULL,
  `FLOW_DIRE_JUN1` int(11) DEFAULT NULL,
  `FLOW_DIRE_JUN2` int(11) DEFAULT NULL,
  `FLOW_DIRE_MAR1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_MAR2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_MAY1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_MAY2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_NOV1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_NOV2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_OCT1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_OCT2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_SEP1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_SEP2_` int(11) DEFAULT NULL,
  `FLOW_DIRE_TOTAL1_` int(11) DEFAULT NULL,
  `FLOW_DIRE_TOTAL2_` int(11) DEFAULT NULL,
  `HIGH_MONTH_` varchar(40) DEFAULT NULL,
  `LEDGER_ID_` varchar(40) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_DEC1_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_DEC2_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_NOV1_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_NOV2_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_flowdire_analysis
-- ----------------------------

-- ----------------------------
-- Table structure for poc_ledger
-- ----------------------------
DROP TABLE IF EXISTS `poc_ledger`;
CREATE TABLE `poc_ledger` (
  `ID_` varchar(40) NOT NULL,
  `CALC_LEVEL1_` int(11) DEFAULT NULL,
  `CALC_LEVEL2_` int(11) DEFAULT NULL,
  `CALC_RESULT1_` int(11) DEFAULT NULL,
  `CALC_RESULT2_` int(11) DEFAULT NULL,
  `CALC_SALE_JAN_TO_NOV1_` int(11) DEFAULT NULL,
  `CALC_SALE_JAN_TO_NOV2_` int(11) DEFAULT NULL,
  `CUSTOMER_NAME_` varchar(50) DEFAULT NULL,
  `CUSTOMER_NO_` varchar(50) DEFAULT NULL,
  `HAS_OVERPLUS_CUR_MONTH_` varchar(50) DEFAULT NULL,
  `HAS_OVERPLUS_DEC_` varchar(50) DEFAULT NULL,
  `HAS_OVERPLUS_JAN_TO_NOV_` varchar(50) DEFAULT NULL,
  `HIGH_MONTH_` varchar(10) DEFAULT NULL,
  `INVENTORY_FINAL_` int(11) DEFAULT NULL,
  `INVENTORY_OPENING1_` int(11) DEFAULT NULL,
  `INVENTORY_OPENING2_` int(11) DEFAULT NULL,
  `MORE_LEVEL1_` int(11) DEFAULT NULL,
  `MORE_LEVEL2_` int(11) DEFAULT NULL,
  `PRODUCT_NAME_` varchar(50) DEFAULT NULL,
  `PRODUCT_NO_` varchar(50) DEFAULT NULL,
  `SALE_DEC1_` int(11) DEFAULT NULL,
  `SALE_DEC2_` int(11) DEFAULT NULL,
  `SALES_THEORY_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_DEC1_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_DEC2_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_NOV1_` int(11) DEFAULT NULL,
  `TOTAL_OF_OVER_JAN_TO_NOV2_` int(11) DEFAULT NULL,
  `TOTAL_SENDOUT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_ledger
-- ----------------------------

-- ----------------------------
-- Table structure for poc_sales
-- ----------------------------
DROP TABLE IF EXISTS `poc_sales`;
CREATE TABLE `poc_sales` (
  `UUID_` varchar(40) NOT NULL,
  `Auxiliary_column_` varchar(40) DEFAULT NULL,
  `CLIENT_PROPERTY_` varchar(40) DEFAULT NULL,
  `CUSTOMER_NO_` varchar(40) DEFAULT NULL,
  `FIRST_CUSTOMER_NAME_` varchar(40) DEFAULT NULL,
  `FIRST_CUSTOMER_NUMBER_` varchar(40) DEFAULT NULL,
  `MONEY_` varchar(40) DEFAULT NULL,
  `MONTH_` varchar(255) DEFAULT NULL,
  `NUMBER_` varchar(40) DEFAULT NULL,
  `OFFICE_` varchar(40) DEFAULT NULL,
  `Packet_NUMBER_` varchar(40) DEFAULT NULL,
  `PARENT_CUSTOMER_` varchar(40) DEFAULT NULL,
  `PRODUCT_GROUP_` varchar(40) DEFAULT NULL,
  `PRODUCT_NO_` varchar(40) DEFAULT NULL,
  `PRODUCT_NAME_` varchar(255) DEFAULT NULL,
  `TO_DO_` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`UUID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_sales
-- ----------------------------
INSERT INTO `poc_sales` VALUES ('1', null, '二级', '3007883', '四季春', '100000', '78', '2', '0.2', '北京', '20', '凯尔康大药房', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '昌平');
INSERT INTO `poc_sales` VALUES ('10', null, '二级', '1000001', '四季春', '100000', '134', '2', '0.125', '北京', '10', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('100', null, '二级', '1001288', '四季春', '100000', '117', '3', '0.3', '北京', '30', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1000', null, '一级', '1002856', '嘉事堂', '1002856', '13965', '7', '6.65', '北京', '1330', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1001', null, '一级', '1002856', '嘉事堂', '1002856', '62107.2', '7', '28.374', '北京', '3405', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1002', null, '二级', '1002859', '四季春', '100000', '97.15', '7', '0.147', '北京', '17.662', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1003', null, '二级', '1002859', '四季春', '100000', '-268', '7', '-0.25', '北京', '-20', '天力泽', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1004', null, '二级', '1002859', '四季春', '100000', '11781', '7', '5.61', '北京', '1122', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1005', null, '二级', '1002859', '四季春', '100000', '182.4', '7', '0.083', '北京', '10', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1006', null, '二级', '1003145', '四季春', '100000', '36', '7', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1007', null, '二级', '1003145', '四季春', '100000', '58.5', '7', '0.15', '北京', '15', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1008', null, '二级', '1003145', '四季春', '100000', '319', '7', '0.483', '北京', '58', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1009', null, '二级', '1003145', '四季春', '100000', '150.4', '7', '0.251', '北京', '20', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('101', null, '二级', '1001288', '四季春', '100000', '233.12', '3', '0.389', '北京', '31', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1010', null, '二级', '1003145', '四季春', '100000', '1005', '7', '0.938', '北京', '75', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1011', null, '二级', '1003145', '四季春', '100000', '30607.5', '7', '14.575', '北京', '2915', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1012', null, '二级', '3007902', '四季春', '100000', '132', '7', '0.201', '北京', '24', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1013', null, '二级', '3007902', '四季春', '100000', '37.6', '7', '0.062', '北京', '5', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1014', null, '二级', '3007902', '四季春', '100000', '402', '7', '0.375', '北京', '30', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1015', null, '二级', '3007902', '四季春', '100000', '703.5', '7', '0.335', '北京', '67', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1016', null, '二级', '3007902', '四季春', '100000', '64', '7', '0.042', '北京', '5', '好药师达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1017', null, '二级', '3007902', '四季春', '100000', '18.24', '7', '0.008', '北京', '1', '好药师达药房连锁', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1018', null, '二级', '3027238', '兰州四季春', '100678', '902.4', '7', '1.5', '北京', '120', '甘肃德生堂科技集团', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1019', null, '二级', '3541049', '内蒙古四季春', '100803', '105', '7', '0.05', '北京', '10', '陕西亿洲', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('102', null, '二级', '1001288', '四季春', '100000', '2312.7', '3', '2.187', '北京', '175', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1020', null, '二级', '5027725', '四季春', '100000', '13314', '7', '6.34', '北京', '1268', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1021', null, '二级', '5027725', '四季春', '100000', '21529.6', '7', '14.017', '北京', '1682', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1022', null, '二级', '5045669', '四季春', '100000', '14592', '7', '9.5', '北京', '1140', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1023', null, '一级', '100000', '四季春', '100000', '3019.5', '8', '4.576', '北京', '549', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1024', null, '二级', '1000001', '四季春', '100000', '3762', '8', '5.702', '北京', '684', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1025', null, '二级', '1001288', '四季春', '100000', '731.5', '8', '1.11', '北京', '133', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1026', null, '二级', '1002859', '四季春', '100000', '38.5', '8', '0.059', '北京', '7', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1027', null, '二级', '1003145', '四季春', '100000', '77', '8', '0.117', '北京', '14', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1028', null, '一级', '100000', '四季春', '100000', '903.6', '8', '2.091', '北京', '251', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1029', null, '二级', '1001288', '四季春', '100000', '226.8', '8', '0.526', '北京', '63', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('103', null, '二级', '1001288', '四季春', '100000', '8179.5', '3', '3.895', '北京', '779', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1030', null, '二级', '1002859', '四季春', '100000', '1260', '8', '2.917', '北京', '350', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1031', null, '二级', '1003145', '四季春', '100000', '18', '8', '0.042', '北京', '5', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1032', null, '二级', '1000089', '保定市久展销售', '101733', '78', '8', '0.2', '北京', '20', '河北顺泽', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1033', null, '一级', '100000', '四季春', '100000', '233.12', '8', '0.387', '北京', '31', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1034', null, '二级', '1000089', '保定市久展销售', '101733', '37.6', '8', '0.063', '北京', '5', '河北顺泽', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1035', null, '二级', '1001288', '四季春', '100000', '112.8', '8', '0.187', '北京', '15', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1036', null, '二级', '1003145', '四季春', '100000', '112.8', '8', '0.188', '北京', '15', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1037', null, '一级', '100000', '四季春', '100000', '990', '8', '0.688', '北京', '55', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1038', null, '一级', '100000', '四季春', '100000', '12.8', '8', '0.017', '北京', '1', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '海淀');
INSERT INTO `poc_sales` VALUES ('1039', null, '一级', '1002856', '嘉事堂', '1002856', '1040', '8', '0.8', '北京', '80', '嘉事堂', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('104', null, '一级', '1002856', '嘉事堂', '1002856', '568', '3', '0.475', '北京', '284', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1040', null, '一级', '100000', '四季春', '100000', '737', '8', '0.69', '北京', '55', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1041', null, '二级', '1001288', '四季春', '100000', '871', '8', '0.813', '北京', '65', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1042', null, '二级', '1002859', '四季春', '100000', '67', '8', '0.063', '北京', '5', '天力泽', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1043', null, '二级', '1003145', '四季春', '100000', '294.8', '8', '0.276', '北京', '22', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1044', null, '二级', '5045669', '四季春', '100000', '495.8', '8', '0.463', '北京', '37', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1045', null, '一级', '100000', '四季春', '100000', '175', '8', '0.125', '北京', '25', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1046', null, '一级', '100000', '四季春', '100000', '272', '8', '0.227', '北京', '136', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1047', null, '一级', '100004', '华润商业集团', '100004', '1532', '8', '1.276', '北京', '766', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1048', null, '一级', '100957', '四药控股', '100957', '100', '8', '0.083', '北京', '50', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1049', null, '一级', '1002856', '嘉事堂', '1002856', '2242', '8', '1.867', '北京', '1121', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('105', null, '一级', '1002856', '嘉事堂', '1002856', '218.6', '3', '0.166', '北京', '20', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1050', null, '二级', '1002859', '四季春', '100000', '40', '8', '0.033', '北京', '20', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1051', null, '一级', '100000', '四季春', '100000', '13257', '8', '2.455', '北京', '491', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1052', null, '一级', '100000', '四季春', '100000', '20517', '8', '9.77', '北京', '1954', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1053', null, '一级', '100004', '华润商业集团', '100004', '4620', '8', '2.2', '北京', '440', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1054', null, '二级', '100112', '四季春', '100000', '8032.5', '8', '3.825', '北京', '765', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1055', null, '一级', '100957', '四药控股', '100957', '19162.5', '8', '9.125', '北京', '1825', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1056', null, '二级', '1000001', '四季春', '100000', '11802', '8', '5.62', '北京', '1124', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1057', null, '二级', '1000089', '保定市久展销售', '101733', '89.12', '8', '0.042', '北京', '8.49', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1058', null, '二级', '1001288', '四季春', '100000', '2047.5', '8', '0.975', '北京', '195', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1059', null, '一级', '1002856', '嘉事堂', '1002856', '14700', '8', '7', '北京', '1400', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('106', null, '二级', '1003145', '四季春', '100000', '630', '3', '1.459', '北京', '175', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1060', null, '二级', '1002859', '四季春', '100000', '11077.5', '8', '5.275', '北京', '1055', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1061', null, '二级', '1003145', '四季春', '100000', '5806.5', '8', '2.765', '北京', '553', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1062', null, '二级', '5027724', '四季春', '100000', '2940', '8', '1.4', '北京', '280', '永安堂连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1063', null, '二级', '5027725', '四季春', '100000', '3402', '8', '1.62', '北京', '324', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1064', null, '一级', '100000', '四季春', '100000', '10.93', '8', '0.008', '北京', '1', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1065', null, '一级', '1002856', '嘉事堂', '1002856', '218.6', '8', '0.167', '北京', '20', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1066', null, '二级', '5027725', '四季春', '100000', '6361.6', '8', '4.144', '北京', '497', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1067', null, '一级', '100000', '四季春', '100000', '17875.2', '8', '8.167', '北京', '980', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1068', null, '一级', '100004', '华润商业集团', '100004', '16598.4', '8', '7.584', '北京', '910', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1069', null, '一级', '100253', '科园信海经营', '100253', '101779.2', '8', '46.5', '北京', '5580', '科园信海经营', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('107', null, '二级', '1003145', '四季春', '100000', '75.2', '3', '0.126', '北京', '10', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1070', null, '一级', '100957', '四药控股', '100957', '31920', '8', '14.584', '北京', '1750', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1071', null, '一级', '1002856', '嘉事堂', '1002856', '26812.8', '8', '12.25', '北京', '1470', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1072', null, '一级', '100000', '四季春', '100000', '413.6', '8', '0.235', '北京', '47', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1073', null, '一级', '100000', '四季春', '100000', '85.4', '8', '0.083', '北京', '10', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1074', null, '一级', '100957', '四药控股', '100957', '42.7', '8', '0.042', '北京', '5', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1075', null, '一级', '1002856', '嘉事堂', '1002856', '2220.4', '8', '2.166', '北京', '260', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1076', null, '一级', '100000', '四季春', '100000', '347.8', '8', '0.47', '北京', '94', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1077', null, '一级', '1002856', '嘉事堂', '1002856', '3.7', '8', '0.005', '北京', '1', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1078', null, '二级', '1002859', '四季春', '100000', '48.1', '8', '0.065', '北京', '13', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1079', null, '一级', '100000', '四季春', '100000', '14.4', '8', '0.008', '北京', '2', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '海淀');
INSERT INTO `poc_sales` VALUES ('108', null, '二级', '1003145', '四季春', '100000', '999.4', '3', '0.951', '北京', '76', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1080', null, '一级', '100000', '四季春', '100000', '1171.5', '8', '1.775', '北京', '213', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1081', null, '二级', '101164', '河北中健贸易集团', '100007', '165', '8', '0.25', '北京', '30', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1082', null, '二级', '1000001', '四季春', '100000', '561', '8', '0.851', '北京', '102', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1083', null, '二级', '1001288', '四季春', '100000', '665.5', '8', '1.009', '北京', '121', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1084', null, '二级', '1003145', '四季春', '100000', '346.5', '8', '0.525', '北京', '63', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1085', null, '一级', '100000', '四季春', '100000', '3956.4', '8', '9.159', '北京', '1099', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1086', null, '二级', '1001288', '四季春', '100000', '504', '8', '1.167', '北京', '140', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1087', null, '二级', '1003145', '四季春', '100000', '194.4', '8', '0.45', '北京', '54', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1088', null, '一级', '100000', '四季春', '100000', '120.32', '8', '0.201', '北京', '16', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1089', null, '二级', '1000089', '保定市久展销售', '101733', '37.6', '8', '0.063', '北京', '5', '河北顺泽', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('109', null, '二级', '1003145', '四季春', '100000', '3412.5', '3', '1.625', '北京', '325', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1090', null, '二级', '1003145', '四季春', '100000', '22.56', '8', '0.037', '北京', '3', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1091', null, '一级', '100000', '四季春', '100000', '768', '8', '1', '北京', '60', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('1092', null, '一级', '100000', '四季春', '100000', '281.4', '8', '0.263', '北京', '21', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1093', null, '二级', '1003145', '四季春', '100000', '402', '8', '0.376', '北京', '30', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1094', null, '一级', '100000', '四季春', '100000', '73.5', '8', '0.059', '北京', '7', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1095', null, '一级', '100000', '四季春', '100000', '96', '8', '0.08', '北京', '48', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1096', null, '一级', '100004', '华润商业集团', '100004', '110', '8', '0.091', '北京', '55', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1097', null, '一级', '1002856', '嘉事堂', '1002856', '192', '8', '0.16', '北京', '96', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1098', null, '一级', '100000', '四季春', '100000', '19120.5', '8', '9.105', '北京', '1821', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1099', null, '一级', '100004', '华润商业集团', '100004', '1155', '8', '0.55', '北京', '110', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('11', null, '二级', '1000001', '四季春', '100000', '1197', '2', '0.57', '北京', '114', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('110', null, '一级', '100957', '四药控股', '100957', '1049.28', '3', '0.8', '北京', '96', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1100', null, '二级', '100112', '四季春', '100000', '2320.5', '8', '1.105', '北京', '221', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1101', null, '一级', '100253', '科园信海经营', '100253', '315', '8', '0.15', '北京', '30', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1102', null, '一级', '100957', '四药控股', '100957', '2257.5', '8', '1.075', '北京', '215', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1103', null, '二级', '1000001', '四季春', '100000', '3045', '8', '1.45', '北京', '290', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1104', null, '二级', '1000089', '保定市久展销售', '101733', '33.89', '8', '0.016', '北京', '3.227', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1105', null, '二级', '1001288', '四季春', '100000', '1092', '8', '0.52', '北京', '104', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1106', null, '二级', '1003145', '四季春', '100000', '1165.5', '8', '0.555', '北京', '111', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1107', null, '一级', '100957', '四药控股', '100957', '-2546.69', '8', '-1.942', '北京', '-233', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1108', null, '一级', '100000', '四季春', '100000', '30278.4', '8', '13.833', '北京', '1660', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1109', null, '一级', '100957', '四药控股', '100957', '4560', '8', '2.083', '北京', '250', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('111', null, '二级', '3007902', '四季春', '100000', '15.04', '3', '0.025', '北京', '2', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1110', null, '一级', '100000', '四季春', '100000', '170.8', '8', '0.167', '北京', '20', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1111', null, '二级', '1000089', '保定市久展销售', '101733', '170.8', '8', '0.167', '北京', '20', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1112', null, '一级', '100957', '四药控股', '100957', '18.5', '8', '0.025', '北京', '5', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1113', null, '一级', '1002856', '嘉事堂', '1002856', '40.7', '8', '0.055', '北京', '11', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1114', null, '一级', '100000', '四季春', '100000', '14.4', '8', '0.008', '北京', '2', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '密云');
INSERT INTO `poc_sales` VALUES ('1115', null, '一级', '100000', '四季春', '100000', '1402.5', '8', '2.127', '北京', '255', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1116', null, '二级', '1000001', '四季春', '100000', '220', '8', '0.334', '北京', '40', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1117', null, '二级', '1000110', '四药乐仁堂', '100008', '110', '8', '0.167', '北京', '20', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1118', null, '二级', '1001288', '四季春', '100000', '1320', '8', '1.997', '北京', '240', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1119', null, '二级', '1002859', '四季春', '100000', '1127.5', '8', '1.709', '北京', '205', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('112', null, '二级', '3007902', '四季春', '100000', '227.8', '3', '0.214', '北京', '17', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1120', null, '二级', '1003145', '四季春', '100000', '137.5', '8', '0.208', '北京', '25', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1121', null, '二级', '5027739', '四药乐仁堂', '100008', '16.5', '8', '0.025', '北京', '3', '河北新兴', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1122', null, '一级', '100000', '四季春', '100000', '187.2', '8', '0.434', '北京', '52', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1123', null, '二级', '1001288', '四季春', '100000', '50.4', '8', '0.117', '北京', '14', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1124', null, '二级', '1002859', '四季春', '100000', '72', '8', '0.166', '北京', '20', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1125', null, '一级', '100000', '四季春', '100000', '150.4', '8', '0.25', '北京', '20', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1126', null, '二级', '1001288', '四季春', '100000', '330.88', '8', '0.55', '北京', '44', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1127', null, '二级', '1003145', '四季春', '100000', '37.6', '8', '0.062', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1128', null, '一级', '100000', '四季春', '100000', '36', '8', '0.025', '北京', '2', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1129', null, '一级', '100000', '四季春', '100000', '156', '8', '0.12', '北京', '12', '四季春', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('113', null, '二级', '3007902', '四季春', '100000', '304.5', '3', '0.145', '北京', '29', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1130', null, '一级', '100000', '四季春', '100000', '951.4', '8', '0.89', '北京', '71', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1131', null, '二级', '1000001', '四季春', '100000', '-13.4', '8', '-0.013', '北京', '-1', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1132', null, '二级', '1001288', '四季春', '100000', '656.6', '8', '0.614', '北京', '49', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1133', null, '二级', '1003145', '四季春', '100000', '67', '8', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1134', null, '二级', '5045669', '四季春', '100000', '134', '8', '0.126', '北京', '10', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1135', null, '一级', '100000', '四季春', '100000', '31.5', '8', '0.025', '北京', '3', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1136', null, '一级', '100000', '四季春', '100000', '128', '8', '0.106', '北京', '64', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1137', null, '一级', '100004', '华润商业集团', '100004', '20', '8', '0.017', '北京', '10', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1138', null, '一级', '100957', '四药控股', '100957', '40', '8', '0.034', '北京', '20', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1139', null, '一级', '1002856', '嘉事堂', '1002856', '200', '8', '0.167', '北京', '100', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('114', null, '二级', '5027725', '四季春', '100000', '1984', '3', '1.289', '北京', '155', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1140', null, '一级', '100000', '四季春', '100000', '14448', '8', '6.88', '北京', '1376', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1141', null, '一级', '100004', '华润商业集团', '100004', '2520', '8', '1.2', '北京', '240', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1142', null, '二级', '100112', '四季春', '100000', '924', '8', '0.44', '北京', '88', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1143', null, '一级', '100957', '四药控股', '100957', '420', '8', '0.2', '北京', '40', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1144', null, '二级', '1000001', '四季春', '100000', '1480.5', '8', '0.705', '北京', '141', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1145', null, '二级', '1000110', '四药乐仁堂', '100008', '157.5', '8', '0.075', '北京', '15', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1146', null, '二级', '1001288', '四季春', '100000', '6877.5', '8', '3.275', '北京', '655', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1147', null, '一级', '1002856', '嘉事堂', '1002856', '2152.5', '8', '1.025', '北京', '205', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1148', null, '二级', '1002859', '四季春', '100000', '735', '8', '0.35', '北京', '70', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1149', null, '二级', '1003145', '四季春', '100000', '1596', '8', '0.76', '北京', '152', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('115', null, '二级', '5045669', '四季春', '100000', '16.63', '3', '0.016', '北京', '1.24', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1150', null, '二级', '5027725', '四季春', '100000', '210', '8', '0.1', '北京', '20', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1151', null, '一级', '100957', '四药控股', '100957', '-43.72', '8', '-0.033', '北京', '-4', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1152', null, '二级', '5027725', '四季春', '100000', '512', '8', '0.333', '北京', '40', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1153', null, '一级', '100000', '四季春', '100000', '11728.32', '8', '5.36', '北京', '643', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1154', null, '一级', '100004', '华润商业集团', '100004', '7113.6', '8', '3.25', '北京', '390', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1155', null, '一级', '100957', '四药控股', '100957', '29822.4', '8', '13.628', '北京', '1635', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1156', null, '一级', '1002856', '嘉事堂', '1002856', '547.2', '8', '0.25', '北京', '30', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1157', null, '二级', '1002859', '四季春', '100000', '4377.6', '8', '2', '北京', '240', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1158', null, '一级', '100000', '四季春', '100000', '114.4', '8', '0.065', '北京', '13', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1159', null, '一级', '100000', '四季春', '100000', '2203.32', '8', '2.15', '北京', '258', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('116', null, '二级', '5047913', '四季春', '100000', '315', '3', '0.15', '北京', '30', '国达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1160', null, '一级', '100957', '四药控股', '100957', '170.8', '8', '0.167', '北京', '20', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1161', null, '二级', '1000089', '保定市久展销售', '101733', '42.7', '8', '0.042', '北京', '5', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1162', null, '一级', '100000', '四季春', '100000', '3.7', '8', '0.005', '北京', '1', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1163', null, '一级', '100957', '四药控股', '100957', '37', '8', '0.05', '北京', '10', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1164', null, '一级', '100000', '四季春', '100000', '50.4', '8', '0.03', '北京', '7', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('1165', null, '一级', '100000', '四季春', '100000', '1001', '8', '1.518', '北京', '182', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1166', null, '二级', '1000001', '四季春', '100000', '522.5', '8', '0.792', '北京', '95', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1167', null, '二级', '1000110', '四药乐仁堂', '100008', '654.5', '8', '0.992', '北京', '119', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1168', null, '二级', '1001288', '四季春', '100000', '1155', '8', '1.752', '北京', '210', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1169', null, '二级', '1002859', '四季春', '100000', '110', '8', '0.167', '北京', '20', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('117', null, '二级', '5047913', '四季春', '100000', '179.2', '3', '0.117', '北京', '14', '国达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1170', null, '二级', '1003145', '四季春', '100000', '187', '8', '0.285', '北京', '34', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1171', null, '二级', '3027238', '甘肃新光', '100106', '389.33', '8', '0.59', '北京', '70.788', '甘肃德生堂科技集团', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1172', null, '一级', '100000', '四季春', '100000', '154.8', '8', '0.359', '北京', '43', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1173', null, '二级', '1001288', '四季春', '100000', '18', '8', '0.042', '北京', '5', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1174', null, '二级', '1003145', '四季春', '100000', '36', '8', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1175', null, '一级', '100000', '四季春', '100000', '165.44', '8', '0.276', '北京', '22', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1176', null, '二级', '1001288', '四季春', '100000', '195.52', '8', '0.325', '北京', '26', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1177', null, '二级', '1003145', '四季春', '100000', '22.56', '8', '0.037', '北京', '3', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1178', null, '二级', '3027238', '甘肃新光', '100106', '752', '8', '1.25', '北京', '100', '甘肃德生堂科技集团', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1179', null, '一级', '100000', '四季春', '100000', '1280', '8', '1.667', '北京', '100', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('118', null, '一级', '100000', '四季春', '100000', '126', '3', '0.292', '北京', '35', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1180', null, '二级', '1002859', '四季春', '100000', '0', '8', '0', '北京', '0', '天力泽', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1181', null, '一级', '100000', '四季春', '100000', '469', '8', '0.437', '北京', '35', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1182', null, '二级', '1001288', '四季春', '100000', '321.6', '8', '0.3', '北京', '24', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1183', null, '二级', '1003145', '四季春', '100000', '629.8', '8', '0.588', '北京', '47', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1184', null, '二级', '5045669', '四季春', '100000', '40.2', '8', '0.037', '北京', '3', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1185', null, '一级', '100000', '四季春', '100000', '35', '8', '0.025', '北京', '5', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1186', null, '一级', '100000', '四季春', '100000', '768', '8', '0.64', '北京', '384', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1187', null, '一级', '100004', '华润商业集团', '100004', '5110', '8', '4.258', '北京', '2555', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1188', null, '一级', '100253', '科园信海经营', '100253', '0', '8', '0', '北京', '0', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1189', null, '一级', '100957', '四药控股', '100957', '662', '8', '0.552', '北京', '331', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('119', null, '一级', '100000', '四季春', '100000', '347.1', '3', '0.89', '北京', '89', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('1190', null, '一级', '1002856', '嘉事堂', '1002856', '1188', '8', '0.991', '北京', '594', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1191', null, '一级', '100000', '四季春', '100000', '108', '8', '0.02', '北京', '4', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1192', null, '一级', '100000', '四季春', '100000', '85018.5', '8', '40.485', '北京', '8097', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1193', null, '一级', '100004', '华润商业集团', '100004', '13104', '8', '6.24', '北京', '1248', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1194', null, '二级', '100112', '四季春', '100000', '6279', '8', '2.99', '北京', '598', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1195', null, '一级', '100253', '科园信海经营', '100253', '1050', '8', '0.5', '北京', '100', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1196', null, '一级', '100957', '四药控股', '100957', '11655', '8', '5.55', '北京', '1110', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1197', null, '二级', '1000001', '四季春', '100000', '1942.5', '8', '0.925', '北京', '185', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1198', null, '二级', '1000089', '保定市久展销售', '101733', '38.2', '8', '0.018', '北京', '3.638', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1199', null, '二级', '1000110', '四药乐仁堂', '100008', '420', '8', '0.2', '北京', '40', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('12', null, '二级', '100112', '四季春', '100000', '840', '2', '0.4', '北京', '80', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('120', null, '一级', '100000', '四季春', '100000', '32', '3', '0.027', '北京', '16', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1200', null, '二级', '1001288', '四季春', '100000', '6069', '8', '2.89', '北京', '578', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1201', null, '一级', '1002856', '嘉事堂', '1002856', '6405', '8', '3.05', '北京', '610', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1202', null, '二级', '1002859', '四季春', '100000', '4935', '8', '2.35', '北京', '470', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1203', null, '二级', '1003145', '四季春', '100000', '11592', '8', '5.52', '北京', '1104', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1204', null, '二级', '5027724', '四季春', '100000', '1050', '8', '0.5', '北京', '100', '永安堂连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1205', null, '二级', '5027725', '四季春', '100000', '2205', '8', '1.05', '北京', '210', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1206', null, '二级', '3027238', '甘肃新光', '100106', '384', '8', '0.25', '北京', '30', '甘肃德生堂科技集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1207', null, '二级', '5027725', '四季春', '100000', '5388.8', '8', '3.507', '北京', '421', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1208', null, '一级', '100000', '四季春', '100000', '31372.8', '8', '14.334', '北京', '1720', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1209', null, '一级', '100004', '华润商业集团', '100004', '17692.8', '8', '8.084', '北京', '970', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('121', null, '一级', '100000', '四季春', '100000', '45.12', '3', '0.075', '北京', '6', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1210', null, '一级', '100253', '科园信海经营', '100253', '15868.8', '8', '7.249', '北京', '870', '科园信海经营', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1211', null, '一级', '100957', '四药控股', '100957', '14409.6', '8', '6.584', '北京', '790', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1212', null, '一级', '1002856', '嘉事堂', '1002856', '20976', '8', '9.583', '北京', '1150', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1213', null, '二级', '1002859', '四季春', '100000', '182.4', '8', '0.083', '北京', '10', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1214', null, '一级', '100000', '四季春', '100000', '396', '8', '0.225', '北京', '45', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1215', null, '一级', '100000', '四季春', '100000', '102.48', '8', '0.1', '北京', '12', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1216', null, '一级', '100957', '四药控股', '100957', '358.68', '8', '0.35', '北京', '42', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1217', null, '二级', '1000089', '保定市久展销售', '101733', '42.7', '8', '0.042', '北京', '5', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1218', null, '一级', '100000', '四季春', '100000', '11.1', '8', '0.015', '北京', '3', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1219', null, '一级', '100957', '四药控股', '100957', '92.5', '8', '0.125', '北京', '25', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('122', null, '一级', '100000', '四季春', '100000', '1555', '3', '1.524', '北京', '122', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1220', null, '一级', '100000', '四季春', '100000', '252', '8', '0.146', '北京', '35', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1221', null, '一级', '100000', '四季春', '100000', '1090.8', '9', '2.525', '北京', '303', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1222', null, '一级', '100000', '四季春', '100000', '3072', '9', '4', '北京', '240', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1223', null, '一级', '100000', '四季春', '100000', '320', '9', '0.266', '北京', '160', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1224', null, '一级', '100000', '四季春', '100000', '341.6', '9', '0.333', '北京', '40', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1225', null, '一级', '100000', '四季春', '100000', '11.1', '9', '0.015', '北京', '3', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1226', null, '一级', '100000', '四季春', '100000', '17', '9', '0.017', '北京', '2', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1227', null, '一级', '100000', '四季春', '100000', '176', '9', '0.1', '北京', '20', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1228', null, '一级', '100000', '四季春', '100000', '3132', '9', '0.58', '北京', '116', '四季春', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1229', null, '一级', '100000', '四季春', '100000', '1292.5', '9', '1.961', '北京', '235', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('123', null, '一级', '100000', '四季春', '100000', '12390', '3', '5.9', '北京', '1180', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1230', null, '一级', '100000', '四季春', '100000', '1082.88', '9', '1.8', '北京', '144', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1231', null, '一级', '100000', '四季春', '100000', '90', '9', '0.063', '北京', '5', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1232', null, '一级', '100000', '四季春', '100000', '2894.4', '9', '2.703', '北京', '216', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1233', null, '一级', '100000', '四季春', '100000', '73.5', '9', '0.059', '北京', '7', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1234', null, '一级', '100000', '四季春', '100000', '13377', '9', '6.37', '北京', '1274', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1235', null, '一级', '100000', '四季春', '100000', '163.95', '9', '0.125', '北京', '15', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1236', null, '一级', '100000', '四季春', '100000', '93420.66', '9', '42.681', '北京', '5121.747', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1237', null, '二级', '1000001', '四季春', '100000', '561', '9', '0.849', '北京', '102', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1238', null, '二级', '1000001', '四季春', '100000', '120.6', '9', '0.113', '北京', '9', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1239', null, '二级', '1000001', '四季春', '100000', '1953', '9', '0.93', '北京', '186', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('124', null, '一级', '100000', '四季春', '100000', '983.7', '3', '0.75', '北京', '90', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1240', null, '一级', '100004', '华润商业集团', '100004', '13974', '9', '11.647', '北京', '6987', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1241', null, '一级', '100004', '华润商业集团', '100004', '1050', '9', '0.5', '北京', '100', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1242', null, '二级', '1000089', '保定市久展销售', '101733', '85.4', '9', '0.083', '北京', '10', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1243', null, '二级', '1000106', '四药乐仁堂', '100008', '110', '9', '0.167', '北京', '20', '沧州天元第四分公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1244', null, '二级', '1000110', '四药乐仁堂', '100008', '1485', '9', '2.25', '北京', '270', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1245', null, '二级', '100112', '四季春', '100000', '609', '9', '0.29', '北京', '58', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1246', null, '二级', '1001288', '四季春', '100000', '39.6', '9', '0.092', '北京', '11', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1247', null, '二级', '1001288', '四季春', '100000', '2420', '9', '3.669', '北京', '440', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1248', null, '二级', '1001288', '四季春', '100000', '218.08', '9', '0.362', '北京', '29', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1249', null, '二级', '1001288', '四季春', '100000', '3671.6', '9', '3.425', '北京', '274', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('125', null, '二级', '1000001', '四季春', '100000', '18', '3', '0.042', '北京', '5', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1250', null, '二级', '1001288', '四季春', '100000', '127869', '9', '60.89', '北京', '12178', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1251', null, '一级', '100253', '科园信海经营', '100253', '0', '9', '0', '北京', '0', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1252', null, '一级', '100253', '科园信海经营', '100253', '364.8', '9', '0.167', '北京', '20', '科园信海经营', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1253', null, '一级', '1002856', '嘉事堂', '1002856', '1142', '9', '0.952', '北京', '571', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1254', null, '一级', '1002856', '嘉事堂', '1002856', '3151.26', '9', '3.075', '北京', '369', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1255', null, '一级', '1002856', '嘉事堂', '1002856', '520', '9', '0.4', '北京', '40', '嘉事堂', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1256', null, '一级', '1002856', '嘉事堂', '1002856', '364.8', '9', '0.167', '北京', '20', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1257', null, '二级', '1002859', '四季春', '100000', '20', '9', '0.017', '北京', '10', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1258', null, '二级', '1002859', '四季春', '100000', '704', '9', '0.4', '北京', '80', '天力泽', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1259', null, '二级', '1002859', '四季春', '100000', '55', '9', '0.083', '北京', '10', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('126', null, '二级', '1000001', '四季春', '100000', '67', '3', '0.063', '北京', '5', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1260', null, '二级', '1002859', '四季春', '100000', '472.5', '9', '0.225', '北京', '45', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1261', null, '二级', '1003145', '四季春', '100000', '36', '9', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1262', null, '二级', '1003145', '四季春', '100000', '357.5', '9', '0.542', '北京', '65', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1263', null, '二级', '1003145', '四季春', '100000', '15.04', '9', '0.025', '北京', '2', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1264', null, '二级', '1003145', '四季春', '100000', '1366.8', '9', '1.276', '北京', '102', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1265', null, '二级', '1003145', '四季春', '100000', '10332', '9', '4.92', '北京', '984', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1266', null, '一级', '100957', '四药控股', '100957', '18', '9', '0.042', '北京', '5', '四药控股', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1267', null, '一级', '100957', '四药控股', '100957', '300', '9', '0.25', '北京', '150', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1268', null, '一级', '100957', '四药控股', '100957', '25.9', '9', '0.035', '北京', '7', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1269', null, '一级', '100957', '四药控股', '100957', '945', '9', '0.45', '北京', '90', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('127', null, '二级', '1000001', '四季春', '100000', '189', '3', '0.09', '北京', '18', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1270', null, '一级', '100957', '四药控股', '100957', '1094.4', '9', '0.5', '北京', '60', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1271', null, '二级', '3007902', '四季春', '100000', '52.8', '9', '0.03', '北京', '6', '好药师达药房连锁', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1272', null, '二级', '3007902', '四季春', '100000', '13', '9', '0.01', '北京', '1', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1273', null, '二级', '3007902', '四季春', '100000', '1620', '9', '0.3', '北京', '60', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1274', null, '二级', '3007902', '四季春', '100000', '77', '9', '0.117', '北京', '14', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1275', null, '二级', '3007902', '四季春', '100000', '120.6', '9', '0.113', '北京', '9', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1276', null, '二级', '3027238', '甘肃田元', '100107', '-1876.03', '9', '-4.81', '北京', '-481.034', '甘肃德生堂科技集团', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1277', null, '二级', '3027238', '甘肃新光', '100106', '1100', '9', '1.667', '北京', '200', '甘肃德生堂科技集团', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1278', null, '二级', '3027238', '甘肃新光', '100106', '676.8', '9', '1.125', '北京', '90', '甘肃德生堂科技集团', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1279', null, '二级', '5027725', '四季春', '100000', '231', '9', '0.11', '北京', '22', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('128', null, '二级', '1001288', '四季春', '100000', '72', '3', '0.166', '北京', '20', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1280', null, '二级', '5027725', '四季春', '100000', '1728', '9', '1.126', '北京', '135', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1281', null, '二级', '5045669', '四季春', '100000', '670', '9', '0.625', '北京', '50', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1282', null, '一级', '100000', '四季春', '100000', '1375.2', '9', '3.184', '北京', '382', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1283', null, '一级', '100000', '四季春', '100000', '144', '9', '0.12', '北京', '72', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1284', null, '一级', '100000', '四季春', '100000', '2152.08', '9', '2.1', '北京', '252', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1285', null, '一级', '100000', '四季春', '100000', '14.8', '9', '0.02', '北京', '4', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1286', null, '一级', '100000', '四季春', '100000', '781', '9', '1.184', '北京', '142', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1287', null, '一级', '100000', '四季春', '100000', '812.16', '9', '1.349', '北京', '108', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1288', null, '一级', '100000', '四季春', '100000', '964.8', '9', '0.9', '北京', '72', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1289', null, '一级', '100000', '四季春', '100000', '35', '9', '0.025', '北京', '5', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('129', null, '二级', '1001288', '四季春', '100000', '452.2', '3', '0.476', '北京', '38', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1290', null, '一级', '100000', '四季春', '100000', '3465', '9', '1.65', '北京', '330', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1291', null, '一级', '100000', '四季春', '100000', '0', '9', '0', '北京', '0', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1292', null, '一级', '100000', '四季春', '100000', '52923.35', '9', '24.177', '北京', '2901.499', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1293', null, '一级', '100000', '四季春', '100000', '144', '9', '0.084', '北京', '20', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('1294', null, '二级', '1000001', '四季春', '100000', '203.5', '9', '0.309', '北京', '37', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1295', null, '二级', '1000001', '四季春', '100000', '178.5', '9', '0.085', '北京', '17', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1296', null, '一级', '100004', '华润商业集团', '100004', '20', '9', '0.017', '北京', '10', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1297', null, '一级', '100004', '华润商业集团', '100004', '182.4', '9', '0.083', '北京', '10', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1298', null, '二级', '1000089', '保定市久展销售', '101733', '85.4', '9', '0.083', '北京', '10', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1299', null, '二级', '1000089', '保定市久展销售', '101733', '75.2', '9', '0.125', '北京', '10', '河北顺泽', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('13', null, '二级', '1001288', '四季春', '100000', '25.2', '2', '0.059', '北京', '7', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('130', null, '二级', '1001288', '四季春', '100000', '283.5', '3', '0.135', '北京', '27', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1300', null, '二级', '1000110', '四药乐仁堂', '100008', '165', '9', '0.25', '北京', '30', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1301', null, '二级', '1000110', '四药乐仁堂', '100008', '67', '9', '0.063', '北京', '5', '廊坊市中诚康宇', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1302', null, '二级', '100112', '四季春', '100000', '210', '9', '0.1', '北京', '20', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1303', null, '二级', '1001288', '四季春', '100000', '46.8', '9', '0.108', '北京', '13', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1304', null, '二级', '1001288', '四季春', '100000', '1947', '9', '2.954', '北京', '354', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1305', null, '二级', '1001288', '四季春', '100000', '188', '9', '0.313', '北京', '25', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1306', null, '二级', '1001288', '四季春', '100000', '696.8', '9', '0.651', '北京', '52', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1307', null, '二级', '1001288', '四季春', '100000', '924', '9', '0.44', '北京', '88', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1308', null, '一级', '1002856', '嘉事堂', '1002856', '820', '9', '0.684', '北京', '410', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1309', null, '一级', '1002856', '嘉事堂', '1002856', '105', '9', '0.05', '北京', '10', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('131', null, '二级', '1002859', '四季春', '100000', '630', '3', '1.459', '北京', '175', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1310', null, '二级', '1002859', '四季春', '100000', '684', '9', '1.584', '北京', '190', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1311', null, '二级', '1002859', '四季春', '100000', '200', '9', '0.167', '北京', '100', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1312', null, '二级', '1002859', '四季春', '100000', '2255', '9', '3.416', '北京', '410', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1313', null, '二级', '1002859', '四季春', '100000', '1480.5', '9', '0.705', '北京', '141', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1314', null, '二级', '1003145', '四季春', '100000', '36', '9', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1315', null, '二级', '1003145', '四季春', '100000', '236.5', '9', '0.359', '北京', '43', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1316', null, '二级', '1003145', '四季春', '100000', '75.2', '9', '0.125', '北京', '10', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1317', null, '二级', '1003145', '四季春', '100000', '428.8', '9', '0.4', '北京', '32', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1318', null, '二级', '1003145', '四季春', '100000', '651', '9', '0.31', '北京', '62', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1319', null, '一级', '100957', '四药控股', '100957', '20', '9', '0.017', '北京', '10', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('132', null, '二级', '1002859', '四季春', '100000', '210', '3', '0.1', '北京', '20', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1320', null, '一级', '100957', '四药控股', '100957', '854', '9', '0.834', '北京', '100', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1321', null, '一级', '100957', '四药控股', '100957', '547.2', '9', '0.25', '北京', '30', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1322', null, '二级', '3007902', '四季春', '100000', '26', '9', '0.02', '北京', '2', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('1323', null, '二级', '3007902', '四季春', '100000', '6966', '9', '1.29', '北京', '258', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1324', null, '二级', '3007902', '四季春', '100000', '357.5', '9', '0.54', '北京', '65', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1325', null, '二级', '3007902', '四季春', '100000', '22.56', '9', '0.037', '北京', '3', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1326', null, '二级', '3007902', '四季春', '100000', '361.8', '9', '0.337', '北京', '27', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1327', null, '二级', '3007902', '四季春', '100000', '315', '9', '0.15', '北京', '30', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1328', null, '二级', '5027725', '四季春', '100000', '448', '9', '0.292', '北京', '35', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1329', null, '二级', '5027739', '四药乐仁堂', '100008', '16.5', '9', '0.025', '北京', '3', '河北新兴', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('133', null, '二级', '1003145', '四季春', '100000', '97.2', '3', '0.226', '北京', '27', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1330', null, '一级', '100000', '四季春', '100000', '12528', '9', '29', '北京', '3480', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1331', null, '一级', '100000', '四季春', '100000', '3412.5', '9', '8.75', '北京', '875', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1332', null, '一级', '100000', '四季春', '100000', '144', '9', '0.119', '北京', '72', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1333', null, '一级', '100000', '四季春', '100000', '512.4', '9', '0.5', '北京', '60', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1334', null, '一级', '100000', '四季春', '100000', '33.3', '9', '0.045', '北京', '9', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1335', null, '一级', '100000', '四季春', '100000', '17', '9', '0.017', '北京', '2', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1336', null, '一级', '100000', '四季春', '100000', '70.4', '9', '0.04', '北京', '8', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1337', null, '一级', '100000', '四季春', '100000', '130', '9', '0.1', '北京', '10', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1338', null, '一级', '100000', '四季春', '100000', '945', '9', '0.175', '北京', '35', '四季春', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1339', null, '一级', '100000', '四季春', '100000', '4466', '9', '6.766', '北京', '812', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('134', null, '二级', '1003145', '四季春', '100000', '268', '3', '0.25', '北京', '20', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1340', null, '一级', '100000', '四季春', '100000', '676.8', '9', '1.126', '北京', '90', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1341', null, '一级', '100000', '四季春', '100000', '6187.8', '9', '5.878', '北京', '470', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1342', null, '一级', '100000', '四季春', '100000', '84', '9', '0.067', '北京', '8', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1343', null, '一级', '100000', '四季春', '100000', '59713.5', '9', '28.435', '北京', '5687', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1344', null, '一级', '100000', '四季春', '100000', '54.65', '9', '0.042', '北京', '5', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1345', null, '一级', '100000', '四季春', '100000', '35117.3', '9', '16.044', '北京', '1925.286', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1346', null, '一级', '100000', '四季春', '100000', '93.6', '9', '0.055', '北京', '13', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1347', null, '二级', '1000001', '四季春', '100000', '180', '9', '0.417', '北京', '50', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1348', null, '二级', '1000001', '四季春', '100000', '468', '9', '1.2', '北京', '120', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1349', null, '二级', '1000001', '四季春', '100000', '3366', '9', '5.102', '北京', '612', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('135', null, '二级', '1003145', '四季春', '100000', '819', '3', '0.39', '北京', '78', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1350', null, '二级', '1000001', '四季春', '100000', '-134', '9', '-0.125', '北京', '-10', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1351', null, '二级', '1000001', '四季春', '100000', '10626', '9', '5.06', '北京', '1012', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1352', null, '一级', '100004', '华润商业集团', '100004', '1618', '9', '1.349', '北京', '809', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1353', null, '一级', '100004', '华润商业集团', '100004', '52.5', '9', '0.025', '北京', '5', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1354', null, '一级', '100004', '华润商业集团', '100004', '4833.6', '9', '2.209', '北京', '265', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1355', null, '二级', '1000089', '保定市久展销售', '101733', '85.4', '9', '0.083', '北京', '10', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1356', null, '二级', '1000110', '四药乐仁堂', '100008', '42.7', '9', '0.042', '北京', '5', '廊坊市中诚康宇', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1357', null, '二级', '1000110', '四药乐仁堂', '100008', '134', '9', '0.125', '北京', '10', '廊坊市中诚康宇', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1358', null, '二级', '100112', '四季春', '100000', '3171', '9', '1.51', '北京', '302', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1359', null, '二级', '1001288', '四季春', '100000', '651.6', '9', '1.508', '北京', '181', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('136', null, '二级', '5027725', '四季春', '100000', '128', '3', '0.083', '北京', '10', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1360', null, '二级', '1001288', '四季春', '100000', '1512.5', '9', '2.294', '北京', '275', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1361', null, '二级', '1001288', '四季春', '100000', '188', '9', '0.312', '北京', '25', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1362', null, '二级', '1001288', '四季春', '100000', '308.2', '9', '0.288', '北京', '23', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1363', null, '二级', '1001288', '四季春', '100000', '1333.5', '9', '0.635', '北京', '127', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1364', null, '二级', '1001511', '保定市久展销售', '101733', '27.5', '9', '0.042', '北京', '5', '保定汇达分公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1365', null, '一级', '100253', '科园信海经营', '100253', '140', '9', '0.116', '北京', '70', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1366', null, '一级', '100253', '科园信海经营', '100253', '9607.5', '9', '4.575', '北京', '915', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1367', null, '一级', '1002856', '嘉事堂', '1002856', '2264', '9', '1.887', '北京', '1132', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1368', null, '一级', '1002856', '嘉事堂', '1002856', '341.6', '9', '0.333', '北京', '40', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1369', null, '一级', '1002856', '嘉事堂', '1002856', '55.5', '9', '0.075', '北京', '15', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('137', null, '二级', '5045669', '四季春', '100000', '15.01', '3', '0.015', '北京', '1.12', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1370', null, '一级', '1002856', '嘉事堂', '1002856', '3640', '9', '2.8', '北京', '280', '嘉事堂', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1371', null, '一级', '1002856', '嘉事堂', '1002856', '1365', '9', '0.65', '北京', '130', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1372', null, '一级', '1002856', '嘉事堂', '1002856', '546.5', '9', '0.417', '北京', '50', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1373', null, '二级', '1002859', '四季春', '100000', '160', '9', '0.133', '北京', '80', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1374', null, '二级', '1002859', '四季春', '100000', '55.5', '9', '0.075', '北京', '15', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1375', null, '二级', '1002859', '四季春', '100000', '176', '9', '0.1', '北京', '20', '天力泽', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1376', null, '二级', '1002859', '四季春', '100000', '2475', '9', '3.751', '北京', '450', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1377', null, '二级', '1002859', '四季春', '100000', '945', '9', '0.45', '北京', '90', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1378', null, '二级', '1002859', '四季春', '100000', '182.4', '9', '0.083', '北京', '10', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1379', null, '二级', '1003145', '四季春', '100000', '54', '9', '0.125', '北京', '15', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('138', null, '一级', '100000', '四季春', '100000', '342', '3', '0.793', '北京', '95', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1380', null, '二级', '1003145', '四季春', '100000', '368.5', '9', '0.559', '北京', '67', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1381', null, '二级', '1003145', '四季春', '100000', '-52.64', '9', '-0.088', '北京', '-7', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1382', null, '二级', '1003145', '四季春', '100000', '442.2', '9', '0.414', '北京', '33', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1383', null, '二级', '1003145', '四季春', '100000', '37285.5', '9', '17.755', '北京', '3551', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1384', null, '一级', '100957', '四药控股', '100957', '242', '9', '0.202', '北京', '121', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1385', null, '一级', '100957', '四药控股', '100957', '222.04', '9', '0.217', '北京', '26', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1386', null, '一级', '100957', '四药控股', '100957', '166.5', '9', '0.225', '北京', '45', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1387', null, '一级', '100957', '四药控股', '100957', '315', '9', '0.15', '北京', '30', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1388', null, '一级', '100957', '四药控股', '100957', '-547.2', '9', '-0.25', '北京', '-30', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1389', null, '二级', '101164', '河北中健贸易集团', '100007', '16.5', '9', '0.025', '北京', '3', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('139', null, '一级', '100000', '四季春', '100000', '522.6', '3', '1.34', '北京', '134', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1390', null, '二级', '3007902', '四季春', '100000', '13', '9', '0.01', '北京', '1', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1391', null, '二级', '3007902', '四季春', '100000', '729', '9', '0.135', '北京', '27', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1392', null, '二级', '3007902', '四季春', '100000', '33', '9', '0.05', '北京', '6', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1393', null, '二级', '3007902', '四季春', '100000', '30.08', '9', '0.05', '北京', '4', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1394', null, '二级', '5027725', '四季春', '100000', '525', '9', '0.25', '北京', '50', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1395', null, '二级', '5027725', '四季春', '100000', '307.2', '9', '0.2', '北京', '24', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1396', null, '一级', '100000', '四季春', '100000', '13647.6', '9', '31.593', '北京', '3791', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1397', null, '一级', '100000', '四季春', '100000', '1599', '9', '4.1', '北京', '410', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('1398', null, '一级', '100000', '四季春', '100000', '1536', '9', '2.001', '北京', '120', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('1399', null, '一级', '100000', '四季春', '100000', '48', '9', '0.04', '北京', '24', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('14', null, '二级', '1001288', '四季春', '100000', '23.4', '2', '0.06', '北京', '6', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('140', null, '一级', '100000', '四季春', '100000', '288', '3', '0.239', '北京', '144', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1400', null, '一级', '100000', '四季春', '100000', '18.5', '9', '0.025', '北京', '5', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1401', null, '一级', '100000', '四季春', '100000', '6127', '9', '9.284', '北京', '1114', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1402', null, '一级', '100000', '四季春', '100000', '210.56', '9', '0.35', '北京', '28', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1403', null, '一级', '100000', '四季春', '100000', '375.2', '9', '0.35', '北京', '28', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1404', null, '一级', '100000', '四季春', '100000', '70', '9', '0.05', '北京', '10', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1405', null, '一级', '100000', '四季春', '100000', '210', '9', '0.166', '北京', '20', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1406', null, '一级', '100000', '四季春', '100000', '54463.5', '9', '25.935', '北京', '5187', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1407', null, '一级', '100000', '四季春', '100000', '74044.58', '9', '33.828', '北京', '4059.462', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1408', null, '二级', '1000001', '四季春', '100000', '1105.5', '9', '1.675', '北京', '201', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1409', null, '二级', '1000001', '四季春', '100000', '5932.5', '9', '2.825', '北京', '565', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('141', null, '一级', '100000', '四季春', '100000', '233.12', '3', '0.388', '北京', '31', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1410', null, '一级', '100004', '华润商业集团', '100004', '20', '9', '0.017', '北京', '10', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1411', null, '二级', '1000089', '保定市久展销售', '101733', '170.8', '9', '0.167', '北京', '20', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1412', null, '二级', '1000089', '保定市久展销售', '101733', '18.61', '9', '0.009', '北京', '1.773', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1413', null, '二级', '100112', '四季春', '100000', '7665', '9', '3.65', '北京', '730', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1414', null, '二级', '1001288', '四季春', '100000', '1976.4', '9', '4.575', '北京', '549', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1415', null, '二级', '1001288', '四季春', '100000', '929.5', '9', '1.407', '北京', '169', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1416', null, '二级', '1001288', '四季春', '100000', '134', '9', '0.125', '北京', '10', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1417', null, '二级', '1001288', '四季春', '100000', '315', '9', '0.15', '北京', '30', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1418', null, '一级', '100253', '科园信海经营', '100253', '2467.5', '9', '1.175', '北京', '235', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1419', null, '一级', '1002856', '嘉事堂', '1002856', '60', '9', '0.05', '北京', '30', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('142', null, '一级', '100000', '四季春', '100000', '3577.1', '3', '3.488', '北京', '279', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1420', null, '一级', '1002856', '嘉事堂', '1002856', '7.4', '9', '0.01', '北京', '2', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1421', null, '二级', '1003145', '四季春', '100000', '1476', '9', '3.419', '北京', '410', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1422', null, '二级', '1003145', '四季春', '100000', '2698.8', '9', '6.92', '北京', '692', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('1423', null, '二级', '1003145', '四季春', '100000', '649', '9', '0.984', '北京', '118', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1424', null, '二级', '1003145', '四季春', '100000', '6069', '9', '2.89', '北京', '578', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1425', null, '二级', '1003494', '保定市久展销售', '101733', '85.4', '9', '0.083', '北京', '10', '滦平县惠仁有限责任公司', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1426', null, '二级', '1003494', '保定市久展销售', '101733', '105', '9', '0.05', '北京', '10', '滦平县惠仁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1427', null, '一级', '100957', '四药控股', '100957', '74', '9', '0.1', '北京', '20', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1428', null, '一级', '100957', '四药控股', '100957', '-262.5', '9', '-0.125', '北京', '-25', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1429', null, '二级', '101164', '河北中健贸易集团', '100007', '220', '9', '0.333', '北京', '40', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('143', null, '一级', '100000', '四季春', '100000', '64291.5', '3', '30.615', '北京', '6123', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1430', null, '一级', '100000', '四季春', '100000', '1600.5', '10', '2.424', '北京', '291', '四季春', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1431', null, '一级', '100000', '四季春', '100000', '831.6', '10', '1.926', '北京', '231', '四季春', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1432', null, '一级', '100000', '四季春', '100000', '451.2', '10', '0.75', '北京', '60', '四季春', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1433', null, '一级', '100000', '四季春', '100000', '90', '10', '0.063', '北京', '5', '四季春', '', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1434', null, '一级', '100000', '四季春', '100000', '64', '10', '0.083', '北京', '5', '四季春', '', '10001000800', '板蓝根颗粒 10克*100袋*30包', '海淀');
INSERT INTO `poc_sales` VALUES ('1435', null, '一级', '100000', '四季春', '100000', '795.2', '10', '0.466', '北京', '56', '四季春', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1436', null, '一级', '100000', '四季春', '100000', '1742', '10', '1.627', '北京', '130', '四季春', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1437', null, '一级', '100000', '四季春', '100000', '96', '10', '0.134', '北京', '16', '四季春', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1438', null, '一级', '100000', '四季春', '100000', '3000', '10', '4.166', '北京', '500', '四季春', '', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1439', null, '一级', '100000', '四季春', '100000', '352', '10', '0.295', '北京', '176', '四季春', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('144', null, '一级', '100000', '四季春', '100000', '327.9', '3', '0.25', '北京', '30', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1440', null, '一级', '100000', '四季春', '100000', '756', '10', '0.14', '北京', '28', '四季春', '', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1441', null, '一级', '100000', '四季春', '100000', '4312', '10', '5.133', '北京', '616', '四季春', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1442', null, '一级', '100000', '四季春', '100000', '210', '10', '0.1', '北京', '20', '四季春', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1443', null, '一级', '100000', '四季春', '100000', '-255.36', '10', '-0.116', '北京', '-14', '四季春', '', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1444', null, '一级', '100000', '四季春', '100000', '1997.6', '10', '1.135', '北京', '227', '四季春', '', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1445', null, '一级', '100000', '四季春', '100000', '157.32', '10', '0.038', '北京', '12', '四季春', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1446', null, '一级', '100000', '四季春', '100000', '3910.4', '10', '1.735', '北京', '208', '四季春', '', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1447', null, '一级', '100000', '四季春', '100000', '2445', '10', '2.499', '北京', '300', '四季春', '', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1448', null, '一级', '100000', '四季春', '100000', '1353.6', '10', '1.567', '北京', '188', '四季春', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1449', null, '一级', '100000', '四季春', '100000', '256.2', '10', '0.25', '北京', '30', '四季春', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('145', null, '二级', '1000001', '四季春', '100000', '2912.4', '3', '6.745', '北京', '809', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1450', null, '一级', '100000', '四季春', '100000', '747.4', '10', '1.01', '北京', '202', '四季春', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1451', null, '一级', '100000', '四季春', '100000', '1728', '10', '1', '北京', '240', '四季春', '', '10009000202', '涩肠止泻散 4克*3袋*240盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1452', null, '一级', '100004', '华润商业集团', '100004', '3022', '10', '2.518', '北京', '1511', '华润商业集团', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1453', null, '一级', '100004', '华润商业集团', '100004', '10.5', '10', '0.005', '北京', '1', '华润商业集团', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1454', null, '一级', '100004', '华润商业集团', '100004', '912', '10', '0.417', '北京', '50', '华润商业集团', '', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1455', null, '二级', '100112', '四季春', '100000', '357', '10', '0.425', '北京', '51', '丰瑞龙翔', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1456', null, '一级', '100253', '科园信海经营', '100253', '0', '10', '0', '北京', '0', '科园信海经营', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1457', null, '一级', '100957', '四药控股', '100957', '72', '10', '0.167', '北京', '20', '四药控股', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1458', null, '一级', '100957', '四药控股', '100957', '330', '10', '0.274', '北京', '165', '四药控股', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1459', null, '一级', '100957', '四药控股', '100957', '364.8', '10', '0.167', '北京', '20', '四药控股', '', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('146', null, '二级', '1000001', '四季春', '100000', '2262', '3', '5.8', '北京', '580', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1460', null, '一级', '100957', '四药控股', '100957', '12.21', '10', '0.017', '北京', '3.3', '四药控股', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1461', null, '二级', '101164', '河北中健贸易集团', '100007', '105', '10', '0.05', '北京', '10', '保定中诚汇达贸易', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1462', null, '二级', '101164', '河北中健贸易集团', '100007', '376', '10', '0.166', '北京', '20', '保定中诚汇达贸易', '', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1463', null, '二级', '101164', '河北中健贸易集团', '100007', '86.4', '10', '0.1', '北京', '12', '保定中诚汇达贸易', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1464', null, '一级', '101733', '保定市久展销售', '101733', '36', '10', '0.083', '北京', '10', '保定市久展销售', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1465', null, '二级', '1000001', '四季春', '100000', '5142.5', '10', '7.794', '北京', '935', '凯宏鑫有限责任公司', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1466', null, '二级', '1000001', '四季春', '100000', '13.4', '10', '0.013', '北京', '1', '凯宏鑫有限责任公司', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1467', null, '二级', '1000001', '四季春', '100000', '1200', '10', '1.669', '北京', '200', '凯宏鑫有限责任公司', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1468', null, '二级', '1000001', '四季春', '100000', '2863', '10', '3.416', '北京', '409', '凯宏鑫有限责任公司', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1469', null, '二级', '1000001', '四季春', '100000', '241.5', '10', '0.115', '北京', '23', '凯宏鑫有限责任公司', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('147', null, '二级', '1000001', '四季春', '100000', '2613', '3', '2.444', '北京', '195', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1470', null, '二级', '1000001', '四季春', '100000', '188', '10', '0.083', '北京', '10', '凯宏鑫有限责任公司', '', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1471', null, '二级', '1000001', '四季春', '100000', '5721.3', '10', '5.852', '北京', '702', '凯宏鑫有限责任公司', '', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1472', null, '二级', '1000001', '四季春', '100000', '237.6', '10', '0.275', '北京', '33', '凯宏鑫有限责任公司', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1473', null, '二级', '1000110', '四药乐仁堂', '100008', '27.5', '10', '0.042', '北京', '5', '廊坊市中诚康宇', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1474', null, '二级', '1001288', '四季春', '100000', '467.5', '10', '0.71', '北京', '85', '悦康源通', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1475', null, '二级', '1001288', '四季春', '100000', '25.81', '10', '0.06', '北京', '7.17', '悦康源通', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1476', null, '二级', '1001288', '四季春', '100000', '90.24', '10', '0.151', '北京', '12', '悦康源通', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1477', null, '二级', '1001288', '四季春', '100000', '71', '10', '0.042', '北京', '5', '悦康源通', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1478', null, '二级', '1001288', '四季春', '100000', '428.8', '10', '0.4', '北京', '32', '悦康源通', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1479', null, '二级', '1001288', '四季春', '100000', '174', '10', '0.242', '北京', '29', '悦康源通', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('148', null, '二级', '1000001', '四季春', '100000', '14374.5', '3', '6.845', '北京', '1369', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1480', null, '二级', '1001288', '四季春', '100000', '273', '10', '0.326', '北京', '39', '悦康源通', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1481', null, '二级', '1001288', '四季春', '100000', '483', '10', '0.23', '北京', '46', '悦康源通', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1482', null, '二级', '1001288', '四季春', '100000', '523.38', '10', '0.123', '北京', '39', '悦康源通', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1483', null, '二级', '1001288', '四季春', '100000', '407.5', '10', '0.417', '北京', '50', '悦康源通', '', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1484', null, '二级', '1001511', '保定市久展销售', '101733', '27.5', '10', '0.042', '北京', '5', '保定汇达分公司', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1485', null, '二级', '1001511', '保定市久展销售', '101733', '81.5', '10', '0.083', '北京', '10', '保定汇达分公司', '', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1486', null, '一级', '1002856', '嘉事堂', '1002856', '3510', '10', '2.7', '北京', '270', '嘉事堂', '', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1487', null, '一级', '1002856', '嘉事堂', '1002856', '2846', '10', '2.372', '北京', '1423', '嘉事堂', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1488', null, '一级', '1002856', '嘉事堂', '1002856', '-367.5', '10', '-0.175', '北京', '-35', '嘉事堂', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1489', null, '一级', '1002856', '嘉事堂', '1002856', '-157.32', '10', '-0.037', '北京', '-12', '嘉事堂', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('149', null, '一级', '100004', '华润商业集团', '100004', '4.12', '3', '0.003', '北京', '0.377', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1490', null, '一级', '1002856', '嘉事堂', '1002856', '11.1', '10', '0.015', '北京', '3', '嘉事堂', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1491', null, '二级', '1002859', '四季春', '100000', '1826', '10', '2.766', '北京', '332', '天力泽', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1492', null, '二级', '1002859', '四季春', '100000', '80', '10', '0.067', '北京', '40', '天力泽', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1493', null, '二级', '1002859', '四季春', '100000', '140', '10', '0.167', '北京', '20', '天力泽', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1494', null, '二级', '1002859', '四季春', '100000', '1793', '10', '1.834', '北京', '220', '天力泽', '', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1495', null, '二级', '1003145', '四季春', '100000', '214.5', '10', '0.325', '北京', '39', '华润新龙（）', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1496', null, '二级', '1003145', '四季春', '100000', '201.6', '10', '0.467', '北京', '56', '华润新龙（）', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1497', null, '二级', '1003145', '四季春', '100000', '294.8', '10', '0.274', '北京', '22', '华润新龙（）', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1498', null, '二级', '1003145', '四季春', '100000', '60', '10', '0.083', '北京', '10', '华润新龙（）', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1499', null, '二级', '1003145', '四季春', '100000', '882', '10', '1.052', '北京', '126', '华润新龙（）', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('15', null, '二级', '1001288', '四季春', '100000', '315.84', '2', '0.525', '北京', '42', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('150', null, '二级', '100112', '四季春', '100000', '-135', '3', '-0.025', '北京', '-5', '丰瑞龙翔', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1500', null, '二级', '1003145', '四季春', '100000', '241.5', '10', '0.115', '北京', '23', '华润新龙（）', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1501', null, '二级', '1003145', '四季春', '100000', '201.3', '10', '0.047', '北京', '15', '华润新龙（）', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1502', null, '二级', '1003145', '四季春', '100000', '692.75', '10', '0.709', '北京', '85', '华润新龙（）', '', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1503', null, '二级', '3007902', '四季春', '100000', '38.5', '10', '0.059', '北京', '7', '好药师达药房连锁', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1504', null, '二级', '3007902', '四季春', '100000', '71', '10', '0.042', '北京', '5', '好药师达药房连锁', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1505', null, '二级', '3007902', '四季春', '100000', '12', '10', '0.017', '北京', '2', '好药师达药房连锁', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1506', null, '二级', '3007902', '四季春', '100000', '17.6', '10', '0.01', '北京', '2', '好药师达药房连锁', '', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1507', null, '二级', '5027725', '四季春', '100000', '36', '10', '0.05', '北京', '6', '金象大药房连锁有限责任公司', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1508', null, '二级', '5027725', '四季春', '100000', '243.2', '10', '0.159', '北京', '19', '金象大药房连锁有限责任公司', '', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1509', null, '二级', '5027725', '四季春', '100000', '241.56', '10', '0.056', '北京', '18', '金象大药房连锁有限责任公司', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('151', null, '二级', '100112', '四季春', '100000', '2730', '3', '1.3', '北京', '260', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1510', null, '一级', '100000', '四季春', '100000', '3745.5', '10', '5.675', '北京', '681', '四季春', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1511', null, '一级', '100000', '四季春', '100000', '5180.4', '10', '11.988', '北京', '1439', '四季春', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1512', null, '一级', '100000', '四季春', '100000', '656.6', '10', '0.613', '北京', '49', '四季春', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1513', null, '一级', '100000', '四季春', '100000', '48', '10', '0.067', '北京', '8', '四季春', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '密云');
INSERT INTO `poc_sales` VALUES ('1514', null, '一级', '100000', '四季春', '100000', '78', '10', '0.108', '北京', '13', '四季春', '', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1515', null, '一级', '100000', '四季春', '100000', '70', '10', '0.05', '北京', '10', '四季春', '', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1516', null, '一级', '100000', '四季春', '100000', '84', '10', '0.067', '北京', '8', '四季春', '', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1517', null, '一级', '100000', '四季春', '100000', '176', '10', '0.146', '北京', '88', '四季春', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1518', null, '一级', '100000', '四季春', '100000', '231', '10', '0.277', '北京', '33', '四季春', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1519', null, '一级', '100000', '四季春', '100000', '-1276.8', '10', '-0.583', '北京', '-70', '四季春', '', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('152', null, '二级', '1001288', '四季春', '100000', '759.6', '3', '1.757', '北京', '211', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1520', null, '一级', '100000', '四季春', '100000', '563.73', '10', '0.135', '北京', '43', '四季春', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '密云');
INSERT INTO `poc_sales` VALUES ('1521', null, '一级', '100000', '四季春', '100000', '94', '10', '0.042', '北京', '5', '四季春', '', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1522', null, '一级', '100000', '四季春', '100000', '733.5', '10', '0.749', '北京', '90', '四季春', '', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1523', null, '一级', '100000', '四季春', '100000', '36', '10', '0.042', '北京', '5', '四季春', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1524', null, '一级', '100000', '四季春', '100000', '307.44', '10', '0.3', '北京', '36', '四季春', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1525', null, '一级', '100004', '华润商业集团', '100004', '50', '10', '0.041', '北京', '25', '华润商业集团', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1526', null, '一级', '100004', '华润商业集团', '100004', '420', '10', '0.2', '北京', '40', '华润商业集团', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1527', null, '二级', '100112', '四季春', '100000', '210', '10', '0.25', '北京', '30', '丰瑞龙翔', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1528', null, '一级', '100957', '四药控股', '100957', '-160', '10', '-0.133', '北京', '-80', '四药控股', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1529', null, '一级', '100957', '四药控股', '100957', '0', '10', '0', '北京', '0', '四药控股', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('153', null, '二级', '1001288', '四季春', '100000', '331.5', '3', '0.85', '北京', '85', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1530', null, '二级', '101164', '河北中健贸易集团', '100007', '660', '10', '1', '北京', '120', '保定中诚汇达贸易', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1531', null, '二级', '1000001', '四季春', '100000', '2530', '10', '3.831', '北京', '460', '凯宏鑫有限责任公司', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1532', null, '二级', '1000001', '四季春', '100000', '90', '10', '0.126', '北京', '15', '凯宏鑫有限责任公司', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '密云');
INSERT INTO `poc_sales` VALUES ('1533', null, '二级', '1000001', '四季春', '100000', '623', '10', '0.741', '北京', '89', '凯宏鑫有限责任公司', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1534', null, '二级', '1000001', '四季春', '100000', '367.5', '10', '0.175', '北京', '35', '凯宏鑫有限责任公司', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1535', null, '二级', '1000001', '四季春', '100000', '507.6', '10', '0.225', '北京', '27', '凯宏鑫有限责任公司', '', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1536', null, '二级', '1000001', '四季春', '100000', '594.95', '10', '0.607', '北京', '73', '凯宏鑫有限责任公司', '', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1537', null, '二级', '1001288', '四季春', '100000', '979', '10', '1.484', '北京', '178', '悦康源通', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1538', null, '二级', '1001288', '四季春', '100000', '427.86', '10', '0.991', '北京', '118.852', '悦康源通', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1539', null, '二级', '1001288', '四季春', '100000', '28.4', '10', '0.017', '北京', '2', '悦康源通', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('154', null, '二级', '1001288', '四季春', '100000', '293.28', '3', '0.488', '北京', '39', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1540', null, '二级', '1001288', '四季春', '100000', '134', '10', '0.125', '北京', '10', '悦康源通', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1541', null, '二级', '1001288', '四季春', '100000', '180', '10', '0.25', '北京', '30', '悦康源通', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '密云');
INSERT INTO `poc_sales` VALUES ('1542', null, '二级', '1001288', '四季春', '100000', '63', '10', '0.076', '北京', '9', '悦康源通', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1543', null, '二级', '1001288', '四季春', '100000', '157.5', '10', '0.075', '北京', '15', '悦康源通', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1544', null, '二级', '1001288', '四季春', '100000', '432.4', '10', '0.192', '北京', '23', '悦康源通', '', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1545', null, '二级', '1001288', '四季春', '100000', '554.2', '10', '0.567', '北京', '68', '悦康源通', '', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1546', null, '二级', '1001288', '四季春', '100000', '144', '10', '0.167', '北京', '20', '悦康源通', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1547', null, '一级', '1002856', '嘉事堂', '1002856', '256', '10', '0.333', '北京', '20', '嘉事堂', '', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('1548', null, '一级', '1002856', '嘉事堂', '1002856', '220', '10', '0.183', '北京', '110', '嘉事堂', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1549', null, '一级', '1002856', '嘉事堂', '1002856', '11.1', '10', '0.015', '北京', '3', '嘉事堂', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('155', null, '二级', '1001288', '四季春', '100000', '1956.8', '3', '1.879', '北京', '150', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1550', null, '二级', '1003145', '四季春', '100000', '533.5', '10', '0.809', '北京', '97', '华润新龙（）', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1551', null, '二级', '1003145', '四季春', '100000', '1720.8', '10', '3.982', '北京', '478', '华润新龙（）', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1552', null, '二级', '1003145', '四季春', '100000', '67.68', '10', '0.113', '北京', '9', '华润新龙（）', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1553', null, '二级', '1003145', '四季春', '100000', '227.8', '10', '0.213', '北京', '17', '华润新龙（）', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1554', null, '二级', '1003145', '四季春', '100000', '48', '10', '0.067', '北京', '8', '华润新龙（）', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '密云');
INSERT INTO `poc_sales` VALUES ('1555', null, '二级', '1003145', '四季春', '100000', '175', '10', '0.21', '北京', '25', '华润新龙（）', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1556', null, '二级', '1003145', '四季春', '100000', '134.2', '10', '0.032', '北京', '10', '华润新龙（）', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '密云');
INSERT INTO `poc_sales` VALUES ('1557', null, '二级', '1003145', '四季春', '100000', '188', '10', '0.083', '北京', '10', '华润新龙（）', '', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1558', null, '二级', '1003145', '四季春', '100000', '1181.75', '10', '1.207', '北京', '145', '华润新龙（）', '', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1559', null, '二级', '1003494', '保定市久展销售', '101733', '70', '10', '0.083', '北京', '10', '滦平县惠仁有限责任公司', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('156', null, '二级', '1001288', '四季春', '100000', '2982', '3', '1.42', '北京', '284', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1560', null, '二级', '1003494', '保定市久展销售', '101733', '285.25', '10', '0.291', '北京', '35', '滦平县惠仁有限责任公司', '', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1561', null, '二级', '1003494', '保定市久展销售', '101733', '170.8', '10', '0.167', '北京', '20', '滦平县惠仁有限责任公司', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1562', null, '一级', '100000', '四季春', '100000', '1369.5', '10', '2.076', '北京', '249', '四季春', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1563', null, '一级', '100000', '四季春', '100000', '1026', '10', '2.376', '北京', '285', '四季春', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1564', null, '一级', '100000', '四季春', '100000', '195.52', '10', '0.325', '北京', '26', '四季春', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1565', null, '一级', '100000', '四季春', '100000', '1692', '10', '1.175', '北京', '94', '四季春', '', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1566', null, '一级', '100000', '四季春', '100000', '42.6', '10', '0.025', '北京', '3', '四季春', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1567', null, '一级', '100000', '四季春', '100000', '130', '10', '0.1', '北京', '10', '四季春', '', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('1568', null, '一级', '100000', '四季春', '100000', '1098.8', '10', '1.025', '北京', '82', '四季春', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1569', null, '一级', '100000', '四季春', '100000', '402', '10', '0.559', '北京', '67', '四季春', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('157', null, '一级', '1002856', '嘉事堂', '1002856', '720', '3', '0.601', '北京', '360', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1570', null, '一级', '100000', '四季春', '100000', '492', '10', '0.684', '北京', '82', '四季春', '', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1571', null, '一级', '100000', '四季春', '100000', '448', '10', '0.373', '北京', '224', '四季春', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1572', null, '一级', '100000', '四季春', '100000', '540', '10', '0.1', '北京', '20', '四季春', '', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1573', null, '一级', '100000', '四季春', '100000', '735', '10', '0.875', '北京', '105', '四季春', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1574', null, '一级', '100000', '四季春', '100000', '598.5', '10', '0.285', '北京', '57', '四季春', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1575', null, '一级', '100000', '四季春', '100000', '546.5', '10', '0.417', '北京', '50', '四季春', '', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1576', null, '一级', '100000', '四季春', '100000', '61.6', '10', '0.035', '北京', '7', '四季春', '', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1577', null, '一级', '100000', '四季春', '100000', '4326.3', '10', '1.035', '北京', '330', '四季春', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('1578', null, '一级', '100000', '四季春', '100000', '1598', '10', '0.709', '北京', '85', '四季春', '', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1579', null, '一级', '100000', '四季春', '100000', '3838.65', '10', '3.923', '北京', '471', '四季春', '', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('158', null, '一级', '1002856', '嘉事堂', '1002856', '4044.1', '3', '3.083', '北京', '370', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1580', null, '一级', '100000', '四季春', '100000', '252', '10', '0.292', '北京', '35', '四季春', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1581', null, '一级', '100000', '四季春', '100000', '1451.8', '10', '1.417', '北京', '170', '四季春', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1582', null, '一级', '100000', '四季春', '100000', '-7.4', '10', '-0.01', '北京', '-2', '四季春', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1583', null, '一级', '100000', '四季春', '100000', '720', '10', '0.417', '北京', '100', '四季春', '', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('1584', null, '二级', '100112', '四季春', '100000', '280', '10', '0.334', '北京', '40', '丰瑞龙翔', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1585', null, '二级', '100112', '四季春', '100000', '105', '10', '0.05', '北京', '10', '丰瑞龙翔', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1586', null, '一级', '100957', '四药控股', '100957', '20', '10', '0.017', '北京', '10', '四药控股', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1587', null, '一级', '100957', '四药控股', '100957', '597.8', '10', '0.583', '北京', '70', '四药控股', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1588', null, '二级', '101164', '河北中健贸易集团', '100007', '110', '10', '0.167', '北京', '20', '保定中诚汇达贸易', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1589', null, '一级', '101733', '保定市久展销售', '101733', '376', '10', '0.167', '北京', '20', '保定市久展销售', '', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('159', null, '二级', '1002859', '四季春', '100000', '18', '3', '0.042', '北京', '5', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1590', null, '一级', '101733', '保定市久展销售', '101733', '407.5', '10', '0.417', '北京', '50', '保定市久展销售', '', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1591', null, '一级', '101733', '保定市久展销售', '101733', '125', '10', '0.083', '北京', '10', '保定市久展销售', '', '10006000400', '灯盏花素注射液 5克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1592', null, '一级', '101733', '保定市久展销售', '101733', '64.8', '10', '0.075', '北京', '9', '保定市久展销售', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1593', null, '二级', '1000001', '四季春', '100000', '594', '10', '0.9', '北京', '108', '凯宏鑫有限责任公司', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1594', null, '二级', '1000001', '四季春', '100000', '180', '10', '0.25', '北京', '30', '凯宏鑫有限责任公司', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('1595', null, '二级', '1000001', '四季春', '100000', '994', '10', '1.185', '北京', '142', '凯宏鑫有限责任公司', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1596', null, '二级', '1000001', '四季春', '100000', '815', '10', '0.834', '北京', '100', '凯宏鑫有限责任公司', '', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1597', null, '二级', '1000089', '河北中健贸易集团', '100007', '94', '10', '0.042', '北京', '5', '河北顺泽', '', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1598', null, '二级', '1000110', '四药乐仁堂', '100008', '550', '10', '0.833', '北京', '100', '廊坊市中诚康宇', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1599', null, '二级', '1000110', '四药乐仁堂', '100008', '71', '10', '0.042', '北京', '5', '廊坊市中诚康宇', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('16', null, '二级', '1001288', '四季春', '100000', '915.27', '2', '0.916', '北京', '73.31', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('160', null, '二级', '1002859', '四季春', '100000', '2992.5', '3', '1.425', '北京', '285', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1600', null, '二级', '1000110', '四药乐仁堂', '100008', '163', '10', '0.167', '北京', '20', '廊坊市中诚康宇', '', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1601', null, '二级', '1001288', '四季春', '100000', '1798.5', '10', '2.728', '北京', '327', '悦康源通', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1602', null, '二级', '1001288', '四季春', '100000', '94.17', '10', '0.218', '北京', '26.16', '悦康源通', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1603', null, '二级', '1001288', '四季春', '100000', '22.56', '10', '0.037', '北京', '3', '悦康源通', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1604', null, '二级', '1001288', '四季春', '100000', '402', '10', '0.378', '北京', '30', '悦康源通', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1605', null, '二级', '1001288', '四季春', '100000', '168', '10', '0.233', '北京', '28', '悦康源通', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('1606', null, '二级', '1001288', '四季春', '100000', '826', '10', '0.985', '北京', '118', '悦康源通', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1607', null, '二级', '1001288', '四季春', '100000', '483', '10', '0.23', '北京', '46', '悦康源通', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1608', null, '二级', '1001288', '四季春', '100000', '523.38', '10', '0.122', '北京', '39', '悦康源通', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('1609', null, '二级', '1001288', '四季春', '100000', '658', '10', '0.292', '北京', '35', '悦康源通', '', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('161', null, '二级', '1003145', '四季春', '100000', '126', '3', '0.292', '北京', '35', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1610', null, '二级', '1001288', '四季春', '100000', '912.8', '10', '0.932', '北京', '112', '悦康源通', '', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1611', null, '二级', '1001288', '四季春', '100000', '144', '10', '0.166', '北京', '20', '悦康源通', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1612', null, '一级', '1002856', '嘉事堂', '1002856', '25.9', '10', '0.035', '北京', '7', '嘉事堂', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1613', null, '二级', '1002859', '四季春', '100000', '1430', '10', '2.167', '北京', '260', '天力泽', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1614', null, '二级', '1002859', '四季春', '100000', '900', '10', '2.083', '北京', '250', '天力泽', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1615', null, '二级', '1002859', '四季春', '100000', '40.75', '10', '0.042', '北京', '5', '天力泽', '', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1616', null, '二级', '1003145', '四季春', '100000', '203.5', '10', '0.309', '北京', '37', '华润新龙（）', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1617', null, '二级', '1003145', '四季春', '100000', '126', '10', '0.291', '北京', '35', '华润新龙（）', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1618', null, '二级', '1003145', '四季春', '100000', '22.56', '10', '0.037', '北京', '3', '华润新龙（）', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1619', null, '二级', '1003145', '四季春', '100000', '53.6', '10', '0.05', '北京', '4', '华润新龙（）', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('162', null, '二级', '1003145', '四季春', '100000', '3.9', '3', '0.01', '北京', '1', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1620', null, '二级', '1003145', '四季春', '100000', '60', '10', '0.083', '北京', '10', '华润新龙（）', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('1621', null, '二级', '1003145', '四季春', '100000', '280', '10', '0.334', '北京', '40', '华润新龙（）', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1622', null, '二级', '1003145', '四季春', '100000', '378', '10', '0.18', '北京', '36', '华润新龙（）', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1623', null, '二级', '1003145', '四季春', '100000', '416.02', '10', '0.097', '北京', '31', '华润新龙（）', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('1624', null, '二级', '1003145', '四季春', '100000', '1116', '10', '1.292', '北京', '155', '华润新龙（）', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1625', null, '二级', '3007902', '四季春', '100000', '341', '10', '0.516', '北京', '62', '好药师达药房连锁', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1626', null, '二级', '3007902', '四季春', '100000', '60.16', '10', '0.101', '北京', '8', '好药师达药房连锁', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1627', null, '二级', '3007902', '四季春', '100000', '13', '10', '0.01', '北京', '1', '好药师达药房连锁', '', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('1628', null, '二级', '3007902', '四季春', '100000', '80.4', '10', '0.075', '北京', '6', '好药师达药房连锁', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1629', null, '二级', '3007902', '四季春', '100000', '234', '10', '0.324', '北京', '39', '好药师达药房连锁', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('163', null, '二级', '1003145', '四季春', '100000', '995.7', '3', '0.965', '北京', '77', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1630', null, '二级', '3007902', '四季春', '100000', '162', '10', '0.03', '北京', '6', '好药师达药房连锁', '', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1631', null, '二级', '5027725', '四季春', '100000', '128', '10', '0.083', '北京', '10', '金象大药房连锁有限责任公司', '', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1632', null, '二级', '5027739', '四药乐仁堂', '100008', '27.5', '10', '0.042', '北京', '5', '河北新兴', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1633', null, '一级', '100000', '四季春', '100000', '1655.5', '10', '2.51', '北京', '301', '四季春', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1634', null, '一级', '100000', '四季春', '100000', '115.2', '10', '0.267', '北京', '32', '四季春', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1635', null, '一级', '100000', '四季春', '100000', '248.16', '10', '0.413', '北京', '33', '四季春', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1636', null, '一级', '100000', '四季春', '100000', '180', '10', '0.125', '北京', '10', '四季春', '', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1637', null, '一级', '100000', '四季春', '100000', '3840', '10', '5', '北京', '300', '四季春', '', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1638', null, '一级', '100000', '四季春', '100000', '312.4', '10', '0.183', '北京', '22', '四季春', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1639', null, '一级', '100000', '四季春', '100000', '650', '10', '0.5', '北京', '50', '四季春', '', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('164', null, '二级', '1003145', '四季春', '100000', '2079', '3', '0.99', '北京', '198', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1640', null, '一级', '100000', '四季春', '100000', '1929.6', '10', '1.802', '北京', '144', '四季春', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1641', null, '一级', '100000', '四季春', '100000', '360', '10', '0.501', '北京', '60', '四季春', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1642', null, '一级', '100000', '四季春', '100000', '240', '10', '0.333', '北京', '40', '四季春', '', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1643', null, '一级', '100000', '四季春', '100000', '768', '10', '0.64', '北京', '384', '四季春', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1644', null, '一级', '100000', '四季春', '100000', '1620', '10', '0.3', '北京', '60', '四季春', '', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1645', null, '一级', '100000', '四季春', '100000', '1386', '10', '1.652', '北京', '198', '四季春', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1646', null, '一级', '100000', '四季春', '100000', '714', '10', '0.34', '北京', '68', '四季春', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1647', null, '一级', '100000', '四季春', '100000', '729.6', '10', '0.334', '北京', '40', '四季春', '', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1648', null, '一级', '100000', '四季春', '100000', '264', '10', '0.15', '北京', '30', '四季春', '', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1649', null, '一级', '100000', '四季春', '100000', '419.52', '10', '0.1', '北京', '32', '四季春', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('165', null, '一级', '100957', '四药控股', '100957', '2404.6', '3', '1.832', '北京', '220', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1650', null, '一级', '100000', '四季春', '100000', '188', '10', '0.083', '北京', '10', '四季春', '', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1651', null, '一级', '100000', '四季春', '100000', '1141', '10', '1.167', '北京', '140', '四季春', '', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1652', null, '一级', '100000', '四季春', '100000', '108', '10', '0.125', '北京', '15', '四季春', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1653', null, '一级', '100000', '四季春', '100000', '170.8', '10', '0.167', '北京', '20', '四季春', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1654', null, '一级', '100000', '四季春', '100000', '3.7', '10', '0.005', '北京', '1', '四季春', '', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1655', null, '一级', '100004', '华润商业集团', '100004', '6772', '10', '5.645', '北京', '3386', '华润商业集团', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1656', null, '一级', '100004', '华润商业集团', '100004', '-525', '10', '-0.25', '北京', '-50', '华润商业集团', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1657', null, '二级', '100112', '四季春', '100000', '434', '10', '0.518', '北京', '62', '丰瑞龙翔', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1658', null, '二级', '100112', '四季春', '100000', '210', '10', '0.1', '北京', '20', '丰瑞龙翔', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1659', null, '一级', '100253', '科园信海经营', '100253', '0', '10', '0', '北京', '0', '科园信海经营', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('166', null, '二级', '3007898', '四季春', '100000', '26.8', '3', '0.025', '北京', '2', '医保中洋达药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1660', null, '一级', '100957', '四药控股', '100957', '610', '10', '0.507', '北京', '305', '四药控股', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1661', null, '一级', '100957', '四药控股', '100957', '0', '10', '0', '北京', '0', '四药控股', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1662', null, '一级', '100957', '四药控股', '100957', '155.43', '10', '0.152', '北京', '18.2', '四药控股', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1663', null, '二级', '101164', '河北中健贸易集团', '100007', '110', '10', '0.167', '北京', '20', '保定中诚汇达贸易', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1664', null, '二级', '101171', '四药集团新疆新特', '100111', '144', '10', '0.167', '北京', '20', '新疆神州通', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1665', null, '二级', '1000001', '四季春', '100000', '385', '10', '0.583', '北京', '70', '凯宏鑫有限责任公司', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1666', null, '二级', '1000001', '四季春', '100000', '96', '10', '0.133', '北京', '16', '凯宏鑫有限责任公司', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1667', null, '二级', '1000001', '四季春', '100000', '812', '10', '0.969', '北京', '116', '凯宏鑫有限责任公司', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1668', null, '二级', '1000001', '四季春', '100000', '105', '10', '0.05', '北京', '10', '凯宏鑫有限责任公司', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1669', null, '二级', '1000001', '四季春', '100000', '582.8', '10', '0.258', '北京', '31', '凯宏鑫有限责任公司', '', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('167', null, '二级', '3007898', '四季春', '100000', '157.5', '3', '0.075', '北京', '15', '医保中洋达药房', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1670', null, '二级', '1000001', '四季春', '100000', '65.2', '10', '0.067', '北京', '8', '凯宏鑫有限责任公司', '', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1671', null, '二级', '1000001', '四季春', '100000', '-36', '10', '-0.042', '北京', '-5', '凯宏鑫有限责任公司', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1672', null, '二级', '1000089', '河北中健贸易集团', '100007', '-4890', '10', '-5', '北京', '-600', '河北顺泽', '', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1673', null, '二级', '1000089', '河北中健贸易集团', '100007', '14.4', '10', '0.017', '北京', '2', '河北顺泽', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1674', null, '二级', '1000110', '四药乐仁堂', '100008', '192.5', '10', '0.292', '北京', '35', '廊坊市中诚康宇', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1675', null, '二级', '1000110', '四药乐仁堂', '100008', '36', '10', '0.083', '北京', '10', '廊坊市中诚康宇', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1676', null, '二级', '1000110', '四药乐仁堂', '100008', '201', '10', '0.188', '北京', '15', '廊坊市中诚康宇', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1677', null, '二级', '1000110', '四药乐仁堂', '100008', '36', '10', '0.042', '北京', '5', '廊坊市中诚康宇', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1678', null, '二级', '1001288', '四季春', '100000', '1936', '10', '2.93', '北京', '352', '悦康源通', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1679', null, '二级', '1001288', '四季春', '100000', '28.15', '10', '0.065', '北京', '7.82', '悦康源通', '', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('168', null, '二级', '3007902', '四季春', '100000', '240.64', '3', '0.4', '北京', '32', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1680', null, '二级', '1001288', '四季春', '100000', '75.2', '10', '0.126', '北京', '10', '悦康源通', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1681', null, '二级', '1001288', '四季春', '100000', '1487.4', '10', '1.39', '北京', '111', '悦康源通', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1682', null, '二级', '1001288', '四季春', '100000', '324', '10', '0.449', '北京', '54', '悦康源通', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1683', null, '二级', '1001288', '四季春', '100000', '1988', '10', '2.367', '北京', '284', '悦康源通', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1684', null, '二级', '1001288', '四季春', '100000', '273', '10', '0.13', '北京', '26', '悦康源通', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1685', null, '二级', '1001288', '四季春', '100000', '1570.14', '10', '0.365', '北京', '117', '悦康源通', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1686', null, '二级', '1001288', '四季春', '100000', '2656.9', '10', '2.717', '北京', '326', '悦康源通', '', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1687', null, '一级', '1002856', '嘉事堂', '1002856', '1062', '10', '0.886', '北京', '531', '嘉事堂', '', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1688', null, '一级', '1002856', '嘉事堂', '1002856', '912', '10', '0.417', '北京', '50', '嘉事堂', '', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1689', null, '一级', '1002856', '嘉事堂', '1002856', '1708', '10', '1.667', '北京', '200', '嘉事堂', '', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('169', null, '二级', '3007902', '四季春', '100000', '268', '3', '0.25', '北京', '20', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1690', null, '二级', '1002859', '四季春', '100000', '220', '10', '0.334', '北京', '40', '天力泽', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1691', null, '二级', '1002859', '四季春', '100000', '3.9', '10', '0.01', '北京', '1', '天力泽', '', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1692', null, '二级', '1002859', '四季春', '100000', '0', '10', '0', '北京', '0', '天力泽', '', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1693', null, '二级', '1002859', '四季春', '100000', '440', '10', '0.25', '北京', '50', '天力泽', '', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1694', null, '二级', '1003145', '四季春', '100000', '341', '10', '0.517', '北京', '62', '华润新龙（）', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1695', null, '二级', '1003145', '四季春', '100000', '150.4', '10', '0.251', '北京', '20', '华润新龙（）', '', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1696', null, '二级', '1003145', '四季春', '100000', '509.2', '10', '0.475', '北京', '38', '华润新龙（）', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1697', null, '二级', '1003145', '四季春', '100000', '42', '10', '0.059', '北京', '7', '华润新龙（）', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1698', null, '二级', '1003145', '四季春', '100000', '1365', '10', '1.626', '北京', '195', '华润新龙（）', '', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1699', null, '二级', '1003145', '四季春', '100000', '787.5', '10', '0.375', '北京', '75', '华润新龙（）', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('17', null, '二级', '1001288', '四季春', '100000', '2373', '2', '1.13', '北京', '226', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('170', null, '二级', '3007902', '四季春', '100000', '451.5', '3', '0.215', '北京', '43', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1700', null, '二级', '1003145', '四季春', '100000', '1355.42', '10', '0.316', '北京', '101', '华润新龙（）', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1701', null, '二级', '1003145', '四季春', '100000', '188', '10', '0.083', '北京', '10', '华润新龙（）', '', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1702', null, '二级', '1003145', '四季春', '100000', '652', '10', '0.667', '北京', '80', '华润新龙（）', '', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1703', null, '二级', '1003145', '四季春', '100000', '72', '10', '0.083', '北京', '10', '华润新龙（）', '', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1704', null, '二级', '3007902', '四季春', '100000', '99', '10', '0.15', '北京', '18', '好药师达药房连锁', '', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1705', null, '二级', '3007902', '四季春', '100000', '28.4', '10', '0.017', '北京', '2', '好药师达药房连锁', '', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1706', null, '二级', '3007902', '四季春', '100000', '80.4', '10', '0.075', '北京', '6', '好药师达药房连锁', '', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1707', null, '二级', '3007902', '四季春', '100000', '12', '10', '0.016', '北京', '2', '好药师达药房连锁', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1708', null, '二级', '3007902', '四季春', '100000', '26.4', '10', '0.015', '北京', '3', '好药师达药房连锁', '', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1709', null, '二级', '3541049', '内蒙古四季春', '100803', '210', '10', '0.1', '北京', '20', '陕西亿洲', '', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('171', null, '二级', '3007902', '四季春', '100000', '64', '3', '0.042', '北京', '5', '好药师达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1710', null, '二级', '5027725', '四季春', '100000', '36', '10', '0.05', '北京', '6', '金象大药房连锁有限责任公司', '', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1711', null, '二级', '5027725', '四季春', '100000', '832', '10', '0.542', '北京', '65', '金象大药房连锁有限责任公司', '', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1712', null, '二级', '5027725', '四季春', '100000', '362.34', '10', '0.084', '北京', '27', '金象大药房连锁有限责任公司', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1713', null, '二级', '5027764', '四季春', '100000', '38.4', '10', '0.025', '北京', '3', '德威治连锁有限责任公司', '', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1714', null, '二级', '5027764', '四季春', '100000', '134.2', '10', '0.031', '北京', '10', '德威治连锁有限责任公司', '', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1715', null, '一级', '100000', '四季春', '100000', '1184.4', '11', '2.743', '北京', '329', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1716', null, '一级', '100000', '四季春', '100000', '256', '11', '0.333', '北京', '20', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '海淀');
INSERT INTO `poc_sales` VALUES ('1717', null, '一级', '100000', '四季春', '100000', '304', '11', '0.252', '北京', '152', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1718', null, '一级', '100000', '四季春', '100000', '3252', '11', '3.845', '北京', '461', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1719', null, '一级', '100000', '四季春', '100000', '2293.6', '11', '1.017', '北京', '122', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('172', null, '二级', '5027725', '四季春', '100000', '3660.8', '3', '2.384', '北京', '286', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1720', null, '一级', '100000', '四季春', '100000', '5264.9', '11', '5.385', '北京', '646', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1721', null, '一级', '100000', '四季春', '100000', '3600', '11', '4.165', '北京', '500', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1722', null, '一级', '100000', '四季春', '100000', '427', '11', '0.416', '北京', '50', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1723', null, '一级', '100000', '四季春', '100000', '210.9', '11', '0.285', '北京', '57', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1724', null, '一级', '100000', '四季春', '100000', '340', '11', '0.334', '北京', '40', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1725', null, '一级', '100000', '四季春', '100000', '1654.4', '11', '0.94', '北京', '188', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1726', null, '一级', '100000', '四季春', '100000', '2639', '11', '2.03', '北京', '203', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1727', null, '一级', '100000', '四季春', '100000', '756', '11', '0.14', '北京', '28', '四季春', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1728', null, '一级', '100000', '四季春', '100000', '458.85', '11', '0.11', '北京', '35', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1729', null, '一级', '100000', '四季春', '100000', '6237', '11', '9.451', '北京', '1134', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('173', null, '二级', '5045669', '四季春', '100000', '21.98', '3', '0.022', '北京', '1.64', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1730', null, '一级', '100000', '四季春', '100000', '112.8', '11', '0.187', '北京', '15', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1731', null, '一级', '100000', '四季春', '100000', '288', '11', '0.2', '北京', '16', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1732', null, '一级', '100000', '四季春', '100000', '3109.8', '11', '1.825', '北京', '219', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1733', null, '一级', '100000', '四季春', '100000', '3671.6', '11', '3.427', '北京', '274', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1734', null, '一级', '100000', '四季春', '100000', '1830', '11', '2.54', '北京', '305', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1735', null, '一级', '100000', '四季春', '100000', '2184', '11', '1.56', '北京', '312', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1736', null, '一级', '100000', '四季春', '100000', '73.5', '11', '0.059', '北京', '7', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1737', null, '一级', '100000', '四季春', '100000', '861', '11', '0.41', '北京', '82', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1738', null, '一级', '100000', '四季春', '100000', '3082.26', '11', '2.35', '北京', '282', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1739', null, '一级', '100000', '四季春', '100000', '547.2', '11', '0.25', '北京', '30', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('174', null, '一级', '100000', '四季春', '100000', '2678.4', '3', '6.201', '北京', '744', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1740', null, '一级', '100000', '四季春', '100000', '2088', '11', '1.209', '北京', '290', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1741', null, '一级', '100004', '华润商业集团', '100004', '1520', '11', '1.267', '北京', '760', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1742', null, '一级', '100004', '华润商业集团', '100004', '-10.5', '11', '-0.005', '北京', '-1', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1743', null, '一级', '100004', '华润商业集团', '100004', '364.8', '11', '0.167', '北京', '20', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1744', null, '二级', '100112', '四季春', '100000', '1129', '11', '1.327', '北京', '159', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1745', null, '二级', '100112', '四季春', '100000', '11980.18', '11', '5.708', '北京', '1140.966', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1746', null, '一级', '100253', '科园信海经营', '100253', '340', '11', '0.283', '北京', '170', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1747', null, '一级', '100957', '四药控股', '100957', '360', '11', '0.3', '北京', '180', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1748', null, '一级', '100957', '四药控股', '100957', '222.04', '11', '0.217', '北京', '26', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1749', null, '一级', '100957', '四药控股', '100957', '210', '11', '0.1', '北京', '20', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('175', null, '一级', '100000', '四季春', '100000', '5046.6', '3', '12.94', '北京', '1294', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('1750', null, '一级', '100957', '四药控股', '100957', '273.6', '11', '0.125', '北京', '15', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1751', null, '二级', '101164', '保定市久展销售', '101733', '21.6', '11', '0.025', '北京', '3', '保定中诚汇达贸易', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1752', null, '一级', '101733', '保定市久展销售', '101733', '72', '11', '0.167', '北京', '20', '保定市久展销售', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1753', null, '一级', '101733', '保定市久展销售', '101733', '110', '11', '0.167', '北京', '20', '保定市久展销售', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1754', null, '二级', '1000001', '四季春', '100000', '2739', '11', '3.037', '北京', '364', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1755', null, '二级', '1000001', '四季春', '100000', '470', '11', '0.209', '北京', '25', '凯宏鑫有限责任公司', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1756', null, '二级', '1000001', '四季春', '100000', '5053', '11', '5.166', '北京', '620', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1757', null, '二级', '1000001', '四季春', '100000', '0', '11', '0', '北京', '0', '凯宏鑫有限责任公司', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1758', null, '二级', '1000001', '四季春', '100000', '7425', '11', '11.251', '北京', '1350', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1759', null, '二级', '1000001', '四季春', '100000', '201', '11', '0.189', '北京', '15', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('176', null, '一级', '100000', '四季春', '100000', '48', '3', '0.04', '北京', '24', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1760', null, '二级', '1000001', '四季春', '100000', '0', '11', '0', '北京', '0', '凯宏鑫有限责任公司', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1761', null, '二级', '1000001', '四季春', '100000', '1491', '11', '0.71', '北京', '142', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1762', null, '二级', '1000110', '河北中健贸易集团', '100007', '131', '11', '0.142', '北京', '17', '廊坊市中诚康宇', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1763', null, '二级', '1001288', '四季春', '100000', '52.8', '11', '0.123', '北京', '14.667', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1764', null, '二级', '1001288', '四季春', '100000', '677', '11', '0.718', '北京', '86', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1765', null, '二级', '1001288', '四季春', '100000', '150.4', '11', '0.067', '北京', '8', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1766', null, '二级', '1001288', '四季春', '100000', '1083.95', '11', '1.109', '北京', '133', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1767', null, '二级', '1001288', '四季春', '100000', '144', '11', '0.167', '北京', '20', '悦康源通', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1768', null, '二级', '1001288', '四季春', '100000', '40.26', '11', '0.009', '北京', '3', '悦康源通', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1769', null, '二级', '1001288', '四季春', '100000', '593.43', '11', '0.898', '北京', '107.889', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('177', null, '一级', '100000', '四季春', '100000', '225.6', '3', '0.375', '北京', '30', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1770', null, '二级', '1001288', '四季春', '100000', '442.2', '11', '0.414', '北京', '33', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1771', null, '二级', '1001288', '四季春', '100000', '126', '11', '0.06', '北京', '12', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1772', null, '一级', '1002856', '嘉事堂', '1002856', '1850', '11', '1.542', '北京', '925', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1773', null, '一级', '1002856', '嘉事堂', '1002856', '34.16', '11', '0.033', '北京', '4', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1774', null, '一级', '1002856', '嘉事堂', '1002856', '29.6', '11', '0.04', '北京', '8', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1775', null, '一级', '1002856', '嘉事堂', '1002856', '2730', '11', '2.1', '北京', '210', '嘉事堂', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1776', null, '一级', '1002856', '嘉事堂', '1002856', '735', '11', '0.35', '北京', '70', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1777', null, '二级', '1002859', '四季春', '100000', '864', '11', '2', '北京', '240', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1778', null, '二级', '1002859', '四季春', '100000', '19.5', '11', '0.05', '北京', '5', '天力泽', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1779', null, '二级', '1002859', '四季春', '100000', '120', '11', '0.1', '北京', '60', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('178', null, '一级', '100000', '四季春', '100000', '486.5', '3', '0.488', '北京', '39', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1780', null, '二级', '1002859', '四季春', '100000', '29.6', '11', '0.04', '北京', '8', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1781', null, '二级', '1002859', '四季春', '100000', '748', '11', '1.133', '北京', '136', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1782', null, '二级', '1003145', '四季春', '100000', '208.8', '11', '0.483', '北京', '58', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1783', null, '二级', '1003145', '四季春', '100000', '241', '11', '0.259', '北京', '31', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('1784', null, '二级', '1003145', '四季春', '100000', '81.5', '11', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1785', null, '二级', '1003145', '四季春', '100000', '281.82', '11', '0.066', '北京', '21', '华润新龙（）', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1786', null, '二级', '1003145', '四季春', '100000', '440', '11', '0.667', '北京', '80', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1787', null, '二级', '1003145', '四季春', '100000', '90.24', '11', '0.15', '北京', '12', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1788', null, '二级', '1003145', '四季春', '100000', '142', '11', '0.083', '北京', '10', '华润新龙（）', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1789', null, '二级', '1003145', '四季春', '100000', '670', '11', '0.628', '北京', '50', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('179', null, '一级', '100000', '四季春', '100000', '2730', '3', '1.3', '北京', '260', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1790', null, '二级', '1003145', '四季春', '100000', '861', '11', '0.41', '北京', '82', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1791', null, '二级', '3007902', '四季春', '100000', '8.8', '11', '0.005', '北京', '1', '好药师达药房连锁', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1792', null, '二级', '3007902', '四季春', '100000', '26', '11', '0.02', '北京', '2', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1793', null, '二级', '3007902', '四季春', '100000', '126.5', '11', '0.192', '北京', '23', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1794', null, '二级', '3007902', '四季春', '100000', '142', '11', '0.084', '北京', '10', '好药师达药房连锁', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1795', null, '二级', '3007902', '四季春', '100000', '67', '11', '0.063', '北京', '5', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1796', null, '二级', '5027725', '四季春', '100000', '107.36', '11', '0.025', '北京', '8', '金象大药房连锁有限责任公司', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1797', null, '二级', '5027725', '四季春', '100000', '174', '11', '0.241', '北京', '29', '金象大药房连锁有限责任公司', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1798', null, '二级', '5027725', '四季春', '100000', '262.5', '11', '0.125', '北京', '25', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1799', null, '二级', '5027725', '四季春', '100000', '371.2', '11', '0.243', '北京', '29', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('18', null, '一级', '1002856', '嘉事堂', '1002856', '648', '2', '0.542', '北京', '324', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('180', null, '一级', '100000', '四季春', '100000', '1366.25', '3', '1.042', '北京', '125', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1800', null, '二级', '5045669', '四季春', '100000', '415.4', '11', '0.387', '北京', '31', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1801', null, '一级', '100000', '四季春', '100000', '6213.6', '11', '14.384', '北京', '1726', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1802', null, '一级', '100000', '四季春', '100000', '640', '11', '0.833', '北京', '50', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('1803', null, '一级', '100000', '四季春', '100000', '128', '11', '0.107', '北京', '64', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1804', null, '一级', '100000', '四季春', '100000', '537', '11', '0.584', '北京', '70', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1805', null, '一级', '100000', '四季春', '100000', '282', '11', '0.125', '北京', '15', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1806', null, '一级', '100000', '四季春', '100000', '1385.5', '11', '1.416', '北京', '170', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1807', null, '一级', '100000', '四季春', '100000', '86.4', '11', '0.1', '北京', '12', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1808', null, '一级', '100000', '四季春', '100000', '563.64', '11', '0.55', '北京', '66', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1809', null, '一级', '100000', '四季春', '100000', '65', '11', '0.05', '北京', '5', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '密云');
INSERT INTO `poc_sales` VALUES ('181', null, '二级', '1000001', '四季春', '100000', '2426.4', '3', '5.618', '北京', '674', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1810', null, '一级', '100000', '四季春', '100000', '39.33', '11', '0.009', '北京', '3', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '密云');
INSERT INTO `poc_sales` VALUES ('1811', null, '一级', '100000', '四季春', '100000', '2876.5', '11', '4.359', '北京', '523', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1812', null, '一级', '100000', '四季春', '100000', '60.16', '11', '0.1', '北京', '8', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1813', null, '一级', '100000', '四季春', '100000', '142', '11', '0.083', '北京', '10', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1814', null, '一级', '100000', '四季春', '100000', '857.6', '11', '0.8', '北京', '64', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1815', null, '一级', '100000', '四季春', '100000', '498', '11', '0.693', '北京', '83', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1816', null, '一级', '100000', '四季春', '100000', '31.5', '11', '0.025', '北京', '3', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1817', null, '一级', '100000', '四季春', '100000', '54.65', '11', '0.042', '北京', '5', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1818', null, '一级', '100000', '四季春', '100000', '36', '11', '0.021', '北京', '5', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '密云');
INSERT INTO `poc_sales` VALUES ('1819', null, '一级', '100004', '华润商业集团', '100004', '60', '11', '0.05', '北京', '30', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('182', null, '二级', '1000001', '四季春', '100000', '4508.4', '3', '11.56', '北京', '1156', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('1820', null, '二级', '100112', '四季春', '100000', '560', '11', '0.626', '北京', '75', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1821', null, '二级', '100112', '四季春', '100000', '1781.59', '11', '0.85', '北京', '169.676', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1822', null, '二级', '101164', '保定市久展销售', '101733', '550', '11', '0.833', '北京', '100', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1823', null, '二级', '1000001', '四季春', '100000', '827', '11', '0.943', '北京', '113', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1824', null, '二级', '1000001', '四季春', '100000', '94', '11', '0.042', '北京', '5', '凯宏鑫有限责任公司', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1825', null, '二级', '1000001', '四季春', '100000', '2901.4', '11', '2.968', '北京', '356', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1826', null, '二级', '1000001', '四季春', '100000', '0', '11', '0', '北京', '0', '凯宏鑫有限责任公司', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1827', null, '二级', '1000001', '四季春', '100000', '1116.5', '11', '1.691', '北京', '203', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1828', null, '二级', '1000001', '四季春', '100000', '134', '11', '0.125', '北京', '10', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1829', null, '二级', '1000001', '四季春', '100000', '0', '11', '0', '北京', '0', '凯宏鑫有限责任公司', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '密云');
INSERT INTO `poc_sales` VALUES ('183', null, '二级', '1000001', '四季春', '100000', '268', '3', '0.251', '北京', '20', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1830', null, '二级', '1000001', '四季春', '100000', '252', '11', '0.12', '北京', '24', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1831', null, '二级', '1001288', '四季春', '100000', '576.3', '11', '1.337', '北京', '160.088', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1832', null, '二级', '1001288', '四季春', '100000', '141', '11', '0.158', '北京', '19', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1833', null, '二级', '1001288', '四季春', '100000', '282', '11', '0.126', '北京', '15', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1834', null, '二级', '1001288', '四季春', '100000', '1092.1', '11', '1.116', '北京', '134', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1835', null, '二级', '1001288', '四季春', '100000', '703.42', '11', '1.066', '北京', '127.888', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1836', null, '二级', '1001288', '四季春', '100000', '67', '11', '0.063', '北京', '5', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1837', null, '二级', '1001288', '四季春', '100000', '252', '11', '0.12', '北京', '24', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1838', null, '一级', '1002856', '嘉事堂', '1002856', '100', '11', '0.083', '北京', '50', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1839', null, '二级', '1003145', '四季春', '100000', '2206.8', '11', '5.11', '北京', '613', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('184', null, '二级', '1000001', '四季春', '100000', '1753.5', '3', '0.835', '北京', '167', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1840', null, '二级', '1003145', '四季春', '100000', '331', '11', '0.374', '北京', '45', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1841', null, '二级', '1003145', '四季春', '100000', '150.4', '11', '0.067', '北京', '8', '华润新龙（）', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1842', null, '二级', '1003145', '四季春', '100000', '1711.5', '11', '1.75', '北京', '210', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1843', null, '二级', '1003145', '四季春', '100000', '939.4', '11', '0.219', '北京', '70', '华润新龙（）', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '密云');
INSERT INTO `poc_sales` VALUES ('1844', null, '二级', '1003145', '四季春', '100000', '1265', '11', '1.917', '北京', '230', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1845', null, '二级', '1003145', '四季春', '100000', '37.6', '11', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1846', null, '二级', '1003145', '四季春', '100000', '142', '11', '0.083', '北京', '10', '华润新龙（）', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1847', null, '二级', '1003145', '四季春', '100000', '160.8', '11', '0.15', '北京', '12', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1848', null, '二级', '1003145', '四季春', '100000', '120', '11', '0.167', '北京', '20', '华润新龙（）', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1849', null, '二级', '1003145', '四季春', '100000', '63', '11', '0.03', '北京', '6', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('185', null, '二级', '100112', '四季春', '100000', '577.5', '3', '0.275', '北京', '55', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1850', null, '二级', '1003494', '保定市久展销售', '101733', '72', '11', '0.083', '北京', '10', '滦平县惠仁有限责任公司', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1851', null, '二级', '1003494', '保定市久展销售', '101733', '170.8', '11', '0.167', '北京', '20', '滦平县惠仁有限责任公司', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1852', null, '一级', '100000', '四季春', '100000', '640.8', '11', '1.483', '北京', '178', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1853', null, '一级', '100000', '四季春', '100000', '352', '11', '0.292', '北京', '176', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1854', null, '一级', '100000', '四季春', '100000', '679', '11', '0.759', '北京', '91', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1855', null, '一级', '100000', '四季春', '100000', '827.2', '11', '0.367', '北京', '44', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1856', null, '一级', '100000', '四季春', '100000', '2575.4', '11', '2.633', '北京', '316', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1857', null, '一级', '100000', '四季春', '100000', '2563.2', '11', '2.968', '北京', '356', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1858', null, '一级', '100000', '四季春', '100000', '1161.44', '11', '1.134', '北京', '136', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1859', null, '一级', '100000', '四季春', '100000', '7.4', '11', '0.01', '北京', '2', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('186', null, '二级', '1001288', '四季春', '100000', '410.4', '3', '0.95', '北京', '114', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1860', null, '一级', '100000', '四季春', '100000', '748', '11', '0.425', '北京', '85', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1861', null, '一级', '100000', '四季春', '100000', '260', '11', '0.2', '北京', '20', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('1862', null, '一级', '100000', '四季春', '100000', '1350', '11', '0.25', '北京', '50', '四季春', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1863', null, '一级', '100000', '四季春', '100000', '4549.17', '11', '1.088', '北京', '347', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('1864', null, '一级', '100000', '四季春', '100000', '4977.5', '11', '7.54', '北京', '905', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1865', null, '一级', '100000', '四季春', '100000', '37.6', '11', '0.062', '北京', '5', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1866', null, '一级', '100000', '四季春', '100000', '1530', '11', '1.063', '北京', '85', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1867', null, '一级', '100000', '四季春', '100000', '28.4', '11', '0.017', '北京', '2', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1868', null, '一级', '100000', '四季春', '100000', '469', '11', '0.437', '北京', '35', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1869', null, '一级', '100000', '四季春', '100000', '1932', '11', '2.684', '北京', '322', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('187', null, '二级', '1001288', '四季春', '100000', '152.1', '3', '0.39', '北京', '39', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('1870', null, '一级', '100000', '四季春', '100000', '367.5', '11', '0.175', '北京', '35', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1871', null, '一级', '100000', '四季春', '100000', '1705.08', '11', '1.3', '北京', '156', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1872', null, '一级', '100000', '四季春', '100000', '-36.48', '11', '-0.017', '北京', '-2', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1873', null, '一级', '100000', '四季春', '100000', '36', '11', '0.021', '北京', '5', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('1874', null, '一级', '100004', '华润商业集团', '100004', '136', '11', '0.113', '北京', '68', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1875', null, '二级', '100112', '四季春', '100000', '475', '11', '0.528', '北京', '63', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1876', null, '二级', '100112', '四季春', '100000', '275', '11', '0.417', '北京', '50', '丰瑞龙翔', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1877', null, '二级', '100112', '四季春', '100000', '1471.75', '11', '0.702', '北京', '140.165', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1878', null, '一级', '100957', '四药控股', '100957', '1742.16', '11', '1.7', '北京', '204', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1879', null, '二级', '101164', '保定市久展销售', '101733', '52.5', '11', '0.025', '北京', '5', '保定中诚汇达贸易', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('188', null, '二级', '1001288', '四季春', '100000', '67', '3', '0.063', '北京', '5', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1880', null, '二级', '1000001', '四季春', '100000', '1264', '11', '1.361', '北京', '163', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1881', null, '二级', '1000001', '四季春', '100000', '94', '11', '0.042', '北京', '5', '凯宏鑫有限责任公司', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1882', null, '二级', '1000001', '四季春', '100000', '122.25', '11', '0.126', '北京', '15', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1883', null, '二级', '1000001', '四季春', '100000', '0', '11', '0', '北京', '0', '凯宏鑫有限责任公司', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1884', null, '二级', '1000001', '四季春', '100000', '742.5', '11', '1.124', '北京', '135', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1885', null, '二级', '1000001', '四季春', '100000', '335', '11', '0.313', '北京', '25', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1886', null, '二级', '1000001', '四季春', '100000', '52.5', '11', '0.025', '北京', '5', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1887', null, '二级', '1000110', '河北中健贸易集团', '100007', '244.5', '11', '0.25', '北京', '30', '廊坊市中诚康宇', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1888', null, '二级', '1000110', '河北中健贸易集团', '100007', '374', '11', '0.567', '北京', '68', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1889', null, '二级', '1000110', '河北中健贸易集团', '100007', '170.4', '11', '0.1', '北京', '12', '廊坊市中诚康宇', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('189', null, '二级', '1001288', '四季春', '100000', '105', '3', '0.05', '北京', '10', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1890', null, '二级', '1000110', '河北中健贸易集团', '100007', '174.2', '11', '0.162', '北京', '13', '廊坊市中诚康宇', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1891', null, '二级', '1000110', '河北中健贸易集团', '100007', '52.5', '11', '0.025', '北京', '5', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1892', null, '二级', '1001288', '四季春', '100000', '193.36', '11', '0.449', '北京', '53.712', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1893', null, '二级', '1001288', '四季春', '100000', '1295', '11', '1.405', '北京', '168', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1894', null, '二级', '1001288', '四季春', '100000', '56.4', '11', '0.025', '北京', '3', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1895', null, '二级', '1001288', '四季春', '100000', '3879.4', '11', '3.965', '北京', '476', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1896', null, '二级', '1001288', '四季春', '100000', '72', '11', '0.083', '北京', '10', '悦康源通', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1897', null, '二级', '1001288', '四季春', '100000', '1274.9', '11', '0.298', '北京', '95', '悦康源通', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('1898', null, '二级', '1001288', '四季春', '100000', '2332.09', '11', '3.529', '北京', '424.003', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1899', null, '二级', '1001288', '四季春', '100000', '60.16', '11', '0.1', '北京', '8', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('19', '19', '二级', '1002859', '四季春', '100000', '735', '2', '0.35', '北京', '70', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('190', '190', '一级', '1002856', '嘉事堂', '1002856', '560', '3', '0.467', '北京', '280', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('1900', '1900', '二级', '1001288', '四季春', '100000', '509.2', '11', '0.477', '北京', '38', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1901', '1901', '二级', '1001288', '四季春', '100000', '1386', '11', '0.66', '北京', '132', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1902', '1902', '一级', '1002856', '嘉事堂', '1002856', '96', '11', '0.08', '北京', '48', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('1903', '1903', '一级', '1002856', '嘉事堂', '1002856', '11.1', '11', '0.015', '北京', '3', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1904', '1904', '二级', '1002859', '四季春', '100000', '36', '11', '0.083', '北京', '10', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1905', '1905', '二级', '1002859', '四季春', '100000', '652', '11', '0.666', '北京', '80', '天力泽', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1906', '1906', '二级', '1002859', '四季春', '100000', '37', '11', '0.05', '北京', '10', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1907', '1907', '二级', '1002859', '四季春', '100000', '2530', '11', '3.834', '北京', '460', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1908', '1908', '二级', '1003145', '四季春', '100000', '223.2', '11', '0.517', '北京', '62', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1909', '1909', '二级', '1003145', '四季春', '100000', '434', '11', '0.501', '北京', '60', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('191', '191', '一级', '1002856', '嘉事堂', '1002856', '218.6', '3', '0.166', '北京', '20', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1910', '1910', '二级', '1003145', '四季春', '100000', '188', '11', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1911', '1911', '二级', '1003145', '四季春', '100000', '244.5', '11', '0.25', '北京', '30', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1912', '1912', '二级', '1003145', '四季春', '100000', '389.18', '11', '0.091', '北京', '29', '华润新龙（）', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('1913', '1913', '二级', '1003145', '四季春', '100000', '357.5', '11', '0.541', '北京', '65', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1914', '1914', '二级', '1003145', '四季春', '100000', '15.04', '11', '0.025', '北京', '2', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1915', '1915', '二级', '1003145', '四季春', '100000', '40.2', '11', '0.037', '北京', '3', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1916', '1916', '二级', '1003145', '四季春', '100000', '262.5', '11', '0.125', '北京', '25', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1917', '1917', '二级', '3007902', '四季春', '100000', '13', '11', '0.01', '北京', '1', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('1918', '1918', '二级', '3007902', '四季春', '100000', '0', '11', '0', '北京', '0', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1919', '1919', '二级', '3007902', '四季春', '100000', '40.26', '11', '0.009', '北京', '3', '好药师达药房连锁', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('192', '192', '二级', '1003145', '四季春', '100000', '982.8', '3', '2.275', '北京', '273', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1920', '1920', '二级', '3007902', '四季春', '100000', '374', '11', '0.566', '北京', '68', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1921', '1921', '二级', '3007902', '四季春', '100000', '45.12', '11', '0.074', '北京', '6', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1922', '1922', '二级', '3007902', '四季春', '100000', '284', '11', '0.167', '北京', '20', '好药师达药房连锁', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('1923', '1923', '二级', '3007902', '四季春', '100000', '53.6', '11', '0.05', '北京', '4', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1924', '1924', '二级', '3007902', '四季春', '100000', '283.5', '11', '0.135', '北京', '27', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('1925', '1925', '二级', '3007902', '四季春', '100000', '14.4', '11', '0.008', '北京', '2', '好药师达药房连锁', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('1926', '1926', '二级', '5027725', '四季春', '100000', '30', '11', '0.042', '北京', '5', '金象大药房连锁有限责任公司', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('1927', '1927', '二级', '5045669', '四季春', '100000', '134', '11', '0.124', '北京', '10', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('1928', '1928', '一级', '100000', '四季春', '100000', '792', '11', '1.833', '北京', '220', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1929', '1929', '一级', '100000', '四季春', '100000', '4608', '11', '6', '北京', '360', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('193', '193', '二级', '1003145', '四季春', '100000', '811.2', '3', '2.08', '北京', '208', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('1930', '1930', '一级', '100000', '四季春', '100000', '960', '11', '0.8', '北京', '480', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1931', '1931', '一级', '100000', '四季春', '100000', '8398', '11', '9.216', '北京', '1105', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1932', '1932', '一级', '100000', '四季春', '100000', '2256', '11', '1', '北京', '120', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1933', '1933', '一级', '100000', '四季春', '100000', '2200.5', '11', '2.251', '北京', '270', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1934', '1934', '一级', '100000', '四季春', '100000', '108', '11', '0.125', '北京', '15', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1935', '1935', '一级', '100000', '四季春', '100000', '1229.76', '11', '1.2', '北京', '144', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1936', '1936', '一级', '100000', '四季春', '100000', '229.5', '11', '0.225', '北京', '27', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1937', '1937', '一级', '100000', '四季春', '100000', '352', '11', '0.2', '北京', '40', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1938', '1938', '一级', '100000', '四季春', '100000', '1430', '11', '1.1', '北京', '110', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1939', '1939', '一级', '100000', '四季春', '100000', '2430', '11', '0.45', '北京', '90', '四季春', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('194', '194', '二级', '1003145', '四季春', '100000', '22.56', '3', '0.037', '北京', '3', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1940', '1940', '一级', '100000', '四季春', '100000', '957.03', '11', '0.229', '北京', '73', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1941', '1941', '一级', '100000', '四季春', '100000', '2238.5', '11', '3.394', '北京', '407', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1942', '1942', '一级', '100000', '四季春', '100000', '1067.84', '11', '1.776', '北京', '142', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1943', '1943', '一级', '100000', '四季春', '100000', '990', '11', '0.688', '北京', '55', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1944', '1944', '一级', '100000', '四季春', '100000', '355', '11', '0.208', '北京', '25', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1945', '1945', '一级', '100000', '四季春', '100000', '2626.4', '11', '2.452', '北京', '196', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1946', '1946', '一级', '100000', '四季春', '100000', '1536', '11', '2.134', '北京', '256', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1947', '1947', '一级', '100000', '四季春', '100000', '175', '11', '0.125', '北京', '25', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1948', '1948', '一级', '100000', '四季春', '100000', '73.5', '11', '0.059', '北京', '7', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1949', '1949', '一级', '100000', '四季春', '100000', '-1344', '11', '-0.64', '北京', '-128', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('195', '195', '二级', '1003145', '四季春', '100000', '884.4', '3', '0.826', '北京', '66', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('1950', '1950', '一级', '100000', '四季春', '100000', '54.65', '11', '0.042', '北京', '5', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1951', '1951', '一级', '100000', '四季春', '100000', '182.4', '11', '0.083', '北京', '10', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1952', '1952', '一级', '100000', '四季春', '100000', '36', '11', '0.021', '北京', '5', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1953', '1953', '一级', '100004', '华润商业集团', '100004', '7180', '11', '5.983', '北京', '3590', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1954', '1954', '一级', '100004', '华润商业集团', '100004', '105', '11', '0.05', '北京', '10', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1955', '1955', '一级', '100004', '华润商业集团', '100004', '-174.88', '11', '-0.133', '北京', '-16', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1956', '1956', '二级', '100112', '四季春', '100000', '284', '11', '0.309', '北京', '37', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1957', '1957', '二级', '100112', '四季春', '100000', '72', '11', '0.083', '北京', '10', '丰瑞龙翔', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1958', '1958', '二级', '100112', '四季春', '100000', '5871.56', '11', '2.799', '北京', '559.194', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1959', '1959', '一级', '100253', '科园信海经营', '100253', '1110', '11', '0.924', '北京', '555', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('196', '196', '二级', '1003145', '四季春', '100000', '157.5', '3', '0.075', '北京', '15', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('1960', '1960', '二级', '100650', '江西四季春', '100581', '94', '11', '0.042', '北京', '5', '江西五洲营销', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1961', '1961', '一级', '100957', '四药控股', '100957', '320', '11', '0.267', '北京', '160', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1962', '1962', '一级', '100957', '四药控股', '100957', '145.18', '11', '0.141', '北京', '17', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1963', '1963', '一级', '100957', '四药控股', '100957', '-52.5', '11', '-0.025', '北京', '-5', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1964', '1964', '一级', '100957', '四药控股', '100957', '364.8', '11', '0.167', '北京', '20', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1965', '1965', '二级', '101164', '河北中健贸易集团', '100007', '40', '11', '0.042', '北京', '5', '保定中诚汇达贸易', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1966', '1966', '二级', '101164', '保定市久展销售', '101733', '110', '11', '0.167', '北京', '20', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1967', '1967', '二级', '1000001', '四季春', '100000', '1573', '11', '1.787', '北京', '214', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1968', '1968', '二级', '1000001', '四季春', '100000', '112.8', '11', '0.05', '北京', '6', '凯宏鑫有限责任公司', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1969', '1969', '二级', '1000001', '四季春', '100000', '122.25', '11', '0.125', '北京', '15', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('197', '197', '一级', '100957', '四药控股', '100957', '109.3', '3', '0.083', '北京', '10', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('1970', '1970', '二级', '1000001', '四季春', '100000', '517', '11', '0.783', '北京', '94', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1971', '1971', '二级', '1000001', '四季春', '100000', '94.5', '11', '0.045', '北京', '9', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1972', '1972', '二级', '1000110', '四药乐仁堂', '100008', '7.2', '11', '0.017', '北京', '2', '廊坊市中诚康宇', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1973', '1973', '二级', '1000110', '河北中健贸易集团', '100007', '225.5', '11', '0.342', '北京', '41', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1974', '1974', '二级', '1000110', '河北中健贸易集团', '100007', '30', '11', '0.042', '北京', '5', '廊坊市中诚康宇', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1975', '1975', '一级', '1000154', '赤峰颈复康', '1000154', '20', '11', '0.017', '北京', '10', '赤峰颈复康', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1976', '1976', '二级', '1001288', '四季春', '100000', '34.33', '11', '0.08', '北京', '9.536', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1977', '1977', '二级', '1001288', '四季春', '100000', '2213', '11', '2.472', '北京', '296', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1978', '1978', '二级', '1001288', '四季春', '100000', '282', '11', '0.125', '北京', '15', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1979', '1979', '二级', '1001288', '四季春', '100000', '81.5', '11', '0.083', '北京', '10', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('198', '198', '一级', '100000', '四季春', '100000', '640.8', '4', '1.484', '北京', '178', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('1980', '1980', '二级', '1001288', '四季春', '100000', '791.78', '11', '0.184', '北京', '59', '悦康源通', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1981', '1981', '二级', '1001288', '四季春', '100000', '1601.78', '11', '2.424', '北京', '291.219', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1982', '1982', '二级', '1001288', '四季春', '100000', '142', '11', '0.083', '北京', '10', '悦康源通', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1983', '1983', '二级', '1001288', '四季春', '100000', '643.2', '11', '0.601', '北京', '48', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1984', '1984', '二级', '1001288', '四季春', '100000', '493.5', '11', '0.235', '北京', '47', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1985', '1985', '一级', '1002856', '嘉事堂', '1002856', '2174', '11', '1.812', '北京', '1087', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1986', '1986', '一级', '1002856', '嘉事堂', '1002856', '3544.1', '11', '3.458', '北京', '415', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1987', '1987', '一级', '1002856', '嘉事堂', '1002856', '14.8', '11', '0.02', '北京', '4', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1988', '1988', '一级', '1002856', '嘉事堂', '1002856', '130', '11', '0.1', '北京', '10', '嘉事堂', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1989', '1989', '一级', '1002856', '嘉事堂', '1002856', '273.6', '11', '0.125', '北京', '15', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('199', '199', '一级', '100000', '四季春', '100000', '284.7', '4', '0.73', '北京', '73', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('1990', '1990', '二级', '1002859', '四季春', '100000', '3.9', '11', '0.01', '北京', '1', '天力泽', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1991', '1991', '二级', '1002859', '四季春', '100000', '64', '11', '0.083', '北京', '5', '天力泽', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('1992', '1992', '二级', '1002859', '四季春', '100000', '100', '11', '0.083', '北京', '50', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1993', '1993', '二级', '1002859', '四季春', '100000', '70', '11', '0.083', '北京', '10', '天力泽', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('1994', '1994', '二级', '1002859', '四季春', '100000', '244.5', '11', '0.25', '北京', '30', '天力泽', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1995', '1995', '二级', '1002859', '四季春', '100000', '66', '11', '0.1', '北京', '12', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1996', '1996', '二级', '1002859', '四季春', '100000', '6219.17', '11', '4.742', '北京', '569', '天力泽', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1997', '1997', '二级', '1002859', '四季春', '100000', '91.2', '11', '0.042', '北京', '5', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1998', '1998', '二级', '1003145', '四季春', '100000', '115.2', '11', '0.267', '北京', '32', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('1999', '1999', '二级', '1003145', '四季春', '100000', '1172', '11', '1.318', '北京', '158', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2', '2', '一级', '100000', '四季春', '100000', '68.4', '2', '0.158', '北京', '19', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('20', '20', '二级', '1003145', '四季春', '100000', '100.8', '2', '0.233', '北京', '28', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('200', '200', '一级', '100000', '四季春', '100000', '3304', '4', '2.753', '北京', '1652', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2000', '2000', '二级', '1003145', '四季春', '100000', '300.8', '11', '0.133', '北京', '16', '华润新龙（）', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2001', '2001', '二级', '1003145', '四季春', '100000', '2616.15', '11', '2.676', '北京', '321', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2002', '2002', '二级', '1003145', '四季春', '100000', '604.8', '11', '0.7', '北京', '84', '华润新龙（）', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2003', '2003', '二级', '1003145', '四季春', '100000', '201.3', '11', '0.048', '北京', '15', '华润新龙（）', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2004', '2004', '二级', '1003145', '四季春', '100000', '819.5', '11', '1.241', '北京', '149', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2005', '2005', '二级', '1003145', '四季春', '100000', '37.6', '11', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2006', '2006', '二级', '1003145', '四季春', '100000', '2291.4', '11', '2.137', '北京', '171', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2007', '2007', '二级', '1003145', '四季春', '100000', '72', '11', '0.1', '北京', '12', '华润新龙（）', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2008', '2008', '二级', '1003145', '四季春', '100000', '1585.5', '11', '0.755', '北京', '151', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2009', '2009', '二级', '3007902', '四季春', '100000', '44', '11', '0.025', '北京', '5', '好药师达药房连锁', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('201', '201', '一级', '100000', '四季春', '100000', '1076.04', '4', '1.049', '北京', '126', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2010', '2010', '二级', '3007902', '四季春', '100000', '0', '11', '0', '北京', '0', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2011', '2011', '二级', '3007902', '四季春', '100000', '-67.1', '11', '-0.016', '北京', '-5', '好药师达药房连锁', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2012', '2012', '二级', '3007902', '四季春', '100000', '214.5', '11', '0.324', '北京', '39', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2013', '2013', '二级', '3007902', '四季春', '100000', '142', '11', '0.084', '北京', '10', '好药师达药房连锁', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2014', '2014', '二级', '3027238', '甘肃新光', '100106', '1876.03', '11', '4.81', '北京', '481.034', '甘肃德生堂科技集团', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('2015', '2015', '二级', '3146952', '四季春', '100000', '768', '11', '1', '北京', '60', '红惠', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('2016', '2016', '一级', '3541049', '陕西亿洲', '3541049', '50', '11', '0.1', '北京', '20', '陕西亿洲', '基层产品', '10001000602', '头孢氨苄颗粒 125mg*12袋/盒*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2017', '2017', '一级', '3541049', '陕西亿洲', '3541049', '407.5', '11', '0.417', '北京', '50', '陕西亿洲', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2018', '2018', '二级', '5027725', '四季春', '100000', '483.12', '11', '0.113', '北京', '36', '金象大药房连锁有限责任公司', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2019', '2019', '二级', '5027725', '四季春', '100000', '42', '11', '0.058', '北京', '7', '金象大药房连锁有限责任公司', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('202', '202', '一级', '100000', '四季春', '100000', '25.9', '4', '0.035', '北京', '7', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2020', '2020', '二级', '5027725', '四季春', '100000', '157.5', '11', '0.075', '北京', '15', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2021', '2021', '二级', '5027725', '四季春', '100000', '896', '11', '0.584', '北京', '70', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2022', '2022', '二级', '5027764', '四季春', '100000', '187.88', '11', '0.044', '北京', '14', '德威治连锁有限责任公司', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2023', '2023', '二级', '5027764', '四季春', '100000', '115.5', '11', '0.055', '北京', '11', '德威治连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2024', '2024', '二级', '5027764', '四季春', '100000', '38.4', '11', '0.025', '北京', '3', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2025', '2025', '二级', '5045669', '四季春', '100000', '107.2', '11', '0.1', '北京', '8', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2026', '2026', '一级', '100000', '四季春', '100000', '1173.6', '12', '2.718', '北京', '326', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2027', '2027', '二级', '1001288', '四季春', '100000', '238.98', '12', '0.553', '北京', '66.384', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2028', '2028', '二级', '1002859', '四季春', '100000', '540', '12', '1.25', '北京', '150', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2029', '2029', '二级', '1003145', '四季春', '100000', '61.2', '12', '0.142', '北京', '17', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('203', '203', '一级', '100000', '四季春', '100000', '1080', '4', '0.2', '北京', '40', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2030', '2030', '一级', '100000', '四季春', '100000', '9626.4', '12', '22.283', '北京', '2674', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2031', '2031', '二级', '1001288', '四季春', '100000', '2249.14', '12', '5.205', '北京', '624.754', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2032', '2032', '二级', '1003145', '四季春', '100000', '4402.8', '12', '10.192', '北京', '1223', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2033', '2033', '一级', '100000', '四季春', '100000', '1450.8', '12', '3.359', '北京', '403', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2034', '2034', '二级', '1001288', '四季春', '100000', '776.47', '12', '1.796', '北京', '215.682', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2035', '2035', '二级', '1002859', '四季春', '100000', '1152', '12', '2.667', '北京', '320', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2036', '2036', '二级', '1003145', '四季春', '100000', '273.6', '12', '0.634', '北京', '76', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2037', '2037', '一级', '100000', '四季春', '100000', '205.2', '12', '0.475', '北京', '57', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2038', '2038', '二级', '1000110', '四药乐仁堂', '100008', '36', '12', '0.083', '北京', '10', '廊坊市中诚康宇', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2039', '2039', '二级', '1001288', '四季春', '100000', '18.65', '12', '0.044', '北京', '5.179', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('204', '204', '一级', '100000', '四季春', '100000', '220', '4', '0.125', '北京', '25', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2040', '2040', '二级', '1003145', '四季春', '100000', '108', '12', '0.25', '北京', '30', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2041', '2041', '二级', '1002859', '四季春', '100000', '11.7', '12', '0.03', '北京', '3', '天力泽', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('2042', '2042', '一级', '3541049', '陕西亿洲', '3541049', '25', '12', '0.05', '北京', '10', '陕西亿洲', '基层产品', '10001000602', '头孢氨苄颗粒 125mg*12袋/盒*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2043', '2043', '一级', '100000', '四季春', '100000', '448', '12', '0.583', '北京', '35', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '海淀');
INSERT INTO `poc_sales` VALUES ('2044', '2044', '一级', '100000', '四季春', '100000', '896', '12', '1.166', '北京', '70', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('2045', '2045', '一级', '100000', '四季春', '100000', '25.6', '12', '0.033', '北京', '2', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '房山');
INSERT INTO `poc_sales` VALUES ('2046', '2046', '一级', '100000', '四季春', '100000', '7680', '12', '10', '北京', '600', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('2047', '2047', '一级', '100000', '四季春', '100000', '292.29', '12', '0.243', '北京', '146.143', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2048', '2048', '一级', '100004', '华润商业集团', '100004', '2598', '12', '2.164', '北京', '1299', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2049', '2049', '一级', '100253', '科园信海经营', '100253', '146', '12', '0.122', '北京', '73', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('205', '205', '一级', '100000', '四季春', '100000', '1914', '4', '2.898', '北京', '348', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2050', '2050', '一级', '100957', '四药控股', '100957', '536', '12', '0.446', '北京', '268', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2051', '2051', '二级', '101164', '保定市久展销售', '101733', '20', '12', '0.017', '北京', '10', '保定中诚汇达贸易', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2052', '2052', '一级', '1002856', '嘉事堂', '1002856', '2348', '12', '1.955', '北京', '1174', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2053', '2053', '一级', '100000', '四季春', '100000', '129.91', '12', '0.108', '北京', '64.951', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2054', '2054', '一级', '100253', '科园信海经营', '100253', '400', '12', '0.333', '北京', '200', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2055', '2055', '一级', '1002856', '嘉事堂', '1002856', '100', '12', '0.083', '北京', '50', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2056', '2056', '一级', '100000', '四季春', '100000', '660.36', '12', '0.55', '北京', '330.174', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2057', '2057', '一级', '100957', '四药控股', '100957', '10', '12', '0.008', '北京', '5', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2058', '2058', '一级', '1002856', '嘉事堂', '1002856', '460', '12', '0.383', '北京', '230', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2059', '2059', '一级', '100000', '四季春', '100000', '1645.45', '12', '1.37', '北京', '822.728', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('206', '206', '一级', '100000', '四季春', '100000', '233.12', '4', '0.388', '北京', '31', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2060', '2060', '一级', '100004', '华润商业集团', '100004', '8096', '12', '6.746', '北京', '4048', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2061', '2061', '一级', '100253', '科园信海经营', '100253', '180', '12', '0.15', '北京', '90', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2062', '2062', '一级', '100957', '四药控股', '100957', '620', '12', '0.517', '北京', '310', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2063', '2063', '一级', '1002856', '嘉事堂', '1002856', '-400', '12', '-0.334', '北京', '-200', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2064', '2064', '一级', '100000', '四季春', '100000', '584', '12', '0.611', '北京', '73', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2065', '2065', '二级', '100112', '四季春', '100000', '680', '12', '0.709', '北京', '85', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2066', '2066', '二级', '1000001', '四季春', '100000', '4752', '12', '4.963', '北京', '594', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2067', '2067', '二级', '1001288', '四季春', '100000', '568', '12', '0.592', '北京', '71', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2068', '2068', '二级', '1003145', '四季春', '100000', '560', '12', '0.584', '北京', '70', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2069', '2069', '一级', '100000', '四季春', '100000', '320', '12', '0.334', '北京', '40', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('207', '207', '一级', '100000', '四季春', '100000', '482.4', '4', '0.452', '北京', '36', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2070', '2070', '二级', '100112', '四季春', '100000', '784', '12', '0.817', '北京', '98', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2071', '2071', '二级', '1000001', '四季春', '100000', '912', '12', '0.952', '北京', '114', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2072', '2072', '二级', '1001288', '四季春', '100000', '224', '12', '0.233', '北京', '28', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2073', '2073', '二级', '1003145', '四季春', '100000', '40', '12', '0.042', '北京', '5', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '密云');
INSERT INTO `poc_sales` VALUES ('2074', '2074', '一级', '100000', '四季春', '100000', '736', '12', '0.77', '北京', '92', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2075', '2075', '二级', '100112', '四季春', '100000', '400', '12', '0.417', '北京', '50', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2076', '2076', '二级', '1000001', '四季春', '100000', '904', '12', '0.942', '北京', '113', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2077', '2077', '二级', '1000110', '河北中健贸易集团', '100007', '200', '12', '0.208', '北京', '25', '廊坊市中诚康宇', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2078', '2078', '二级', '1001288', '四季春', '100000', '1120', '12', '1.171', '北京', '140', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2079', '2079', '二级', '1002859', '四季春', '100000', '104', '12', '0.108', '北京', '13', '天力泽', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('208', '208', '一级', '100000', '四季春', '100000', '13272', '4', '6.32', '北京', '1264', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2080', '2080', '二级', '1003145', '四季春', '100000', '560', '12', '0.584', '北京', '70', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '房山');
INSERT INTO `poc_sales` VALUES ('2081', '2081', '一级', '100000', '四季春', '100000', '12808', '12', '13.344', '北京', '1601', '四季春', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2082', '2082', '二级', '100112', '四季春', '100000', '456', '12', '0.476', '北京', '57', '丰瑞龙翔', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2083', '2083', '二级', '1000001', '四季春', '100000', '1288', '12', '1.347', '北京', '161', '凯宏鑫有限责任公司', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2084', '2084', '二级', '1000110', '河北中健贸易集团', '100007', '400', '12', '0.417', '北京', '50', '廊坊市中诚康宇', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2085', '2085', '一级', '1000154', '赤峰颈复康', '1000154', '80', '12', '0.083', '北京', '10', '赤峰颈复康', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2086', '2086', '二级', '1001288', '四季春', '100000', '3008', '12', '3.136', '北京', '376', '悦康源通', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2087', '2087', '二级', '1002859', '四季春', '100000', '160', '12', '0.167', '北京', '20', '天力泽', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2088', '2088', '二级', '1003145', '四季春', '100000', '1920', '12', '2', '北京', '240', '华润新龙（）', '基层产品', '10005000202', '三维亚油酸胶丸I 100粒*1100瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('2089', '2089', '一级', '100000', '四季春', '100000', '2726', '12', '1.21', '北京', '145', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('209', '209', '一级', '100000', '四季春', '100000', '120.23', '4', '0.092', '北京', '11', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2090', '2090', '二级', '1000001', '四季春', '100000', '188', '12', '0.083', '北京', '10', '凯宏鑫有限责任公司', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2091', '2091', '一级', '100000', '四季春', '100000', '376', '12', '0.167', '北京', '20', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2092', '2092', '二级', '1000001', '四季春', '100000', '188', '12', '0.083', '北京', '10', '凯宏鑫有限责任公司', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2093', '2093', '二级', '1001288', '四季春', '100000', '282', '12', '0.125', '北京', '15', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2094', '2094', '二级', '1003145', '四季春', '100000', '188', '12', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2095', '2095', '一级', '100000', '四季春', '100000', '470', '12', '0.208', '北京', '25', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2096', '2096', '二级', '1001288', '四季春', '100000', '996.4', '12', '0.442', '北京', '53', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2097', '2097', '二级', '1002859', '四季春', '100000', '376', '12', '0.167', '北京', '20', '天力泽', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2098', '2098', '二级', '1003145', '四季春', '100000', '564', '12', '0.25', '北京', '30', '华润新龙（）', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2099', '2099', '一级', '100000', '四季春', '100000', '376', '12', '0.166', '北京', '20', '四季春', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('21', '21', '二级', '1003145', '四季春', '100000', '1072', '2', '1.001', '北京', '80', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('210', '210', '二级', '1000001', '四季春', '100000', '1466.4', '4', '3.76', '北京', '376', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('2100', '2100', '二级', '1001288', '四季春', '100000', '94', '12', '0.042', '北京', '5', '悦康源通', '基层产品', '10006000100', '参麦注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2101', '2101', '一级', '100000', '四季春', '100000', '13594.2', '12', '13.897', '北京', '1668', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2102', '2102', '二级', '100112', '四季春', '100000', '81.5', '12', '0.083', '北京', '10', '丰瑞龙翔', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2103', '2103', '二级', '1000001', '四季春', '100000', '9485.55', '12', '9.695', '北京', '1163.867', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2104', '2104', '二级', '1000110', '河北中健贸易集团', '100007', '122.25', '12', '0.125', '北京', '15', '廊坊市中诚康宇', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2105', '2105', '二级', '1001288', '四季春', '100000', '1866.35', '12', '1.907', '北京', '229', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2106', '2106', '二级', '1003145', '四季春', '100000', '3211.1', '12', '3.283', '北京', '394', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2107', '2107', '一级', '100000', '四季春', '100000', '3871.25', '12', '3.957', '北京', '475', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2108', '2108', '二级', '1000001', '四季春', '100000', '2634.22', '12', '2.696', '北京', '323.216', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2109', '2109', '二级', '1001090', '保定市久展销售', '101733', '81.5', '12', '0.083', '北京', '10', '保定仲景药材采购站', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('211', '211', '二级', '1000001', '四季春', '100000', '60.5', '4', '0.092', '北京', '11', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2110', '2110', '二级', '1001288', '四季春', '100000', '676.45', '12', '0.691', '北京', '83', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2111', '2111', '二级', '1003145', '四季春', '100000', '3137.75', '12', '3.208', '北京', '385', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2112', '2112', '二级', '1003494', '保定市久展销售', '101733', '50.58', '12', '0.052', '北京', '6.206', '滦平县惠仁有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2113', '2113', '一级', '100000', '四季春', '100000', '8492.3', '12', '8.683', '北京', '1042', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2114', '2114', '二级', '100112', '四季春', '100000', '81.5', '12', '0.083', '北京', '10', '丰瑞龙翔', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2115', '2115', '二级', '1000001', '四季春', '100000', '866.13', '12', '0.886', '北京', '106.272', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2116', '2116', '二级', '1001288', '四季春', '100000', '4197.25', '12', '4.293', '北京', '515', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2117', '2117', '二级', '1003145', '四季春', '100000', '774.25', '12', '0.792', '北京', '95', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2118', '2118', '一级', '100000', '四季春', '100000', '5093.75', '12', '5.208', '北京', '625', '四季春', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2119', '2119', '一级', '101733', '保定市久展销售', '101733', '81.5', '12', '0.083', '北京', '10', '保定市久展销售', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('212', '212', '二级', '1000001', '四季春', '100000', '294.8', '4', '0.277', '北京', '22', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2120', '2120', '二级', '1000001', '四季春', '100000', '29.87', '12', '0.031', '北京', '3.665', '凯宏鑫有限责任公司', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2121', '2121', '二级', '1001288', '四季春', '100000', '733.5', '12', '0.75', '北京', '90', '悦康源通', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2122', '2122', '二级', '1001821', '保定市久展销售', '101733', '1956', '12', '2', '北京', '240', '定州市', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2123', '2123', '二级', '1002859', '四季春', '100000', '489', '12', '0.5', '北京', '60', '天力泽', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2124', '2124', '二级', '1003145', '四季春', '100000', '2893.25', '12', '2.959', '北京', '355', '华润新龙（）', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2125', '2125', '一级', '3541049', '陕西亿洲', '3541049', '244.5', '12', '0.25', '北京', '30', '陕西亿洲', '基层产品', '10006000201', '四物注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2126', '2126', '一级', '100000', '四季春', '100000', '1116', '12', '1.291', '北京', '155', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2127', '2127', '二级', '1000001', '四季春', '100000', '511.2', '12', '0.593', '北京', '71', '凯宏鑫有限责任公司', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2128', '2128', '二级', '1001288', '四季春', '100000', '216', '12', '0.25', '北京', '30', '悦康源通', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2129', '2129', '二级', '1003145', '四季春', '100000', '936', '12', '1.083', '北京', '130', '华润新龙（）', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('213', '213', '二级', '1000001', '四季春', '100000', '14763', '4', '7.03', '北京', '1406', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2130', '2130', '一级', '100000', '四季春', '100000', '158.4', '12', '0.184', '北京', '22', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2131', '2131', '二级', '1001288', '四季春', '100000', '72', '12', '0.083', '北京', '10', '悦康源通', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2132', '2132', '一级', '100000', '四季春', '100000', '1130.4', '12', '1.308', '北京', '157', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2133', '2133', '二级', '1001288', '四季春', '100000', '-21.6', '12', '-0.024', '北京', '-3', '悦康源通', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2134', '2134', '二级', '1003145', '四季春', '100000', '36', '12', '0.042', '北京', '5', '华润新龙（）', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2135', '2135', '一级', '100000', '四季春', '100000', '36', '12', '0.042', '北京', '5', '四季春', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2136', '2136', '二级', '1001511', '保定市久展销售', '101733', '93.6', '12', '0.109', '北京', '13', '保定汇达分公司', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2137', '2137', '二级', '1003145', '四季春', '100000', '1152', '12', '1.334', '北京', '160', '华润新龙（）', '基层产品', '10006000901', '黄芪注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2138', '2138', '一级', '100000', '四季春', '100000', '85.4', '12', '0.083', '北京', '10', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2139', '2139', '一级', '100957', '四药控股', '100957', '34.16', '12', '0.033', '北京', '4', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('214', '214', '一级', '100004', '华润商业集团', '100004', '342', '4', '0.285', '北京', '171', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2140', '2140', '一级', '100000', '四季春', '100000', '512.4', '12', '0.5', '北京', '60', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2141', '2141', '二级', '1003494', '保定市久展销售', '101733', '42.7', '12', '0.042', '北京', '5', '滦平县惠仁有限责任公司', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2142', '2142', '一级', '100000', '四季春', '100000', '2732.8', '12', '2.667', '北京', '320', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2143', '2143', '一级', '100957', '四药控股', '100957', '392.84', '12', '0.384', '北京', '46', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2144', '2144', '一级', '100000', '四季春', '100000', '42.7', '12', '0.042', '北京', '5', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2145', '2145', '一级', '100957', '四药控股', '100957', '85.4', '12', '0.083', '北京', '10', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2146', '2146', '二级', '1000110', '四药乐仁堂', '100008', '85.4', '12', '0.083', '北京', '10', '廊坊市中诚康宇', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2147', '2147', '一级', '1002856', '嘉事堂', '1002856', '3535.56', '12', '3.45', '北京', '414', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2148', '2148', '一级', '100000', '四季春', '100000', '22.2', '12', '0.03', '北京', '6', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2149', '2149', '一级', '1002856', '嘉事堂', '1002856', '29.6', '12', '0.04', '北京', '8', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('215', '215', '一级', '100004', '华润商业集团', '100004', '1050', '4', '0.5', '北京', '100', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2150', '2150', '二级', '1002859', '四季春', '100000', '18.5', '12', '0.025', '北京', '5', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2151', '2151', '一级', '100000', '四季春', '100000', '74', '12', '0.1', '北京', '20', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('2152', '2152', '一级', '1002856', '嘉事堂', '1002856', '18.5', '12', '0.025', '北京', '5', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('2153', '2153', '一级', '100000', '四季春', '100000', '7.4', '12', '0.01', '北京', '2', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2154', '2154', '一级', '1002856', '嘉事堂', '1002856', '11.1', '12', '0.015', '北京', '3', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2155', '2155', '一级', '100000', '四季春', '100000', '7.4', '12', '0.01', '北京', '2', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2156', '2156', '一级', '100957', '四药控股', '100957', '3.7', '12', '0.005', '北京', '1', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2157', '2157', '一级', '100000', '四季春', '100000', '2082.5', '12', '2.042', '北京', '245', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2158', '2158', '一级', '100000', '四季春', '100000', '1028.5', '12', '1.009', '北京', '121', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2159', '2159', '一级', '100000', '四季春', '100000', '193.6', '12', '0.11', '北京', '22', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('216', '216', '一级', '100004', '华润商业集团', '100004', '50.53', '4', '0.039', '北京', '4.623', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2160', '2160', '二级', '3007902', '四季春', '100000', '17.6', '12', '0.01', '北京', '2', '好药师达药房连锁', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2161', '2161', '一级', '100000', '四季春', '100000', '88', '12', '0.05', '北京', '10', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('2162', '2162', '一级', '100000', '四季春', '100000', '2420', '12', '1.375', '北京', '275', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2163', '2163', '二级', '3007902', '四季春', '100000', '140.8', '12', '0.08', '北京', '16', '好药师达药房连锁', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2164', '2164', '一级', '100000', '四季春', '100000', '1469.6', '12', '0.835', '北京', '167', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2165', '2165', '二级', '100112', '四季春', '100000', '114.4', '12', '0.065', '北京', '13', '丰瑞龙翔', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2166', '2166', '二级', '1002859', '四季春', '100000', '440', '12', '0.25', '北京', '50', '天力泽', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2167', '2167', '二级', '3007902', '四季春', '100000', '44', '12', '0.025', '北京', '5', '好药师达药房连锁', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2168', '2168', '一级', '100000', '四季春', '100000', '130', '12', '0.1', '北京', '10', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2169', '2169', '一级', '1002856', '嘉事堂', '1002856', '1950', '12', '1.5', '北京', '150', '嘉事堂', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('217', '217', '一级', '100004', '华润商业集团', '100004', '4560', '4', '2.083', '北京', '250', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2170', '2170', '二级', '1002859', '四季春', '100000', '65', '12', '0.05', '北京', '5', '天力泽', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2171', '2171', '二级', '3007902', '四季春', '100000', '39', '12', '0.03', '北京', '3', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2172', '2172', '一级', '100000', '四季春', '100000', '195', '12', '0.15', '北京', '15', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('2173', '2173', '二级', '3007902', '四季春', '100000', '26', '12', '0.02', '北京', '2', '好药师达药房连锁', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '房山');
INSERT INTO `poc_sales` VALUES ('2174', '2174', '一级', '100000', '四季春', '100000', '780', '12', '0.6', '北京', '60', '四季春', '零售2产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2175', '2175', '二级', '3007902', '四季春', '100000', '7614', '12', '1.41', '北京', '282', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2176', '2176', '二级', '3007902', '四季春', '100000', '540', '12', '0.1', '北京', '20', '好药师达药房连锁', '零售2产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2177', '2177', '一级', '100000', '四季春', '100000', '-39.33', '12', '-0.01', '北京', '-3', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2178', '2178', '二级', '3007902', '四季春', '100000', '67.1', '12', '0.016', '北京', '5', '好药师达药房连锁', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2179', '2179', '二级', '5027725', '四季春', '100000', '805.2', '12', '0.188', '北京', '60', '金象大药房连锁有限责任公司', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '海淀');
INSERT INTO `poc_sales` VALUES ('218', '218', '二级', '100112', '四季春', '100000', '-202.4', '4', '-0.115', '北京', '0', '丰瑞龙翔', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2180', '2180', '一级', '100000', '四季春', '100000', '340.86', '12', '0.081', '北京', '26', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('2181', '2181', '二级', '3007902', '四季春', '100000', '26.84', '12', '0.006', '北京', '2', '好药师达药房连锁', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '房山');
INSERT INTO `poc_sales` VALUES ('2182', '2182', '一级', '100000', '四季春', '100000', '65.55', '12', '0.016', '北京', '5', '四季春', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2183', '2183', '二级', '5027725', '四季春', '100000', '563.64', '12', '0.132', '北京', '42', '金象大药房连锁有限责任公司', '零售2产品', '10005000700', '清开灵软颗粒 0.4克*12粒*1板*320盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2184', '2184', '一级', '100000', '四季春', '100000', '1644.5', '12', '2.492', '北京', '299', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2185', '2185', '二级', '1000001', '四季春', '100000', '3753.48', '12', '5.689', '北京', '682.433', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2186', '2186', '二级', '1001288', '四季春', '100000', '1139.07', '12', '1.722', '北京', '207.111', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2187', '2187', '二级', '1002859', '四季春', '100000', '852.5', '12', '1.293', '北京', '155', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2188', '2188', '二级', '1003145', '四季春', '100000', '709.5', '12', '1.076', '北京', '129', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2189', '2189', '二级', '3007902', '四季春', '100000', '137.5', '12', '0.209', '北京', '25', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('219', '219', '二级', '100112', '四季春', '100000', '3895.5', '4', '1.855', '北京', '371', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2190', '2190', '一级', '100000', '四季春', '100000', '3272.5', '12', '4.962', '北京', '595', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2191', '2191', '二级', '101164', '四季春', '100000', '275', '12', '0.417', '北京', '50', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2192', '2192', '二级', '1000001', '四季春', '100000', '766.13', '12', '1.162', '北京', '139.289', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2193', '2193', '二级', '1001288', '四季春', '100000', '1639.58', '12', '2.48', '北京', '298.112', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2194', '2194', '二级', '1003145', '四季春', '100000', '1974.5', '12', '2.993', '北京', '359', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2195', '2195', '一级', '100000', '四季春', '100000', '5588', '12', '8.466', '北京', '1016', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2196', '2196', '二级', '100112', '四季春', '100000', '275', '12', '0.417', '北京', '50', '丰瑞龙翔', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2197', '2197', '二级', '101164', '四季春', '100000', '55', '12', '0.083', '北京', '10', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2198', '2198', '二级', '1000001', '四季春', '100000', '193.87', '12', '0.293', '北京', '35.248', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2199', '2199', '二级', '1001288', '四季春', '100000', '2276.91', '12', '3.444', '北京', '413.997', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('22', '22', '二级', '1003145', '四季春', '100000', '2247', '2', '1.07', '北京', '214', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('220', '220', '二级', '1001288', '四季春', '100000', '86.4', '4', '0.2', '北京', '24', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2200', '2200', '二级', '1002859', '四季春', '100000', '676.5', '12', '1.025', '北京', '123', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2201', '2201', '二级', '1003145', '四季春', '100000', '913', '12', '1.384', '北京', '166', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2202', '2202', '二级', '3007902', '四季春', '100000', '467.5', '12', '0.709', '北京', '85', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2203', '2203', '二级', '5027739', '四季春', '100000', '22', '12', '0.033', '北京', '4', '河北新兴', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2204', '2204', '一级', '100000', '四季春', '100000', '2244', '12', '3.402', '北京', '408', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2205', '2205', '二级', '1000001', '四季春', '100000', '119.13', '12', '0.181', '北京', '21.657', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2206', '2206', '二级', '1000110', '四季春', '100000', '935', '12', '1.417', '北京', '170', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2207', '2207', '二级', '1001288', '四季春', '100000', '3150.22', '12', '4.77', '北京', '572.781', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2208', '2208', '二级', '1002859', '四季春', '100000', '561', '12', '0.85', '北京', '102', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2209', '2209', '二级', '1003145', '四季春', '100000', '357.5', '12', '0.542', '北京', '65', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('221', '221', '二级', '1001288', '四季春', '100000', '81.9', '4', '0.21', '北京', '21', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('2210', '2210', '二级', '3007902', '四季春', '100000', '121', '12', '0.183', '北京', '22', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2211', '2211', '二级', '1001288', '四季春', '100000', '22.56', '12', '0.038', '北京', '3', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2212', '2212', '二级', '3007902', '四季春', '100000', '7.52', '12', '0.013', '北京', '1', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2213', '2213', '一级', '100000', '四季春', '100000', '127.84', '12', '0.214', '北京', '17', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('2214', '2214', '一级', '100000', '四季春', '100000', '225.6', '12', '0.377', '北京', '30', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2215', '2215', '二级', '1001288', '四季春', '100000', '75.2', '12', '0.125', '北京', '10', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2216', '2216', '一级', '100000', '四季春', '100000', '240.64', '12', '0.4', '北京', '32', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2217', '2217', '二级', '1001288', '四季春', '100000', '112.8', '12', '0.188', '北京', '15', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2218', '2218', '二级', '1003145', '四季春', '100000', '7.52', '12', '0.013', '北京', '1', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2219', '2219', '二级', '3007902', '四季春', '100000', '90', '12', '0.063', '北京', '5', '好药师达药房连锁', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('222', '222', '二级', '1001288', '四季春', '100000', '214.5', '4', '0.325', '北京', '39', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2220', '2220', '一级', '100000', '四季春', '100000', '213', '12', '0.125', '北京', '15', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2221', '2221', '二级', '1001288', '四季春', '100000', '213', '12', '0.125', '北京', '15', '悦康源通', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2222', '2222', '二级', '3007902', '四季春', '100000', '397.6', '12', '0.233', '北京', '28', '好药师达药房连锁', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2223', '2223', '二级', '1003145', '四季春', '100000', '71', '12', '0.042', '北京', '5', '华润新龙（）', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2224', '2224', '一级', '100000', '四季春', '100000', '170.4', '12', '0.101', '北京', '12', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2225', '2225', '二级', '1000110', '四季春', '100000', '28.4', '12', '0.017', '北京', '2', '廊坊市中诚康宇', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2226', '2226', '二级', '1001288', '四季春', '100000', '142', '12', '0.083', '北京', '10', '悦康源通', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2227', '2227', '二级', '1003145', '四季春', '100000', '184.6', '12', '0.108', '北京', '13', '华润新龙（）', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2228', '2228', '二级', '3007902', '四季春', '100000', '582.2', '12', '0.343', '北京', '41', '好药师达药房连锁', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2229', '2229', '一级', '100000', '四季春', '100000', '284', '12', '0.167', '北京', '20', '四季春', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('223', '223', '二级', '1001288', '四季春', '100000', '142.88', '4', '0.239', '北京', '19', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2230', '2230', '二级', '3007902', '四季春', '100000', '99.4', '12', '0.059', '北京', '7', '好药师达药房连锁', '零售产品', '10001001200', '解郁安神颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2231', '2231', '一级', '100000', '四季春', '100000', '61.43', '12', '0.057', '北京', '4.584', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2232', '2232', '二级', '1000001', '四季春', '100000', '254.6', '12', '0.238', '北京', '19', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2233', '2233', '二级', '1001288', '四季春', '100000', '536', '12', '0.5', '北京', '40', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2234', '2234', '二级', '1003145', '四季春', '100000', '67', '12', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2235', '2235', '二级', '5045669', '四季春', '100000', '415.4', '12', '0.387', '北京', '31', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2236', '2236', '一级', '100000', '四季春', '100000', '29.73', '12', '0.027', '北京', '2.218', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('2237', '2237', '二级', '1000001', '四季春', '100000', '134', '12', '0.125', '北京', '10', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('2238', '2238', '二级', '1001288', '四季春', '100000', '134', '12', '0.125', '北京', '10', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('2239', '2239', '二级', '1003145', '四季春', '100000', '120.6', '12', '0.113', '北京', '9', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('224', '224', '二级', '1001288', '四季春', '100000', '388.6', '4', '0.361', '北京', '29', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2240', '2240', '一级', '100000', '四季春', '100000', '81.25', '12', '0.075', '北京', '6.062', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2241', '2241', '二级', '1001288', '四季春', '100000', '1232.8', '12', '1.153', '北京', '92', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2242', '2242', '二级', '1003145', '四季春', '100000', '93.8', '12', '0.088', '北京', '7', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2243', '2243', '二级', '3007902', '四季春', '100000', '160.8', '12', '0.15', '北京', '12', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2244', '2244', '二级', '5027739', '四季春', '100000', '13.4', '12', '0.013', '北京', '1', '河北新兴', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2245', '2245', '二级', '5045669', '四季春', '100000', '134', '12', '0.124', '北京', '10', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('2246', '2246', '一级', '100000', '四季春', '100000', '899.61', '12', '0.839', '北京', '67.134', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2247', '2247', '二级', '1000001', '四季春', '100000', '536', '12', '0.501', '北京', '40', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2248', '2248', '二级', '1001288', '四季春', '100000', '1139', '12', '1.063', '北京', '85', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2249', '2249', '二级', '1003145', '四季春', '100000', '978.2', '12', '0.912', '北京', '73', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('225', '225', '二级', '1001288', '四季春', '100000', '4746', '4', '2.26', '北京', '452', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2250', '2250', '二级', '3007902', '四季春', '100000', '67', '12', '0.063', '北京', '5', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2251', '2251', '二级', '5045669', '四季春', '100000', '107.2', '12', '0.1', '北京', '8', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2252', '2252', '一级', '100000', '四季春', '100000', '-18', '12', '-0.025', '北京', '-3', '四季春', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '密云');
INSERT INTO `poc_sales` VALUES ('2253', '2253', '一级', '100000', '四季春', '100000', '-24', '12', '-0.033', '北京', '-4', '四季春', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '房山');
INSERT INTO `poc_sales` VALUES ('2254', '2254', '二级', '100112', '四季春', '100000', '12', '12', '0.017', '北京', '2', '丰瑞龙翔', '零售产品', '10001001700', '氨酚烷胺颗粒  12袋/盒*120盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2255', '2255', '一级', '100000', '四季春', '100000', '942', '12', '1.308', '北京', '157', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2256', '2256', '二级', '1003145', '四季春', '100000', '30', '12', '0.042', '北京', '5', '华润新龙（）', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2257', '2257', '一级', '100000', '四季春', '100000', '882', '12', '1.226', '北京', '147', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2258', '2258', '二级', '1003145', '四季春', '100000', '120', '12', '0.166', '北京', '20', '华润新龙（）', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2259', '2259', '一级', '100000', '四季春', '100000', '1068', '12', '1.484', '北京', '178', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('226', '226', '一级', '1002856', '嘉事堂', '1002856', '4560', '4', '3.8', '北京', '2280', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('2260', '2260', '二级', '1003145', '四季春', '100000', '18', '12', '0.025', '北京', '3', '华润新龙（）', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2261', '2261', '一级', '100000', '四季春', '100000', '1686', '12', '2.341', '北京', '281', '四季春', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2262', '2262', '二级', '100112', '四季春', '100000', '30', '12', '0.042', '北京', '5', '丰瑞龙翔', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2263', '2263', '二级', '1000110', '四季春', '100000', '60', '12', '0.083', '北京', '10', '廊坊市中诚康宇', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2264', '2264', '二级', '1003145', '四季春', '100000', '6', '12', '0.008', '北京', '1', '华润新龙（）', '零售产品', '10001001702', '氨酚烷胺颗粒  10袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2265', '2265', '一级', '100000', '四季春', '100000', '14', '12', '0.01', '北京', '2', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2266', '2266', '一级', '100000', '四季春', '100000', '210', '12', '0.15', '北京', '30', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2267', '2267', '一级', '100000', '四季春', '100000', '14', '12', '0.01', '北京', '2', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2268', '2268', '一级', '100000', '四季春', '100000', '21', '12', '0.017', '北京', '2', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2269', '2269', '一级', '100000', '四季春', '100000', '42', '12', '0.034', '北京', '4', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('227', '227', '一级', '1002856', '嘉事堂', '1002856', '1708', '4', '1.667', '北京', '200', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2270', '2270', '一级', '100000', '四季春', '100000', '42', '12', '0.034', '北京', '4', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2271', '2271', '一级', '100000', '四季春', '100000', '2194.5', '12', '1.045', '北京', '209', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2272', '2272', '二级', '100112', '四季春', '100000', '1932', '12', '0.92', '北京', '184', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2273', '2273', '一级', '100957', '四药控股', '100957', '241.5', '12', '0.115', '北京', '23', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2274', '2274', '二级', '101164', '保定市久展销售', '101733', '315', '12', '0.15', '北京', '30', '保定中诚汇达贸易', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2275', '2275', '二级', '1000001', '四季春', '100000', '819', '12', '0.39', '北京', '78', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2276', '2276', '二级', '1001288', '四季春', '100000', '451.5', '12', '0.215', '北京', '43', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2277', '2277', '一级', '1002856', '嘉事堂', '1002856', '315', '12', '0.15', '北京', '30', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2278', '2278', '二级', '1003145', '四季春', '100000', '231', '12', '0.11', '北京', '22', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2279', '2279', '二级', '3007902', '四季春', '100000', '84', '12', '0.04', '北京', '8', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('228', '228', '一级', '1002856', '嘉事堂', '1002856', '48.1', '4', '0.065', '北京', '13', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2280', '2280', '二级', '5027725', '四季春', '100000', '304.5', '12', '0.145', '北京', '29', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2281', '2281', '一级', '100000', '四季春', '100000', '2341.5', '12', '1.115', '北京', '223', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('2282', '2282', '二级', '1000001', '四季春', '100000', '766.5', '12', '0.365', '北京', '73', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('2283', '2283', '二级', '1003145', '四季春', '100000', '808.5', '12', '0.385', '北京', '77', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('2284', '2284', '一级', '100000', '四季春', '100000', '1260', '12', '0.6', '北京', '120', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2285', '2285', '二级', '1000001', '四季春', '100000', '189', '12', '0.09', '北京', '18', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2286', '2286', '二级', '1001288', '四季春', '100000', '777', '12', '0.37', '北京', '74', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2287', '2287', '二级', '1003145', '四季春', '100000', '199.5', '12', '0.095', '北京', '19', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2288', '2288', '二级', '3007902', '四季春', '100000', '115.5', '12', '0.055', '北京', '11', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('2289', '2289', '一级', '100000', '四季春', '100000', '43228.5', '12', '20.585', '北京', '4117', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('229', '229', '一级', '1002856', '嘉事堂', '1002856', '0', '4', '0', '北京', '0', '嘉事堂', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2290', '2290', '一级', '100957', '四药控股', '100957', '525', '12', '0.25', '北京', '50', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2291', '2291', '二级', '1000001', '四季春', '100000', '105', '12', '0.05', '北京', '10', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2292', '2292', '二级', '1001288', '四季春', '100000', '1575', '12', '0.75', '北京', '150', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2293', '2293', '二级', '1003145', '四季春', '100000', '976.5', '12', '0.465', '北京', '93', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2294', '2294', '二级', '3007902', '四季春', '100000', '63', '12', '0.03', '北京', '6', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2295', '2295', '一级', '3541049', '陕西亿洲', '3541049', '105', '12', '0.05', '北京', '10', '陕西亿洲', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2296', '2296', '二级', '5027725', '四季春', '100000', '304.5', '12', '0.145', '北京', '29', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2297', '2297', '二级', '5027764', '四季春', '100000', '31.5', '12', '0.015', '北京', '3', '德威治连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2298', '2298', '二级', '5027725', '四季春', '100000', '550.4', '12', '0.359', '北京', '43', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2299', '2299', '二级', '3027238', '四季春', '100000', '1237.33', '12', '0.806', '北京', '96.667', '甘肃德生堂科技集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('23', '23', '二级', '3007883', '四季春', '100000', '58.5', '2', '0.15', '北京', '15', '凯尔康大药房', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('230', '230', '一级', '1002856', '嘉事堂', '1002856', '10185', '4', '4.85', '北京', '970', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2300', '2300', '二级', '5027725', '四季春', '100000', '1024', '12', '0.669', '北京', '80', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2301', '2301', '二级', '5027764', '四季春', '100000', '25.6', '12', '0.017', '北京', '2', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2302', '2302', '一级', '100000', '四季春', '100000', '364.8', '12', '0.167', '北京', '20', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2303', '2303', '一级', '100004', '华润商业集团', '100004', '729.6', '12', '0.333', '北京', '40', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2304', '2304', '一级', '100253', '科园信海经营', '100253', '-12950.4', '12', '-5.917', '北京', '-710', '科园信海经营', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2305', '2305', '一级', '100957', '四药控股', '100957', '182.4', '12', '0.083', '北京', '10', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2306', '2306', '二级', '3972457', '四季春', '100000', '364.8', '12', '0.166', '北京', '20', '万家瑞', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('2307', '2307', '一级', '100000', '四季春', '100000', '182.4', '12', '0.083', '北京', '10', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('2308', '2308', '一级', '100000', '四季春', '100000', '364.8', '12', '0.167', '北京', '20', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2309', '2309', '一级', '100004', '华润商业集团', '100004', '547.2', '12', '0.25', '北京', '30', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('231', '231', '一级', '1002856', '嘉事堂', '1002856', '-3125.98', '4', '-2.383', '北京', '-286', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('2310', '2310', '一级', '100957', '四药控股', '100957', '182.4', '12', '0.083', '北京', '10', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('2311', '2311', '二级', '3007902', '四季春', '100000', '21.6', '12', '0.013', '北京', '3', '好药师达药房连锁', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('232', '232', '一级', '1002856', '嘉事堂', '1002856', '5289.6', '4', '2.417', '北京', '290', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('233', '233', '二级', '1002859', '四季春', '100000', '233.1', '4', '0.315', '北京', '63', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('234', '234', '二级', '1002859', '四季春', '100000', '825', '4', '1.251', '北京', '150', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('235', '235', '二级', '1002859', '四季春', '100000', '5607', '4', '2.67', '北京', '534', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('236', '236', '二级', '1003145', '四季春', '100000', '568.8', '4', '1.317', '北京', '158', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('237', '237', '二级', '1003145', '四季春', '100000', '11.7', '4', '0.03', '北京', '3', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('238', '238', '二级', '1003145', '四季春', '100000', '401.5', '4', '0.609', '北京', '73', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('239', '239', '二级', '1003145', '四季春', '100000', '37.6', '4', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('24', '24', '二级', '3007883', '四季春', '100000', '3618', '2', '3.375', '北京', '270', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('240', '240', '二级', '1003145', '四季春', '100000', '750.4', '4', '0.7', '北京', '56', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('241', '241', '二级', '1003145', '四季春', '100000', '2362.5', '4', '1.125', '北京', '225', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('242', '242', '一级', '100957', '四药控股', '100957', '180', '4', '0.15', '北京', '90', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('243', '243', '一级', '100957', '四药控股', '100957', '34.16', '4', '0.033', '北京', '4', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('244', '244', '一级', '100957', '四药控股', '100957', '3517.5', '4', '1.675', '北京', '335', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('245', '245', '一级', '100957', '四药控股', '100957', '7843.2', '4', '3.583', '北京', '430', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('246', '246', '二级', '3007883', '四季春', '100000', '402', '4', '0.375', '北京', '30', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('247', '247', '二级', '3007902', '四季春', '100000', '170.5', '4', '0.258', '北京', '31', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('248', '248', '二级', '3007902', '四季春', '100000', '142.88', '4', '0.237', '北京', '19', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('249', '249', '二级', '3007902', '四季春', '100000', '107.2', '4', '0.1', '北京', '8', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('25', '25', '二级', '3007898', '四季春', '100000', '134', '2', '0.125', '北京', '10', '医保中洋达药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('250', '250', '二级', '3007902', '四季春', '100000', '84', '4', '0.04', '北京', '8', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('251', '251', '二级', '5027724', '四季春', '100000', '4410', '4', '2.1', '北京', '420', '永安堂连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('252', '252', '二级', '5027725', '四季春', '100000', '815.41', '4', '0.532', '北京', '63.706', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('253', '253', '二级', '5045669', '四季春', '100000', '629.8', '4', '0.588', '北京', '47', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('254', '254', '二级', '5051085', '四季春', '100000', '1050', '4', '0.5', '北京', '100', '好得快', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('255', '255', '一级', '100000', '四季春', '100000', '75.6', '4', '0.176', '北京', '21', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('256', '256', '一级', '100000', '四季春', '100000', '335.4', '4', '0.86', '北京', '86', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('257', '257', '一级', '100000', '四季春', '100000', '2112', '4', '1.757', '北京', '1056', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('258', '258', '一级', '100000', '四季春', '100000', '34.16', '4', '0.033', '北京', '4', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('259', '259', '一级', '100000', '四季春', '100000', '26.4', '4', '0.015', '北京', '3', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('26', '26', '二级', '3007902', '四季春', '100000', '75.6', '2', '0.175', '北京', '21', '好药师达药房连锁', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('260', '260', '一级', '100000', '四季春', '100000', '1122', '4', '1.703', '北京', '204', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('261', '261', '一级', '100000', '四季春', '100000', '135.36', '4', '0.225', '北京', '18', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('262', '262', '一级', '100000', '四季春', '100000', '723.6', '4', '0.674', '北京', '54', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('263', '263', '一级', '100000', '四季春', '100000', '6972', '4', '3.32', '北京', '664', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('264', '264', '一级', '100000', '四季春', '100000', '-87.44', '4', '-0.067', '北京', '-8', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('265', '265', '一级', '100000', '四季春', '100000', '5289.6', '4', '2.417', '北京', '290', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('266', '266', '二级', '1000001', '四季春', '100000', '19.5', '4', '0.05', '北京', '5', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('267', '267', '二级', '1000001', '四季春', '100000', '67', '4', '0.063', '北京', '5', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('268', '268', '二级', '1000001', '四季春', '100000', '1638', '4', '0.78', '北京', '156', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('269', '269', '一级', '100004', '华润商业集团', '100004', '10012', '4', '8.343', '北京', '5006', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('27', '27', '二级', '3007902', '四季春', '100000', '156', '2', '0.4', '北京', '40', '好药师达药房连锁', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('270', '270', '一级', '100004', '华润商业集团', '100004', '187.88', '4', '0.183', '北京', '22', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('271', '271', '一级', '100004', '华润商业集团', '100004', '5040', '4', '2.4', '北京', '480', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('272', '272', '一级', '100004', '华润商业集团', '100004', '-5045.55', '4', '-3.848', '北京', '-461.623', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('273', '273', '一级', '100004', '华润商业集团', '100004', '16780.8', '4', '7.667', '北京', '920', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('274', '274', '二级', '100112', '四季春', '100000', '4374', '4', '0.81', '北京', '162', '丰瑞龙翔', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('275', '275', '二级', '100112', '四季春', '100000', '6930', '4', '3.3', '北京', '660', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('276', '276', '二级', '1001288', '四季春', '100000', '50.7', '4', '0.13', '北京', '13', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('277', '277', '二级', '1001288', '四季春', '100000', '137.5', '4', '0.209', '北京', '25', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('278', '278', '二级', '1001288', '四季春', '100000', '135.36', '4', '0.225', '北京', '18', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('279', '279', '二级', '1001288', '四季春', '100000', '67', '4', '0.063', '北京', '5', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('28', '28', '二级', '3007902', '四季春', '100000', '37.6', '2', '0.063', '北京', '5', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('280', '280', '二级', '1001288', '四季春', '100000', '1942.5', '4', '0.925', '北京', '185', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('281', '281', '一级', '1002856', '嘉事堂', '1002856', '856', '4', '0.714', '北京', '428', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('282', '282', '一级', '1002856', '嘉事堂', '1002856', '170.8', '4', '0.167', '北京', '20', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('283', '283', '一级', '1002856', '嘉事堂', '1002856', '2310', '4', '1.1', '北京', '220', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('284', '284', '一级', '1002856', '嘉事堂', '1002856', '655.8', '4', '0.501', '北京', '60', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('285', '285', '二级', '1002859', '四季春', '100000', '20', '4', '0.017', '北京', '10', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('286', '286', '二级', '1002859', '四季春', '100000', '22.2', '4', '0.03', '北京', '6', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('287', '287', '二级', '1002859', '四季春', '100000', '110', '4', '0.166', '北京', '20', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('288', '288', '二级', '1002859', '四季春', '100000', '15435', '4', '7.35', '北京', '1470', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('289', '289', '二级', '1003145', '四季春', '100000', '90', '4', '0.209', '北京', '25', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('29', '29', '二级', '3007902', '四季春', '100000', '80.4', '2', '0.075', '北京', '6', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('290', '290', '二级', '1003145', '四季春', '100000', '1072.5', '4', '1.625', '北京', '195', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('291', '291', '二级', '1003145', '四季春', '100000', '90.24', '4', '0.15', '北京', '12', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('292', '292', '二级', '1003145', '四季春', '100000', '978.2', '4', '0.914', '北京', '73', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('293', '293', '二级', '1003145', '四季春', '100000', '3129', '4', '1.49', '北京', '298', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('294', '294', '一级', '100957', '四药控股', '100957', '340', '4', '0.283', '北京', '170', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('295', '295', '一级', '100957', '四药控股', '100957', '1272.46', '4', '1.241', '北京', '149', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('296', '296', '一级', '100957', '四药控股', '100957', '11.1', '4', '0.015', '北京', '3', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('297', '297', '一级', '100957', '四药控股', '100957', '3570', '4', '1.7', '北京', '340', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('298', '298', '一级', '100957', '四药控股', '100957', '-87.44', '4', '-0.067', '北京', '-8', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('299', '299', '一级', '100957', '四药控股', '100957', '1003.2', '4', '0.458', '北京', '55', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('3', '3', '一级', '100000', '四季春', '100000', '1060.8', '2', '2.72', '北京', '272', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('30', '30', '二级', '3007902', '四季春', '100000', '105', '2', '0.05', '北京', '10', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('300', '300', '二级', '3007883', '四季春', '100000', '134', '4', '0.125', '北京', '10', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('301', '301', '二级', '3007902', '四季春', '100000', '203.5', '4', '0.308', '北京', '37', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('302', '302', '二级', '3007902', '四季春', '100000', '174.2', '4', '0.162', '北京', '13', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('303', '303', '二级', '3007902', '四季春', '100000', '157.5', '4', '0.075', '北京', '15', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('304', '304', '二级', '5027724', '四季春', '100000', '1575', '4', '0.75', '北京', '150', '永安堂连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('305', '305', '二级', '5027725', '四季春', '100000', '386.88', '4', '0.252', '北京', '30.225', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('306', '306', '二级', '5045669', '四季春', '100000', '294.8', '4', '0.275', '北京', '22', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('307', '307', '二级', '5047913', '四季春', '100000', '256', '4', '0.167', '北京', '20', '国达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('308', '308', '二级', '5051085', '四季春', '100000', '275', '4', '0.417', '北京', '50', '好得快', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('309', '309', '一级', '100000', '四季春', '100000', '2988', '4', '6.918', '北京', '830', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('31', '31', '二级', '5027725', '四季春', '100000', '3942.4', '2', '2.566', '北京', '308', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('310', '310', '一级', '100000', '四季春', '100000', '2550.6', '4', '6.54', '北京', '654', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('311', '311', '一级', '100000', '四季春', '100000', '80', '4', '0.067', '北京', '40', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('312', '312', '一级', '100000', '四季春', '100000', '70.3', '4', '0.095', '北京', '19', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('313', '313', '一级', '100000', '四季春', '100000', '2266', '4', '3.435', '北京', '412', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('314', '314', '一级', '100000', '四季春', '100000', '67.68', '4', '0.112', '北京', '9', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('315', '315', '一级', '100000', '四季春', '100000', '335', '4', '0.313', '北京', '25', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('316', '316', '一级', '100000', '四季春', '100000', '9817.5', '4', '4.675', '北京', '935', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('317', '317', '一级', '100000', '四季春', '100000', '-863.47', '4', '-0.658', '北京', '-79', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('318', '318', '一级', '100000', '四季春', '100000', '1824', '4', '0.833', '北京', '100', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('319', '319', '二级', '1000001', '四季春', '100000', '1240.2', '4', '3.18', '北京', '318', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('32', '32', '二级', '5051085', '四季春', '100000', '54', '2', '0.125', '北京', '15', '好得快', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('320', '320', '二级', '1000001', '四季春', '100000', '110', '4', '0.167', '北京', '20', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('321', '321', '二级', '1000001', '四季春', '100000', '67', '4', '0.063', '北京', '5', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('322', '322', '二级', '1000001', '四季春', '100000', '1554', '4', '0.74', '北京', '148', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('323', '323', '一级', '100004', '华润商业集团', '100004', '180', '4', '0.15', '北京', '90', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('324', '324', '一级', '100004', '华润商业集团', '100004', '2100', '4', '1', '北京', '200', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('325', '325', '一级', '100004', '华润商业集团', '100004', '-218.6', '4', '-0.167', '北京', '-20', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('326', '326', '二级', '100112', '四季春', '100000', '210', '4', '0.1', '北京', '20', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('327', '327', '二级', '1001288', '四季春', '100000', '54', '4', '0.125', '北京', '15', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('328', '328', '二级', '1001288', '四季春', '100000', '97.5', '4', '0.25', '北京', '25', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('329', '329', '二级', '1001288', '四季春', '100000', '247.5', '4', '0.375', '北京', '45', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('33', '33', '一级', '100000', '四季春', '100000', '1130.4', '2', '2.617', '北京', '314', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('330', '330', '二级', '1001288', '四季春', '100000', '75.2', '4', '0.125', '北京', '10', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('331', '331', '二级', '1001288', '四季春', '100000', '136.5', '4', '0.065', '北京', '13', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('332', '332', '一级', '1002856', '嘉事堂', '1002856', '80', '4', '0.067', '北京', '40', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('333', '333', '一级', '1002856', '嘉事堂', '1002856', '3.7', '4', '0.005', '北京', '1', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('334', '334', '一级', '1002856', '嘉事堂', '1002856', '6300', '4', '3', '北京', '600', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('335', '335', '一级', '1002856', '嘉事堂', '1002856', '-1661.36', '4', '-1.267', '北京', '-152', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('336', '336', '二级', '1003145', '四季春', '100000', '550.8', '4', '1.275', '北京', '153', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('337', '337', '二级', '1003145', '四季春', '100000', '136.5', '4', '0.35', '北京', '35', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('338', '338', '二级', '1003145', '四季春', '100000', '990', '4', '1.501', '北京', '180', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('339', '339', '二级', '1003145', '四季春', '100000', '15.04', '4', '0.025', '北京', '2', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('34', '34', '一级', '100000', '四季春', '100000', '202.8', '2', '0.52', '北京', '52', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('340', '340', '二级', '1003145', '四季春', '100000', '750.4', '4', '0.701', '北京', '56', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('341', '341', '二级', '1003145', '四季春', '100000', '2425.5', '4', '1.155', '北京', '231', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('342', '342', '一级', '100957', '四药控股', '100957', '4725', '4', '2.25', '北京', '450', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('343', '343', '一级', '100957', '四药控股', '100957', '-448.13', '4', '-0.342', '北京', '-41', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('344', '344', '一级', '100957', '四药控股', '100957', '2736', '4', '1.251', '北京', '150', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('345', '345', '一级', '100000', '四季春', '100000', '175.5', '4', '0.45', '北京', '45', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('346', '346', '一级', '100000', '四季春', '100000', '96', '4', '0.08', '北京', '48', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('347', '347', '一级', '100000', '四季春', '100000', '55.5', '4', '0.075', '北京', '15', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('348', '348', '一级', '100000', '四季春', '100000', '135', '4', '0.025', '北京', '5', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('349', '349', '一级', '100000', '四季春', '100000', '594', '4', '0.902', '北京', '108', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('35', '35', '一级', '100000', '四季春', '100000', '469', '2', '0.438', '北京', '35', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('350', '350', '一级', '100000', '四季春', '100000', '67.68', '4', '0.113', '北京', '9', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('351', '351', '一级', '100000', '四季春', '100000', '120.6', '4', '0.113', '北京', '9', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('352', '352', '一级', '100000', '四季春', '100000', '14763', '4', '7.03', '北京', '1406', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('353', '353', '一级', '100000', '四季春', '100000', '2065.77', '4', '1.575', '北京', '189', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('354', '354', '一级', '100000', '四季春', '100000', '12038.4', '4', '5.501', '北京', '660', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('355', '355', '二级', '1000001', '四季春', '100000', '315', '4', '0.15', '北京', '30', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('356', '356', '一级', '100004', '华润商业集团', '100004', '4', '4', '0.003', '北京', '2', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('357', '357', '一级', '100004', '华润商业集团', '100004', '273.28', '4', '0.267', '北京', '32', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('358', '358', '一级', '100004', '华润商业集团', '100004', '525', '4', '0.25', '北京', '50', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('359', '359', '一级', '100004', '华润商业集团', '100004', '364.8', '4', '0.167', '北京', '20', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('36', '36', '一级', '100000', '四季春', '100000', '15603', '2', '7.43', '北京', '1486', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('360', '360', '二级', '100112', '四季春', '100000', '105', '4', '0.05', '北京', '10', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('361', '361', '二级', '1001288', '四季春', '100000', '7.8', '4', '0.02', '北京', '2', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('362', '362', '二级', '1001288', '四季春', '100000', '82.5', '4', '0.125', '北京', '15', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('363', '363', '二级', '1001288', '四季春', '100000', '26.8', '4', '0.025', '北京', '2', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('364', '364', '二级', '1001288', '四季春', '100000', '126', '4', '0.06', '北京', '12', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('365', '365', '一级', '1002856', '嘉事堂', '1002856', '1300', '4', '1.083', '北京', '650', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('366', '366', '一级', '1002856', '嘉事堂', '1002856', '18.5', '4', '0.025', '北京', '5', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('367', '367', '一级', '1002856', '嘉事堂', '1002856', '210', '4', '0.1', '北京', '20', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('368', '368', '一级', '1002856', '嘉事堂', '1002856', '-349.76', '4', '-0.267', '北京', '-32', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('369', '369', '二级', '1002859', '四季春', '100000', '144', '4', '0.333', '北京', '40', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('37', '37', '一级', '100000', '四季春', '100000', '54.65', '2', '0.042', '北京', '5', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('370', '370', '二级', '1002859', '四季春', '100000', '181.3', '4', '0.245', '北京', '49', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('371', '371', '二级', '1002859', '四季春', '100000', '220', '4', '0.334', '北京', '40', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('372', '372', '二级', '1003145', '四季春', '100000', '36', '4', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('373', '373', '二级', '1003145', '四季春', '100000', '93.5', '4', '0.142', '北京', '17', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('374', '374', '二级', '1003145', '四季春', '100000', '294.8', '4', '0.275', '北京', '22', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('375', '375', '二级', '1003145', '四季春', '100000', '1155', '4', '0.55', '北京', '110', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('376', '376', '二级', '5027725', '四季春', '100000', '52.05', '4', '0.034', '北京', '4.066', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('377', '377', '二级', '5045669', '四季春', '100000', '415.4', '4', '0.387', '北京', '31', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('378', '378', '一级', '100000', '四季春', '100000', '165.6', '5', '0.383', '北京', '46', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('379', '379', '一级', '100000', '四季春', '100000', '97.5', '5', '0.25', '北京', '25', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('38', '38', '二级', '1000001', '四季春', '100000', '25.2', '2', '0.059', '北京', '7', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('380', '380', '一级', '100000', '四季春', '100000', '3072', '5', '4', '北京', '240', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('381', '381', '一级', '100000', '四季春', '100000', '736', '5', '0.612', '北京', '368', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('382', '382', '一级', '100000', '四季春', '100000', '170.8', '5', '0.167', '北京', '20', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('383', '383', '一级', '100000', '四季春', '100000', '37', '5', '0.05', '北京', '10', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('384', '384', '一级', '100000', '四季春', '100000', '1523.5', '5', '2.31', '北京', '277', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('385', '385', '一级', '100000', '四季春', '100000', '240.64', '5', '0.401', '北京', '32', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('386', '386', '一级', '100000', '四季春', '100000', '629.8', '5', '0.588', '北京', '47', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('387', '387', '一级', '100000', '四季春', '100000', '41527.5', '5', '19.775', '北京', '3955', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('388', '388', '一级', '100000', '四季春', '100000', '12296.25', '5', '9.375', '北京', '1125', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('389', '389', '一级', '100000', '四季春', '100000', '9302.4', '5', '4.251', '北京', '510', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('39', '39', '二级', '1000001', '四季春', '100000', '134', '2', '0.126', '北京', '10', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('390', '390', '二级', '1000001', '四季春', '100000', '7.8', '5', '0.02', '北京', '2', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('391', '391', '二级', '1000001', '四季春', '100000', '12285', '5', '5.85', '北京', '1170', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('392', '392', '一级', '100004', '华润商业集团', '100004', '10352', '5', '8.623', '北京', '5176', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('393', '393', '一级', '100004', '华润商业集团', '100004', '392.84', '5', '0.383', '北京', '46', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('394', '394', '一级', '100004', '华润商业集团', '100004', '414.4', '5', '0.56', '北京', '112', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('395', '395', '一级', '100004', '华润商业集团', '100004', '60532.5', '5', '28.825', '北京', '5765', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('396', '396', '一级', '100004', '华润商业集团', '100004', '-623.01', '5', '-0.475', '北京', '-57', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('397', '397', '一级', '100004', '华润商业集团', '100004', '73872', '5', '33.75', '北京', '4050', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('398', '398', '二级', '100112', '四季春', '100000', '15487.5', '5', '7.375', '北京', '1475', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('399', '399', '二级', '1001288', '四季春', '100000', '10.8', '5', '0.025', '北京', '3', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('4', '4', '一级', '100000', '四季春', '100000', '210.56', '2', '0.351', '北京', '28', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('40', '40', '二级', '1000001', '四季春', '100000', '315', '2', '0.15', '北京', '30', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('400', '400', '二级', '1001288', '四季春', '100000', '97.5', '5', '0.25', '北京', '25', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('401', '401', '二级', '1001288', '四季春', '100000', '112.8', '5', '0.189', '北京', '15', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('402', '402', '二级', '1001288', '四季春', '100000', '15571.5', '5', '7.415', '北京', '1483', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('403', '403', '一级', '1002856', '嘉事堂', '1002856', '984', '5', '0.821', '北京', '492', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('404', '404', '一级', '1002856', '嘉事堂', '1002856', '18480', '5', '8.8', '北京', '1760', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('405', '405', '一级', '1002856', '嘉事堂', '1002856', '207.67', '5', '0.159', '北京', '19', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('406', '406', '一级', '1002856', '嘉事堂', '1002856', '13680', '5', '6.25', '北京', '750', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('407', '407', '二级', '1002859', '四季春', '100000', '140', '5', '0.117', '北京', '70', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('408', '408', '二级', '1002859', '四季春', '100000', '111', '5', '0.15', '北京', '30', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('409', '409', '二级', '1002859', '四季春', '100000', '110', '5', '0.166', '北京', '20', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('41', '41', '二级', '1001288', '四季春', '100000', '18', '2', '0.042', '北京', '5', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('410', '410', '二级', '1002859', '四季春', '100000', '11287.5', '5', '5.375', '北京', '1075', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('411', '411', '二级', '1003145', '四季春', '100000', '37', '5', '0.05', '北京', '10', '华润新龙（）', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('412', '412', '二级', '1003145', '四季春', '100000', '1309', '5', '1.985', '北京', '238', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('413', '413', '二级', '1003145', '四季春', '100000', '75.2', '5', '0.126', '北京', '10', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('414', '414', '二级', '1003145', '四季春', '100000', '1085.4', '5', '1.015', '北京', '81', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('415', '415', '二级', '1003145', '四季春', '100000', '26468.21', '5', '12.603', '北京', '2520.787', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('416', '416', '一级', '100957', '四药控股', '100957', '480', '5', '0.399', '北京', '240', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('417', '417', '一级', '100957', '四药控股', '100957', '1538.91', '5', '1.501', '北京', '180.2', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('418', '418', '一级', '100957', '四药控股', '100957', '25.9', '5', '0.035', '北京', '7', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('419', '419', '一级', '100957', '四药控股', '100957', '11707.5', '5', '5.575', '北京', '1115', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('42', '42', '二级', '1001288', '四季春', '100000', '23.4', '2', '0.06', '北京', '6', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('420', '420', '一级', '100957', '四药控股', '100957', '-1060.21', '5', '-0.808', '北京', '-97', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('421', '421', '一级', '100957', '四药控股', '100957', '19881.6', '5', '9.083', '北京', '1090', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('422', '422', '二级', '3007883', '四季春', '100000', '857.6', '5', '0.801', '北京', '64', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('423', '423', '二级', '3007902', '四季春', '100000', '88', '5', '0.133', '北京', '16', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('424', '424', '二级', '3007902', '四季春', '100000', '30.08', '5', '0.05', '北京', '4', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('425', '425', '二级', '3007902', '四季春', '100000', '147.4', '5', '0.139', '北京', '11', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('426', '426', '二级', '3007902', '四季春', '100000', '525', '5', '0.25', '北京', '50', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('427', '427', '二级', '5027725', '四季春', '100000', '16422', '5', '7.82', '北京', '1564', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('428', '428', '二级', '5027725', '四季春', '100000', '17753.6', '5', '11.557', '北京', '1387', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('429', '429', '二级', '5027764', '四季春', '100000', '2035.2', '5', '1.325', '北京', '159', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('43', '43', '二级', '1001288', '四季春', '100000', '399.19', '2', '0.413', '北京', '33.06', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('430', '430', '二级', '5045669', '四季春', '100000', '398.77', '5', '0.372', '北京', '29.76', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('431', '431', '二级', '5045669', '四季春', '100000', '27136', '5', '17.667', '北京', '2120', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('432', '432', '二级', '5047913', '四季春', '100000', '0', '5', '0', '北京', '0', '国达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('433', '433', '二级', '5047913', '四季春', '100000', '0', '5', '0', '北京', '0', '国达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('434', '434', '二级', '5051085', '四季春', '100000', '429', '5', '0.65', '北京', '78', '好得快', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('435', '435', '二级', '5051085', '四季春', '100000', '2100', '5', '1', '北京', '200', '好得快', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('436', '436', '一级', '100000', '四季春', '100000', '144', '5', '0.333', '北京', '40', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('437', '437', '一级', '100000', '四季春', '100000', '312', '5', '0.8', '北京', '80', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('438', '438', '一级', '100000', '四季春', '100000', '32', '5', '0.026', '北京', '16', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('439', '439', '一级', '100000', '四季春', '100000', '81', '5', '0.015', '北京', '3', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('44', '44', '二级', '1001288', '四季春', '100000', '8662.5', '2', '4.125', '北京', '825', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('440', '440', '一级', '100000', '四季春', '100000', '26.4', '5', '0.015', '北京', '3', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('441', '441', '一级', '100000', '四季春', '100000', '654.5', '5', '0.992', '北京', '119', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('442', '442', '一级', '100000', '四季春', '100000', '52.64', '5', '0.088', '北京', '7', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('443', '443', '一级', '100000', '四季春', '100000', '763.8', '5', '0.714', '北京', '57', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('444', '444', '一级', '100000', '四季春', '100000', '35322', '5', '16.82', '北京', '3364', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('445', '445', '一级', '100000', '四季春', '100000', '10569.31', '5', '8.059', '北京', '967', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('446', '446', '一级', '100000', '四季春', '100000', '30260.16', '5', '13.825', '北京', '1659', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('447', '447', '二级', '1000001', '四季春', '100000', '2751', '5', '1.31', '北京', '262', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('448', '448', '一级', '100004', '华润商业集团', '100004', '170.8', '5', '0.167', '北京', '20', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('449', '449', '一级', '100004', '华润商业集团', '100004', '37', '5', '0.05', '北京', '10', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('45', '45', '二级', '1002859', '四季春', '100000', '432', '2', '1', '北京', '120', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('450', '450', '一级', '100004', '华润商业集团', '100004', '3150', '5', '1.5', '北京', '300', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('451', '451', '一级', '100004', '华润商业集团', '100004', '3465.6', '5', '1.584', '北京', '190', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('452', '452', '二级', '100112', '四季春', '100000', '1701', '5', '0.81', '北京', '162', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('453', '453', '二级', '1001288', '四季春', '100000', '15.6', '5', '0.04', '北京', '4', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('454', '454', '二级', '1001288', '四季春', '100000', '8316', '5', '3.96', '北京', '792', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('455', '455', '一级', '1002856', '嘉事堂', '1002856', '400', '5', '0.333', '北京', '200', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('456', '456', '一级', '1002856', '嘉事堂', '1002856', '37', '5', '0.05', '北京', '10', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('457', '457', '一级', '1002856', '嘉事堂', '1002856', '945', '5', '0.45', '北京', '90', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('458', '458', '一级', '1002856', '嘉事堂', '1002856', '-710.45', '5', '-0.542', '北京', '-65', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('459', '459', '一级', '1002856', '嘉事堂', '1002856', '3100.8', '5', '1.417', '北京', '170', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('46', '46', '二级', '1002859', '四季春', '100000', '1050', '2', '0.5', '北京', '100', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('460', '460', '二级', '1002859', '四季春', '100000', '871.2', '5', '2.016', '北京', '242', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('461', '461', '二级', '1002859', '四季春', '100000', '1210', '5', '1.833', '北京', '220', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('462', '462', '二级', '1002859', '四季春', '100000', '3276', '5', '1.56', '北京', '312', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('463', '463', '二级', '1003145', '四季春', '100000', '72', '5', '0.167', '北京', '20', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('464', '464', '二级', '1003145', '四季春', '100000', '37', '5', '0.05', '北京', '10', '华润新龙（）', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('465', '465', '二级', '1003145', '四季春', '100000', '330', '5', '0.5', '北京', '60', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('466', '466', '二级', '1003145', '四季春', '100000', '120.6', '5', '0.112', '北京', '9', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('467', '467', '二级', '1003145', '四季春', '100000', '53049.93', '5', '25.259', '北京', '5052.375', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('468', '468', '一级', '100957', '四药控股', '100957', '20', '5', '0.017', '北京', '10', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('469', '469', '一级', '100957', '四药控股', '100957', '7.4', '5', '0.01', '北京', '2', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('47', '47', '二级', '1003145', '四季春', '100000', '36', '2', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('470', '470', '一级', '100957', '四药控股', '100957', '2100', '5', '1', '北京', '200', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('471', '471', '一级', '100957', '四药控股', '100957', '4012.8', '5', '1.833', '北京', '220', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('472', '472', '二级', '3007898', '四季春', '100000', '420', '5', '0.2', '北京', '40', '医保中洋达药房', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('473', '473', '二级', '5027725', '四季春', '100000', '315', '5', '0.15', '北京', '30', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('474', '474', '二级', '5027725', '四季春', '100000', '1088', '5', '0.708', '北京', '85', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('475', '475', '二级', '5045669', '四季春', '100000', '360.19', '5', '0.336', '北京', '26.88', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('476', '476', '二级', '5045669', '四季春', '100000', '6400', '5', '4.169', '北京', '500', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('477', '477', '一级', '100000', '四季春', '100000', '1346.4', '5', '3.117', '北京', '374', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('478', '478', '一级', '100000', '四季春', '100000', '210.6', '5', '0.54', '北京', '54', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('479', '479', '一级', '100000', '四季春', '100000', '128', '5', '0.167', '北京', '10', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '海淀');
INSERT INTO `poc_sales` VALUES ('48', '48', '二级', '1003145', '四季春', '100000', '361.8', '2', '0.337', '北京', '27', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('480', '480', '一级', '100000', '四季春', '100000', '144', '5', '0.12', '北京', '72', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('481', '481', '一级', '100000', '四季春', '100000', '623.42', '5', '0.608', '北京', '73', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('482', '482', '一级', '100000', '四季春', '100000', '42.5', '5', '0.042', '北京', '5', '四季春', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('483', '483', '一级', '100000', '四季春', '100000', '1026', '5', '0.19', '北京', '38', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('484', '484', '一级', '100000', '四季春', '100000', '52.8', '5', '0.03', '北京', '6', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('485', '485', '一级', '100000', '四季春', '100000', '3481.5', '5', '5.276', '北京', '633', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('486', '486', '一级', '100000', '四季春', '100000', '112.8', '5', '0.187', '北京', '15', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('487', '487', '一级', '100000', '四季春', '100000', '1527.6', '5', '1.43', '北京', '114', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('488', '488', '一级', '100000', '四季春', '100000', '57130.5', '5', '27.205', '北京', '5441', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('489', '489', '一级', '100000', '四季春', '100000', '6732.88', '5', '5.134', '北京', '616', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('49', '49', '二级', '1003145', '四季春', '100000', '367.5', '2', '0.175', '北京', '35', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('490', '490', '一级', '100000', '四季春', '100000', '7113.6', '5', '3.25', '北京', '390', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('491', '491', '二级', '1000001', '四季春', '100000', '1384.5', '5', '3.55', '北京', '355', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('492', '492', '二级', '1000001', '四季春', '100000', '3190', '5', '4.833', '北京', '580', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('493', '493', '二级', '1000001', '四季春', '100000', '60081', '5', '28.61', '北京', '5722', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('494', '494', '一级', '100004', '华润商业集团', '100004', '362', '5', '0.302', '北京', '181', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('495', '495', '一级', '100004', '华润商业集团', '100004', '29.6', '5', '0.04', '北京', '8', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('496', '496', '一级', '100004', '华润商业集团', '100004', '4567.5', '5', '2.175', '北京', '435', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('497', '497', '一级', '100004', '华润商业集团', '100004', '-3322.72', '5', '-2.533', '北京', '-304', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('498', '498', '一级', '100004', '华润商业集团', '100004', '52166.4', '5', '23.833', '北京', '2860', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('499', '499', '二级', '100112', '四季春', '100000', '11970', '5', '5.7', '北京', '1140', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('5', '5', '一级', '100000', '四季春', '100000', '1407', '2', '1.316', '北京', '105', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('50', '50', '二级', '3007898', '四季春', '100000', '11.7', '2', '0.03', '北京', '3', '医保中洋达药房', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('500', '500', '二级', '1001288', '四季春', '100000', '90', '5', '0.209', '北京', '25', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('501', '501', '二级', '1001288', '四季春', '100000', '78', '5', '0.2', '北京', '20', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('502', '502', '二级', '1001288', '四季春', '100000', '308.32', '5', '0.514', '北京', '41', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('503', '503', '二级', '1001288', '四季春', '100000', '78708', '5', '37.48', '北京', '7496', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('504', '504', '一级', '1002856', '嘉事堂', '1002856', '542', '5', '0.45', '北京', '271', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('505', '505', '一级', '1002856', '嘉事堂', '1002856', '22.2', '5', '0.03', '北京', '6', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('506', '506', '一级', '1002856', '嘉事堂', '1002856', '1950', '5', '1.5', '北京', '150', '嘉事堂', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('507', '507', '一级', '1002856', '嘉事堂', '1002856', '19845', '5', '9.45', '北京', '1890', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('508', '508', '一级', '1002856', '嘉事堂', '1002856', '-1344.39', '5', '-1.025', '北京', '-123', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('509', '509', '一级', '1002856', '嘉事堂', '1002856', '33196.8', '5', '15.167', '北京', '1820', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('51', '51', '二级', '5027725', '四季春', '100000', '294.4', '2', '0.192', '北京', '23', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('510', '510', '二级', '1002859', '四季春', '100000', '180', '5', '0.417', '北京', '50', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('511', '511', '二级', '1002859', '四季春', '100000', '120', '5', '0.1', '北京', '60', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('512', '512', '二级', '1002859', '四季春', '100000', '77.7', '5', '0.105', '北京', '21', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('513', '513', '二级', '1002859', '四季春', '100000', '247.5', '5', '0.375', '北京', '45', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('514', '514', '二级', '1002859', '四季春', '100000', '25819.5', '5', '12.295', '北京', '2459', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('515', '515', '二级', '1003145', '四季春', '100000', '108', '5', '0.25', '北京', '30', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('516', '516', '二级', '1003145', '四季春', '100000', '385', '5', '0.584', '北京', '70', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('517', '517', '二级', '1003145', '四季春', '100000', '37.6', '5', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('518', '518', '二级', '1003145', '四季春', '100000', '938', '5', '0.877', '北京', '70', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('519', '519', '二级', '1003145', '四季春', '100000', '24488.55', '5', '11.657', '北京', '2332.246', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('52', '52', '一级', '100000', '四季春', '100000', '4777.2', '2', '11.06', '北京', '1327', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('520', '520', '一级', '100957', '四药控股', '100957', '200', '5', '0.167', '北京', '100', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('521', '521', '一级', '100957', '四药控股', '100957', '85.4', '5', '0.083', '北京', '10', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('522', '522', '一级', '100957', '四药控股', '100957', '44.4', '5', '0.06', '北京', '12', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('523', '523', '一级', '100957', '四药控股', '100957', '39795', '5', '18.95', '北京', '3790', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('524', '524', '一级', '100957', '四药控股', '100957', '-623.01', '5', '-0.475', '北京', '-57', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('525', '525', '一级', '100957', '四药控股', '100957', '24168', '5', '11.043', '北京', '1325', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('526', '526', '二级', '3007883', '四季春', '100000', '214.4', '5', '0.2', '北京', '16', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('527', '527', '二级', '3007898', '四季春', '100000', '33', '5', '0.05', '北京', '6', '医保中洋达药房', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('528', '528', '二级', '3007898', '四季春', '100000', '21', '5', '0.01', '北京', '2', '医保中洋达药房', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('529', '529', '二级', '3007902', '四季春', '100000', '225.5', '5', '0.34', '北京', '41', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('53', '53', '一级', '100000', '四季春', '100000', '3135.6', '2', '8.04', '北京', '804', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('530', '530', '二级', '3007902', '四季春', '100000', '67', '5', '0.063', '北京', '5', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('531', '531', '二级', '3007902', '四季春', '100000', '525', '5', '0.25', '北京', '50', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('532', '532', '二级', '3007902', '四季春', '100000', '-76.8', '5', '-0.05', '北京', '-6', '好药师达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('533', '533', '二级', '5027725', '四季春', '100000', '8925', '5', '4.25', '北京', '850', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('534', '534', '二级', '5027725', '四季春', '100000', '11750.4', '5', '7.653', '北京', '918', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('535', '535', '二级', '5027764', '四季春', '100000', '268.8', '5', '0.175', '北京', '21', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('536', '536', '二级', '5045669', '四季春', '100000', '527.42', '5', '0.492', '北京', '39.36', '嘉事堂连锁药店', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('537', '537', '二级', '5045669', '四季春', '100000', '29056', '5', '18.932', '北京', '2270', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('538', '538', '二级', '5047913', '四季春', '100000', '0', '5', '0', '北京', '0', '国达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('539', '539', '二级', '5051085', '四季春', '100000', '71.5', '5', '0.108', '北京', '13', '好得快', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('54', '54', '一级', '100000', '四季春', '100000', '473.76', '2', '0.787', '北京', '63', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('540', '540', '一级', '100000', '四季春', '100000', '2433.6', '5', '5.634', '北京', '676', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('541', '541', '一级', '100000', '四季春', '100000', '3014.7', '5', '7.73', '北京', '773', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('542', '542', '一级', '100000', '四季春', '100000', '640', '5', '0.833', '北京', '50', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('543', '543', '一级', '100000', '四季春', '100000', '32', '5', '0.027', '北京', '16', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('544', '544', '一级', '100000', '四季春', '100000', '2981', '5', '4.516', '北京', '542', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('545', '545', '一级', '100000', '四季春', '100000', '82.72', '5', '0.138', '北京', '11', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('546', '546', '一级', '100000', '四季春', '100000', '294.8', '5', '0.276', '北京', '22', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('547', '547', '一级', '100000', '四季春', '100000', '87664.5', '5', '41.745', '北京', '8349', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('548', '548', '一级', '100000', '四季春', '100000', '-710.45', '5', '-0.542', '北京', '-65', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('549', '549', '一级', '100000', '四季春', '100000', '24076.8', '5', '11', '北京', '1320', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('55', '55', '一级', '100000', '四季春', '100000', '710.2', '2', '0.664', '北京', '53', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('550', '550', '二级', '1000001', '四季春', '100000', '534.3', '5', '1.37', '北京', '137', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('551', '551', '二级', '1000001', '四季春', '100000', '110', '5', '0.167', '北京', '20', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('552', '552', '二级', '1000001', '四季春', '100000', '26859', '5', '12.79', '北京', '2558', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('553', '553', '一级', '100004', '华润商业集团', '100004', '700', '5', '0.583', '北京', '350', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('554', '554', '一级', '100004', '华润商业集团', '100004', '6657', '5', '3.17', '北京', '634', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('555', '555', '一级', '100004', '华润商业集团', '100004', '-754.17', '5', '-0.575', '北京', '-69', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('556', '556', '一级', '100004', '华润商业集团', '100004', '364.8', '5', '0.167', '北京', '20', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('557', '557', '二级', '100112', '四季春', '100000', '1029', '5', '0.49', '北京', '98', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('558', '558', '二级', '1001288', '四季春', '100000', '216', '5', '0.501', '北京', '60', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('559', '559', '二级', '1001288', '四季春', '100000', '85.8', '5', '0.22', '北京', '22', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('56', '56', '一级', '100000', '四季春', '100000', '7906.5', '2', '3.765', '北京', '753', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('560', '560', '二级', '1001288', '四季春', '100000', '3024', '5', '1.44', '北京', '288', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('561', '561', '一级', '1002856', '嘉事堂', '1002856', '200', '5', '0.166', '北京', '100', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('562', '562', '一级', '1002856', '嘉事堂', '1002856', '5985', '5', '2.85', '北京', '570', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('563', '563', '一级', '1002856', '嘉事堂', '1002856', '-2568.55', '5', '-1.958', '北京', '-235', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('564', '564', '一级', '1002856', '嘉事堂', '1002856', '1094.4', '5', '0.5', '北京', '60', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('565', '565', '二级', '1002859', '四季春', '100000', '2100', '5', '1', '北京', '200', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('566', '566', '二级', '1003145', '四季春', '100000', '1584', '5', '3.667', '北京', '440', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('567', '567', '二级', '1003145', '四季春', '100000', '0', '5', '0', '北京', '0', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('568', '568', '二级', '1003145', '四季春', '100000', '797.5', '5', '1.209', '北京', '145', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('569', '569', '二级', '1003145', '四季春', '100000', '75.2', '5', '0.125', '北京', '10', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('57', '57', '一级', '100000', '四季春', '100000', '579.29', '2', '0.441', '北京', '53', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('570', '570', '二级', '1003145', '四季春', '100000', '911.2', '5', '0.851', '北京', '68', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('571', '571', '二级', '1003145', '四季春', '100000', '21683.96', '5', '10.323', '北京', '2065.14', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('572', '572', '一级', '100957', '四药控股', '100957', '36', '5', '0.083', '北京', '10', '四药控股', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('573', '573', '一级', '100957', '四药控股', '100957', '20', '5', '0.017', '北京', '10', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('574', '574', '一级', '100957', '四药控股', '100957', '74', '5', '0.1', '北京', '20', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('575', '575', '一级', '100957', '四药控股', '100957', '-105', '5', '-0.05', '北京', '-10', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('576', '576', '一级', '100957', '四药控股', '100957', '-1836.24', '5', '-1.4', '北京', '-168', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('577', '577', '一级', '100957', '四药控股', '100957', '10396.8', '5', '4.75', '北京', '570', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('578', '578', '二级', '5045669', '四季春', '100000', '1536', '5', '1', '北京', '120', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('579', '579', '一级', '100000', '四季春', '100000', '212.4', '6', '0.493', '北京', '59', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('58', '58', '二级', '1000001', '四季春', '100000', '5554.8', '2', '12.862', '北京', '1543', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('580', '580', '一级', '100000', '四季春', '100000', '331.5', '6', '0.85', '北京', '85', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('581', '581', '一级', '100000', '四季春', '100000', '64', '6', '0.083', '北京', '5', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '海淀');
INSERT INTO `poc_sales` VALUES ('582', '582', '一级', '100000', '四季春', '100000', '80', '6', '0.067', '北京', '40', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('583', '583', '一级', '100000', '四季春', '100000', '1622.6', '6', '1.584', '北京', '190', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('584', '584', '一级', '100000', '四季春', '100000', '37', '6', '0.05', '北京', '10', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('585', '585', '一级', '100004', '华润商业集团', '100004', '164', '6', '0.137', '北京', '82', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('586', '586', '一级', '100004', '华润商业集团', '100004', '125.8', '6', '0.17', '北京', '34', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('587', '587', '二级', '100112', '四季春', '100000', '2688', '6', '2', '北京', '160', '丰瑞龙翔', '基层产品', '10006000601', '红花注射液 100克*3支*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('588', '588', '一级', '100957', '四药控股', '100957', '60', '6', '0.05', '北京', '30', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('589', '589', '一级', '100957', '四药控股', '100957', '136.64', '6', '0.133', '北京', '16', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('59', '59', '二级', '1000001', '四季春', '100000', '3599.7', '2', '9.23', '北京', '923', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('590', '590', '一级', '100957', '四药控股', '100957', '25.9', '6', '0.035', '北京', '7', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('591', '591', '二级', '1000001', '四季春', '100000', '507', '6', '1.3', '北京', '130', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('592', '592', '二级', '1000089', '保定市久展销售', '101733', '36', '6', '0.083', '北京', '10', '河北顺泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('593', '593', '二级', '1001288', '四季春', '100000', '198', '6', '0.459', '北京', '55', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('594', '594', '二级', '1001288', '四季春', '100000', '202.8', '6', '0.52', '北京', '52', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('595', '595', '一级', '1002856', '嘉事堂', '1002856', '1786', '6', '1.488', '北京', '893', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('596', '596', '一级', '1002856', '嘉事堂', '1002856', '3697.82', '6', '3.609', '北京', '433', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('597', '597', '一级', '1002856', '嘉事堂', '1002856', '3.7', '6', '0.005', '北京', '1', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('598', '598', '二级', '1002859', '四季春', '100000', '81.4', '6', '0.11', '北京', '22', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('599', '599', '二级', '1003145', '四季春', '100000', '100.8', '6', '0.234', '北京', '28', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('6', '6', '一级', '100000', '四季春', '100000', '25557', '2', '12.17', '北京', '2434', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('60', '60', '二级', '1000001', '四季春', '100000', '2103.8', '2', '1.963', '北京', '157', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('600', '600', '二级', '1003145', '四季春', '100000', '39', '6', '0.1', '北京', '10', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('601', '601', '一级', '100000', '四季春', '100000', '2170.8', '6', '5.023', '北京', '603', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('602', '602', '一级', '100000', '四季春', '100000', '620.1', '6', '1.59', '北京', '159', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('603', '603', '一级', '100000', '四季春', '100000', '640', '6', '0.833', '北京', '50', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('604', '604', '一级', '100000', '四季春', '100000', '176', '6', '0.147', '北京', '88', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('605', '605', '一级', '100957', '四药控股', '100957', '40', '6', '0.033', '北京', '20', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('606', '606', '二级', '1000001', '四季春', '100000', '1123.2', '6', '2.88', '北京', '288', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('607', '607', '二级', '1000089', '保定市久展销售', '101733', '72', '6', '0.167', '北京', '20', '河北顺泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('608', '608', '二级', '1000089', '保定市久展销售', '101733', '42.7', '6', '0.042', '北京', '5', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('609', '609', '二级', '1001288', '四季春', '100000', '331.2', '6', '0.767', '北京', '92', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('61', '61', '二级', '1000001', '四季春', '100000', '7875', '2', '3.75', '北京', '750', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('610', '610', '二级', '1001288', '四季春', '100000', '39', '6', '0.1', '北京', '10', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('611', '611', '一级', '1002856', '嘉事堂', '1002856', '220', '6', '0.183', '北京', '110', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('612', '612', '一级', '1002856', '嘉事堂', '1002856', '7.4', '6', '0.01', '北京', '2', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('613', '613', '二级', '1003145', '四季春', '100000', '439.2', '6', '1.018', '北京', '122', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('614', '614', '二级', '1003145', '四季春', '100000', '1014', '6', '2.6', '北京', '260', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('615', '615', '一级', '100000', '四季春', '100000', '61.2', '6', '0.142', '北京', '17', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('616', '616', '一级', '100000', '四季春', '100000', '48', '6', '0.039', '北京', '24', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('617', '617', '一级', '100000', '四季春', '100000', '153.72', '6', '0.15', '北京', '18', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('618', '618', '一级', '100000', '四季春', '100000', '7.4', '6', '0.01', '北京', '2', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('619', '619', '一级', '100004', '华润商业集团', '100004', '85.4', '6', '0.083', '北京', '10', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('62', '62', '二级', '100112', '四季春', '100000', '1239', '2', '0.59', '北京', '118', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('620', '620', '一级', '100957', '四药控股', '100957', '40', '6', '0.033', '北京', '20', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('621', '621', '一级', '1002856', '嘉事堂', '1002856', '20', '6', '0.017', '北京', '10', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('622', '622', '一级', '1002856', '嘉事堂', '1002856', '17.08', '6', '0.017', '北京', '2', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('623', '623', '二级', '1002859', '四季春', '100000', '612', '6', '1.417', '北京', '170', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('624', '624', '二级', '1003145', '四季春', '100000', '46.8', '6', '0.108', '北京', '13', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('625', '625', '一级', '100000', '四季春', '100000', '144', '6', '0.333', '北京', '40', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('626', '626', '一级', '100000', '四季春', '100000', '105.3', '6', '0.27', '北京', '27', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('627', '627', '一级', '100000', '四季春', '100000', '2048', '6', '2.667', '北京', '160', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('628', '628', '一级', '100000', '四季春', '100000', '368', '6', '0.307', '北京', '184', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('629', '629', '一级', '100000', '四季春', '100000', '170.8', '6', '0.167', '北京', '20', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('63', '63', '二级', '1001288', '四季春', '100000', '554.4', '2', '1.284', '北京', '154', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('630', '630', '一级', '100000', '四季春', '100000', '40.7', '6', '0.055', '北京', '11', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('631', '631', '一级', '100004', '华润商业集团', '100004', '7198', '6', '5.996', '北京', '3599', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('632', '632', '一级', '100004', '华润商业集团', '100004', '529.48', '6', '0.517', '北京', '62', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('633', '633', '一级', '100004', '华润商业集团', '100004', '11.1', '6', '0.015', '北京', '3', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('634', '634', '一级', '100957', '四药控股', '100957', '740', '6', '0.616', '北京', '370', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('635', '635', '一级', '100957', '四药控股', '100957', '2032.52', '6', '1.983', '北京', '238', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('636', '636', '一级', '100957', '四药控股', '100957', '22.2', '6', '0.03', '北京', '6', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('637', '637', '二级', '1000089', '保定市久展销售', '101733', '324.52', '6', '0.317', '北京', '38', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('638', '638', '二级', '1001288', '四季春', '100000', '18', '6', '0.042', '北京', '5', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('639', '639', '二级', '1001288', '四季春', '100000', '70.2', '6', '0.18', '北京', '18', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('64', '64', '二级', '1001288', '四季春', '100000', '210.6', '2', '0.54', '北京', '54', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('640', '640', '一级', '1002856', '嘉事堂', '1002856', '1050', '6', '0.875', '北京', '525', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('641', '641', '一级', '1002856', '嘉事堂', '1002856', '683.2', '6', '0.666', '北京', '80', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('642', '642', '二级', '1002859', '四季春', '100000', '200', '6', '0.167', '北京', '100', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('643', '643', '二级', '1002859', '四季春', '100000', '48.1', '6', '0.065', '北京', '13', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('644', '644', '二级', '1003145', '四季春', '100000', '36', '6', '0.083', '北京', '10', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('645', '645', '一级', '100000', '四季春', '100000', '7047', '6', '1.305', '北京', '261', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('646', '646', '一级', '100000', '四季春', '100000', '123.2', '6', '0.07', '北京', '14', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('647', '647', '一级', '100000', '四季春', '100000', '2145', '6', '3.252', '北京', '390', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('648', '648', '一级', '100000', '四季春', '100000', '368.48', '6', '0.612', '北京', '49', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('649', '649', '一级', '100000', '四季春', '100000', '911.2', '6', '0.852', '北京', '68', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('65', '65', '二级', '1001288', '四季春', '100000', '323.36', '2', '0.539', '北京', '43', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('650', '650', '一级', '100000', '四季春', '100000', '49959', '6', '23.79', '北京', '4758', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('651', '651', '一级', '100000', '四季春', '100000', '2787.15', '6', '2.125', '北京', '255', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('652', '652', '一级', '100000', '四季春', '100000', '13534.08', '6', '6.184', '北京', '742', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('653', '653', '一级', '100004', '华润商业集团', '100004', '15120', '6', '7.2', '北京', '1440', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('654', '654', '一级', '100004', '华润商业集团', '100004', '-251.39', '6', '-0.192', '北京', '-23', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('655', '655', '一级', '100004', '华润商业集团', '100004', '29001.6', '6', '13.251', '北京', '1590', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('656', '656', '二级', '100112', '四季春', '100000', '30529.79', '6', '14.536', '北京', '2907.601', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('657', '657', '一级', '100957', '四药控股', '100957', '39931.5', '6', '19.015', '北京', '3803', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('658', '658', '一级', '100957', '四药控股', '100957', '-2175.07', '6', '-1.658', '北京', '-199', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('659', '659', '一级', '100957', '四药控股', '100957', '33014.4', '6', '15.084', '北京', '1810', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('66', '66', '二级', '1001288', '四季春', '100000', '3781.67', '2', '3.709', '北京', '296.62', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('660', '660', '二级', '1000001', '四季春', '100000', '2134', '6', '3.235', '北京', '388', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('661', '661', '二级', '1000001', '四季春', '100000', '84882', '6', '40.42', '北京', '8084', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('662', '662', '二级', '1000089', '保定市久展销售', '101733', '3.49', '6', '0.005', '北京', '0.634', '河北顺泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('663', '663', '二级', '1000089', '保定市久展销售', '101733', '626', '6', '0.297', '北京', '59.621', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('664', '664', '二级', '1000094', '保定市久展销售', '101733', '105', '6', '0.05', '北京', '10', '河北冀北物流', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('665', '665', '二级', '1000110', '四药乐仁堂', '100008', '67', '6', '0.063', '北京', '5', '廊坊市中诚康宇', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('666', '666', '二级', '1000110', '四药乐仁堂', '100008', '630', '6', '0.3', '北京', '60', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('667', '667', '二级', '1001288', '四季春', '100000', '720.5', '6', '1.094', '北京', '131', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('668', '668', '二级', '1001288', '四季春', '100000', '278.24', '6', '0.464', '北京', '37', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('669', '669', '二级', '1001288', '四季春', '100000', '1299.8', '6', '1.216', '北京', '97', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('67', '67', '二级', '1001288', '四季春', '100000', '5071.5', '2', '2.415', '北京', '483', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('670', '670', '二级', '1001288', '四季春', '100000', '27206.98', '6', '12.959', '北京', '2591.136', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('671', '671', '二级', '1001511', '保定市久展销售', '101733', '55', '6', '0.083', '北京', '10', '保定汇达分公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('672', '672', '二级', '1001511', '保定市久展销售', '101733', '252', '6', '0.12', '北京', '24', '保定汇达分公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('673', '673', '一级', '1002856', '嘉事堂', '1002856', '2275', '6', '1.75', '北京', '175', '嘉事堂', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('674', '674', '一级', '1002856', '嘉事堂', '1002856', '47428.5', '6', '22.585', '北京', '4517', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('675', '675', '一级', '1002856', '嘉事堂', '1002856', '1311.6', '6', '1', '北京', '120', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('676', '676', '一级', '1002856', '嘉事堂', '1002856', '61468.8', '6', '28.084', '北京', '3370', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('677', '677', '二级', '1002859', '四季春', '100000', '2600', '6', '2', '北京', '200', '天力泽', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('678', '678', '二级', '1002859', '四季春', '100000', '528', '6', '0.8', '北京', '96', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('679', '679', '二级', '1002859', '四季春', '100000', '67', '6', '0.063', '北京', '5', '天力泽', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('68', '68', '一级', '1002856', '嘉事堂', '1002856', '2446', '2', '2.038', '北京', '1223', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('680', '680', '二级', '1002859', '四季春', '100000', '23551.5', '6', '11.215', '北京', '2243', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('681', '681', '二级', '1002859', '四季春', '100000', '2371.2', '6', '1.083', '北京', '130', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('682', '682', '二级', '1003145', '四季春', '100000', '300.05', '6', '0.455', '北京', '54.555', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('683', '683', '二级', '1003145', '四季春', '100000', '37.6', '6', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('684', '684', '二级', '1003145', '四季春', '100000', '321.6', '6', '0.301', '北京', '24', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('685', '685', '二级', '1003145', '四季春', '100000', '18351.45', '6', '8.743', '北京', '1747.754', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('686', '686', '二级', '3007883', '四季春', '100000', '-214.4', '6', '-0.2', '北京', '-16', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('687', '687', '二级', '3007902', '四季春', '100000', '64', '6', '0.042', '北京', '5', '好药师达药房连锁', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('688', '688', '二级', '5027725', '四季春', '100000', '14437.5', '6', '6.875', '北京', '1375', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('689', '689', '二级', '5027725', '四季春', '100000', '18380.8', '6', '11.969', '北京', '1436', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('69', '69', '二级', '1002859', '四季春', '100000', '864', '2', '2', '北京', '240', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('690', '690', '二级', '5027764', '四季春', '100000', '550.4', '6', '0.358', '北京', '43', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('691', '691', '二级', '5045669', '四季春', '100000', '11904', '6', '7.75', '北京', '930', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('692', '692', '二级', '5051085', '四季春', '100000', '-44', '6', '-0.066', '北京', '-8', '好得快', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('693', '693', '二级', '5051085', '四季春', '100000', '45952', '6', '29.917', '北京', '3590', '好得快', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('694', '694', '一级', '100000', '四季春', '100000', '2618', '6', '3.965', '北京', '476', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('695', '695', '一级', '100000', '四季春', '100000', '52.64', '6', '0.088', '北京', '7', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('696', '696', '一级', '100000', '四季春', '100000', '120.6', '6', '0.113', '北京', '9', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('697', '697', '一级', '100000', '四季春', '100000', '79128', '6', '37.68', '北京', '7536', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('698', '698', '一级', '100000', '四季春', '100000', '382.55', '6', '0.292', '北京', '35', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('699', '699', '一级', '100000', '四季春', '100000', '85545.6', '6', '39.082', '北京', '4690', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('7', '7', '一级', '100000', '四季春', '100000', '262.32', '2', '0.2', '北京', '24', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('70', '70', '二级', '1002859', '四季春', '100000', '766.5', '2', '0.365', '北京', '73', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('700', '700', '一级', '100004', '华润商业集团', '100004', '14175', '6', '6.75', '北京', '1350', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('701', '701', '一级', '100004', '华润商业集团', '100004', '-218.6', '6', '-0.167', '北京', '-20', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('702', '702', '一级', '100004', '华润商业集团', '100004', '912', '6', '0.417', '北京', '50', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('703', '703', '二级', '100112', '四季春', '100000', '2878.45', '6', '1.371', '北京', '274.136', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('704', '704', '一级', '100957', '四药控股', '100957', '2835', '6', '1.35', '北京', '270', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('705', '705', '一级', '100957', '四药控股', '100957', '-590.22', '6', '-0.45', '北京', '-54', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('706', '706', '一级', '100957', '四药控股', '100957', '2371.2', '6', '1.083', '北京', '130', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('707', '707', '二级', '101164', '河北中健贸易集团', '100007', '105', '6', '0.05', '北京', '10', '保定中诚汇达贸易', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('708', '708', '二级', '1000001', '四季春', '100000', '374', '6', '0.568', '北京', '68', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('709', '709', '二级', '1000001', '四季春', '100000', '25704', '6', '12.24', '北京', '2448', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('71', '71', '二级', '1003145', '四季春', '100000', '1555.2', '2', '3.599', '北京', '432', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('710', '710', '二级', '1000089', '保定市久展销售', '101733', '27.5', '6', '0.042', '北京', '5', '河北顺泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('711', '711', '二级', '1000089', '保定市久展销售', '101733', '189.81', '6', '0.09', '北京', '18.078', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('712', '712', '二级', '1001288', '四季春', '100000', '423.5', '6', '0.642', '北京', '77', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('713', '713', '二级', '1001288', '四季春', '100000', '90.24', '6', '0.15', '北京', '12', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('714', '714', '二级', '1001288', '四季春', '100000', '134', '6', '0.125', '北京', '10', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('715', '715', '二级', '1001288', '四季春', '100000', '3736.02', '6', '1.783', '北京', '355.812', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('716', '716', '二级', '1002059', '赤峰四季春', '101468', '630', '6', '0.3', '北京', '60', '赤峰市金泰有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('717', '717', '一级', '1002856', '嘉事堂', '1002856', '13702.5', '6', '6.525', '北京', '1305', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('718', '718', '一级', '1002856', '嘉事堂', '1002856', '1094.4', '6', '0.5', '北京', '60', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('719', '719', '二级', '1002859', '四季春', '100000', '1050', '6', '0.5', '北京', '100', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('72', '72', '二级', '1003145', '四季春', '100000', '889.2', '2', '2.28', '北京', '228', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('720', '720', '二级', '1003145', '四季春', '100000', '627', '6', '0.95', '北京', '114', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('721', '721', '二级', '1003145', '四季春', '100000', '60.16', '6', '0.1', '北京', '8', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('722', '722', '二级', '1003145', '四季春', '100000', '268', '6', '0.251', '北京', '20', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('723', '723', '二级', '1003145', '四季春', '100000', '25450.54', '6', '12.122', '北京', '2423.86', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('724', '724', '二级', '1003494', '保定市久展销售', '101733', '349.05', '6', '0.166', '北京', '33.243', '滦平县惠仁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('725', '725', '二级', '5045669', '四季春', '100000', '320', '6', '0.208', '北京', '25', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('726', '726', '一级', '100000', '四季春', '100000', '81', '6', '0.015', '北京', '3', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('727', '727', '一级', '100000', '四季春', '100000', '495', '6', '0.75', '北京', '90', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('728', '728', '一级', '100000', '四季春', '100000', '75.2', '6', '0.126', '北京', '10', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('729', '729', '一级', '100000', '四季春', '100000', '522.6', '6', '0.487', '北京', '39', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('73', '73', '二级', '1003145', '四季春', '100000', '37.6', '2', '0.063', '北京', '5', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('730', '730', '一级', '100000', '四季春', '100000', '70', '6', '0.05', '北京', '10', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('731', '731', '一级', '100000', '四季春', '100000', '60081', '6', '28.61', '北京', '5722', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('732', '732', '一级', '100000', '四季春', '100000', '3453.88', '6', '2.633', '北京', '316', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('733', '733', '一级', '100000', '四季春', '100000', '63475.2', '6', '29.001', '北京', '3480', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('734', '734', '一级', '100004', '华润商业集团', '100004', '5250', '6', '2.5', '北京', '500', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('735', '735', '一级', '100004', '华润商业集团', '100004', '11856', '6', '5.417', '北京', '650', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('736', '736', '二级', '100112', '四季春', '100000', '5211.52', '6', '2.481', '北京', '496.337', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('737', '737', '一级', '100957', '四药控股', '100957', '57273.6', '6', '26.167', '北京', '3140', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('738', '738', '二级', '1000001', '四季春', '100000', '110', '6', '0.167', '北京', '20', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('739', '739', '二级', '1000001', '四季春', '100000', '8011.5', '6', '3.815', '北京', '763', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('74', '74', '二级', '1003145', '四季春', '100000', '1500.8', '2', '1.405', '北京', '112', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('740', '740', '二级', '1000089', '保定市久展销售', '101733', '16.16', '6', '0.008', '北京', '1.539', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('741', '741', '二级', '1001288', '四季春', '100000', '247.5', '6', '0.376', '北京', '45', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('742', '742', '二级', '1001288', '四季春', '100000', '268', '6', '0.25', '北京', '20', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('743', '743', '二级', '1001288', '四季春', '100000', '9485.49', '6', '4.516', '北京', '903.378', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('744', '744', '一级', '1002856', '嘉事堂', '1002856', '2100', '6', '1', '北京', '200', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('745', '745', '一级', '1002856', '嘉事堂', '1002856', '12220.8', '6', '5.584', '北京', '670', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('746', '746', '二级', '1002859', '四季春', '100000', '1320', '6', '2', '北京', '240', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('747', '747', '二级', '1002859', '四季春', '100000', '6279', '6', '2.99', '北京', '598', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('748', '748', '二级', '1002859', '四季春', '100000', '6566.4', '6', '3', '北京', '360', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('749', '749', '二级', '1003145', '四季春', '100000', '55', '6', '0.083', '北京', '10', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('75', '75', '二级', '1003145', '四季春', '100000', '661.5', '2', '0.315', '北京', '63', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('750', '750', '二级', '1003145', '四季春', '100000', '93.8', '6', '0.088', '北京', '7', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('751', '751', '二级', '1003145', '四季春', '100000', '25742.07', '6', '12.261', '北京', '2451.625', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('752', '752', '二级', '5027725', '四季春', '100000', '105', '6', '0.05', '北京', '10', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('753', '753', '二级', '5027725', '四季春', '100000', '768', '6', '0.5', '北京', '60', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('754', '754', '二级', '5045669', '四季春', '100000', '960', '6', '0.625', '北京', '75', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('755', '755', '一级', '100000', '四季春', '100000', '44', '6', '0.025', '北京', '5', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('756', '756', '一级', '100000', '四季春', '100000', '2442', '6', '3.702', '北京', '444', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('757', '757', '一级', '100000', '四季春', '100000', '1549.12', '6', '2.576', '北京', '206', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('758', '758', '一级', '100000', '四季春', '100000', '2398.6', '6', '2.239', '北京', '179', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('759', '759', '一级', '100000', '四季春', '100000', '45664.5', '6', '21.745', '北京', '4349', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('76', '76', '一级', '100957', '四药控股', '100957', '20', '2', '0.017', '北京', '10', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('760', '760', '一级', '100000', '四季春', '100000', '40823.55', '6', '31.126', '北京', '3735', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('761', '761', '一级', '100000', '四季春', '100000', '29001.6', '6', '13.25', '北京', '1590', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('762', '762', '一级', '100004', '华润商业集团', '100004', '90363', '6', '43.03', '北京', '8606', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('763', '763', '一级', '100004', '华润商业集团', '100004', '-1344.39', '6', '-1.025', '北京', '-123', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('764', '764', '一级', '100004', '华润商业集团', '100004', '115824', '6', '52.918', '北京', '6350', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('765', '765', '二级', '100112', '四季春', '100000', '36818.29', '6', '17.532', '北京', '3506.503', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('766', '766', '一级', '100957', '四药控股', '100957', '22879.5', '6', '10.895', '北京', '2179', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('767', '767', '一级', '100957', '四药控股', '100957', '65846.4', '6', '30.085', '北京', '3610', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('768', '768', '二级', '1000001', '四季春', '100000', '555.5', '6', '0.842', '北京', '101', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('769', '769', '二级', '1000001', '四季春', '100000', '86856', '6', '41.36', '北京', '8272', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('77', '77', '二级', '3007883', '四季春', '100000', '97.5', '2', '0.25', '北京', '25', '凯尔康大药房', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('770', '770', '二级', '1000089', '保定市久展销售', '101733', '874.8', '6', '0.415', '北京', '83.317', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('771', '771', '二级', '1000110', '四药乐仁堂', '100008', '110', '6', '0.167', '北京', '20', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('772', '772', '二级', '1000110', '四药乐仁堂', '100008', '2100', '6', '1', '北京', '200', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('773', '773', '二级', '1001288', '四季春', '100000', '781', '6', '1.184', '北京', '142', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('774', '774', '二级', '1001288', '四季春', '100000', '135.36', '6', '0.225', '北京', '18', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('775', '775', '二级', '1001288', '四季春', '100000', '254.6', '6', '0.238', '北京', '19', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('776', '776', '二级', '1001288', '四季春', '100000', '9677.54', '6', '4.613', '北京', '921.667', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('777', '777', '二级', '1001511', '保定市久展销售', '101733', '52.5', '6', '0.025', '北京', '5', '保定汇达分公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('778', '778', '一级', '1002856', '嘉事堂', '1002856', '260', '6', '0.2', '北京', '20', '嘉事堂', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('779', '779', '一级', '1002856', '嘉事堂', '1002856', '16275', '6', '7.75', '北京', '1550', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('78', '78', '二级', '3007898', '四季春', '100000', '42.9', '2', '0.11', '北京', '11', '医保中洋达药房', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('780', '780', '一级', '1002856', '嘉事堂', '1002856', '7651', '6', '5.833', '北京', '700', '嘉事堂', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('781', '781', '一级', '1002856', '嘉事堂', '1002856', '22708.8', '6', '10.376', '北京', '1245', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('782', '782', '二级', '1002859', '四季春', '100000', '260', '6', '0.2', '北京', '20', '天力泽', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('783', '783', '二级', '1002859', '四季春', '100000', '110', '6', '0.167', '北京', '20', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('784', '784', '二级', '1002859', '四季春', '100000', '29536.5', '6', '14.065', '北京', '2813', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('785', '785', '二级', '1003145', '四季春', '100000', '1006.5', '6', '1.524', '北京', '183', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('786', '786', '二级', '1003145', '四季春', '100000', '30.08', '6', '0.05', '北京', '4', '华润新龙（）', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('787', '787', '二级', '1003145', '四季春', '100000', '1969.8', '6', '1.84', '北京', '147', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('788', '788', '二级', '1003145', '四季春', '100000', '30588.79', '6', '14.567', '北京', '2913.213', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('789', '789', '二级', '3007883', '四季春', '100000', '-857.6', '6', '-0.801', '北京', '-64', '凯尔康大药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('79', '79', '二级', '3007898', '四季春', '100000', '26.8', '2', '0.025', '北京', '2', '医保中洋达药房', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('790', '790', '二级', '3027238', '兰州四季春', '100678', '385', '6', '0.583', '北京', '70', '甘肃德生堂科技集团', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('791', '791', '二级', '3027238', '兰州四季春', '100678', '902.4', '6', '1.5', '北京', '120', '甘肃德生堂科技集团', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('792', '792', '二级', '3027238', '兰州四季春', '100678', '8868.89', '6', '5.774', '北京', '692.882', '甘肃德生堂科技集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('793', '793', '二级', '5027725', '四季春', '100000', '8347.5', '6', '3.975', '北京', '795', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('794', '794', '二级', '5027725', '四季春', '100000', '19379.2', '6', '12.619', '北京', '1514', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('795', '795', '二级', '5027764', '四季春', '100000', '1369.6', '6', '0.892', '北京', '107', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('796', '796', '二级', '5045669', '四季春', '100000', '16896', '6', '11', '北京', '1320', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('797', '797', '二级', '5051085', '四季春', '100000', '-302.5', '6', '-0.458', '北京', '-55', '好得快', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('798', '798', '二级', '5051085', '四季春', '100000', '-8576', '6', '-5.583', '北京', '-670', '好得快', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('799', '799', '一级', '100000', '四季春', '100000', '154.8', '7', '0.357', '北京', '43', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('8', '8', '二级', '1000001', '四季春', '100000', '180', '2', '0.417', '北京', '50', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('80', '80', '二级', '3007902', '四季春', '100000', '42.9', '2', '0.11', '北京', '11', '好药师达药房连锁', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('800', '800', '一级', '100000', '四季春', '100000', '384', '7', '0.321', '北京', '192', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('801', '801', '一级', '100000', '四季春', '100000', '2041.06', '7', '1.992', '北京', '239', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('802', '802', '一级', '100000', '四季春', '100000', '7.4', '7', '0.01', '北京', '2', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('803', '803', '一级', '100000', '四季春', '100000', '338', '7', '0.26', '北京', '26', '四季春', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('804', '804', '一级', '100000', '四季春', '100000', '3456', '7', '0.64', '北京', '128', '四季春', '控销产品', '10002000301', '健阳颗粒 0.34g*12颗粒*1板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('805', '805', '一级', '100000', '四季春', '100000', '61.6', '7', '0.035', '北京', '7', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('806', '806', '一级', '100000', '四季春', '100000', '2348.5', '7', '3.559', '北京', '427', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('807', '807', '一级', '100000', '四季春', '100000', '255.68', '7', '0.426', '北京', '34', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('808', '808', '一级', '100000', '四季春', '100000', '1530', '7', '1.063', '北京', '85', '四季春', '零售产品', '10001000709', '清肺化痰颗粒 3克*15袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('809', '809', '一级', '100000', '四季春', '100000', '616.4', '7', '0.577', '北京', '46', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('81', '81', '二级', '3007902', '四季春', '100000', '45.12', '2', '0.075', '北京', '6', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('810', '810', '一级', '100000', '四季春', '100000', '1400', '7', '1', '北京', '200', '四季春', '零售产品', '10001003201', '咳喘灵颗粒 2克*3袋*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('811', '811', '一级', '100000', '四季春', '100000', '21', '7', '0.017', '北京', '2', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('812', '812', '一级', '100000', '四季春', '100000', '143293.5', '7', '68.235', '北京', '13647', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('813', '813', '一级', '100000', '四季春', '100000', '3989.45', '7', '3.041', '北京', '365', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('814', '814', '一级', '100000', '四季春', '100000', '24746.38', '7', '11.306', '北京', '1356.714', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('815', '815', '一级', '100000', '四季春', '100000', '201.6', '7', '0.116', '北京', '28', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '海淀');
INSERT INTO `poc_sales` VALUES ('816', '816', '一级', '100004', '华润商业集团', '100004', '506', '7', '0.422', '北京', '253', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('817', '817', '一级', '100004', '华润商业集团', '100004', '11.1', '7', '0.015', '北京', '3', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('818', '818', '一级', '100004', '华润商业集团', '100004', '9009', '7', '4.29', '北京', '858', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('819', '819', '一级', '100004', '华润商业集团', '100004', '22617.6', '7', '10.332', '北京', '1240', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('82', '82', '二级', '3007902', '四季春', '100000', '134', '2', '0.125', '北京', '10', '好药师达药房连锁', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('820', '820', '二级', '100112', '四季春', '100000', '88', '7', '0.05', '北京', '10', '丰瑞龙翔', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('821', '821', '二级', '100112', '四季春', '100000', '19209', '7', '9.151', '北京', '1829.429', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('822', '822', '一级', '100253', '科园信海经营', '100253', '60', '7', '0.05', '北京', '30', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('823', '823', '一级', '100253', '科园信海经营', '100253', '7140', '7', '3.4', '北京', '680', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('824', '824', '一级', '100253', '科园信海经营', '100253', '49977.6', '7', '22.833', '北京', '2740', '科园信海经营', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('825', '825', '一级', '100957', '四药控股', '100957', '10', '7', '0.008', '北京', '5', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('826', '826', '一级', '100957', '四药控股', '100957', '187.88', '7', '0.183', '北京', '22', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('827', '827', '一级', '100957', '四药控股', '100957', '18.5', '7', '0.025', '北京', '5', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('828', '828', '一级', '100957', '四药控股', '100957', '65100', '7', '31', '北京', '6200', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('829', '829', '一级', '100957', '四药控股', '100957', '-1388.11', '7', '-1.058', '北京', '-127', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('83', '83', '二级', '5027725', '四季春', '100000', '371.2', '2', '0.242', '北京', '29', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('830', '830', '一级', '100957', '四药控股', '100957', '47059.2', '7', '21.5', '北京', '2580', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('831', '831', '二级', '101164', '河北中健贸易集团', '100007', '787.5', '7', '0.375', '北京', '75', '保定中诚汇达贸易', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('832', '832', '二级', '1000001', '四季春', '100000', '0', '7', '0', '北京', '0', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('833', '833', '二级', '1000001', '四季春', '100000', '2486', '7', '3.768', '北京', '452', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('834', '834', '二级', '1000001', '四季春', '100000', '81196.5', '7', '38.665', '北京', '7733', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('835', '835', '二级', '1000001', '四季春', '100000', '36.48', '7', '0.016', '北京', '2', '凯宏鑫有限责任公司', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('836', '836', '二级', '1000089', '保定市久展销售', '101733', '19.5', '7', '0.05', '北京', '5', '河北顺泽', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('837', '837', '二级', '1000089', '保定市久展销售', '101733', '42.7', '7', '0.042', '北京', '5', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('838', '838', '二级', '1000089', '保定市久展销售', '101733', '75.2', '7', '0.125', '北京', '10', '河北顺泽', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('839', '839', '二级', '1000089', '保定市久展销售', '101733', '120.6', '7', '0.113', '北京', '9', '河北顺泽', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('84', '84', '二级', '5027764', '四季春', '100000', '25.6', '2', '0.017', '北京', '2', '德威治连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('840', '840', '二级', '1000089', '保定市久展销售', '101733', '645.88', '7', '0.308', '北京', '61.51', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('841', '841', '二级', '1000110', '四药乐仁堂', '100008', '577.5', '7', '0.275', '北京', '55', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('842', '842', '二级', '1001288', '四季春', '100000', '222.3', '7', '0.57', '北京', '57', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('843', '843', '二级', '1001288', '四季春', '100000', '1276', '7', '1.934', '北京', '232', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('844', '844', '二级', '1001288', '四季春', '100000', '263.2', '7', '0.437', '北京', '35', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('845', '845', '二级', '1001288', '四季春', '100000', '562.8', '7', '0.525', '北京', '42', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('846', '846', '二级', '1001288', '四季春', '100000', '39237.02', '7', '18.681', '北京', '3736.864', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('847', '847', '二级', '1001511', '保定市久展销售', '101733', '651', '7', '0.31', '北京', '62', '保定汇达分公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('848', '848', '一级', '1002856', '嘉事堂', '1002856', '2990', '7', '2.491', '北京', '1495', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('849', '849', '一级', '1002856', '嘉事堂', '1002856', '3416', '7', '3.333', '北京', '400', '嘉事堂', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('85', '85', '二级', '5051085', '四季春', '100000', '18', '2', '0.042', '北京', '5', '好得快', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('850', '850', '一级', '1002856', '嘉事堂', '1002856', '14.8', '7', '0.02', '北京', '4', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('851', '851', '一级', '1002856', '嘉事堂', '1002856', '2080', '7', '1.6', '北京', '160', '嘉事堂', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '海淀');
INSERT INTO `poc_sales` VALUES ('852', '852', '一级', '1002856', '嘉事堂', '1002856', '92137.5', '7', '43.875', '北京', '8775', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('853', '853', '一级', '1002856', '嘉事堂', '1002856', '76680.96', '7', '35.033', '北京', '4204', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('854', '854', '二级', '1002859', '四季春', '100000', '432', '7', '1', '北京', '120', '天力泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('855', '855', '二级', '1002859', '四季春', '100000', '160', '7', '0.133', '北京', '80', '天力泽', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '海淀');
INSERT INTO `poc_sales` VALUES ('856', '856', '二级', '1002859', '四季春', '100000', '18.5', '7', '0.025', '北京', '5', '天力泽', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('857', '857', '二级', '1002859', '四季春', '100000', '126.28', '7', '0.191', '北京', '22.96', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('858', '858', '二级', '1002859', '四季春', '100000', '67', '7', '0.063', '北京', '5', '天力泽', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('859', '859', '二级', '1002859', '四季春', '100000', '15844.5', '7', '7.545', '北京', '1509', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('86', '86', '一级', '100000', '四季春', '100000', '79.2', '3', '0.185', '北京', '22', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('860', '860', '二级', '1002859', '四季春', '100000', '3648', '7', '1.666', '北京', '200', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('861', '861', '二级', '1003145', '四季春', '100000', '72', '7', '0.167', '北京', '20', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('862', '862', '二级', '1003145', '四季春', '100000', '70.2', '7', '0.18', '北京', '18', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '海淀');
INSERT INTO `poc_sales` VALUES ('863', '863', '二级', '1003145', '四季春', '100000', '84.95', '7', '0.128', '北京', '15.445', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('864', '864', '二级', '1003145', '四季春', '100000', '348.4', '7', '0.326', '北京', '26', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('865', '865', '二级', '1003145', '四季春', '100000', '17703', '7', '8.43', '北京', '1686', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('866', '866', '二级', '3007902', '四季春', '100000', '247.5', '7', '0.375', '北京', '45', '好药师达药房连锁', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('867', '867', '二级', '3007902', '四季春', '100000', '75.2', '7', '0.124', '北京', '10', '好药师达药房连锁', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '海淀');
INSERT INTO `poc_sales` VALUES ('868', '868', '二级', '3007902', '四季春', '100000', '1690.5', '7', '0.805', '北京', '161', '好药师达药房连锁', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('869', '869', '二级', '5027725', '四季春', '100000', '87727.5', '7', '41.775', '北京', '8355', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '海淀');
INSERT INTO `poc_sales` VALUES ('87', '87', '一级', '100000', '四季春', '100000', '335.4', '3', '0.86', '北京', '86', '四季春', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('870', '870', '二级', '5027725', '四季春', '100000', '22848', '7', '14.876', '北京', '1785', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('871', '871', '二级', '5045669', '四季春', '100000', '7232', '7', '4.71', '北京', '565', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '海淀');
INSERT INTO `poc_sales` VALUES ('872', '872', '一级', '100000', '四季春', '100000', '1227.6', '7', '2.841', '北京', '341', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('873', '873', '一级', '100000', '四季春', '100000', '640', '7', '0.833', '北京', '50', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '密云');
INSERT INTO `poc_sales` VALUES ('874', '874', '一级', '100000', '四季春', '100000', '176', '7', '0.147', '北京', '88', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('875', '875', '一级', '100000', '四季春', '100000', '85.4', '7', '0.083', '北京', '10', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('876', '876', '一级', '100000', '四季春', '100000', '1760', '7', '1', '北京', '200', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('877', '877', '一级', '100000', '四季春', '100000', '1276', '7', '1.935', '北京', '232', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('878', '878', '一级', '100000', '四季春', '100000', '90.24', '7', '0.151', '北京', '12', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('879', '879', '一级', '100000', '四季春', '100000', '549.4', '7', '0.513', '北京', '41', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('88', '88', '一级', '100000', '四季春', '100000', '16', '3', '0.013', '北京', '8', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('880', '880', '一级', '100000', '四季春', '100000', '42', '7', '0.034', '北京', '4', '四季春', '零售产品', '10001006300', '牡蛎碳酸钙颗粒 5克*10袋*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('881', '881', '一级', '100000', '四季春', '100000', '207889.5', '7', '98.995', '北京', '19799', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('882', '882', '一级', '100000', '四季春', '100000', '47743.9', '7', '21.812', '北京', '2617.538', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('883', '883', '一级', '100000', '四季春', '100000', '36', '7', '0.021', '北京', '5', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '密云');
INSERT INTO `poc_sales` VALUES ('884', '884', '一级', '100004', '华润商业集团', '100004', '14', '7', '0.012', '北京', '7', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('885', '885', '一级', '100004', '华润商业集团', '100004', '10080', '7', '4.8', '北京', '960', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('886', '886', '二级', '100112', '四季春', '100000', '2652.51', '7', '1.263', '北京', '252.622', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('887', '887', '一级', '100253', '科园信海经营', '100253', '400', '7', '0.333', '北京', '200', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('888', '888', '一级', '100253', '科园信海经营', '100253', '4620', '7', '2.2', '北京', '440', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('889', '889', '一级', '100957', '四药控股', '100957', '200', '7', '0.167', '北京', '100', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('89', '89', '一级', '100000', '四季春', '100000', '421.12', '3', '0.701', '北京', '56', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('890', '890', '一级', '100957', '四药控股', '100957', '5092.5', '7', '2.425', '北京', '485', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('891', '891', '二级', '101164', '河北中健贸易集团', '100007', '110', '7', '0.167', '北京', '20', '保定中诚汇达贸易', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('892', '892', '二级', '101164', '河北中健贸易集团', '100007', '105', '7', '0.05', '北京', '10', '保定中诚汇达贸易', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('893', '893', '二级', '1000001', '四季春', '100000', '330', '7', '0.502', '北京', '60', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('894', '894', '二级', '1000001', '四季春', '100000', '27531', '7', '13.11', '北京', '2622', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('895', '895', '二级', '1000089', '保定市久展销售', '101733', '256.2', '7', '0.25', '北京', '30', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('896', '896', '二级', '1001288', '四季春', '100000', '259.2', '7', '0.6', '北京', '72', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('897', '897', '二级', '1001288', '四季春', '100000', '132.6', '7', '0.34', '北京', '34', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('898', '898', '二级', '1001288', '四季春', '100000', '368.5', '7', '0.559', '北京', '67', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('899', '899', '二级', '1001288', '四季春', '100000', '26.8', '7', '0.025', '北京', '2', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('9', '9', '二级', '1000001', '四季春', '100000', '117', '2', '0.3', '北京', '30', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('90', '90', '一级', '100000', '四季春', '100000', '1545.7', '3', '1.555', '北京', '124', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('900', '900', '二级', '1001288', '四季春', '100000', '4285.98', '7', '2.037', '北京', '408.188', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('901', '901', '二级', '1002059', '赤峰四季春', '101468', '55', '7', '0.083', '北京', '10', '赤峰市金泰有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('902', '902', '一级', '1002856', '嘉事堂', '1002856', '80', '7', '0.067', '北京', '40', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('903', '903', '一级', '1002856', '嘉事堂', '1002856', '9555', '7', '4.55', '北京', '910', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('904', '904', '一级', '1002856', '嘉事堂', '1002856', '1276.8', '7', '0.584', '北京', '70', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('905', '905', '二级', '1002859', '四季春', '100000', '210', '7', '0.1', '北京', '20', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('906', '906', '二级', '1003145', '四季春', '100000', '925.2', '7', '2.143', '北京', '257', '华润新龙（）', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('907', '907', '二级', '1003145', '四季春', '100000', '897', '7', '2.3', '北京', '230', '华润新龙（）', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '密云');
INSERT INTO `poc_sales` VALUES ('908', '908', '二级', '1003145', '四季春', '100000', '143', '7', '0.217', '北京', '26', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('909', '909', '二级', '1003145', '四季春', '100000', '268', '7', '0.25', '北京', '20', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '密云');
INSERT INTO `poc_sales` VALUES ('91', '91', '一级', '100000', '四季春', '100000', '2614.5', '3', '1.245', '北京', '249', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('910', '910', '二级', '1003145', '四季春', '100000', '37936.5', '7', '18.065', '北京', '3613', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('911', '911', '二级', '1003494', '保定市久展销售', '101733', '20', '7', '0.017', '北京', '10', '滦平县惠仁有限责任公司', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '密云');
INSERT INTO `poc_sales` VALUES ('912', '912', '二级', '1003494', '保定市久展销售', '101733', '31.83', '7', '0.031', '北京', '3.727', '滦平县惠仁有限责任公司', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('913', '913', '二级', '1003494', '保定市久展销售', '101733', '759.95', '7', '0.362', '北京', '72.376', '滦平县惠仁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '密云');
INSERT INTO `poc_sales` VALUES ('914', '914', '二级', '5045669', '四季春', '100000', '896', '7', '0.583', '北京', '70', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '密云');
INSERT INTO `poc_sales` VALUES ('915', '915', '一级', '100000', '四季春', '100000', '118.8', '7', '0.276', '北京', '33', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('916', '916', '一级', '100000', '四季春', '100000', '96', '7', '0.08', '北京', '48', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('917', '917', '一级', '100000', '四季春', '100000', '85.4', '7', '0.083', '北京', '10', '四季春', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('918', '918', '一级', '100000', '四季春', '100000', '-7.4', '7', '-0.01', '北京', '-2', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('919', '919', '一级', '100000', '四季春', '100000', '44', '7', '0.025', '北京', '5', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('92', '92', '一级', '100000', '四季春', '100000', '163.95', '3', '0.125', '北京', '15', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('920', '920', '一级', '100000', '四季春', '100000', '319', '7', '0.484', '北京', '58', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('921', '921', '一级', '100000', '四季春', '100000', '120.32', '7', '0.199', '北京', '16', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('922', '922', '一级', '100000', '四季春', '100000', '107.2', '7', '0.099', '北京', '8', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('923', '923', '一级', '100000', '四季春', '100000', '51618', '7', '24.58', '北京', '4916', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('924', '924', '一级', '100000', '四季春', '100000', '2404.6', '7', '1.833', '北京', '220', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('925', '925', '一级', '100000', '四季春', '100000', '38714.41', '7', '17.69', '北京', '2122.501', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('926', '926', '一级', '100000', '四季春', '100000', '115.2', '7', '0.066', '北京', '16', '四季春', '零售产品', '10009000202', '涩肠止泻散 4克*3袋*240盒', '房山');
INSERT INTO `poc_sales` VALUES ('927', '927', '一级', '100004', '华润商业集团', '100004', '170.8', '7', '0.167', '北京', '20', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('928', '928', '一级', '100004', '华润商业集团', '100004', '6300', '7', '3', '北京', '600', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('929', '929', '一级', '100004', '华润商业集团', '100004', '6548.16', '7', '2.992', '北京', '359', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('93', '93', '二级', '1000001', '四季春', '100000', '36', '3', '0.084', '北京', '10', '凯宏鑫有限责任公司', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('930', '930', '二级', '100112', '四季春', '100000', '1063.03', '7', '0.506', '北京', '101.24', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('931', '931', '一级', '100957', '四药控股', '100957', '52.5', '7', '0.025', '北京', '5', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('932', '932', '一级', '100957', '四药控股', '100957', '49649.28', '7', '22.686', '北京', '2722', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('933', '933', '二级', '1000001', '四季春', '100000', '209', '7', '0.317', '北京', '38', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('934', '934', '二级', '1000001', '四季春', '100000', '4273.5', '7', '2.035', '北京', '407', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('935', '935', '二级', '1001288', '四季春', '100000', '39', '7', '0.1', '北京', '10', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '房山');
INSERT INTO `poc_sales` VALUES ('936', '936', '二级', '1001288', '四季春', '100000', '357.5', '7', '0.543', '北京', '65', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('937', '937', '二级', '1001288', '四季春', '100000', '15.04', '7', '0.025', '北京', '2', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('938', '938', '二级', '1001288', '四季春', '100000', '8270.01', '7', '3.939', '北京', '787.622', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('939', '939', '一级', '1002856', '嘉事堂', '1002856', '100', '7', '0.083', '北京', '50', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '房山');
INSERT INTO `poc_sales` VALUES ('94', '94', '二级', '1000001', '四季春', '100000', '175.5', '3', '0.45', '北京', '45', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('940', '940', '一级', '1002856', '嘉事堂', '1002856', '18.5', '7', '0.025', '北京', '5', '嘉事堂', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('941', '941', '一级', '1002856', '嘉事堂', '1002856', '4830', '7', '2.3', '北京', '460', '嘉事堂', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('942', '942', '一级', '1002856', '嘉事堂', '1002856', '8116.8', '7', '3.709', '北京', '445', '嘉事堂', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('943', '943', '二级', '1002859', '四季春', '100000', '425', '7', '0.417', '北京', '50', '天力泽', '控销产品', '10001001100', '感冒清热颗粒 3克*10袋*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('944', '944', '二级', '1002859', '四季春', '100000', '557.57', '7', '0.843', '北京', '101.378', '天力泽', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('945', '945', '二级', '1002859', '四季春', '100000', '3423', '7', '1.63', '北京', '326', '天力泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('946', '946', '二级', '1002859', '四季春', '100000', '10944', '7', '5', '北京', '600', '天力泽', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('947', '947', '二级', '1003145', '四季春', '100000', '93.5', '7', '0.142', '北京', '17', '华润新龙（）', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('948', '948', '二级', '1003145', '四季春', '100000', '160.8', '7', '0.151', '北京', '12', '华润新龙（）', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '房山');
INSERT INTO `poc_sales` VALUES ('949', '949', '二级', '1003145', '四季春', '100000', '8137.5', '7', '3.875', '北京', '775', '华润新龙（）', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('95', '95', '二级', '1000001', '四季春', '100000', '804', '3', '0.751', '北京', '60', '凯宏鑫有限责任公司', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('950', '950', '二级', '5027725', '四季春', '100000', '420', '7', '0.2', '北京', '40', '金象大药房连锁有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '房山');
INSERT INTO `poc_sales` VALUES ('951', '951', '二级', '5027725', '四季春', '100000', '2368', '7', '1.542', '北京', '185', '金象大药房连锁有限责任公司', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('952', '952', '二级', '5045669', '四季春', '100000', '2176', '7', '1.417', '北京', '170', '嘉事堂连锁药店', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '房山');
INSERT INTO `poc_sales` VALUES ('953', '953', '一级', '100000', '四季春', '100000', '75.6', '7', '0.175', '北京', '21', '四季春', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('954', '954', '一级', '100000', '四季春', '100000', '3072', '7', '4', '北京', '240', '四季春', '基层产品', '10001000800', '板蓝根颗粒 10克*100袋*30包', '朝阳');
INSERT INTO `poc_sales` VALUES ('955', '955', '一级', '100000', '四季春', '100000', '1584', '7', '1.321', '北京', '792', '四季春', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('956', '956', '一级', '100000', '四季春', '100000', '37', '7', '0.05', '北京', '10', '四季春', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('957', '957', '一级', '100000', '四季春', '100000', '260', '7', '0.2', '北京', '20', '四季春', '控销产品', '10001001401', '益母草颗粒 15克*4袋*40盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('958', '958', '一级', '100000', '四季春', '100000', '44', '7', '0.025', '北京', '5', '四季春', '控销产品', '10005000600', '感冒颗粒 12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('959', '959', '一级', '100000', '四季春', '100000', '1892', '7', '2.867', '北京', '344', '四季春', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('96', '96', '二级', '1000001', '四季春', '100000', '1816.5', '3', '0.865', '北京', '173', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('960', '960', '一级', '100000', '四季春', '100000', '812.16', '7', '1.352', '北京', '108', '四季春', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('961', '961', '一级', '100000', '四季春', '100000', '737', '7', '0.687', '北京', '55', '四季春', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('962', '962', '一级', '100000', '四季春', '100000', '55240.5', '7', '26.305', '北京', '5261', '四季春', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('963', '963', '一级', '100000', '四季春', '100000', '109.3', '7', '0.083', '北京', '10', '四季春', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('964', '964', '一级', '100000', '四季春', '100000', '32435.34', '7', '14.817', '北京', '1778.253', '四季春', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('965', '965', '一级', '100004', '华润商业集团', '100004', '7172', '7', '5.975', '北京', '3586', '华润商业集团', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('966', '966', '一级', '100004', '华润商业集团', '100004', '239.12', '7', '0.233', '北京', '28', '华润商业集团', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('967', '967', '一级', '100004', '华润商业集团', '100004', '14.8', '7', '0.02', '北京', '4', '华润商业集团', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('968', '968', '一级', '100004', '华润商业集团', '100004', '116781', '7', '55.61', '北京', '11122', '华润商业集团', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('969', '969', '一级', '100004', '华润商业集团', '100004', '41532.48', '7', '18.976', '北京', '2277', '华润商业集团', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('97', '97', '一级', '100004', '华润商业集团', '100004', '312.86', '3', '0.239', '北京', '28.623', '华润商业集团', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('970', '970', '二级', '100112', '四季春', '100000', '9524.93', '7', '4.533', '北京', '907.137', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('971', '971', '一级', '100253', '科园信海经营', '100253', '112', '7', '0.093', '北京', '56', '科园信海经营', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('972', '972', '一级', '100253', '科园信海经营', '100253', '3150', '7', '1.5', '北京', '300', '科园信海经营', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('973', '973', '一级', '100253', '科园信海经营', '100253', '7113.6', '7', '3.25', '北京', '390', '科园信海经营', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('974', '974', '一级', '100957', '四药控股', '100957', '506', '7', '0.423', '北京', '253', '四药控股', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');
INSERT INTO `poc_sales` VALUES ('975', '975', '一级', '100957', '四药控股', '100957', '1127.28', '7', '1.1', '北京', '132', '四药控股', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('976', '976', '一级', '100957', '四药控股', '100957', '77.7', '7', '0.105', '北京', '21', '四药控股', '基层产品', '10006001900', '柴胡注射液 2克*10支*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('977', '977', '一级', '100957', '四药控股', '100957', '30345', '7', '14.45', '北京', '2890', '四药控股', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('978', '978', '一级', '100957', '四药控股', '100957', '-2043.91', '7', '-1.559', '北京', '-187', '四药控股', '零售产品', '10005000512', '铜绿颗粒 0.45克*12粒*3板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('979', '979', '一级', '100957', '四药控股', '100957', '39580.8', '7', '18.083', '北京', '2170', '四药控股', '零售产品', '10005000514', '铜绿颗粒 0.45克*12粒*4板*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('98', '98', '二级', '100112', '四季春', '100000', '1291.5', '3', '0.615', '北京', '123', '丰瑞龙翔', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('980', '980', '二级', '101164', '河北中健贸易集团', '100007', '157.5', '7', '0.075', '北京', '15', '保定中诚汇达贸易', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('981', '981', '二级', '1000001', '四季春', '100000', '0', '7', '0', '北京', '0', '凯宏鑫有限责任公司', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('982', '982', '二级', '1000001', '四季春', '100000', '236.5', '7', '0.359', '北京', '43', '凯宏鑫有限责任公司', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('983', '983', '二级', '1000001', '四季春', '100000', '10836', '7', '5.16', '北京', '1032', '凯宏鑫有限责任公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('984', '984', '二级', '1000089', '保定市久展销售', '101733', '72', '7', '0.167', '北京', '20', '河北顺泽', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('985', '985', '二级', '1000089', '保定市久展销售', '101733', '19.5', '7', '0.05', '北京', '5', '河北顺泽', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('986', '986', '二级', '1000089', '保定市久展销售', '101733', '128.1', '7', '0.125', '北京', '15', '河北顺泽', '基层产品', '10006001100', '灯盏注射液 10克*5支*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('987', '987', '二级', '1000089', '保定市久展销售', '101733', '276.8', '7', '0.132', '北京', '26.362', '河北顺泽', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('988', '988', '二级', '1000094', '保定市久展销售', '101733', '55', '7', '0.083', '北京', '10', '河北冀北物流', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('989', '989', '二级', '1000110', '四药乐仁堂', '100008', '27.5', '7', '0.042', '北京', '5', '廊坊市中诚康宇', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('99', '99', '二级', '1001288', '四季春', '100000', '18', '3', '0.042', '北京', '5', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('990', '990', '二级', '1000110', '四药乐仁堂', '100008', '892.5', '7', '0.425', '北京', '85', '廊坊市中诚康宇', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('991', '991', '二级', '1000154', '赤峰四季春', '101468', '210', '7', '0.1', '北京', '20', '赤峰颈复康', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('992', '992', '二级', '1001288', '四季春', '100000', '7.2', '7', '0.017', '北京', '2', '悦康源通', '基层产品', '10001000306', '氨酚那敏颗粒 100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('993', '993', '二级', '1001288', '四季春', '100000', '15.6', '7', '0.04', '北京', '4', '悦康源通', '基层产品', '10001000402', '酚氨咖敏颗粒 5克*100袋*100包', '朝阳');
INSERT INTO `poc_sales` VALUES ('994', '994', '二级', '1001288', '四季春', '100000', '1562', '7', '2.367', '北京', '284', '悦康源通', '零售产品', '10001000113', '氨酚黄那敏颗粒  100袋/盒*1100盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('995', '995', '二级', '1001288', '四季春', '100000', '60.16', '7', '0.1', '北京', '8', '悦康源通', '零售产品', '10001000500', '葡萄糖酸锌颗粒 70mg*4袋/盒*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('996', '996', '二级', '1001288', '四季春', '100000', '603', '7', '0.563', '北京', '45', '悦康源通', '零售产品', '10001001500', '通脉颗粒 4克*4袋*80盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('997', '997', '二级', '1001288', '四季春', '100000', '27586.97', '7', '13.132', '北京', '2627.333', '悦康源通', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('998', '998', '二级', '1001511', '保定市久展销售', '101733', '52.5', '7', '0.025', '北京', '5', '保定汇达分公司', '零售产品', '10005000500', '铜绿颗粒 0.45克*12粒*2板*1000盒', '朝阳');
INSERT INTO `poc_sales` VALUES ('999', '999', '一级', '1002856', '嘉事堂', '1002856', '346', '7', '0.289', '北京', '173', '嘉事堂', '基层产品', '10002000101', '阿司匹林肠溶颗粒 25mg*100颗粒*300瓶', '朝阳');

-- ----------------------------
-- Table structure for poc_sale_analysis
-- ----------------------------
DROP TABLE IF EXISTS `poc_sale_analysis`;
CREATE TABLE `poc_sale_analysis` (
  `ID_` varchar(40) NOT NULL,
  `LEDGER_ID_` varchar(40) DEFAULT NULL,
  `SALE_APRI1_` int(11) DEFAULT NULL,
  `SALE_APRI2_` int(11) DEFAULT NULL,
  `SALE_AUG1_` int(11) DEFAULT NULL,
  `SALE_AUG2_` int(11) DEFAULT NULL,
  `SALE_DEC1_` int(11) DEFAULT NULL,
  `SALE_DEC2_` int(11) DEFAULT NULL,
  `SALE_FEB1_` int(11) DEFAULT NULL,
  `SALE_FEB2_` int(11) DEFAULT NULL,
  `SALE_JAN1_` int(11) DEFAULT NULL,
  `SALE_JAN2_` int(11) DEFAULT NULL,
  `SALE_JUL1_` int(11) DEFAULT NULL,
  `SALE_JUL2_` int(11) DEFAULT NULL,
  `SALE_JUN1_` int(11) DEFAULT NULL,
  `SALE_JUN2_` int(11) DEFAULT NULL,
  `SALE_MAR1_` int(11) DEFAULT NULL,
  `SALE_MAR2_` int(11) DEFAULT NULL,
  `SALE_MAY1_` int(11) DEFAULT NULL,
  `SALE_MAY2_` int(11) DEFAULT NULL,
  `SALE_NOV1_` int(11) DEFAULT NULL,
  `SALE_NOV2_` int(11) DEFAULT NULL,
  `SALE_OCT1_` int(11) DEFAULT NULL,
  `SALE_OCT2_` int(11) DEFAULT NULL,
  `SALE_SEP1_` int(11) DEFAULT NULL,
  `SALE_SEP2_` int(11) DEFAULT NULL,
  `SALE_TOTAL1_` int(11) DEFAULT NULL,
  `SALE_TOTAL2_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_sale_analysis
-- ----------------------------

-- ----------------------------
-- Table structure for poc_sendout_analysis
-- ----------------------------
DROP TABLE IF EXISTS `poc_sendout_analysis`;
CREATE TABLE `poc_sendout_analysis` (
  `ID_` varchar(40) NOT NULL,
  `LEDGER_ID_` varchar(40) DEFAULT NULL,
  `SENDOUT_APRI_` int(11) DEFAULT NULL,
  `SENDOUT_AUG_` int(11) DEFAULT NULL,
  `SENDOUT_DEC_` int(11) DEFAULT NULL,
  `SENDOUT_FEB_` int(11) DEFAULT NULL,
  `SENDOUT_JAN_` int(11) DEFAULT NULL,
  `SENDOUT_JUL_` int(11) DEFAULT NULL,
  `SENDOUT_JUN_` int(11) DEFAULT NULL,
  `SENDOUT_MAR_` int(11) DEFAULT NULL,
  `SENDOUT_MAY_` int(11) DEFAULT NULL,
  `SENDOUT_NOV_` int(11) DEFAULT NULL,
  `SENDOUT_OCT_` int(11) DEFAULT NULL,
  `SENDOUT_SEP_` int(11) DEFAULT NULL,
  `SENDOUT_TOTAL_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_sendout_analysis
-- ----------------------------

-- ----------------------------
-- Table structure for poc_send_out
-- ----------------------------
DROP TABLE IF EXISTS `poc_send_out`;
CREATE TABLE `poc_send_out` (
  `UUID_` varchar(40) NOT NULL,
  `BOX_PRICE_` varchar(40) DEFAULT NULL,
  `CAUSE_DEPT_` varchar(40) DEFAULT NULL,
  `CAUSE_DEPT_ID_` varchar(40) DEFAULT NULL,
  `CUSTOMER_` varchar(40) DEFAULT NULL,
  `CUSTOMER_NO_` varchar(40) DEFAULT NULL,
  `DATE_` varchar(40) DEFAULT NULL,
  `DISCOUNT_` varchar(40) DEFAULT NULL,
  `HIGH_` varchar(40) DEFAULT NULL,
  `HIGH_PRICE_` varchar(40) DEFAULT NULL,
  `NO_HIGH_` varchar(40) DEFAULT NULL,
  `NUMBER_` varchar(40) DEFAULT NULL,
  `OFFICE_` varchar(40) DEFAULT NULL,
  `OFFICE_ID_` varchar(40) DEFAULT NULL,
  `Packet_NUMBER_` varchar(40) DEFAULT NULL,
  `PRODUCT_NO_` varchar(40) DEFAULT NULL,
  `PRODUCT_NAME_` varchar(255) DEFAULT NULL,
  `REMARKS_` varchar(255) DEFAULT NULL,
  `SALES_DOCUMENT_` varchar(40) DEFAULT NULL,
  `TAX_MONEY_` varchar(40) DEFAULT NULL,
  `TAX_THOUSAND_MONEY_` varchar(40) DEFAULT NULL,
  `UNIT_PRICE_` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`UUID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poc_send_out
-- ----------------------------

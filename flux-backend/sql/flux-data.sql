/*
 Navicat Premium Dump SQL

 Source Server         : flux-data
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : 49.232.209.33:3306
 Source Schema         : flux-data

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 29/01/2025 17:08:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apscheduler_jobs
-- ----------------------------
DROP TABLE IF EXISTS `apscheduler_jobs`;
CREATE TABLE `apscheduler_jobs` (
  `id` varchar(191) NOT NULL,
  `next_run_time` double DEFAULT NULL,
  `job_state` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_apscheduler_jobs_next_run_time` (`next_run_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of apscheduler_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for car_info
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志',
  `car_name` varchar(255) DEFAULT NULL COMMENT '小车名称',
  `lng` float DEFAULT NULL COMMENT '经度',
  `lat` float DEFAULT NULL COMMENT '纬度',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `manager` int(11) DEFAULT NULL COMMENT '管理员ID',
  `location` varchar(255) DEFAULT NULL COMMENT '所在位置',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `car_type` int(11) NOT NULL DEFAULT '1' COMMENT '车辆类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='小车信息';

-- ----------------------------
-- Records of car_info
-- ----------------------------
BEGIN;
INSERT INTO `car_info` (`id`, `create_time`, `update_time`, `del_flag`, `car_name`, `lng`, `lat`, `image`, `manager`, `location`, `price`, `car_type`) VALUES (1, '2025-01-18 08:33:52', '2025-01-18 08:33:52', '0', '小车一号', 35.3234, 173.323, 'https://image.baidu.com', 3, '北京市朝阳区望京CDB', 520.00, 1);
INSERT INTO `car_info` (`id`, `create_time`, `update_time`, `del_flag`, `car_name`, `lng`, `lat`, `image`, `manager`, `location`, `price`, `car_type`) VALUES (2, '2025-01-18 08:33:54', '2025-01-18 08:33:54', '0', '小车二号', 180.323, 35.9323, 'qiniu.com', 3, '苏宁写字楼', 588.00, 2);
INSERT INTO `car_info` (`id`, `create_time`, `update_time`, `del_flag`, `car_name`, `lng`, `lat`, `image`, `manager`, `location`, `price`, `car_type`) VALUES (3, '2025-01-18 08:36:48', '2025-01-18 08:36:48', '0', '小车三号', 169.323, 35.3232, 'qiniu.com3', 3, '鲁能大厦', 988.00, 2);
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`table_id`) USING BTREE,
  UNIQUE KEY `gen_table_id` (`table_id`) USING BTREE COMMENT 'unique'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `tpl_web_type`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (12, 'car_info', '小车信息', NULL, NULL, 'CarInfo', 'crud', 'element-plus', 'module_admin', 'car', 'info', '小车信息', 'richard', '0', '/', '{\"parentMenuId\": 2028}', '', '2025-01-18 09:52:42', '', '2025-01-18 09:52:42', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `python_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `python_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (147, 12, 'id', 'id', 'int(11)', 'int', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (148, 12, 'create_time', '创建时间', 'datetime', 'datetime', 'create_time', '0', '0', '0', '1', NULL, '1', '1', 'EQ', 'datetime', '', 2, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (149, 12, 'update_time', '更新时间', 'datetime', 'datetime', 'update_time', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 3, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (150, 12, 'del_flag', '删除标志', 'char(1)', 'str', 'del_flag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (151, 12, 'car_name', '小车名称', 'varchar(255)', 'str', 'car_name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (152, 12, 'lng', '经度', 'float', 'float', 'lng', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 6, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (153, 12, 'lat', '纬度', 'float', 'float', 'lat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (154, 12, 'image', '图片', 'varchar(255)', 'str', 'image', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (155, 12, 'manager', '管理员ID', 'int(11)', 'int', 'manager', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (156, 12, 'location', '所在位置', 'varchar(255)', 'str', 'location', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 10, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (157, 12, 'price', '价格', 'decimal(10,2)', 'float', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `python_type`, `python_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (158, 12, 'car_type', '车辆类型', 'int(11)', 'int', 'car_type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'car_type', 12, '', '2025-01-26 21:38:37', '', '2025-01-26 21:38:37', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-11-13 14:12:02', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-11-13 14:12:02', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-11-13 14:12:02', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-11-13 14:12:02', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-11-13 14:12:02', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-11-13 14:12:02', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '集团总公司', 0, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳分公司', 1, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (200, 100, '0,100', '托管事业部', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-12-14 16:42:36', 'admin', '2024-12-14 16:42:36');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (201, 200, '0,100,200', '项目一部', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-12-14 16:42:47', 'admin', '2024-12-14 16:42:47');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (202, 200, '0,100,200', '项目二部', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-12-14 16:42:55', 'admin', '2024-12-14 16:42:55');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'default', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '数据库', 'sqlalchemy', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '数据库分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 3, 'redis', 'redis', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, 'reids分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 1, '默认', 'default', 'sys_job_executor', '', '', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '线程池');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 2, '进程池', 'processpool', 'sys_job_executor', '', '', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '进程池');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (30, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (31, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (32, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, 0, '已上架', '1', 'news_status', NULL, 'success', 'N', '0', 'admin', '2024-11-30 13:50:32', 'admin', '2024-11-30 13:50:32', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, 0, '下架', '0', 'news_status', NULL, 'danger', 'N', '0', 'admin', '2024-11-30 13:50:55', 'admin', '2024-11-30 13:50:55', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, 0, '免费', '0', 'new_charge', NULL, 'info', 'N', '0', 'admin', '2024-11-30 13:52:13', 'admin', '2024-11-30 13:52:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, 0, '收费', '1', 'new_charge', NULL, 'success', 'N', '0', 'admin', '2024-11-30 13:52:25', 'admin', '2024-11-30 13:52:25', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, 0, '置顶', '1', 'news_top', NULL, 'primary', 'N', '0', 'admin', '2024-11-30 13:56:24', 'admin', '2024-11-30 13:56:32', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, 0, '不置顶', '0', 'news_top', NULL, 'info', 'N', '0', 'admin', '2024-11-30 13:56:50', 'admin', '2024-11-30 13:56:50', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, 0, '未处理', '0', 'cooperation_status', NULL, 'danger', 'N', '0', 'admin', '2024-12-24 14:27:34', 'admin', '2024-12-24 14:28:40', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, 0, '已处理', '1', 'cooperation_status', NULL, 'success', 'N', '0', 'admin', '2024-12-24 14:28:04', 'admin', '2024-12-24 14:28:04', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, 0, '已废弃', '2', 'cooperation_status', NULL, 'info', 'N', '0', 'admin', '2024-12-24 14:28:24', 'admin', '2024-12-24 14:28:24', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, 0, '越野车', '1', 'car_type', NULL, 'primary', 'N', '0', 'admin', '2025-01-17 14:12:25', 'admin', '2025-01-17 14:12:25', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, 0, '小汽车', '2', 'car_type', NULL, 'success', 'N', '0', 'admin', '2025-01-17 14:12:48', 'admin', '2025-01-17 14:12:48', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '任务执行器', 'sys_job_executor', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '任务执行器列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '系统是否', 'sys_yes_no', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知类型', 'sys_notice_type', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '通知状态', 'sys_notice_status', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '操作类型', 'sys_oper_type', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, '系统状态', 'sys_common_status', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, 'test', 'test', '0', 'admin', '2024-11-16 10:10:04', 'admin', '2024-11-16 10:10:04', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '新闻上架状态', 'news_status', '0', 'admin', '2024-11-30 13:49:17', 'admin', '2024-11-30 13:49:17', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '新闻收费状态', 'new_charge', '0', 'admin', '2024-11-30 13:51:33', 'admin', '2024-11-30 13:51:33', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '新闻置顶', 'news_top', '0', 'admin', '2024-11-30 13:53:04', 'admin', '2024-11-30 13:53:04', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '合作意向状态', 'cooperation_status', '0', 'admin', '2024-12-24 14:26:48', 'admin', '2024-12-24 14:26:48', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '车辆类型', 'car_type', '0', 'admin', '2025-01-17 14:11:44', 'admin', '2025-01-17 14:11:44', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'default' COMMENT '任务组名',
  `job_executor` varchar(64) DEFAULT 'default' COMMENT '任务执行器',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) DEFAULT '' COMMENT '位置参数',
  `job_kwargs` varchar(255) DEFAULT '' COMMENT '关键字参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'default', 'default', 'module_task.scheduler_test.job', NULL, NULL, '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'default', 'default', 'module_task.scheduler_test.job', 'test', NULL, '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'default', 'default', 'module_task.scheduler_test.job', 'new', '{\"test\": 111}', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '文章每日生成', 'default', 'default', 'module_task.scheduler_test.gen_article_job', '', '', '0 0 0 1/1 * ?', '1', '1', '0', 'admin', '2024-11-29 15:42:14', 'admin', '2025-01-02 09:28:41', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_executor` varchar(64) NOT NULL COMMENT '任务执行器',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) DEFAULT '' COMMENT '位置参数',
  `job_kwargs` varchar(255) DEFAULT '' COMMENT '关键字参数',
  `job_trigger` varchar(255) DEFAULT '' COMMENT '任务触发器',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (295, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-14 00:03:19', '0', '', '2025-01-14 00:03:19');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (296, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-14 00:03:19', '1', 'Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided. \', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}, \'request_id\': \'92226003-d819-9e58-b207-f154dee58c73\'}', '2025-01-14 00:03:20');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (297, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-15 00:06:52', '0', '', '2025-01-15 00:06:53');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (298, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-15 00:06:53', '1', 'Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided. \', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}, \'request_id\': \'28e4d7e1-e5d7-912c-8104-c82dcc94fb79\'}', '2025-01-15 00:06:53');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (299, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-16 00:00:22', '0', '', '2025-01-16 00:00:22');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (300, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-16 00:00:23', '1', 'Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided. \', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}, \'request_id\': \'01c6dd84-c7c0-9583-9b6d-48dc5449517d\'}', '2025-01-16 00:00:23');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (301, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-17 00:00:20', '0', '', '2025-01-17 00:00:20');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (302, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-17 00:00:20', '1', 'Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided. \', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}, \'request_id\': \'837660d4-4d47-9930-8dd5-de699c8f78bc\'}', '2025-01-17 00:00:21');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (303, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-18 00:00:00', '0', '', '2025-01-18 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (304, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-18 00:00:00', '1', 'Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided. \', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}, \'request_id\': \'f94031af-4016-9ead-b6c7-d0f030f73b13\'}', '2025-01-18 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (305, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-25 00:00:00', '0', '', '2025-01-25 00:00:01');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (306, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-25 00:00:01', '0', '', '2025-01-25 00:00:01');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (307, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-26 00:00:00', '0', '', '2025-01-26 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (308, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-26 00:00:00', '0', '', '2025-01-26 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (309, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-27 00:00:00', '0', '', '2025-01-27 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (310, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-27 00:00:00', '0', '', '2025-01-27 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (311, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-28 00:00:00', '0', '', '2025-01-28 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (312, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-28 00:00:00', '0', '', '2025-01-28 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (313, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-29 00:00:00', '0', '', '2025-01-29 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (314, '文章每日生成', 'default', 'default', 'module_task.scheduler_test:gen_article_job', '', '{}', 'cron[month=\'*\', day=\'1/1\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 100, 任务名称: 文章每日生成, 执行于2025-01-29 00:00:00', '0', '', '2025-01-29 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (185, 'admin', '', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-13 13:47:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (186, 'admin', '', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-20 10:46:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (187, 'admin', '', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-20 16:15:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (188, 'admin', '112.224.180.92', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-20 17:52:15');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (189, 'admin', '112.224.180.92', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-20 18:00:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (190, 'admin', '140.250.214.3', '内网IP', 'Chrome 131', 'Mac OS X 10', '1', '密码错误', '2025-01-21 08:28:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (191, 'admin', '140.250.214.3', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-21 08:28:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (192, 'admin', '140.250.249.68', '内网IP', 'Safari 18', 'Mac OS X 10', '0', '登录成功', '2025-01-21 13:08:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (193, 'admin', '36.152.33.122', '内网IP', 'Chrome 131', 'Mac OS X 10', '1', '密码错误', '2025-01-21 16:48:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (194, 'admin', '164.70.92.16', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-21 17:51:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (195, 'admin', '140.250.214.3', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-23 10:08:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (196, 'admin', '111.193.25.236', '内网IP', 'Chrome 128', 'Windows 10', '0', '登录成功', '2025-01-23 18:18:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (197, 'admin', '140.250.214.3', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-24 11:24:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (198, 'admin', '112.224.179.163', '内网IP', 'Chrome 131', 'Mac OS X 10', '1', '验证码已失效', '2025-01-24 17:20:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (199, 'admin', '112.224.179.163', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-24 17:20:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (200, 'admin', '119.147.10.199', '内网IP', 'Chrome 132', 'Windows 10', '0', '登录成功', '2025-01-25 09:09:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (201, 'admin', '171.41.89.110', '内网IP', 'Edge 120', 'Windows 10', '0', '登录成功', '2025-01-25 20:19:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (202, 'admin', '113.27.21.236', '内网IP', 'Chrome 116', 'Windows 10', '0', '登录成功', '2025-01-26 01:16:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (203, 'admin', '114.226.164.142', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-26 11:58:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (204, 'admin', '61.147.250.9', '内网IP', 'Chrome 122', 'Windows 10', '0', '登录成功', '2025-01-26 14:00:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (205, 'admin', '223.73.115.216', '内网IP', 'Chrome 122', 'Windows 10', '0', '登录成功', '2025-01-26 15:02:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (206, 'admin', '58.22.113.159', '内网IP', 'Chrome Mobile WebView 130', 'Android 13', '0', '登录成功', '2025-01-26 18:56:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (207, 'admin', '223.101.194.66', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-26 20:05:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (208, 'admin', '36.28.153.234', '内网IP', 'Chrome Mobile 131', 'Android 10', '0', '登录成功', '2025-01-26 21:00:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (209, 'admin', '124.162.194.11', '内网IP', 'Edge 131', 'Windows 10', '0', '登录成功', '2025-01-26 21:08:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (210, 'admin', '112.50.59.12', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-26 21:30:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (211, 'admin', '121.207.61.63', '内网IP', 'Chrome 114', 'Android 12', '0', '登录成功', '2025-01-27 01:40:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (212, 'admin', '123.115.83.72', '内网IP', 'Firefox 135', 'Windows 10', '0', '登录成功', '2025-01-27 08:08:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (213, 'admin', '183.50.207.9', '内网IP', 'Edge Mobile 132', 'Android 10', '0', '登录成功', '2025-01-27 08:33:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (214, 'admin', '124.89.49.92', '内网IP', 'Chrome 132', 'Linux', '0', '登录成功', '2025-01-27 08:46:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (215, 'admin', '101.90.158.73', '内网IP', 'Safari 16', 'Mac OS X 10', '0', '登录成功', '2025-01-27 08:57:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (216, 'admin', '101.90.158.73', '内网IP', 'Safari 16', 'Mac OS X 10', '0', '登录成功', '2025-01-27 08:59:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (217, 'admin', '111.18.139.19', '内网IP', 'Chrome 131', 'Windows 10', '0', '登录成功', '2025-01-27 11:38:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (218, 'admin', '39.162.140.142', '内网IP', 'Chrome Mobile WebView 120', 'Android 14', '1', '密码错误', '2025-01-27 11:50:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (219, 'admin', '39.162.140.142', '内网IP', 'Chrome Mobile WebView 120', 'Android 14', '1', '密码错误', '2025-01-27 11:50:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (220, 'admin', '39.162.140.142', '内网IP', 'Chrome Mobile WebView 120', 'Android 14', '1', '密码错误', '2025-01-27 11:50:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (221, 'admin', '39.162.140.142', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 11:56:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (222, 'admin', '223.101.194.66', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 13:18:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (223, 'admin', '111.52.95.156', '内网IP', 'Chrome 132', 'Windows 10', '0', '登录成功', '2025-01-27 14:04:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (224, 'admin', '36.25.168.35', '内网IP', 'Chrome 132', 'Windows 10', '0', '登录成功', '2025-01-27 14:49:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (225, 'admin', '183.4.20.178', '内网IP', 'Chrome 132', 'Linux', '0', '登录成功', '2025-01-27 15:20:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (226, 'admin', '106.224.156.171', '内网IP', 'MiuiBrowser 19', 'Android 15', '1', '验证码错误', '2025-01-27 15:34:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (227, 'admin', '106.224.156.171', '内网IP', 'MiuiBrowser 19', 'Android 15', '0', '登录成功', '2025-01-27 15:34:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (228, 'admin', '117.152.131.116', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 16:48:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (229, 'admin', '146.19.163.105', '内网IP', 'Chrome 132', 'Mac OS X 10', '0', '登录成功', '2025-01-27 17:02:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (230, 'admin', '120.235.101.57', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 17:36:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (231, 'admin', '117.152.131.116', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 19:08:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (232, 'admin', '223.101.194.66', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 20:16:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (233, 'admin', '1.30.81.32', '内网IP', 'Edge 131', 'Mac OS X 10', '0', '登录成功', '2025-01-27 20:31:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (234, 'admin', '61.184.8.51', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-27 21:15:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (235, 'admin', '60.9.29.102', '内网IP', 'Safari 18', 'Mac OS X 10', '0', '登录成功', '2025-01-27 23:37:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (236, 'admin', '42.48.161.41', '内网IP', 'Chrome Mobile 125', 'Android 10', '0', '登录成功', '2025-01-28 00:11:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (237, 'admin', '183.212.180.77', '内网IP', 'Edge 131', 'Windows 10', '0', '登录成功', '2025-01-28 08:11:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (238, 'admin', '39.146.6.73', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-28 08:17:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (239, 'admin', '223.157.236.39', '内网IP', 'Chrome Mobile WebView 129', 'Android 14', '1', '验证码错误', '2025-01-28 08:22:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (240, 'admin', '223.157.236.39', '内网IP', 'Chrome Mobile WebView 129', 'Android 14', '0', '登录成功', '2025-01-28 08:22:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (241, 'admin', '115.206.208.118', '内网IP', 'Chrome 132', 'Windows 10', '0', '登录成功', '2025-01-28 09:54:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (242, 'admin', '119.62.170.49', '内网IP', 'Chrome 126', 'Windows 10', '0', '登录成功', '2025-01-28 09:56:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (243, 'admin', '114.235.204.211', '内网IP', 'Chrome 122', 'Windows 10', '0', '登录成功', '2025-01-28 16:05:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (244, 'admin', '120.230.207.33', '内网IP', 'Chrome 129', 'Windows 10', '0', '登录成功', '2025-01-28 16:09:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (245, 'admin', '39.162.162.188', '内网IP', 'Chrome 114', 'Android 10', '0', '登录成功', '2025-01-28 16:56:28');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (246, 'admin', '27.16.226.12', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-28 17:23:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (247, 'admin', '110.191.35.104', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-28 19:40:10');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (248, 'admin', '171.36.28.244', '内网IP', 'Edge 126', 'Windows 10', '0', '登录成功', '2025-01-28 20:53:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (249, 'admin', '223.242.131.42', '内网IP', 'MiuiBrowser 19', 'Android 15', '0', '登录成功', '2025-01-28 22:27:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (250, 'admin', '182.118.236.169', '内网IP', 'Chrome 131', 'Mac OS X 10', '0', '登录成功', '2025-01-28 22:39:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (251, 'admin', '114.233.186.158', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-29 00:28:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (252, 'admin', '117.136.106.40', '内网IP', 'Mobile Safari 17', 'iOS 17', '1', '密码错误', '2025-01-29 01:03:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (253, 'admin', '117.136.106.40', '内网IP', 'Mobile Safari 17', 'iOS 17', '1', '密码错误', '2025-01-29 01:03:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (254, 'admin', '117.136.106.40', '内网IP', 'Mobile Safari 17', 'iOS 17', '1', '验证码错误', '2025-01-29 01:03:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (255, 'admin', '117.136.106.40', '内网IP', 'Mobile Safari 17', 'iOS 17', '1', '密码错误', '2025-01-29 01:03:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (256, 'admin', '117.136.106.40', '内网IP', 'Mobile Safari 17', 'iOS 17', '1', '验证码错误', '2025-01-29 01:03:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (257, 'admin', '73.181.10.64', '内网IP', 'Chrome Mobile iOS 132', 'iOS 18', '0', '登录成功', '2025-01-29 02:02:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (258, 'admin', '112.9.6.124', '内网IP', 'Chrome Mobile iOS 109', 'iOS 14', '0', '登录成功', '2025-01-29 02:44:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (259, 'admin', '112.236.251.145', '内网IP', 'Chrome 131', 'Windows 10', '0', '登录成功', '2025-01-29 07:32:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (260, 'admin', '116.169.81.73', '内网IP', 'Chrome Mobile 130', 'Android 15', '0', '登录成功', '2025-01-29 08:30:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (261, 'admin', '112.111.24.113', '内网IP', 'Edge 132', 'Windows 10', '1', '验证码错误', '2025-01-29 09:04:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (262, 'admin', '112.111.24.113', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-29 09:05:00');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (263, 'admin', '112.193.74.5', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-29 11:54:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (264, 'admin', '124.240.84.79', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-29 12:47:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (265, 'admin', '223.90.169.35', '内网IP', 'Edge 131', 'Windows 10', '0', '登录成功', '2025-01-29 12:48:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (266, 'admin', '113.250.242.192', '内网IP', 'Chrome 132', 'Windows 10', '0', '登录成功', '2025-01-29 13:47:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (267, 'admin123', '124.240.65.57', '内网IP', 'Edge 132', 'Windows 10', '1', '用户不存在', '2025-01-29 14:55:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (268, 'admin', '124.240.65.57', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-29 14:55:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (269, 'admin', '183.209.148.21', '内网IP', 'Edge 132', 'Windows 10', '0', '登录成功', '2025-01-29 15:10:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int(11) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2035 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-11-13 14:12:02', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-11-13 14:12:02', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-11-13 14:12:02', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-11-13 14:12:02', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-11-13 14:12:02', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-11-13 14:12:02', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-11-13 14:12:02', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-11-13 14:12:02', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-11-13 14:12:02', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-11-13 14:12:02', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-11-13 14:12:02', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-11-13 14:12:02', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-11-13 14:12:02', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-11-13 14:12:02', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-11-13 14:12:02', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-11-13 14:12:02', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-11-13 14:12:02', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-11-13 14:12:02', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-11-13 14:12:02', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-11-13 14:12:02', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-11-13 14:12:02', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-11-13 14:12:02', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-11-13 14:12:02', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2028, '业务菜单', 0, 4, 'carInfo', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'dict', 'admin', '2025-01-17 14:16:08', 'admin', '2025-01-17 14:16:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2029, '小车信息', 2028, 1, 'info', 'car/info/index', NULL, '', 1, 0, 'C', '0', '0', 'car:info:list', '#', 'admin', '2025-01-17 14:19:05', '', NULL, '小车信息， 用于测试代码生成功能菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2030, '小车信息查询', 2029, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'car:info:query', '#', 'admin', '2025-01-17 14:19:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2031, '小车信息新增', 2029, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'car:info:add', '#', 'admin', '2025-01-17 14:19:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2032, '小车信息修改', 2029, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'car:info:edit', '#', 'admin', '2025-01-17 14:19:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2033, '小车信息删除', 2029, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'car:info:remove', '#', 'admin', '2025-01-17 14:19:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2034, '小车信息导出', 2029, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'car:info:export', '#', 'admin', '2025-01-17 14:19:05', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 vfadmin新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-11-13 14:12:03', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 vfadmin系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-11-13 14:12:03', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` longtext COMMENT '请求参数',
  `json_result` longtext COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` longtext COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (644, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2024', '', '内网IP', '{\"menu_ids\": \"2024\"}', '{\"code\": 601, \"msg\": \"存在子菜单,不允许删除\", \"success\": false, \"time\": \"2025-01-13T13:48:05.549061\"}', 1, '存在子菜单,不允许删除', '2025-01-13 13:48:06', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (645, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2025', '', '内网IP', '{\"menu_ids\": \"2025\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:48:11.103893\"}', 0, '', '2025-01-13 13:48:11', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (646, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2024', '', '内网IP', '{\"menu_ids\": \"2024\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:48:13.701985\"}', 0, '', '2025-01-13 13:48:14', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (647, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2027', '', '内网IP', '{\"menu_ids\": \"2027\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:48:19.222651\"}', 0, '', '2025-01-13 13:48:19', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (648, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2026', '', '内网IP', '{\"menu_ids\": \"2026\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:48:21.504912\"}', 0, '', '2025-01-13 13:48:21', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (649, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2023', '', '内网IP', '{\"menu_ids\": \"2023\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:48:23.764089\"}', 0, '', '2025-01-13 13:48:24', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (650, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '', '内网IP', '{\"menu_ids\": \"2022\"}', '{\"code\": 601, \"msg\": \"菜单已分配,不允许删除\", \"success\": false, \"time\": \"2025-01-13T13:48:30.018083\"}', 1, '菜单已分配,不允许删除', '2025-01-13 13:48:30', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (651, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '', '内网IP', '{\"menu_ids\": \"2022\"}', '{\"code\": 601, \"msg\": \"菜单已分配,不允许删除\", \"success\": false, \"time\": \"2025-01-13T13:48:32.215802\"}', 1, '菜单已分配,不允许删除', '2025-01-13 13:48:32', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (652, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '', '内网IP', '{\"menu_ids\": \"2021\"}', '{\"code\": 601, \"msg\": \"菜单已分配,不允许删除\", \"success\": false, \"time\": \"2025-01-13T13:48:35.544470\"}', 1, '菜单已分配,不允许删除', '2025-01-13 13:48:36', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (653, '角色管理', 2, 'module_admin/controller/role_controller.edit_system_role()', 'PUT', 1, 'admin', '研发部门', '/system/role', '', '内网IP', '{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"1\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-11-13T14:12:02\", \"updateBy\": \"admin\", \"updateTime\": \"2024-12-18T10:04:30\", \"remark\": \"普通角色\", \"admin\": false, \"menuIds\": [1, 100, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 101, 1007, 1008, 1009, 1010, 1011, 103, 1016, 1017, 1018, 1019]}', '{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2025-01-13T13:49:21.850742\"}', 0, '', '2025-01-13 13:49:22', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (654, '角色管理', 2, 'module_admin/controller/role_controller.edit_system_role()', 'PUT', 1, 'admin', '研发部门', '/system/role', '', '内网IP', '{\"roleId\": 100, \"roleName\": \"文章管理\", \"roleKey\": \"文章管理\", \"roleSort\": 0, \"dataScope\": \"1\", \"menuCheckStrictly\": false, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-12-14T16:22:24\", \"updateBy\": \"姜益收\", \"updateTime\": \"2024-12-18T09:07:39\", \"remark\": \"文章管理\", \"admin\": false, \"menuIds\": []}', '{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2025-01-13T13:49:32.507554\"}', 0, '', '2025-01-13 13:49:32', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (655, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '', '内网IP', '{\"menu_ids\": \"2020\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:49:43.976915\"}', 0, '', '2025-01-13 13:49:44', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (656, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '', '内网IP', '{\"menu_ids\": \"2021\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:49:45.765445\"}', 0, '', '2025-01-13 13:49:46', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (657, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '', '内网IP', '{\"menu_ids\": \"2022\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:49:47.490996\"}', 0, '', '2025-01-13 13:49:47', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (658, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '', '内网IP', '{\"menu_ids\": \"2013\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:49:49.749566\"}', 0, '', '2025-01-13 13:49:50', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (659, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2012', '', '内网IP', '{\"menu_ids\": \"2012\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:49:51.930508\"}', 0, '', '2025-01-13 13:49:52', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (660, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '', '内网IP', '{\"menu_ids\": \"2018\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:49:57.698001\"}', 0, '', '2025-01-13 13:49:58', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (661, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '', '内网IP', '{\"menu_ids\": \"2019\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:00.691762\"}', 0, '', '2025-01-13 13:50:01', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (662, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2017', '', '内网IP', '{\"menu_ids\": \"2017\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:03.126192\"}', 0, '', '2025-01-13 13:50:03', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (663, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2010', '', '内网IP', '{\"menu_ids\": \"2010\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:10.021518\"}', 0, '', '2025-01-13 13:50:10', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (664, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2015', '', '内网IP', '{\"menu_ids\": \"2015\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:13.713535\"}', 0, '', '2025-01-13 13:50:14', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (665, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2016', '', '内网IP', '{\"menu_ids\": \"2016\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:15.847678\"}', 0, '', '2025-01-13 13:50:16', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (666, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '', '内网IP', '{\"menu_ids\": \"2014\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:17.841216\"}', 0, '', '2025-01-13 13:50:18', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (667, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2011', '', '内网IP', '{\"menu_ids\": \"2011\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:21.213763\"}', 0, '', '2025-01-13 13:50:21', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (668, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2009', '', '内网IP', '{\"menu_ids\": \"2009\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:25.816517\"}', 0, '', '2025-01-13 13:50:26', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (669, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '', '内网IP', '{\"menu_ids\": \"2003\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:31.235590\"}', 0, '', '2025-01-13 13:50:31', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (670, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '', '内网IP', '{\"menu_ids\": \"2004\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:32.851805\"}', 0, '', '2025-01-13 13:50:33', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (671, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2005', '', '内网IP', '{\"menu_ids\": \"2005\"}', '{\"code\": 601, \"msg\": \"存在子菜单,不允许删除\", \"success\": false, \"time\": \"2025-01-13T13:50:34.400524\"}', 1, '存在子菜单,不允许删除', '2025-01-13 13:50:34', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (672, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2006', '', '内网IP', '{\"menu_ids\": \"2006\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:43.539133\"}', 0, '', '2025-01-13 13:50:44', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (673, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '', '内网IP', '{\"menu_ids\": \"2007\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:46.311467\"}', 0, '', '2025-01-13 13:50:46', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (674, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2008', '', '内网IP', '{\"menu_ids\": \"2008\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:47.948895\"}', 0, '', '2025-01-13 13:50:48', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (675, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2005', '', '内网IP', '{\"menu_ids\": \"2005\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:50.256895\"}', 0, '', '2025-01-13 13:50:50', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (676, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '', '内网IP', '{\"menu_ids\": \"2002\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:52.316253\"}', 0, '', '2025-01-13 13:50:52', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (677, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '', '内网IP', '{\"menu_ids\": \"2001\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:54.262562\"}', 0, '', '2025-01-13 13:50:54', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (678, '菜单管理', 3, 'module_admin/controller/menu_controller.delete_system_menu()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '', '内网IP', '{\"menu_ids\": \"2000\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-13T13:50:56.599779\"}', 0, '', '2025-01-13 13:50:57', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (679, '字典类型', 1, 'module_admin/controller/dict_controller.add_system_dict_type()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictName\": \"车辆类型\", \"dictType\": \"car_type\"}', '{\"code\": 200, \"msg\": \"新增成功\", \"success\": true, \"time\": \"2025-01-17T14:11:43.838953\"}', 0, '', '2025-01-17 14:11:44', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (680, '字典数据', 1, 'module_admin/controller/dict_controller.add_system_dict_data()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '', '内网IP', '{\"dictLabel\": \"越野车\", \"dictValue\": \"1\", \"listClass\": \"primary\", \"dictSort\": 0, \"status\": \"0\", \"dictType\": \"car_type\"}', '{\"code\": 200, \"msg\": \"新增成功\", \"success\": true, \"time\": \"2025-01-17T14:12:25.091650\"}', 0, '', '2025-01-17 14:12:25', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (681, '字典数据', 1, 'module_admin/controller/dict_controller.add_system_dict_data()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '', '内网IP', '{\"dictLabel\": \"小汽车\", \"dictValue\": \"2\", \"listClass\": \"success\", \"dictSort\": 0, \"status\": \"0\", \"dictType\": \"car_type\"}', '{\"code\": 200, \"msg\": \"新增成功\", \"success\": true, \"time\": \"2025-01-17T14:12:47.824332\"}', 0, '', '2025-01-17 14:12:48', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (682, '菜单管理', 1, 'module_admin/controller/menu_controller.add_system_menu()', 'POST', 1, 'admin', '研发部门', '/system/menu', '', '内网IP', '{\"parentId\": 0, \"menuName\": \"业务菜单\", \"icon\": \"dict\", \"menuType\": \"M\", \"orderNum\": 4, \"isFrame\": 1, \"isCache\": 0, \"visible\": \"0\", \"status\": \"0\", \"path\": \"carInfo\"}', '{\"code\": 200, \"msg\": \"新增成功\", \"success\": true, \"time\": \"2025-01-17T14:16:08.362767\"}', 0, '', '2025-01-17 14:16:08', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (683, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dict\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T21:54:05.359039\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 21:54:05', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (684, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dict\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T21:54:10.848637\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 21:54:11', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (685, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dict\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T21:54:15.945600\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 21:54:16', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (686, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dict\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T21:54:19.877169\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 21:54:20', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (687, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dict\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T21:54:33.738278\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 21:54:34', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (688, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dicts\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T21:55:44.311893\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 21:55:44', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (689, '字典类型', 2, 'module_admin/controller/dict_controller.edit_system_dict_type()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '', '内网IP', '{\"dictId\": 106, \"dictName\": \"车辆类型\", \"dictType\": \"car_type_dict\", \"status\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2025-01-17T14:11:44\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-17T14:11:44\", \"remark\": null}', '{\"code\": 500, \"msg\": \"\'dict\' object has no attribute \'dict_code\'\", \"success\": false, \"time\": \"2025-01-17T22:28:20.835420\"}', 1, '\'dict\' object has no attribute \'dict_code\'', '2025-01-17 22:28:21', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (690, '字典类型', 2, 'module_admin/controller/dict_controller.refresh_system_dict()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '', '内网IP', '{}', '{\"code\": 200, \"msg\": \"刷新成功\", \"success\": true, \"time\": \"2025-01-17T22:28:30.960908\"}', 0, '', '2025-01-17 22:28:31', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (691, '字典类型', 2, 'module_admin/controller/dict_controller.refresh_system_dict()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '', '内网IP', '{}', '{\"code\": 200, \"msg\": \"刷新成功\", \"success\": true, \"time\": \"2025-01-17T22:37:54.209106\"}', 0, '', '2025-01-17 22:37:54', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (692, 'car_info', 1, 'module_admin/controller/car_info_controller.add_car_info()', 'POST', 1, 'admin', '研发部门', '/car/info/add', '', '内网IP', '{\"carName\": \"小车二号\", \"carType\": 2, \"createTime\": null, \"delFlag\": null, \"id\": null, \"image\": \"qiniu.com\", \"lat\": \"35.9323\", \"lng\": \"180.3232\", \"location\": \"苏宁写字楼\", \"manager\": \"3\", \"price\": \"588\", \"updateTime\": null}', '{\"code\": 200, \"msg\": \"操作成功\", \"data\": {\"carName\": null, \"carType\": null, \"createTime\": null, \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": null, \"id\": null, \"image\": null, \"lat\": null, \"lng\": null, \"location\": null, \"manager\": null, \"price\": null, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": null}, \"success\": true, \"time\": \"2025-01-17T23:57:08.045728\"}', 0, '', '2025-01-17 23:57:08', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (693, 'car_info', 3, 'module_admin/controller/car_info_controller.del_car_info()', 'DELETE', 1, 'admin', '研发部门', '/car/info/delete/1', '', '内网IP', '{\"carInfoId\": \"1\"}', '{\"code\": 500, \"msg\": \"name \'del_model\' is not defined\", \"success\": false, \"time\": \"2025-01-18T00:12:39.868937\"}', 1, 'name \'del_model\' is not defined', '2025-01-18 00:12:40', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (694, 'car_info', 3, 'module_admin/controller/car_info_controller.del_car_info()', 'DELETE', 1, 'admin', '研发部门', '/car/info/delete/1', '', '内网IP', '{\"carInfoId\": \"1\"}', '{\"code\": 500, \"msg\": \"name \'del_model\' is not defined\", \"success\": false, \"time\": \"2025-01-18T00:13:02.271308\"}', 1, 'name \'del_model\' is not defined', '2025-01-18 00:13:02', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (695, 'car_info', 3, 'module_admin/controller/car_info_controller.del_car_info()', 'DELETE', 1, 'admin', '研发部门', '/car/info/delete/1', '', '内网IP', '{\"carInfoId\": \"1\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"success\": true, \"time\": \"2025-01-18T00:19:22.279918\"}', 0, '', '2025-01-18 00:19:22', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (696, 'car_info', 3, 'module_admin/controller/car_info_controller.del_car_info()', 'DELETE', 1, 'admin', '研发部门', '/car/info/delete/2', '', '内网IP', '{\"carInfoId\": \"2\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"success\": true, \"time\": \"2025-01-18T00:23:00.533866\"}', 0, '', '2025-01-18 00:23:01', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (697, 'car_info', 3, 'module_admin/controller/car_info_controller.del_car_info()', 'DELETE', 1, 'admin', '研发部门', '/car/info/delete/2,1', '', '内网IP', '{\"carInfoIds\": \"2,1\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"success\": true, \"time\": \"2025-01-18T08:33:13.740751\"}', 0, '', '2025-01-18 08:33:14', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (698, 'car_info', 1, 'module_admin/controller/car_info_controller.add_car_info()', 'POST', 1, 'admin', '研发部门', '/car/info/add', '', '内网IP', '{\"carName\": \"小车三号\", \"carType\": 2, \"createTime\": null, \"delFlag\": null, \"id\": null, \"image\": \"qiniu.com\", \"lat\": \"35.323244\", \"lng\": \"169.3234\", \"location\": \"鲁能大厦\", \"manager\": \"3\", \"price\": \"988\", \"updateTime\": null}', '{\"code\": 200, \"msg\": \"操作成功\", \"data\": {\"carName\": null, \"carType\": null, \"createTime\": null, \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": null, \"id\": null, \"image\": null, \"lat\": null, \"lng\": null, \"location\": null, \"manager\": null, \"price\": null, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": null}, \"success\": true, \"time\": \"2025-01-18T08:36:48.145278\"}', 0, '', '2025-01-18 08:36:48', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (699, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车一号\", \"carType\": 1, \"createTime\": \"2025-01-18T08:33:52\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 1, \"image\": \"https://image.baidu.com\", \"lat\": 173.323, \"lng\": 35.3234, \"location\": \"北京市朝阳区\", \"manager\": \"3\", \"price\": 520, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:33:52\"}', '{\"code\": 500, \"msg\": \"module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel\", \"success\": false, \"time\": \"2025-01-18T08:37:13.717678\"}', 1, 'module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel', '2025-01-18 08:37:14', 4);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (700, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车一号\", \"carType\": 1, \"createTime\": \"2025-01-18T08:33:52\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 1, \"image\": \"https://image.baidu.com\", \"lat\": 173.323, \"lng\": 35.3234, \"location\": \"北京市朝阳区\", \"manager\": \"3\", \"price\": 520, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:33:52\"}', '{\"code\": 500, \"msg\": \"module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel\", \"success\": false, \"time\": \"2025-01-18T08:37:18.117363\"}', 1, 'module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel', '2025-01-18 08:37:18', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (701, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车一号\", \"carType\": 1, \"createTime\": \"2025-01-18T08:33:52\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 1, \"image\": \"https://image.baidu.com\", \"lat\": 173.323, \"lng\": 35.3234, \"location\": \"北京市朝阳区\", \"manager\": \"3\", \"price\": 520, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:33:52\"}', '{\"code\": 500, \"msg\": \"module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel\", \"success\": false, \"time\": \"2025-01-18T08:37:22.227092\"}', 1, 'module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel', '2025-01-18 08:37:22', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (702, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车二号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:33:54\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 2, \"image\": \"qiniu.com\", \"lat\": \"35.93233\", \"lng\": 180.323, \"location\": \"苏宁写字楼\", \"manager\": 3, \"price\": 588, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:33:54\"}', '{\"code\": 500, \"msg\": \"module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel\", \"success\": false, \"time\": \"2025-01-18T08:37:34.228349\"}', 1, 'module_admin.entity.vo.car_info_vo.CarInfoModel() argument after ** must be a mapping, not CarInfoModel', '2025-01-18 08:37:34', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (703, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车三号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:36:48\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 3, \"image\": \"qiniu.com\", \"lat\": \"35.32323\", \"lng\": 169.323, \"location\": \"鲁能大厦\", \"manager\": 3, \"price\": 988, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:36:48\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"data\": {\"carName\": \"小车三号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:36:48\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 3, \"image\": \"qiniu.com\", \"lat\": 35.3232, \"lng\": 169.323, \"location\": \"鲁能大厦\", \"manager\": 3, \"price\": 988.0, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:36:48\"}, \"success\": true, \"time\": \"2025-01-18T08:51:21.014093\"}', 0, '', '2025-01-18 08:51:21', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (704, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车一号\", \"carType\": 1, \"createTime\": \"2025-01-18T08:33:52\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 1, \"image\": \"https://image.baidu.com\", \"lat\": \"173.3233\", \"lng\": 35.3234, \"location\": \"北京市朝阳区望京CDB\", \"manager\": 3, \"price\": 520, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:33:52\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"data\": {\"carName\": \"小车一号\", \"carType\": 1, \"createTime\": \"2025-01-18T08:33:52\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 1, \"image\": \"https://image.baidu.com\", \"lat\": 173.323, \"lng\": 35.3234, \"location\": \"北京市朝阳区望京CDB\", \"manager\": 3, \"price\": 520.0, \"beginPrice\": null, \"endPrice\": null, \"updateTime\": \"2025-01-18T08:33:52\"}, \"success\": true, \"time\": \"2025-01-18T08:51:48.308284\"}', 0, '', '2025-01-18 08:51:48', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (705, '角色管理', 5, 'module_admin/controller/role_controller.export_system_role_list()', 'POST', 1, 'admin', '研发部门', '/system/role/export', '', '内网IP', 'pageNum: 1\npageSize: 10', '{\"code\": 200, \"message\": \"获取成功\"}', 0, '', '2025-01-18 08:54:01', 4);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (706, 'car_info', 5, 'module_admin/controller/car_info_controller.export_car_info()', 'POST', 1, 'admin', '研发部门', '/car/info/export', '', '内网IP', 'pageNum: 1\npageSize: 10\ncarType: 1', '{\"code\": 200, \"message\": \"获取成功\"}', 0, '', '2025-01-18 09:23:03', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (707, 'car_info', 5, 'module_admin/controller/car_info_controller.export_car_info()', 'POST', 1, 'admin', '研发部门', '/car/info/export', '', '内网IP', 'pageNum: 1\npageSize: 10\ncarType: 2', '{\"code\": 200, \"message\": \"获取成功\"}', 0, '', '2025-01-18 09:23:27', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (708, 'car_info', 5, 'module_admin/controller/car_info_controller.export_car_info()', 'POST', 1, 'admin', '研发部门', '/car/info/export', '', '内网IP', 'pageNum: 1\npageSize: 10\ncarType: 2', '{\"code\": 200, \"message\": \"获取成功\"}', 0, '', '2025-01-18 09:47:21', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (709, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车三号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:36:48\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 3, \"image\": \"qiniu.com3\", \"lat\": 35.3232, \"lng\": 169.323, \"location\": \"鲁能大厦\", \"manager\": 3, \"price\": 988, \"updateTime\": \"2025-01-18T08:36:48\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"data\": {\"carName\": \"小车三号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:36:48\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 3, \"image\": \"qiniu.com3\", \"lat\": 35.3232, \"lng\": 169.323, \"location\": \"鲁能大厦\", \"manager\": 3, \"price\": 988.0, \"updateTime\": \"2025-01-18T08:36:48\"}, \"success\": true, \"time\": \"2025-01-18T09:57:47.097627\"}', 0, '', '2025-01-18 09:57:47', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (710, 'car_info', 2, 'module_admin/controller/car_info_controller.update_car_info()', 'PUT', 1, 'admin', '研发部门', '/car/info/update', '', '内网IP', '{\"carName\": \"小车二号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:33:54\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 2, \"image\": \"qiniu.com\", \"lat\": \"35.93232\", \"lng\": 180.323, \"location\": \"苏宁写字楼\", \"manager\": 3, \"price\": 588, \"updateTime\": \"2025-01-18T08:33:54\"}', '{\"code\": 200, \"msg\": \"操作成功\", \"data\": {\"carName\": \"小车二号\", \"carType\": 2, \"createTime\": \"2025-01-18T08:33:54\", \"beginCreateTime\": null, \"endCreateTime\": null, \"delFlag\": \"0\", \"id\": 2, \"image\": \"qiniu.com\", \"lat\": 35.9323, \"lng\": 180.323, \"location\": \"苏宁写字楼\", \"manager\": 3, \"price\": 588.0, \"updateTime\": \"2025-01-18T08:33:54\"}, \"success\": true, \"time\": \"2025-01-18T09:57:52.408172\"}', 0, '', '2025-01-18 09:57:52', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (711, 'car_info', 5, 'module_admin/controller/car_info_controller.export_car_info()', 'POST', 1, 'admin', '研发部门', '/car/info/export', '', '内网IP', 'pageNum: 1\npageSize: 10', '{\"code\": 200, \"message\": \"获取成功\"}', 0, '', '2025-01-18 09:57:57', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (712, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/123', '', '内网IP', '{\"user_ids\": \"123\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:09.960717\"}', 0, '', '2025-01-20 10:45:10', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (713, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/124', '', '内网IP', '{\"user_ids\": \"124\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:12.298482\"}', 0, '', '2025-01-20 10:45:12', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (714, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/125', '', '内网IP', '{\"user_ids\": \"125\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:14.436146\"}', 0, '', '2025-01-20 10:45:14', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (715, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/126', '', '内网IP', '{\"user_ids\": \"126\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:16.728412\"}', 0, '', '2025-01-20 10:45:17', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (716, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/127', '', '内网IP', '{\"user_ids\": \"127\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:19.319358\"}', 0, '', '2025-01-20 10:45:19', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (717, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/128', '', '内网IP', '{\"user_ids\": \"128\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:21.511604\"}', 0, '', '2025-01-20 10:45:22', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (718, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/129', '', '内网IP', '{\"user_ids\": \"129\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:24.077627\"}', 0, '', '2025-01-20 10:45:24', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (719, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/122', '', '内网IP', '{\"user_ids\": \"122\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:26.381660\"}', 0, '', '2025-01-20 10:45:26', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (720, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/121', '', '内网IP', '{\"user_ids\": \"121\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:29.180841\"}', 0, '', '2025-01-20 10:45:29', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (721, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/120', '', '内网IP', '{\"user_ids\": \"120\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:31.248021\"}', 0, '', '2025-01-20 10:45:31', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (722, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/119', '', '内网IP', '{\"user_ids\": \"119\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:33.985630\"}', 0, '', '2025-01-20 10:45:34', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (723, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/118', '', '内网IP', '{\"user_ids\": \"118\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:36.158165\"}', 0, '', '2025-01-20 10:45:36', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (724, '用户管理', 3, 'module_admin/controller/user_controller.delete_system_user()', 'DELETE', 1, 'admin', '研发部门', '/system/user/117', '', '内网IP', '{\"user_ids\": \"117\"}', '{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2025-01-20T10:45:38.800873\"}', 0, '', '2025-01-20 10:45:39', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (725, '用户管理', 2, 'module_admin/controller/user_controller.edit_system_user()', 'PUT', 1, 'admin', '研发部门', '/system/user', '', '内网IP', '{\"userId\": 115, \"deptId\": null, \"userName\": \"richard\", \"nickName\": \"Richard\", \"userType\": \"00\", \"email\": \"988550796@qq.com\", \"phonenumber\": \"18000008888\", \"sex\": \"0\", \"avatar\": \"\", \"status\": \"0\", \"delFlag\": \"0\", \"loginIp\": \"\", \"loginDate\": null, \"createBy\": \"admin\", \"createTime\": \"2024-11-16T10:06:31\", \"updateBy\": \"admin\", \"updateTime\": \"2024-11-16T10:06:56\", \"remark\": null, \"admin\": false, \"postIds\": [3], \"roleIds\": [2], \"dept\": null, \"role\": [{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"1\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-11-13T14:12:02\", \"updateBy\": \"admin\", \"updateTime\": \"2025-01-13T13:49:22\", \"remark\": \"普通角色\", \"admin\": false}]}', '{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2025-01-20T10:45:53.789929\"}', 0, '', '2025-01-20 10:45:54', 2);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (726, '个人信息', 2, 'module_admin/controller/user_controller.change_system_user_profile_info()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '', '内网IP', '{\"nickName\": \"超级管理员\", \"phonenumber\": \"18000008888\", \"email\": \"niangao@163.com\", \"sex\": \"1\"}', '{\"code\": 500, \"msg\": \"修改用户admin失败，手机号码已存在\", \"success\": false, \"time\": \"2025-01-20T10:47:09.894864\"}', 1, '修改用户admin失败，手机号码已存在', '2025-01-20 10:47:10', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (727, '个人信息', 2, 'module_admin/controller/user_controller.change_system_user_profile_info()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '', '内网IP', '{\"nickName\": \"超级管理员\", \"phonenumber\": \"18000006666\", \"email\": \"niangao@163.com\", \"sex\": \"0\"}', '{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2025-01-20T10:47:16.458569\"}', 0, '', '2025-01-20 10:47:16', 3);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (728, '个人信息', 2, 'module_admin/controller/user_controller.change_system_user_profile_info()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '', '内网IP', '{\"nickName\": \"超级管理员\", \"phonenumber\": \"18000006666\", \"email\": \"admin@163.com\", \"sex\": \"0\"}', '{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2025-01-20T10:47:24.920731\"}', 0, '', '2025-01-20 10:47:25', 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-11-13 14:12:02', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-11-13 14:12:02', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-11-13 14:12:02', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2024-11-13 14:12:02', 'admin', '2025-01-13 13:49:22', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '文章管理', '文章管理', 0, '1', 0, 1, '0', '0', 'admin', '2024-12-14 16:22:24', 'admin', '2025-01-13 13:49:32', '文章管理');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '超级管理员', '00', 'admin@163.com', '18000006666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-01-29 15:10:00', 'admin', '2024-11-13 14:12:02', 'admin', '2025-01-20 10:47:25', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (115, 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (115, 2);
COMMIT;

-- ----------------------------
-- Table structure for user_wechat
-- ----------------------------
DROP TABLE IF EXISTS `user_wechat`;
CREATE TABLE `user_wechat` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `country` varchar(100) DEFAULT NULL COMMENT '国家',
  `head_img_url` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `union_id` varchar(255) NOT NULL COMMENT 'union_id',
  `user_phone` varchar(15) NOT NULL COMMENT '手机号',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`openid`) USING BTREE,
  UNIQUE KEY `user_phone` (`user_phone`) USING BTREE,
  KEY `ix_user_wechat_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='用户微信信息';

-- ----------------------------
-- Records of user_wechat
-- ----------------------------
BEGIN;
INSERT INTO `user_wechat` (`user_id`, `city`, `country`, `head_img_url`, `nickname`, `openid`, `union_id`, `user_phone`, `province`, `sex`, `id`, `create_time`, `update_time`, `del_flag`) VALUES (117, NULL, NULL, NULL, NULL, 'oxMx-6-s6NINAgtFYTg9B_x_99co', 'ol0Yu65bafiDx5ltVOkE8HKwU0yg', '18010476403', NULL, NULL, 14, '2024-11-16 10:23:09', '2024-11-16 10:23:09', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

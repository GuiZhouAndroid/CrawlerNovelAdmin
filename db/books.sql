/*
 Navicat Premium Data Transfer

 Source Server         : ZSAndroid
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : books

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 09/11/2021 17:48:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `catId` int NULL DEFAULT NULL,
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL,
  `book_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visit_count` bigint NULL DEFAULT 103,
  `update_time` datetime NOT NULL,
  `soft_cat` int NULL DEFAULT 0,
  `soft_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_uniq_name_author`(`book_name`, `author`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6595 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_content
-- ----------------------------
DROP TABLE IF EXISTS `book_content`;
CREATE TABLE `book_content`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `index_id` bigint NULL DEFAULT NULL,
  `index_num` int NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_bookid_indexnum`(`book_id`, `index_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3333338 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_copy1
-- ----------------------------
DROP TABLE IF EXISTS `book_copy1`;
CREATE TABLE `book_copy1`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `catId` int NULL DEFAULT NULL,
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL,
  `book_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visit_count` bigint NULL DEFAULT 103,
  `update_time` datetime NOT NULL,
  `soft_cat` int NULL DEFAULT 0,
  `soft_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_uniq_name_author`(`book_name`, `author`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6596 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_crawl
-- ----------------------------
DROP TABLE IF EXISTS `book_crawl`;
CREATE TABLE `book_crawl`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `crawl_web_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `crawl_web_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `crawl_web_code` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_index
-- ----------------------------
DROP TABLE IF EXISTS `book_index`;
CREATE TABLE `book_index`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `index_num` int NOT NULL,
  `index_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_bookid_indexNum`(`book_id`, `index_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3748341 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_parse_log
-- ----------------------------
DROP TABLE IF EXISTS `book_parse_log`;
CREATE TABLE `book_parse_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL,
  `create_time` datetime NOT NULL,
  `priority` tinyint NOT NULL DEFAULT 10,
  `update_count` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_update_time_log
-- ----------------------------
DROP TABLE IF EXISTS `book_update_time_log`;
CREATE TABLE `book_update_time_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_cat_id` int NOT NULL,
  `last_update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_key_catid`(`book_cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` tinyint NOT NULL DEFAULT 10,
  `get_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `req_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '???????????????URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fb_order
-- ----------------------------
DROP TABLE IF EXISTS `fb_order`;
CREATE TABLE `fb_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????',
  `mcht_id` bigint NOT NULL COMMENT '??????id',
  `sn` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QR??????',
  `fb_merchant_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '???????????????',
  `merchant_order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????????????????????',
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `platform_order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `trade_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `order_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '???????????????1???????????????2??????????????????3??????????????????4???????????????',
  `fn_coupon` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '?????????????????????',
  `red_packet` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '????????????',
  `total_fee` decimal(12, 2) NOT NULL COMMENT '????????????(???)',
  `order_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '????????????',
  `fee` decimal(12, 2) NULL DEFAULT NULL COMMENT '?????????(???)',
  `body` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????????????????',
  `attach` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `store_id` bigint NOT NULL COMMENT '?????????????????????id',
  `cashier_id` bigint NULL DEFAULT NULL COMMENT '????????????????????????id',
  `device_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????????????????open_id??????????????????????????????buyer_user_id???',
  `user_logon_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '?????????????????????',
  `pay_channel` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '????????????:1?????????2????????????3??????',
  `no_cash_coupon_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '????????????????????????(???)',
  `cash_coupon_fee` decimal(10, 0) NULL DEFAULT NULL COMMENT '????????????????????????(???)',
  `cash_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '????????????????????????(???)',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `create_time` datetime NOT NULL COMMENT '????????????',
  `push_time` datetime NULL DEFAULT NULL COMMENT '????????????',
  `push_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????IP',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_merchant_order_sn`(`merchant_order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????-???????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for screen_bullet
-- ----------------------------
DROP TABLE IF EXISTS `screen_bullet`;
CREATE TABLE `screen_bullet`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content_id` bigint NOT NULL,
  `screen_bullet` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_content_id`(`content_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '????????????ID??????????????????0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `order_num` int NULL DEFAULT NULL COMMENT '??????',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '????????????  -1????????????  0?????????',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '?????????',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '?????????',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '??????',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '??????',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '??????????????????',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '????????????',
  `create_by` int NULL DEFAULT NULL COMMENT '?????????',
  `create_date` datetime NULL DEFAULT NULL COMMENT '????????????',
  `update_by` bigint NULL DEFAULT NULL COMMENT '?????????',
  `update_date` datetime NULL DEFAULT NULL COMMENT '????????????',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '????????????',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '?????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL??????',
  `create_date` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_gen_columns
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_columns`;
CREATE TABLE `sys_gen_columns`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '??????',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '??????',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '??????',
  `column_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `column_comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '?????????',
  `page_type` tinyint NULL DEFAULT 1 COMMENT '?????????????????????1???????????? 2???????????? 3????????? 4???????????? 5?????????????????????????????? 6??????????????????????????????',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '??????????????????????????????????????????????????????????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_table`;
CREATE TABLE `sys_gen_table`  (
  `id` bigint NOT NULL COMMENT '??????',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????????',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?????????',
  `category` tinyint(1) NOT NULL DEFAULT 0 COMMENT '?????????0???????????????1?????????',
  `package_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `sub_module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `function_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????????????????????????????',
  `function_name_simple` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????????????????????????????????????????????????????xx?????????',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `src_dir` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'src??????',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `create_by` bigint NOT NULL COMMENT '?????????',
  `create_date` datetime NOT NULL COMMENT '????????????',
  `update_by` bigint NOT NULL COMMENT '?????????',
  `update_date` datetime NOT NULL COMMENT '????????????',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_table_column`;
CREATE TABLE `sys_gen_table_column`  (
  `id` bigint NOT NULL COMMENT '??????',
  `table_id` bigint NOT NULL COMMENT '???id',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
  `column_sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '?????????????????????',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
  `column_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????????',
  `attr_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????????',
  `attr_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `is_null` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `is_update` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gen_table_column_tn`(`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '??????id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `time` int NULL DEFAULT NULL COMMENT '????????????',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP??????',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1160 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int NULL DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `order_num` int NULL DEFAULT NULL COMMENT '??????',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '????????????',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `user_id_create` bigint NULL DEFAULT NULL COMMENT '????????????id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '????????????',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4087 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `dept_id` bigint NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `status` tinyint NULL DEFAULT NULL COMMENT '?????? 0:?????????1:??????',
  `user_id_create` bigint NULL DEFAULT NULL COMMENT '????????????id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '????????????',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '????????????',
  `sex` bigint NULL DEFAULT NULL COMMENT '??????',
  `birth` datetime NULL DEFAULT NULL COMMENT '????????????',
  `pic_id` bigint NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_ref_book
-- ----------------------------
DROP TABLE IF EXISTS `user_ref_book`;
CREATE TABLE `user_ref_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `index_num` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

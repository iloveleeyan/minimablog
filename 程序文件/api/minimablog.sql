/*
 Navicat Premium Dump SQL

 Source Server         : guangzhou
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : pisky.asia:4715
 Source Schema         : free.minimablog.cn

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 13/07/2025 14:55:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin` varchar(31) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录令牌',
  `login_at` datetime NOT NULL,
  `expire_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`admin`, `password`, `token`, `login_at`, `expire_at`) VALUES ('nobody', 'tuKU/yQ7xr2uynzzyCL85rVMAO/gofCMs4SVuFUDePo=', '6602132957bb1aa31fab7abf682f8068', '1970-01-01 08:00:00', '1970-01-01 08:00:00');
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_id` int NOT NULL,
  `tag_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL COMMENT '0：正常，1：草稿，2：禁用，3：秘密',
  `view` int NOT NULL,
  `reply` int NOT NULL,
  `is_close_comment` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `update_at` datetime NOT NULL,
  `create_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`article_id`,`tenant_id`) USING BTREE,
  KEY `article_id` (`article_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for article_image
-- ----------------------------
DROP TABLE IF EXISTS `article_image`;
CREATE TABLE `article_image` (
  `article_id` int NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenant_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `tag_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for article_tag_relate
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_relate`;
CREATE TABLE `article_tag_relate` (
  `article_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`tenant_id`,`article_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article_tag_relate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for background_image
-- ----------------------------
DROP TABLE IF EXISTS `background_image`;
CREATE TABLE `background_image` (
  `image_id` int NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_use` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`image_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of background_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_comment_id` int unsigned NOT NULL DEFAULT '0',
  `reply_comment_id` int unsigned NOT NULL DEFAULT '0',
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_agent` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_user` int unsigned NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`comment_id`,`tenant_id`) USING BTREE,
  KEY `comment_id` (`article_id`,`tenant_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `field` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`field`,`tenant_id`) USING BTREE,
  KEY `key` (`field`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` (`field`, `value`, `tenant_id`) VALUES ('user', '{\"articleListTag\":true,\"auxTitle\":\"记录小明的流水账\",\"avatar\":\"\",\"backgroundColor\":\"#f2f2f2\",\"commentPageSize\":20,\"domain\":\"www.abc.com\",\"email\":\"admin@abc.cn\",\"emotionList\":\"_(:з」∠)_\\n●ω●\\nꕀ ฅ՞•ﻌ•՞ฅ\\n(•‾⌣‾•)\\n( ੭ ˙ᗜ˙ )੭\\n(￣.￣)\\n@ω@\\n（￣～￣）\\n٩( ö̆ ) و\\n(ﾟOﾟ)\\n_(:ᗤ」ㄥ)_\\n( • ̀ω•́ )✧\\n( ˘ᵕ˘ )\\n⊙▽⊙\\n(｡ì _ í｡)\\n(˘︶˘)\\n◕‿↼\\n(๑╹◡╹)ﾉ\\nา(°﹏°า )\\n( ¨̮ )\\n( ^ω^)\\n(￣）￣)\\n(ಗ ‸ ಗ )\\n罒ω罒\\n(⊙ˍ⊙)\\n(=￣ω￣=)\\n(￣0 ￣)y\\n(。_。)\\n(ˇˍˇ)\\nʘ‿ʘ\\n(｡◕‿◕｡)\\n(¬‿¬)\\n(｡•̀◡-)\\nಠ_ಠ\\n(-ω- )\\n(•‾⌣‾•)y\\n◡̈ ʱª\\n *★,°*:.☆(￣▽￣)/$:*.°★*\",\"headerAvatarUrl\":\"\",\"homeIcon\":\"fa-coffee\",\"intro\":\"开会时的我：表面认真点头，内心已经在思考晚饭吃什么 😀\",\"isCommentCaptcha\":false,\"isCommentCity\":false,\"isDownloadSite\":false,\"motto\":\"生活明朗，万物可爱\",\"name\":\"小明同学\",\"recordNumber\":\"\",\"site\":\"小明的博客\",\"skin\":\"skin-bright\",\"storeWebSiteId\":1,\"url\":\"https://www.abc.com\"}', 1);
COMMIT;

-- ----------------------------
-- Table structure for mail_log
-- ----------------------------
DROP TABLE IF EXISTS `mail_log`;
CREATE TABLE `mail_log` (
  `mail_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮件标题',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮件标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮件内容',
  `success_at` datetime NOT NULL COMMENT '发送完成时间',
  `is_success` tinyint(1) NOT NULL COMMENT '发送成功，1：是',
  `response` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送结果报告',
  `create_at` datetime NOT NULL COMMENT '发送时间',
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`mail_id`,`tenant_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mail_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `update_at` datetime NOT NULL,
  `create_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`note_id`,`tenant_id`) USING BTREE,
  KEY `note_id` (`note_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of note
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for note_image
-- ----------------------------
DROP TABLE IF EXISTS `note_image`;
CREATE TABLE `note_image` (
  `note_id` int NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenant_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of note_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for note_tag
-- ----------------------------
DROP TABLE IF EXISTS `note_tag`;
CREATE TABLE `note_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `count` int NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of note_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for note_tag_relate
-- ----------------------------
DROP TABLE IF EXISTS `note_tag_relate`;
CREATE TABLE `note_tag_relate` (
  `tag_id` int NOT NULL,
  `note_id` int NOT NULL,
  `tenant_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of note_tag_relate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for official_startup
-- ----------------------------
DROP TABLE IF EXISTS `official_startup`;
CREATE TABLE `official_startup`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `version_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_at` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of official_startup
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for article_page
-- ----------------------------
DROP TABLE IF EXISTS `article_page`;
CREATE TABLE `article_page` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int NOT NULL,
  `status` tinyint NOT NULL COMMENT '0：正常，1：草稿，2：禁用，3：秘密',
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`page_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article_page
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for article_page_content
-- ----------------------------
DROP TABLE IF EXISTS `article_page_content`;
CREATE TABLE `article_page_content` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `first_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`page_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article_page_content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for article_uri
-- ----------------------------
DROP TABLE IF EXISTS `article_uri`;
CREATE TABLE `article_uri` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`article_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for search_keyword
-- ----------------------------
DROP TABLE IF EXISTS `search_keyword`;
CREATE TABLE `search_keyword` (
  `search_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `keyword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键词',
  `create_at` datetime NOT NULL COMMENT '创建日期',
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`search_id`,`tenant_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of search_keyword
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for skin
-- ----------------------------
DROP TABLE IF EXISTS `skin`;
CREATE TABLE `skin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_url` varchar(100) NOT NULL,
  `version` int NOT NULL,
  `color_list` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `use_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of skin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for skin_center
-- ----------------------------
CREATE TABLE `skin_center` (
  `skin_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `color_list` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_tenant_id` int NOT NULL,
  `author_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `download_count` int NOT NULL,
  `praise_count` int NOT NULL,
  `comment_count` int NOT NULL,
  `version` int NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`skin_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of skin_center
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for skin_center_history
-- ----------------------------
DROP TABLE IF EXISTS `skin_center_history`;
CREATE TABLE `skin_center_history` (
  `skin_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `version` int NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of skin_center_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for skin_center_image
-- ----------------------------
DROP TABLE IF EXISTS `skin_center_image`;
CREATE TABLE `skin_center_image` (
  `skin_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_logo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of skin_center_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for statistic_visit
-- ----------------------------
DROP TABLE IF EXISTS `statistic_visit`;
CREATE TABLE `statistic_visit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `referrer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `screen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_robot` tinyint(1) NOT NULL,
  `is_user` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of statistic_visit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int NOT NULL AUTO_INCREMENT COMMENT '文件id，自增',
  `type` tinyint NOT NULL COMMENT '上传的类型',
  `file` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `create_at` datetime NOT NULL COMMENT '创建日期',
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`upload_id`,`tenant_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of upload
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `tenant_id` int NOT NULL,
  `user` varchar(31) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录令牌',
  `login_at` datetime NOT NULL,
  `expire_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contract_day` int NOT NULL,
  `is_disable` tinyint NOT NULL,
  `create_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tenant_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`tenant_id`, `user`, `password`, `name`, `token`, `login_at`, `expire_at`, `url`, `contract_day`, `is_disable`, `create_at`) VALUES (1, 'admin', 'tuKU/yQ7xr2uynzzyCL85rVMAO/gofCMs4SVuFUDePo=', '简笔记免费版', '6a9c915675cafd9ac078e8519c696046', '1970-01-01 08:00:00', '1970-01-01 08:00:00', 'https://www.abc.com', 999, 0, '2025-07-13 14:55:14');
COMMIT;

-- ----------------------------
-- Table structure for user_apply
-- ----------------------------
DROP TABLE IF EXISTS `user_apply`;
CREATE TABLE `user_apply`  (
  `apply_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_domain_delegate` tinyint(1) NOT NULL,
  `ssl_pem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ssl_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qq` int NOT NULL,
  `state` tinyint NOT NULL,
  `is_pay` tinyint(1) NOT NULL,
  `domain_fee` int NOT NULL,
  `reject_reason` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `finish_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_avatar
-- ----------------------------
DROP TABLE IF EXISTS `user_avatar`;
CREATE TABLE `user_avatar` (
  `avatar_id` int NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_use` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`avatar_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_avatar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_control
-- ----------------------------
DROP TABLE IF EXISTS `user_control`;
CREATE TABLE `user_control` (
  `tenant_id` int NOT NULL,
  `is_word_check_article` tinyint(1) NOT NULL,
  `is_word_check_comment` tinyint(1) NOT NULL,
  `is_word_check_tag` tinyint(1) NOT NULL,
  `is_word_check_config` tinyint(1) NOT NULL,
  PRIMARY KEY (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_control
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for widget_article
-- ----------------------------
DROP TABLE IF EXISTS `widget_article`;
CREATE TABLE `widget_article` (
  `article_id` int NOT NULL,
  `sort` int NOT NULL,
  `tenant_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of widget_article
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

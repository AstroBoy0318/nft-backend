/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : imp

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 09/01/2022 22:26:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `twitter` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `telegram` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `instagram` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, '0x649136732a721e24400c954d778d55b7d2b015b6', '0x65ed8c6185500d2ea27a492c8d4acd6661e83650bef25c2ab7315e18bdb5dc49443887ab8ba4b9a659d5c4f9336c218192d327a67707a73f95f7cb4072095eaf1c', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-29 23:13:31', '2021-12-29 23:13:31');
INSERT INTO `accounts` VALUES (2, '0x699a76ffa3ef08ccafba606e9e1c42fab8bf7171', '0x98735dcda517fea8b2421ce3b4c7be13d7965ced96031239a2f219162bde158d28e53618a51870140f7258b00377edcc04331d20775a212b74d708f576b0bdf71c', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-06 15:48:54', '2022-01-06 15:48:54');
INSERT INTO `accounts` VALUES (3, '0xcc5beb5b1f12c68d18471de24aae3d5f2daa9cca', '0x1c416dbeb46f4b81d6b53fdf93e6525bb21f89064171ec46cdaef88d0f2d2606028d67be0fb2544b867ac2666ae6fec50684b35d57a6b5c365c11aed730fc5851c', 'Willy', 'Artist Bio', 'https://ipfs.io/ipfs/QmRRXBjQRQBdnivJuGe9bgk4yqogULSYoLmcy32y6AierY', '', '', '', '2022-01-06 17:18:25', '2022-01-06 20:31:36');
INSERT INTO `accounts` VALUES (4, '0x581d85386012335ecC3A84F77398dD1A72d0e47e', '0x090744421154fa5212590cf7ec2c5f4aa31a2b36438bde8412b697a817305810045b4a73ac380e2561a698bb05cdbfb2b66c783e71d6cab4d897657caaafbfe11b', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-06 20:39:01', '2022-01-06 20:39:01');
INSERT INTO `accounts` VALUES (5, '0xE0F3fb7Dd6b4238362f197aF8C9A71700538764E', '0xc46b1a94838087ffc884fc05fe4f9cb32310860535bbc00c1f3234e2f0a83390583d8c952597e87f373c9eca2b656f13209d3efab7b40c18d8a14442549cf28d1c', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-07 17:02:56', '2022-01-07 17:02:56');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Art', NULL, NULL);
INSERT INTO `categories` VALUES (2, 'Music', NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Models', NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Cards', NULL, NULL);

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `txhash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `logo_uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `feature_uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `banner_uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `custom_uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collections
-- ----------------------------

-- ----------------------------
-- Table structure for error_logs
-- ----------------------------
DROP TABLE IF EXISTS `error_logs`;
CREATE TABLE `error_logs`  (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `erro_desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `erro_page` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`error_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of error_logs
-- ----------------------------

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tokenId` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT 1,
  `metadata` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `category` int(11) NULL DEFAULT 0,
  `assetType` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `txHash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `external_link` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `property` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `mint_price` decimal(65, 2) NULL DEFAULT NULL,
  `price` decimal(65, 5) NULL DEFAULT NULL,
  `owner` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'user', NULL, NULL);
INSERT INTO `roles` VALUES (2, 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `investment_type` enum('FLEXIVEL','CRESCIMENTO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `gender` enum('MASCULINO','FEMININO','TRANSGÊNERO','OTHER') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cpf` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `complement` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `investment` enum('5.000-15.000','55.000-80.000','20.000-50.000','100.000+') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `admin` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0',
  `first_access` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  `client_type` enum('CLIENTE','ESPECIAL','DEMO','ADMIN') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'CLIENTE',
  `active` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'NO',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

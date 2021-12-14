/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : 127.0.0.1:3306
 Source Schema         : imp

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 22/11/2021 16:28:20
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (3, '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', '0x165df812ab0abdea1fcb0f4d7cb255e76b669911d171f5c35a34a7753146761816b8bf677a4425909345dfefbdcf0c9096702e10ca65fc742269439ab9119d561c', 'Creator1', 'Cretoar1', 'https://ipfs.io/ipfs/QmRRXBjQRQBdnivJuGe9bgk4yqogULSYoLmcy32y6AierY', '', '', '', '2021-11-16 16:53:17', '2021-11-17 05:41:00');
INSERT INTO `accounts` VALUES (4, '0xB14096d94aB202F8F1528Bcce0c1a84dc97594A0', '0x56b676c2fb4fa2256030c818ec2ea9d91f32d8bc5f6f7a4251994de57f185c865de1667e348186505a91887f448e30b958e7034a26eaa5abb0a21f73ddf117281b', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-18 14:40:47', '2021-11-18 14:40:47');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Art', NULL, NULL);
INSERT INTO `categories` VALUES (2, 'Music', NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Virtual Worlds', NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Trading Cards', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collections
-- ----------------------------
INSERT INTO `collections` VALUES (3, 'IMPv1', 'https://ipfs.io/ipfs/QmRRXBjQRQBdnivJuGe9bgk4yqogULSYoLmcy32y6AierY', 'IMP v1', '0xD3f028Ea40b27661ed2B7c6547fAC307Fe008140', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', NULL, NULL, NULL, NULL, NULL, 'private', 0, 1, '2021-11-16 15:51:21', '2021-11-16 15:51:21');
INSERT INTO `collections` VALUES (4, 'IMPV2', 'https://ipfs.io/ipfs/QmUKbysUT6tXgbdC55RHQ1fJ3LjyTmmKkam1Xz7HpYTAA2', 'v2', '0x7F40e41C586b4b894b928d9e9EB36B569773180B', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', NULL, NULL, NULL, NULL, NULL, 'private', 0, 1, '2021-11-16 18:29:06', '2021-11-16 18:29:06');

-- ----------------------------
-- Table structure for error_logs
-- ----------------------------
DROP TABLE IF EXISTS `error_logs`;
CREATE TABLE `error_logs`  (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `erro_desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `erro_page` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`error_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tokenId` int(11) NULL DEFAULT NULL,
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
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime(0) NULL DEFAULT NULL,
  `updatedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (4, '0xD3f028Ea40b27661ed2B7c6547fAC307Fe008140', 2, 'https://ipfs.io/ipfs/bafybeigkwdbcvy3aghdpkdw5w7blelys3n7wvblr3jzatzad6mpqhb4o5e/metadata.json', 1, 'image', '0xd0fe663bc2d12b9d6cf258c1106e98bc713aa01b5e35924fba82c65ed5fd9aa4', 'impv1#2', NULL, 'item#2', 'https://ipfs.io/ipfs/QmUKbysUT6tXgbdC55RHQ1fJ3LjyTmmKkam1Xz7HpYTAA2', NULL, NULL, NULL, '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', 1, 0, 0, '2021-11-17 05:22:49', '2021-11-17 05:22:49');
INSERT INTO `items` VALUES (5, '0xD3f028Ea40b27661ed2B7c6547fAC307Fe008140', 3, 'https://ipfs.io/ipfs/bafybeigbjbpydbldzgvhga36qrdrp4t5rbpw6pzh75gy56kvuppuo2sruq/metadata.json', 2, 'image', '0x3e0a2c64518b9292cd4f8639c5432f2c83e07b22993a1bb130f87d2b6aac8254', 'IMPv1#3', NULL, 'v3', 'https://ipfs.io/ipfs/QmUKbysUT6tXgbdC55RHQ1fJ3LjyTmmKkam1Xz7HpYTAA2', NULL, NULL, 0.00000, '0x6898af88CA898a34555443135575660A5f17182B', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', 1, 0, 2, '2021-11-17 06:56:47', '2021-11-18 16:30:05');
INSERT INTO `items` VALUES (6, '0x7F40e41C586b4b894b928d9e9EB36B569773180B', 1, 'https://ipfs.io/ipfs/bafybeifz2b5onllzpkmufbax4v5iaphapn5j5jxjsodltmdtotewmo3up4/metadata.json', 1, 'image', '0xabc98c9c15ad24c4cb3b5015d342e643cd474bf9ef62c68ab04c95303ed572fd', 'IMPV2#1', NULL, 'v2#1', 'https://ipfs.io/ipfs/QmUKbysUT6tXgbdC55RHQ1fJ3LjyTmmKkam1Xz7HpYTAA2', NULL, NULL, NULL, '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', 1, 0, 0, '2021-11-17 07:31:15', '2021-11-17 07:31:15');
INSERT INTO `items` VALUES (7, '0xD3f028Ea40b27661ed2B7c6547fAC307Fe008140', 4, 'https://ipfs.io/ipfs/bafybeihu57tdheddoyesrx6w4fxbtkuvxr536buncs5jyvmceuyjfruuc4/metadata.json', 3, 'image', '0x739928211a4136593ab8a399cc0cb5f919f92c5f1cb0379c5b1c943bd85aed4b', 'IMPV1#4', NULL, 'v1#4', 'https://ipfs.io/ipfs/QmUKbysUT6tXgbdC55RHQ1fJ3LjyTmmKkam1Xz7HpYTAA2', NULL, NULL, NULL, '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', '0x027C0680f7f678CA42053ef9cCD70561bA4b6250', 1, 0, 0, '2021-11-17 10:57:01', '2021-11-17 10:57:01');

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (NULL, NULL, 18, 1);
INSERT INTO `user_roles` VALUES (NULL, NULL, 17, 1);
INSERT INTO `user_roles` VALUES (NULL, NULL, 16, 1);
INSERT INTO `user_roles` VALUES ('2020-05-28 11:49:50', '2020-05-28 11:49:50', 15, 2);

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
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

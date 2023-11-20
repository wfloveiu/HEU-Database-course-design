/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : wf_sql_ks

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 04/02/2023 13:54:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dispatcher
-- ----------------------------
DROP TABLE IF EXISTS `dispatcher`;
CREATE TABLE `dispatcher`  (
  `dispatcher_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dispatcher_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dispatcher_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dispatcher_id`) USING BTREE,
  UNIQUE INDEX `dispatcher_id`(`dispatcher_id`) USING BTREE,
  INDEX `dispatcher_name`(`dispatcher_name`) USING BTREE,
  INDEX `dispatcher_phone`(`dispatcher_phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dispatcher
-- ----------------------------
INSERT INTO `dispatcher` VALUES ('010100', '摇摆羊', '13365789765');
INSERT INTO `dispatcher` VALUES ('010101', '小亮', '15878977898');
INSERT INTO `dispatcher` VALUES ('1000011', '老八', '13526777887');
INSERT INTO `dispatcher` VALUES ('10111', '赵三金', '15965578765');

-- ----------------------------
-- Table structure for fastfood_shop
-- ----------------------------
DROP TABLE IF EXISTS `fastfood_shop`;
CREATE TABLE `fastfood_shop`  (
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(10) NOT NULL COMMENT '价格',
  `m_sale_v` int(50) NOT NULL COMMENT '销售量',
  PRIMARY KEY (`shop_name`) USING BTREE,
  UNIQUE INDEX `shop_name`(`shop_name`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `m_sale_v`(`m_sale_v`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fastfood_shop
-- ----------------------------
INSERT INTO `fastfood_shop` VALUES ('大美鸡公煲', 15, 100);
INSERT INTO `fastfood_shop` VALUES ('天美自选饭', 10, 200);
INSERT INTO `fastfood_shop` VALUES ('天美馋嘴鸭', 16, 61);
INSERT INTO `fastfood_shop` VALUES ('小美烤盘饭', 12, 101);
INSERT INTO `fastfood_shop` VALUES ('小美章丘炒鸡', 16, 99);
INSERT INTO `fastfood_shop` VALUES ('小美负一楼蛋炒饭', 10, 101);
INSERT INTO `fastfood_shop` VALUES ('小美麻辣烫', 15, 103);
INSERT INTO `fastfood_shop` VALUES ('至美猪脚饭', 20, 52);

-- ----------------------------
-- Table structure for oorder
-- ----------------------------
DROP TABLE IF EXISTS `oorder`;
CREATE TABLE `oorder`  (
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_money` int(50) NOT NULL,
  `order_way` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cons_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cons_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cons_addre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checked` int(1) NULL DEFAULT 0,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `shop_name`(`shop_name`) USING BTREE,
  INDEX `order_money`(`order_money`) USING BTREE,
  INDEX `order_way`(`order_way`) USING BTREE,
  INDEX `cons_phone`(`cons_phone`) USING BTREE,
  INDEX `cons_name`(`cons_name`) USING BTREE,
  INDEX `cons_addre`(`cons_addre`) USING BTREE,
  INDEX `checked`(`checked`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oorder
-- ----------------------------
INSERT INTO `oorder` VALUES (1, '大美鸡公煲', 12, '人工订餐', '13525138301', '老三', '15公寓', 0, '2022-12-16 14:35:17');
INSERT INTO `oorder` VALUES (2, '小美负一楼蛋炒饭', 10, '人工订餐', '13525138301', '吴方', '10公寓', 2, '2022-12-16 14:35:26');
INSERT INTO `oorder` VALUES (3, '至美猪脚饭', 20, '人工订餐', '13525138301', '吴方', '8公寓', 0, '2022-12-16 14:35:35');

-- ----------------------------
-- Table structure for orderway
-- ----------------------------
DROP TABLE IF EXISTS `orderway`;
CREATE TABLE `orderway`  (
  `orderway_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订餐方式',
  `count` int(11) NOT NULL COMMENT '该种方式的订餐数量',
  PRIMARY KEY (`orderway_name`) USING BTREE,
  UNIQUE INDEX `orderway_name`(`orderway_name`) USING BTREE,
  INDEX `count`(`count`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderway
-- ----------------------------
INSERT INTO `orderway` VALUES ('网上订餐', 51);
INSERT INTO `orderway` VALUES ('人工订餐', 108);

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server`  (
  `service_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务员编号',
  `service_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fastfood_shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在的店铺名字',
  PRIMARY KEY (`service_id`) USING BTREE,
  UNIQUE INDEX `service_id`(`service_id`) USING BTREE,
  INDEX `service_name`(`service_name`) USING BTREE,
  INDEX `fastfood_shop_name`(`fastfood_shop_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES ('100000', '刀哥', '小美烤盘饭');
INSERT INTO `server` VALUES ('100001', '司徒王朗', '小美麻辣烫');
INSERT INTO `server` VALUES ('100011', '虎哥', '大美鸡公煲');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE COMMENT '主键索引，选UNIQUE',
  INDEX `username`(`username`) USING BTREE,
  INDEX `password`(`password`) USING BTREE,
  INDEX `telephone`(`telephone`) USING BTREE,
  INDEX `role`(`role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wf', '123456', '13525160625', 1);
INSERT INTO `user` VALUES (2, 'iu', '123456789', '13525138301', 0);
INSERT INTO `user` VALUES (3, 'mty', '123456', '15967789756', 0);

-- ----------------------------
-- Table structure for user_msg
-- ----------------------------
DROP TABLE IF EXISTS `user_msg`;
CREATE TABLE `user_msg`  (
  `id` int(10) UNSIGNED NULL DEFAULT NULL,
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(10) NOT NULL,
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `userid`(`id`) USING BTREE,
  INDEX `real_name`(`real_name`) USING BTREE,
  INDEX `sex`(`sex`) USING BTREE,
  INDEX `age`(`age`) USING BTREE,
  INDEX `mail`(`mail`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  CONSTRAINT `userid` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_msg
-- ----------------------------
INSERT INTO `user_msg` VALUES (2, '李知恩', '男', 18, '3208352196@qq.com', '13525138301', 'iu');
INSERT INTO `user_msg` VALUES (3, '马天宇', '男', 20, '787898@qq.com', '15967789756', '马天宇');

-- ----------------------------
-- Table structure for wuliu
-- ----------------------------
DROP TABLE IF EXISTS `wuliu`;
CREATE TABLE `wuliu`  (
  `order_id` int(11) NOT NULL COMMENT '订单的编号',
  `cons_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `disp_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deliver_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ended` int(1) NOT NULL DEFAULT 0 COMMENT '是否结束',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `cons_phone`(`cons_phone`) USING BTREE,
  INDEX `disp_id`(`disp_id`) USING BTREE,
  INDEX `deliver_time`(`deliver_time`) USING BTREE,
  INDEX `ended`(`ended`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wuliu
-- ----------------------------
INSERT INTO `wuliu` VALUES (2, '13525138301', '010100', '20分钟', 0);

-- ----------------------------
-- View structure for sended_order
-- ----------------------------
DROP VIEW IF EXISTS `sended_order`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sended_order` AS select `oorder`.`order_id` AS `order_id`,`oorder`.`shop_name` AS `shop_name`,`oorder`.`order_money` AS `order_money`,`oorder`.`order_way` AS `order_way`,`oorder`.`cons_phone` AS `cons_phone`,`oorder`.`cons_name` AS `cons_name`,`oorder`.`cons_addre` AS `cons_addre`,`wuliu`.`disp_id` AS `disp_id`,`wuliu`.`deliver_time` AS `deliver_time`,`dispatcher`.`dispatcher_phone` AS `dispatcher_phone` from ((`oorder` join `wuliu` on((`oorder`.`order_id` = `wuliu`.`order_id`))) join `dispatcher` on((`wuliu`.`disp_id` = `dispatcher`.`dispatcher_id`))) where (`oorder`.`checked` = 2);

-- ----------------------------
-- View structure for sending_order
-- ----------------------------
DROP VIEW IF EXISTS `sending_order`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sending_order` AS select `oorder`.`order_id` AS `order_id`,`oorder`.`shop_name` AS `shop_name`,`oorder`.`order_money` AS `order_money`,`oorder`.`order_way` AS `order_way`,`oorder`.`cons_phone` AS `cons_phone`,`oorder`.`cons_name` AS `cons_name`,`oorder`.`cons_addre` AS `cons_addre`,`wuliu`.`disp_id` AS `disp_id`,`wuliu`.`deliver_time` AS `deliver_time`,`dispatcher`.`dispatcher_phone` AS `dispatcher_phone` from ((`oorder` join `wuliu` on((`oorder`.`order_id` = `wuliu`.`order_id`))) join `dispatcher` on((`wuliu`.`disp_id` = `dispatcher`.`dispatcher_id`))) where (`oorder`.`checked` = 1);

-- ----------------------------
-- Triggers structure for table oorder
-- ----------------------------
DROP TRIGGER IF EXISTS `order_insert`;
delimiter ;;
CREATE TRIGGER `order_insert` AFTER INSERT ON `oorder` FOR EACH ROW BEGIN
UPDATE orderway 
SET orderway.count=orderway.count+1
WHERE orderway.orderway_name=new.order_way;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table oorder
-- ----------------------------
DROP TRIGGER IF EXISTS `order_insert_sale`;
delimiter ;;
CREATE TRIGGER `order_insert_sale` AFTER INSERT ON `oorder` FOR EACH ROW BEGIN
UPDATE fastfood_shop
SET fastfood_shop.m_sale_v=fastfood_shop.m_sale_v+1
WHERE fastfood_shop.shop_name=new.shop_name;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table oorder
-- ----------------------------
DROP TRIGGER IF EXISTS `order_update`;
delimiter ;;
CREATE TRIGGER `order_update` AFTER UPDATE ON `oorder` FOR EACH ROW BEGIN
if(new.order_way!=old.order_way)
	then
	UPDATE orderway SET orderway.count=orderway.count-1 WHERE orderway.orderway_name=old.order_way;
	UPDATE orderway SET orderway.count=orderway.count+1 WHERE orderway.orderway_name=new.order_way;
	END IF;
	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table oorder
-- ----------------------------
DROP TRIGGER IF EXISTS `order_delete`;
delimiter ;;
CREATE TRIGGER `order_delete` AFTER DELETE ON `oorder` FOR EACH ROW BEGIN
UPDATE orderway
SET orderway.count=orderway.count-1
WHERE orderway.orderway_name=old.order_way;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table oorder
-- ----------------------------
DROP TRIGGER IF EXISTS `order_delete_sale`;
delimiter ;;
CREATE TRIGGER `order_delete_sale` AFTER DELETE ON `oorder` FOR EACH ROW BEGIN
UPDATE fastfood_shop
SET fastfood_shop.m_sale_v=fastfood_shop.m_sale_v-1
WHERE fastfood_shop.shop_name=old.shop_name;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table wuliu
-- ----------------------------
DROP TRIGGER IF EXISTS `wuliu_insert`;
delimiter ;;
CREATE TRIGGER `wuliu_insert` AFTER INSERT ON `wuliu` FOR EACH ROW BEGIN
UPDATE oorder
SET oorder.checked=1
WHERE oorder.order_id=new.order_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

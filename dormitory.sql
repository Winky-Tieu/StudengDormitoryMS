/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 20/06/2022 11:06:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_building
-- ----------------------------
DROP TABLE IF EXISTS `tb_building`;
CREATE TABLE `tb_building`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '楼栋名',
  `floor_num` int(11) NULL DEFAULT NULL COMMENT '楼层数',
  `liver_sex` int(11) NULL DEFAULT NULL COMMENT '此栋楼居住学生性别：女生=0；男生=1',
  `manager_id` int(11) NULL DEFAULT NULL COMMENT '管理员ID',
  `manager_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_building_tb_user_user_id_fk`(`manager_id`) USING BTREE,
  CONSTRAINT `tb_building_tb_user_user_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_building
-- ----------------------------
INSERT INTO `tb_building` VALUES (1, '学1', 6, 1, 10001, NULL);
INSERT INTO `tb_building` VALUES (2, '学2', 6, 1, 10002, NULL);
INSERT INTO `tb_building` VALUES (3, '学3', 6, 1, 10003, NULL);
INSERT INTO `tb_building` VALUES (4, '学4', 6, 0, 10004, NULL);
INSERT INTO `tb_building` VALUES (5, '学5', 6, 1, 10005, NULL);
INSERT INTO `tb_building` VALUES (6, '学6', 6, 0, 10006, NULL);
INSERT INTO `tb_building` VALUES (7, '学7', 6, 0, 10007, NULL);
INSERT INTO `tb_building` VALUES (8, '学8', 6, 0, 10008, NULL);
INSERT INTO `tb_building` VALUES (9, '学9', 6, 0, 10009, NULL);
INSERT INTO `tb_building` VALUES (10, '学10', 6, 0, 10010, NULL);
INSERT INTO `tb_building` VALUES (11, '学11', 6, 0, 10011, NULL);
INSERT INTO `tb_building` VALUES (12, '学12', 10, 1, 10012, NULL);
INSERT INTO `tb_building` VALUES (13, '教师公寓1', 12, 0, 10013, NULL);
INSERT INTO `tb_building` VALUES (14, '教师公寓2', 12, 0, 10014, NULL);
INSERT INTO `tb_building` VALUES (15, '教师公寓3', 12, 1, 10015, NULL);
INSERT INTO `tb_building` VALUES (16, '继续教育1', 7, 0, 10016, NULL);
INSERT INTO `tb_building` VALUES (17, '继续教育2', 7, 1, 10016, NULL);

-- ----------------------------
-- Table structure for tb_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tb_exchange`;
CREATE TABLE `tb_exchange`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `stu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL COMMENT '学生性别：女生=0；男生=1',
  `building_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `ex_reason` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ex_intention` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ex_date` datetime(0) NULL DEFAULT NULL,
  `ex_status` int(11) NULL DEFAULT NULL COMMENT '调换状态：审核中=0，通过=1，未通过=2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1092849 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_exchange
-- ----------------------------
INSERT INTO `tb_exchange` VALUES (1092834, 2020510320, 'Linda', 0, 17, 171010, '离教学楼太远', '希望能换到14栋', '2021-02-19 10:06:09', 2);
INSERT INTO `tb_exchange` VALUES (1092835, 2019201111, 'Eva', 0, 12, 123009, '楼层太低，阳光被挡', '可否换到3楼以上', '2021-02-28 10:06:15', 1);
INSERT INTO `tb_exchange` VALUES (1092841, 2020510320, 'Linda', 0, 17, 171010, '宿舍太吵', '换到1人间', '2021-04-07 10:08:40', 2);
INSERT INTO `tb_exchange` VALUES (1092849, 2019201111, 'Eva', 0, 17, 173009, '喜欢单人间', '同上', '2022-06-16 09:01:08', 0);

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `href` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标',
  `parent_id` int(11) NULL DEFAULT NULL,
  `user_type` int(11) NULL DEFAULT NULL COMMENT '菜单类型：学生=0，宿管=1，后勤=2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1251 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '功能菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1011, '个人信息', NULL, 'student/info.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1021, '通知公告', NULL, 'notificationstu/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1031, '调换申请', NULL, 'exchangestu/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1032, '维修申请', NULL, 'repairstu/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1041, '日程管理', NULL, 'schedule/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1051, '记账管理', NULL, 'bookkeeping/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1111, '通知发布', NULL, 'notification/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1121, '水电账单', NULL, 'bill/upload.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1131, '维修处理', NULL, 'repair/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1141, '个人信息', NULL, 'MidAdmin/info.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1211, '用户管理', NULL, 'user/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1221, '调换审核', NULL, 'exchange/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1231, '楼栋管理', NULL, 'building/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1232, '房间管理', NULL, 'room/list.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1241, '宿舍分配', NULL, 'intention/arrange.html', NULL, 0, NULL);
INSERT INTO `tb_menu` VALUES (1251, '个人信息', NULL, 'FinalAdmin/info.html', NULL, 0, NULL);

-- ----------------------------
-- Table structure for tb_notification
-- ----------------------------
DROP TABLE IF EXISTS `tb_notification`;
CREATE TABLE `tb_notification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `noti_head` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `noti_content` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `noti_range` int(11) NULL DEFAULT NULL COMMENT '通知范围：即宿舍楼编号',
  `noti_type` int(11) NULL DEFAULT NULL COMMENT '通知类型：一般=0，重要=1',
  `noti_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180293439 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notification
-- ----------------------------
INSERT INTO `tb_notification` VALUES (180293401, 10001, '后天下午停电', '后天下午3:00~5:00，全部停电', 17, 1, '2022-06-01 11:49:17');
INSERT INTO `tb_notification` VALUES (180293402, 10007, '大功率电器检查', '6月4日~6月8日随机抽查大功率电器使用情况', 17, 0, '2022-05-31 11:53:00');
INSERT INTO `tb_notification` VALUES (180293403, 10011, '明日特大暴雨', '近日有特大暴雨，请尽量待在宿舍，避免外出', 17, 1, '2022-06-06 12:34:09');
INSERT INTO `tb_notification` VALUES (180293407, 2020510320, '失物招领', '遗失一张尾号为2093的校园卡的同学请到17栋1001取回丢失的卡片', 17, 0, '2022-05-05 12:54:31');
INSERT INTO `tb_notification` VALUES (180293410, 2022101201, '下午开班会', '下午2:00~2:50在7A301开班会', 0, 0, '2022-05-09 08:19:54');
INSERT INTO `tb_notification` VALUES (180293411, 2019351435, '找代拿晚饭', '悦香一楼玻璃房家味烤鸡，代拿5块', 0, 0, '2022-05-19 08:21:09');
INSERT INTO `tb_notification` VALUES (180293412, 2019201111, '下周二考试', '3号楼B栋410', 0, 1, '2022-05-26 08:22:51');
INSERT INTO `tb_notification` VALUES (180293413, 2022617801, '本周卫生安排', '周一：黄泳昭；周二：温华', 0, 0, '2022-04-21 08:25:01');
INSERT INTO `tb_notification` VALUES (180293427, 10016, '宽带提速', '3月1日起，所有房间宽带免费升级至千兆。届时下载速度峰值将会提升至130Mb/s', 17, 0, '2022-03-01 10:10:20');
INSERT INTO `tb_notification` VALUES (180293428, 2019201111, '不许剧透', '拒绝剧透，从你我做起', 0, 0, '2021-06-02 10:20:35');
INSERT INTO `tb_notification` VALUES (180293429, 2021109223, '大暴雨', '穿洞洞鞋', 0, 0, '2022-05-26 08:47:47');
INSERT INTO `tb_notification` VALUES (180293431, 2020510320, '666', '1号床脱单啦！', 0, 0, '2022-06-08 15:43:09');
INSERT INTO `tb_notification` VALUES (180293432, 2020510212, '今天星期五', '明天出去玩', 0, 0, '2022-06-10 09:18:41');
INSERT INTO `tb_notification` VALUES (180293433, 2019201111, '肯德基疯狂星期四', '要吃葡挞的过来报名！！！', 0, 1, '2022-06-10 09:44:22');
INSERT INTO `tb_notification` VALUES (180293436, 2019201111, '111', '111', 0, 0, '2022-06-10 15:37:07');
INSERT INTO `tb_notification` VALUES (180293437, 10011, '天气预报', '东莞市明日25~30摄氏度，中雨转大雨，出门带好雨具。', 11, 0, '2022-06-10 16:00:45');
INSERT INTO `tb_notification` VALUES (180293439, 2019201111, '111', '111', 0, 0, '2022-06-16 08:59:09');

-- ----------------------------
-- Table structure for tb_repair
-- ----------------------------
DROP TABLE IF EXISTS `tb_repair`;
CREATE TABLE `tb_repair`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rep_item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rep_date` datetime(0) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `building_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `rep_status` int(11) NULL DEFAULT NULL COMMENT '维修状态：等待维修=0；维修完成=1',
  `rep_man` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10200328 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_repair
-- ----------------------------
INSERT INTO `tb_repair` VALUES (10200302, '椅子', '椅子断了一条腿', '2021-02-11 10:07:05', 2020510320, 17, 122001, 1, NULL);
INSERT INTO `tb_repair` VALUES (10200303, '插座', '宿舍门左侧的插座没电', '2021-02-16 09:45:17', 2020510320, 17, 142023, 1, '张师傅');
INSERT INTO `tb_repair` VALUES (10200305, '水龙头', '阳台水龙头不能完全拧紧', '2021-03-10 11:07:53', 2020510320, 17, 171010, 1, NULL);
INSERT INTO `tb_repair` VALUES (10200306, '门', '刚搬进来就是坏的', '2021-03-13 10:06:57', 2020510320, 17, 123009, 1, '黄师傅');
INSERT INTO `tb_repair` VALUES (10200307, '锁', '周围宿舍的钥匙都能打开我们宿舍的门', '2021-03-15 13:24:09', 2020510320, 17, 115001, 0, NULL);
INSERT INTO `tb_repair` VALUES (10200308, '风扇', '风扇不能制热', '2021-03-22 11:01:03', 2020510320, 17, 171010, 2, NULL);
INSERT INTO `tb_repair` VALUES (10200312, '厕所镜子', '因冷热交替而裂开', '2021-04-01 13:24:06', 2020510320, 17, 171010, 1, NULL);
INSERT INTO `tb_repair` VALUES (10200316, '花花', '枯了', '2021-04-10 11:59:21', 2020510320, 17, 171010, 2, NULL);
INSERT INTO `tb_repair` VALUES (10200317, '厕所水管', '水管爆裂', '2022-05-18 13:15:23', 2022209730, 11, 112001, 1, NULL);
INSERT INTO `tb_repair` VALUES (10200318, '花洒', ' 漏水', '2022-06-10 18:04:57', 2019201111, 17, 171010, 0, NULL);
INSERT INTO `tb_repair` VALUES (10200319, '网线口', '不通网', '2022-06-10 20:35:03', 2019201111, 17, 171010, 0, NULL);
INSERT INTO `tb_repair` VALUES (10200328, '11', '11', '2022-06-16 09:01:59', 2019201111, 17, 173009, 0, NULL);

-- ----------------------------
-- Table structure for tb_room
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room`  (
  `id` int(11) NOT NULL,
  `building_id` int(11) NULL DEFAULT NULL,
  `brand` int(11) NULL DEFAULT NULL,
  `floor` int(11) NULL DEFAULT NULL,
  `room_capacity` int(11) NULL DEFAULT NULL COMMENT '房间容量：无人间=0；一人间=1；二人间=2；四人间=4；六人间=6',
  `room_status` int(11) NULL DEFAULT NULL COMMENT '房间状态：空房间=0；未满=1；已满=2',
  `room_type` int(11) NULL DEFAULT NULL COMMENT '房间类型：学生寝室=0；老师寝室=1；管理员寝室=2;',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_room_tb_building_id_fk`(`building_id`) USING BTREE,
  CONSTRAINT `tb_room_tb_building_id_fk` FOREIGN KEY (`building_id`) REFERENCES `tb_building` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room
-- ----------------------------
INSERT INTO `tb_room` VALUES (11001, 1, 1001, 1, 6, 2, 2);
INSERT INTO `tb_room` VALUES (11002, 1, 1002, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11003, 1, 1003, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11004, 1, 1004, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11005, 1, 1005, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11006, 1, 1006, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11007, 1, 1007, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11008, 1, 1008, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11009, 1, 1009, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (11010, 1, 1010, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12001, 1, 2001, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12002, 1, 2002, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12003, 1, 2003, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12004, 1, 2004, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12005, 1, 2005, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12006, 1, 2006, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12007, 1, 2007, 2, 6, 1, 0);
INSERT INTO `tb_room` VALUES (12008, 1, 2008, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12009, 1, 2009, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (12010, 1, 2010, 2, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (13001, 1, 3001, 3, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (13002, 1, 3002, 3, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (13003, 1, 3003, 3, 6, 1, 0);
INSERT INTO `tb_room` VALUES (21001, 2, 1001, 1, 6, 2, 2);
INSERT INTO `tb_room` VALUES (21002, 2, 1002, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (21003, 2, 1003, 1, 6, NULL, 0);
INSERT INTO `tb_room` VALUES (21004, 2, 1004, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (21005, 2, 1005, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (21006, 2, 1006, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (21007, 2, 1007, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (21008, 2, 1008, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (21009, 2, 1009, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (21010, 2, 1010, 1, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22001, 2, 2001, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22002, 2, 2002, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22003, 2, 2003, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22004, 2, 2004, 2, 6, 1, 0);
INSERT INTO `tb_room` VALUES (22005, 2, 2005, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22006, 2, 2006, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22007, 2, 2007, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22008, 2, 2008, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22009, 2, 2009, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (22010, 2, 2010, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (23001, 2, 3001, 3, 6, 0, 0);
INSERT INTO `tb_room` VALUES (23002, 2, 3002, 3, 6, 0, 0);
INSERT INTO `tb_room` VALUES (23003, 2, 3003, 3, 6, 0, 0);
INSERT INTO `tb_room` VALUES (24001, 2, 4001, 4, 6, 0, 0);
INSERT INTO `tb_room` VALUES (25011, 2, 5011, 5, 6, 1, 0);
INSERT INTO `tb_room` VALUES (31001, 3, 1001, 1, 6, 2, 2);
INSERT INTO `tb_room` VALUES (32001, 3, 2001, 2, 6, 0, 0);
INSERT INTO `tb_room` VALUES (41001, 4, 1001, 1, 6, 2, 2);
INSERT INTO `tb_room` VALUES (42001, 4, 2001, 2, 6, 1, 0);
INSERT INTO `tb_room` VALUES (51001, 5, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (52001, 5, 2001, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (52002, 5, 2002, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (52004, 5, 2004, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (52006, 5, 2006, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (61001, 6, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (62001, 6, 2001, 2, 4, 1, 0);
INSERT INTO `tb_room` VALUES (71001, 7, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (71002, 7, 1002, 1, 4, 2, 0);
INSERT INTO `tb_room` VALUES (72001, 7, 2001, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (81001, 8, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (82001, 8, 2001, 2, 4, 1, 0);
INSERT INTO `tb_room` VALUES (91001, 9, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (92001, 9, 2001, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (92002, 9, 2002, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (101001, 10, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (102001, 10, 2001, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (111001, 11, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (112001, 11, 2001, 2, 4, 1, 0);
INSERT INTO `tb_room` VALUES (115001, 11, 5001, 5, 4, 0, 0);
INSERT INTO `tb_room` VALUES (121001, 12, 1001, 1, 4, 2, 2);
INSERT INTO `tb_room` VALUES (122001, 12, 2001, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (123009, 12, 3009, 3, 4, 0, 0);
INSERT INTO `tb_room` VALUES (131001, 13, 1001, 1, 1, 2, 2);
INSERT INTO `tb_room` VALUES (132001, 13, 2001, 2, 1, 2, 1);
INSERT INTO `tb_room` VALUES (132002, 13, 2002, 2, 1, 2, 1);
INSERT INTO `tb_room` VALUES (141001, 14, 1001, 1, 1, 2, 2);
INSERT INTO `tb_room` VALUES (141002, 14, 1002, 1, 1, 2, 1);
INSERT INTO `tb_room` VALUES (141003, 14, 1003, 1, 1, 2, 1);
INSERT INTO `tb_room` VALUES (141004, 14, 1004, 1, 1, 2, 1);
INSERT INTO `tb_room` VALUES (142023, 14, 2023, 2, 1, 2, 1);
INSERT INTO `tb_room` VALUES (151001, 15, 1001, 1, 1, 2, 2);
INSERT INTO `tb_room` VALUES (152001, 15, 2001, 2, 1, 2, 1);
INSERT INTO `tb_room` VALUES (161001, 16, 1001, 1, 6, 2, 2);
INSERT INTO `tb_room` VALUES (161002, 16, 1002, 1, 6, 2, 0);
INSERT INTO `tb_room` VALUES (171001, 17, 1001, 1, 4, 0, 0);
INSERT INTO `tb_room` VALUES (171002, 17, 1002, 1, 4, 0, 0);
INSERT INTO `tb_room` VALUES (171003, 17, 1003, 1, 4, 0, 0);
INSERT INTO `tb_room` VALUES (171009, 17, 1009, 1, 4, 1, 0);
INSERT INTO `tb_room` VALUES (171010, 17, 1010, 1, 4, 0, 0);
INSERT INTO `tb_room` VALUES (172001, 17, 2001, 2, 4, 0, 0);
INSERT INTO `tb_room` VALUES (173001, 17, 3001, 3, 4, 1, 0);
INSERT INTO `tb_room` VALUES (173003, 17, 3003, 3, 4, 1, 0);
INSERT INTO `tb_room` VALUES (173009, 17, 3009, 3, 4, 2, 0);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `user_pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL COMMENT '用户性别：女=0；男=1',
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `user_type` int(11) NULL DEFAULT NULL COMMENT '角色类型：学生=0；宿舍管理员=1；后勤中心=2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2022617801 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (10001, '123456', '曹淑敏', 0, '15800600699', 11001, 1);
INSERT INTO `tb_user` VALUES (10002, '123456789', '崔红宇', 0, '13049009003', 21001, 1);
INSERT INTO `tb_user` VALUES (10003, '123456', '邓博涛', 1, '18829589688', 31001, 1);
INSERT INTO `tb_user` VALUES (10004, '123', '戴蕾', 0, '13075556662', 41001, 1);
INSERT INTO `tb_user` VALUES (10005, '123456', '邓莉', 0, '13275766669', 51001, 1);
INSERT INTO `tb_user` VALUES (10006, '123456', '冯春恒', 0, '15311751818', 61001, 1);
INSERT INTO `tb_user` VALUES (10007, '123456', '顾红丽', 0, '18580881555', 71001, 1);
INSERT INTO `tb_user` VALUES (10008, '123456', '贾燕青', 0, '13562779999', 81001, 1);
INSERT INTO `tb_user` VALUES (10009, '123456', '靖凤琴', 0, '18595888000', 91001, 1);
INSERT INTO `tb_user` VALUES (10010, '123456', '韩云庆', 0, '13109880800', 101001, 1);
INSERT INTO `tb_user` VALUES (10011, '123456', '哇哈哈', 0, '13145550577', 111001, 1);
INSERT INTO `tb_user` VALUES (10012, '123456', '高巍', 1, '13145553133', 121001, 1);
INSERT INTO `tb_user` VALUES (10013, '123456', '杜荣基', 1, '13145556011', 131001, 1);
INSERT INTO `tb_user` VALUES (10014, '123456', '刘艳茹', 0, '13145552833', 141001, 1);
INSERT INTO `tb_user` VALUES (10015, '123456', '乔豫', 1, '18343217111', 151001, 1);
INSERT INTO `tb_user` VALUES (10016, '123456', '吕金起', 1, '17357970001', 161001, 1);
INSERT INTO `tb_user` VALUES (30001, 'wingky', 'Wingky', 0, '13601004757', 132002, 2);
INSERT INTO `tb_user` VALUES (30002, 'admin', 'admin', 1, '18360606111', 152001, 2);
INSERT INTO `tb_user` VALUES (2016201101, '123456', '石娜', 0, '13692237828', 173009, 0);
INSERT INTO `tb_user` VALUES (2016301110, '123456', '袁雪雯', 0, '13911296271', 173003, 0);
INSERT INTO `tb_user` VALUES (2017101101, '123456', '申继忠', 1, '13538227828', 161002, 0);
INSERT INTO `tb_user` VALUES (2017140110, '123456', '赵轶丽', 0, '15592999923', 62001, 0);
INSERT INTO `tb_user` VALUES (2017201140, '123456', '赵希抟', 1, '13911537281', 161002, 0);
INSERT INTO `tb_user` VALUES (2017310601, '123456', '杨金柱', 0, '13911533712', 71002, 0);
INSERT INTO `tb_user` VALUES (2017511511, '123456', '余婷婷', 0, '13433494939', 62001, 0);
INSERT INTO `tb_user` VALUES (2017520107, '123456', '汪访云', 1, '13138766333', 25011, 0);
INSERT INTO `tb_user` VALUES (2018301333, '123456', '徐北栀', 1, '13911715632', 161002, 0);
INSERT INTO `tb_user` VALUES (2018401333, '123456', '张国栋', 1, '18575111161', 161002, 0);
INSERT INTO `tb_user` VALUES (2018411211, '123456', '崔素欣', 0, '13413139443', 71002, 0);
INSERT INTO `tb_user` VALUES (2019141510, '123456', '范琴韵', 0, '13433414349', 71002, 0);
INSERT INTO `tb_user` VALUES (2019201111, '123456', 'Eva', 0, '13829715538', 173009, 0);
INSERT INTO `tb_user` VALUES (2019351411, '123456', '王素娟', 0, '15768369828', 173009, 0);
INSERT INTO `tb_user` VALUES (2019351435, '123456', '徐金枝', 0, '13413119344', 42001, 0);
INSERT INTO `tb_user` VALUES (2019410333, '123456', '周俞莹', 0, '18575111131', 62001, 0);
INSERT INTO `tb_user` VALUES (2020101318, '123456', '路连军', 1, '18520957999', 123009, 0);
INSERT INTO `tb_user` VALUES (2020510212, '123456', '马燕飞', 0, '15768773828', 173009, 0);
INSERT INTO `tb_user` VALUES (2020510320, 'linda', 'Linda', 0, '13262220527', 173003, 0);
INSERT INTO `tb_user` VALUES (2021109223, '123456', '李淳罡', 1, '13119889333', 22004, 0);
INSERT INTO `tb_user` VALUES (2021403702, '123456', '徐淮南', 1, '18576552777', 12007, 0);
INSERT INTO `tb_user` VALUES (2021801914, '123456', '门江涛', 1, '18576556777', 13003, 0);
INSERT INTO `tb_user` VALUES (2022101201, '123456', '温华', 1, '13288368333', 161002, 0);
INSERT INTO `tb_user` VALUES (2022101810, '123456', '时怀期', 0, '13758473033', 82001, 0);
INSERT INTO `tb_user` VALUES (2022209730, '123456', '周亚娟', 0, '13911252372', 112001, 0);
INSERT INTO `tb_user` VALUES (2022315210, '123456', '张建学', 1, '18689232333', 161002, 0);
INSERT INTO `tb_user` VALUES (2022410333, '123456', '赖展文', 1, '13169199333', 25011, 0);
INSERT INTO `tb_user` VALUES (2022617801, '123456', '夏静芙', 0, '13433439443', 71002, 0);

-- ----------------------------
-- Table structure for tb_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_menu`;
CREATE TABLE `tb_user_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_menu
-- ----------------------------
INSERT INTO `tb_user_menu` VALUES (1, 0, 1011);
INSERT INTO `tb_user_menu` VALUES (2, 0, 1021);
INSERT INTO `tb_user_menu` VALUES (3, 0, 1031);
INSERT INTO `tb_user_menu` VALUES (4, 0, 1032);
INSERT INTO `tb_user_menu` VALUES (5, -1, 1041);
INSERT INTO `tb_user_menu` VALUES (6, -1, 1051);
INSERT INTO `tb_user_menu` VALUES (7, 1, 1141);
INSERT INTO `tb_user_menu` VALUES (8, 1, 1111);
INSERT INTO `tb_user_menu` VALUES (9, -1, 1121);
INSERT INTO `tb_user_menu` VALUES (10, 1, 1131);
INSERT INTO `tb_user_menu` VALUES (11, 2, 1251);
INSERT INTO `tb_user_menu` VALUES (12, 2, 1211);
INSERT INTO `tb_user_menu` VALUES (13, 2, 1221);
INSERT INTO `tb_user_menu` VALUES (14, 2, 1231);
INSERT INTO `tb_user_menu` VALUES (15, -1, 1232);
INSERT INTO `tb_user_menu` VALUES (16, -1, 1241);

SET FOREIGN_KEY_CHECKS = 1;

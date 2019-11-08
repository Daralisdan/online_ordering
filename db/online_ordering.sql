/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.55 : Database - online_ordering
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online_ordering` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `online_ordering`;

/*Table structure for table `stu` */

DROP TABLE IF EXISTS `stu`;

CREATE TABLE `stu` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stu` */

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `aid` int(4) NOT NULL COMMENT '唯一标识，管理员id',
  `aname` varchar(50) DEFAULT NULL COMMENT '管理员用户名',
  `apwd` varchar(50) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`aid`,`aname`,`apwd`) values (1,'admin','123'),(2,'ceshi','123'),(3,'张三','123'),(4,'李四','32545'),(5,'lishi','000'),(8,'ffgj','ffgj');

/*Table structure for table `t_foodcalalog` */

DROP TABLE IF EXISTS `t_foodcalalog`;

CREATE TABLE `t_foodcalalog` (
  `calalog_id` int(4) NOT NULL COMMENT '菜品类别ID',
  `calalog_name` varchar(255) DEFAULT NULL COMMENT '菜品分类名称',
  `calalog_describle` varchar(255) DEFAULT NULL COMMENT '菜品分类描述',
  PRIMARY KEY (`calalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_foodcalalog` */

insert  into `t_foodcalalog`(`calalog_id`,`calalog_name`,`calalog_describle`) values (1,'主食','米饭。馒头'),(2,'炒菜','荤菜，素菜，各种口味'),(3,'面食','炒面');

/*Table structure for table `t_foods` */

DROP TABLE IF EXISTS `t_foods`;

CREATE TABLE `t_foods` (
  `foods_id` int(4) NOT NULL COMMENT '菜品ID',
  `foods_name` varchar(255) DEFAULT NULL COMMENT '菜品名称',
  `foods_describle` varchar(255) DEFAULT NULL COMMENT '菜品描述',
  `foods_type` varchar(255) NOT NULL COMMENT '菜品分类',
  `foods_img` varchar(255) DEFAULT NULL COMMENT '菜品图片',
  `foods_price` int(20) DEFAULT NULL COMMENT '菜品价格',
  `foods_people` varchar(255) DEFAULT NULL COMMENT '菜品适合人群',
  PRIMARY KEY (`foods_id`,`foods_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_foods` */

insert  into `t_foods`(`foods_id`,`foods_name`,`foods_describle`,`foods_type`,`foods_img`,`foods_price`,`foods_people`) values (1,'米饭',NULL,'主食',NULL,NULL,NULL);

/*Table structure for table `t_gustbook` */

DROP TABLE IF EXISTS `t_gustbook`;

CREATE TABLE `t_gustbook` (
  `gust_id` int(4) NOT NULL COMMENT '留言表ID',
  `gust_name` varchar(255) DEFAULT NULL COMMENT '留言人',
  `gust_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `gust_content` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`gust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_gustbook` */

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `notice_id` int(4) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `notice_date` date DEFAULT NULL COMMENT '发布日期',
  `notice_content` varchar(255) DEFAULT NULL COMMENT '公告内容',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_notice` */

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `order_id` int(4) NOT NULL COMMENT '订单ID',
  `order_number` int(10) DEFAULT NULL COMMENT '订单编号',
  `order_money` int(10) DEFAULT NULL COMMENT '订单金额',
  `order_date` datetime DEFAULT NULL COMMENT '订单日期',
  `order_sendAddress` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `order_payment` varchar(255) DEFAULT NULL COMMENT '付款方式',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` int(4) NOT NULL COMMENT '会员ID',
  `uName` varchar(255) DEFAULT NULL COMMENT '会员名',
  `uPwd` varchar(255) DEFAULT NULL COMMENT '会员密码',
  `uRealName` varchar(255) DEFAULT NULL COMMENT '会员真实姓名',
  `uAddress` varchar(255) DEFAULT NULL COMMENT '会员住址',
  `uSex` char(10) DEFAULT NULL COMMENT '会员性别',
  `uTel` int(20) DEFAULT NULL COMMENT '会员联系方式',
  `uEmail` varchar(20) DEFAULT NULL COMMENT '会员邮箱',
  `uqq` int(10) DEFAULT NULL COMMENT '会员qq',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`uName`,`uPwd`,`uRealName`,`uAddress`,`uSex`,`uTel`,`uEmail`,`uqq`) values (1,'lisi','123','李四','四川成都','男',111,'0000@qq.com',111111111),(2,'zhangsan','1111','张三','四川德阳','男',11122,'2222@163',121313),(3,'eet','er','ry','bh.','uy',78,'987',86),(5,'lishi','000','四川','iwef','dhf',444444463,'345',23567);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

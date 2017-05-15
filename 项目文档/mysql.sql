
-- 商品评价表    mall_goods_evaluate
DROP TABLE IF EXISTS `mall_goods_evaluate`;
CREATE TABLE `mall_goods_evaluate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `gid` int(11) NOT NULL COMMENT '商品ID',
  `evaluate` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品评价',
  `star` tinyint(4) NOT NULL DEFAULT '5' COMMENT '0:无星, 1:一星, 2:二星, 3:三星, 4:四星, 5:五星',
  `addtime` int(11) NOT NULL COMMENT '评论时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:不显示, 1:显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- 评论回复表  mall_reply
DROP TABLE IF EXISTS `mall_reply`;
CREATE TABLE `mall_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID ',
  `evaeid` int(11) NOT NULL COMMENT '评价表ID',
  `reply` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- 订单表  mall_orders
DROP TABLE IF EXISTS `mall_orders`;
CREATE TABLE `mall_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num_id` int(11) NOT NULL COMMENT '订单号',
  `buy` double(8,2) NOT NULL COMMENT '总金额',
  `written` varchar(255) DEFAULT NULL COMMENT '留言',
  `emailno` int(6) NOT NULL COMMENT '邮编',
  `address` varchar(100) NOT NULL COMMENT '收货地址',
  `tel` varchar(11) DEFAULT NULL COMMENT '联系号码',
  `num` int(10) unsigned NOT NULL COMMENT '购买商品数量',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:关闭,1:开启',
  `addtime` datetime NOT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 订单详情表 mall_orderdetails
DROP TABLE IF EXISTS `mall_orderdetails`;
CREATE TABLE `mall_orderdetails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `oid` int(11) NOT NULL COMMENT '订单id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `pic` varchar(255) NOT NULL COMMENT '商品图',
  `num` int(11) NOT NULL COMMENT '数量',
  `price` double(8,2) NOT NULL COMMENT '单价',
  `guige` varchar(255) NOT NULL COMMENT '规格',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:以评价,1:未评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 收货地址 mall_address
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `address` varchar(50) NOT NULL COMMENT '收货地址',
  `det_address` varchar(100) NOT NULL COMMENT '详细地址',
  `name` varchar(32) NOT NULL COMMENT '收货人',
  `tel` varchar(11) NOT NULL COMMENT '联系号码',
  `emailno` int(6) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 友情链接管理表  mall_friendship
DROP TABLE IF EXISTS `mall_friendship`;
CREATE TABLE `mall_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `pic` varchar(255) NOT NULL COMMENT '友情链接图片',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接url地址',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为关闭，1为开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





--商品分类   mall_assortment
DROP TABLE IF EXISTS `mall_assortment`;
CREATE TABLE `mall_assortment` (
  `asortid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` char(30) NOT NULL COMMENT'分类名称',
  `parent` int(20) unsigned NOT NULL COMMENT'父类ID',
  `path` varchar(30) NOT NULL COMMENT'父类路径',
  `state` int(4) NOT NULL COMMENT'状态',
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`asortid`)
) ENGINE=MyISAM AUTO_INCREMENT=472 DEFAULT CHARSET=utf8;



--商品管理   mall_goods
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goodname` varchar(255) NOT NULL COMMENT '商品名',
  `title` varchar(255) NOT NULL COMMENT '购买title',
  `nowprice` float(11,2) NOT NULL COMMENT '商品现价',
  `goodpic` varchar(255) NOT NULL COMMENT '商品图片(简图,详细图片 在图片表查询)',
  `asortid` int(11) NOT NULL COMMENT '商品分类ID',
  `storeid` int(11) NOT NULL COMMENT '0为自营商品商铺ID',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态(默认1 为0时商品将不在显示)',
  `stock` int(11) NOT NULL,
  `audit` int(11) NOT NULL DEFAULT '0' COMMENT '审核商品',
  `collect` int(11) NOT NULL DEFAULT '0' COMMENT '收藏的数量',
  `goodtime` int(11) NOT NULL COMMENT '商品添加的时间',
  `describe` varchar(255) NOT NULL COMMENT '商品描述',
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;



--商品详情  mall_goods_sku
DROP TABLE IF EXISTS `mall_goods_sku`;
CREATE TABLE `mall_goods_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL COMMENT '商品的id',
  `attr` varchar(255) NOT NULL COMMENT '关联商品属性名表',
  `pic` varchar(255) DEFAULT NULL COMMENT '有特定属性的商品的图片',
  `stock` int(11) NOT NULL COMMENT '最小商品单位库存',
  `price` float(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;




--商品属性   mall_goods_attr
DROP TABLE IF EXISTS `mall_goods_attr`;
CREATE TABLE `mall_goods_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attrname` varchar(255) NOT NULL COMMENT '商品属性名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;




--商品属性值   mall_goods_attr_values
DROP TABLE IF EXISTS `mall_goods_attr_values`;
CREATE TABLE `mall_goods_attr_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attrid` int(11) NOT NULL COMMENT '关联属性名表id',
  `goodsid` int(11) NOT NULL COMMENT '商品id',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `value` varchar(255) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;





--商品详情图片 mall_goods_dress
DROP TABLE IF EXISTS `mall_goods_dress`;
CREATE TABLE `mall_goods_dress` (
  `goodsid` int(11) NOT NULL COMMENT '商品id',
  `dresspic` varchar(255) NOT NULL COMMENT '穿着效果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--商品图片  mall_goods_pic
DROP TABLE IF EXISTS `mall_goods_pic`;
CREATE TABLE `mall_goods_pic` (
  `goodsid` int(11) NOT NULL COMMENT '关联商品id',
  `goodspic` varchar(255) NOT NULL COMMENT '商品业放大镜图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





-- 用户表   mall_user
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `pass` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;



-- 用户详情表   mall_user_detail
DROP TABLE IF EXISTS `mall_user_detail`;
CREATE TABLE `mall_user_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `pic` varchar(30) DEFAULT NULL COMMENT '头像',
  `birthday` char(10) DEFAULT NULL COMMENT '生日',
  `sex` tinyint(4) DEFAULT '1' COMMENT '0：女 1：男',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `addtime` datetime NOT NULL COMMENT '注册时间',
  `role` varchar(255) DEFAULT NULL COMMENT '所属角色',
  `staus` varchar(255) NOT NULL DEFAULT '4' COMMENT '1:在线 2：离线 3：禁用 4：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




-- 用户收货地址   mall_user_address
DROP TABLE IF EXISTS `mall_user_address`;
CREATE TABLE `mall_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '关联用户表id',
  `proid` int(11) NOT NULL COMMENT '关联地址表省id',
  `cityid` int(11) NOT NULL COMMENT '关联地址表市id',
  `areid` int(11) NOT NULL COMMENT '关联地址表区/县id',
  `townid` int(11) NOT NULL COMMENT '关联地址表乡镇id',
  `address` varchar(50) NOT NULL COMMENT '详细地址',
  `code` char(6) DEFAULT NULL COMMENT '邮政编码',
  `tip` varchar(20) DEFAULT NULL COMMENT '地址标签',
  `name` varchar(5) NOT NULL COMMENT '收件人姓名',
  `phone` varchar(11) NOT NULL COMMENT '收件人电',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：不默认 1：默认',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




-- 角色表  mall_role
CREATE TABLE `mall_role` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY  COMMENT '设置主键自增',
  `rolename` varchar(255) NOT NULL COMMENT '角色名称',
  `node` varchar(255) NOT NULL COMMENT '拥有权限',
  `garde` tinyint(2) unsigned DEFAULT '0' COMMENT '角色等级',
  `addtime` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- 权限表   mall_node
CREATE TABLE `mall_node` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY  COMMENT '设置主键自增',
  `nodename` varchar(255) NOT NULL  COMMENT '权限名称',
  `controllername` varchar(255) NOT NULL  COMMENT '控制器名',
  `actionname` text NOT NULL  COMMENT '方法名',
  `addtime` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





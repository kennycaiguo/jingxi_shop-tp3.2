<?php
namespace Admin\Model;
use \Think\Model;
class UserModel extends Model
{
	protected $_validate = array(
		 //参数1 字段名 2验证条件 3提示信息
		 array('name','require','用户名不能为空',2), //默认情况下用正则进行验证     
		 array('name','','帐号名称已经存在！',0,'unique',1), // 在新增的时候验证name字段是否唯一     
		 // array('value',array(1,2,3),'值的范围不正确！',2,'in'), // 当值不为空的时候判断是否在一个范围内  
		 array('email','email','邮箱输入格式不正确'),
		 array('repass','pass','确认密码不正确',0,'confirm'), // 验证确认密码是否和密码一致    
		 array('pass','checkPwd','密码格式不正确',0,'function'), // 自定义函数验证密码格式   );
	);

	protected $_auto = array (          
		   // array('status','1'),  // 新增的时候把status字段设置为1  
	       array('pass','md5',3,'function') , // 对password字段在新增和编辑的时候使md5函数处理 
	       // array('name','getName',3,'callback'), // 对name字段在新增和编辑的时候回调getName方法      
	       array('addtime','time',3,'function'), // 对update_time字段在更新的时候写入当前时间戳    
	);

	//获取登录用户的权限
	public function login()
	{
		$list = $this->find();
		// dump($list);
		//查询用户的所属角色
		$map['id'] = $list['role'];
		$role = $this->table('mall_role')->field('node')->where($map)->find();
		//查询角色对应的权限
		$map['id'] = array('in',$role['node']);
		//查询用户所属权限
		$node = $this->table('mall_node')->field('controllername,actionname')->where($map)->select();
		foreach($node as $val) {
			$nodename[$val['controllername']] = $val['actionname'];
		}
		$nodename['Index'][] = 'index';
		dump($nodename);
		$_SESSION['nodename'] = $nodename;
		// dump($map);
		// dump($role);
		// dump($node);exit;
		//要返回灰灰灰灰灰灰
		return $list;
	}

}
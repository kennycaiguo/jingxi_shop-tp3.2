<?php
namespace Admin\Model;
use Think\Model;
class RoleModel extends Model
{
	protected $_auto = array (          
         array('addtime','time',3,'function'), //对update_time字段在更新的时候写入当前时间戳  
         array('node','setName',3,'callback'),   
	);
	public function getAll()
	{
		$list = $this->select();
		$nodename = $this->table('mall_node')->getField('id,nodename');
		// dump($nodename);
		// return $list;
		foreach($list as &$val) {
			$node = explode(',',$val['node']);
			// dump($node);
				$name = '';
			for($i = 0; $i < count($node); $i++) {
				$name .= $nodename[ $node[$i]] . ',';
			}
			$val['node'] = rtrim($name,',');
		}
		return $list;

	}
	/*public function getAll()
	{ 
		$list = $this->select();
		$nodename = $this->table('mall_node')->getField('id,nodename');
		foreach($list as &$val) { 
			//将字符串转换为数组
			$node = explode(',',$val['node']);
			$name = '';
			for($i = 0;$i < count($node); $i++) { 
				$name .= $nodename[ $node[$i] ] .',';
			}
			$val['node'] = $name;
		}
		return $list;

	}*/

	public function setName($val)
	{
		return join(',',$val);

	}

}
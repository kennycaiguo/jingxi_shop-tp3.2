<?php 
namespace Admin\Model;
use Think\Model;
class NodeModel extends Model
{
	//自动完成
	protected $_auto = array(
		array('addtime','time',3,'function'), 
		);

}
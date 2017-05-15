<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Page;
class RoleController extends CommonController
{
	public function index()
	{
		//获取分页框显示的页数
		$num = I('get.num');
		$num = !empty($num) ? $num : 5;
		//搜索
		if(!empty($_GET['rolename'])) $map['rolename'] = array('like',"%{$_GET['rolename']}%");

		$role = D('Role');
		$total = $role->where($map)->count();
		$page = new Page($total,$num);
		$btn = $page->show();

		$rolelist = $role->where($map)->limit($page->firstRow.','.$page->listRows)->getAll();

		$this->assign('rolelist',$rolelist);
		$this->assign('btn',$btn);
		$this->assign('num',$num);
		$this->display();
	}

	//添加角色
	public function add()
	{
		if(IS_POST) {
			$role = D('Role');
			$info = $role->create();
			if($info) {
				dump($info);
				$result = $role->add();
				if($result) {
					// dump($result);exit;
					$this->success('添加角色成功',U('Role/index'));
				} else {
					$this->error('添加角色失败');
				}
			} else {
				$this->error($role->geterror());
			}
		} else {
			$node = D('Node');
			$nodelist = $node->select();
			$this->assign('nodelist',$nodelist);
			$this->display();
		}
	}

	//角色删除
	public function del($id)
	{
		$role = D('Role');
		$result = $role->delete($id);
		if($result) {
			$this->success('角色删除成功',U('Role/index'));
		} else {
			$this->error('角色删除失败');
		}
	}
}
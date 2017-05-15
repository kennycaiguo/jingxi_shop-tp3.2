<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Page;
class NodeController extends Controller
{
	public function index()
	{
		$node = D('Node');
		$nodelist = $node->order('nodename desc')->select();
		$this->assign('nodelist',$nodelist);
		$this->display();
	}

	//权限添加
	public function add()
	{

		if(IS_POST) {
			$node = D('Node');
			$info = $node->create();
			if($info) {
				$result = $node->add();
				if($result) {
					$this->success('成功',U('Node/index'));
				} else {
					$this->error('数据失败');
				}
			} else {
				$this->error($node->getError());
			}

		} else {

			$this->display();
		}
	}

	//删除权限
	public function delete($id=0)
	{
		$node = D('Node');
		$nodelist = $node->delete($id);
		if($nodelist) {
			$this->success('删除成功',U("Node/index"));
		} else {
			$this->error('删除失败');
		}
	}

	//权限编辑
	public function edit()
	{
		if(IS_POST) {
			/*$info = D('Node')->save($_POST);
			if($info) {
				$this->success('添加成功',U("Node/index"));
			} else {
                dump($info);
				$this->error('添加失败');
			}*/
			/*$node = D('Node');
			$info = $node->save($_POST);
			if($info) {
				$this->success('添加成功');
			} else {
				$this->error('添加失败');
			}*/
		} else {
			$node = D('Node');
			$list = $node->find();
			$this->assign('list',$list);
			dump($list);
			$this->display();
		}
	}
}
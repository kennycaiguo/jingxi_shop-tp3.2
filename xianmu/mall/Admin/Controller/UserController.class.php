<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Page;
class UserController extends CommonController {
   public function index()
   {
        //获取分页框显示的数量
        $num = I('get.num');
        $num = !empty($num) ? $num : 5;
        // $keyword = I('get.keyword');
        // if(!empty($keyword)) {

        // }
        if(!empty($_GET['name'])) $map['name'] = array('like',"%{$_GET['name']}%");

   		$user = D('User');
   		$total = $user->table('mall_user u,mall_user_detail d')->field('d.*')->where($map)->where('u.id=d.uid')->count();
   		$page = new Page($total,$num);
   		$btn = $page->show();
   		$userlist = $user->table('mall_user u,mall_user_detail d')->field('d.*')->where($map)->where($map)->where('u.id=d.uid')->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
   		$this->assign('userlist',$userlist);
      $this->assign('num',$num);
      // $this->assign('keyword',$keyword);
   		$this->assign('btn',$btn);
   		$this->display();
   }

    public function add()
    {
      if(IS_POST) {
        $user = D('User');
        $info = $user->create();
        // dump($info);
        if($info) {
          $result = $user->add();
          if($result) {
            $this->success('数据添加成功',U('User/index'));
          } else {
            $this->error('添加数据失败');
          }
        } else {
          $this->error($user->getError());
        }
      } else {
         $role = D('Role');
         $rolelist = $role->select();
         $this->assign('rolelist',$rolelist);
    	   $this->display();
      }
    }

    public function edit()
    {
      
    	$this->display();
    }
}
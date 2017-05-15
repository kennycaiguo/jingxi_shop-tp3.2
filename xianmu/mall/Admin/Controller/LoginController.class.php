<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller {
    public function login(){
    	if(IS_POST) {
    		//验证验证码
    		 $verify = new \Think\Verify();    
    		 $res = $verify->check(I('code'));
    		 // dump($res);
    		 if(!$res) {
    		 	$this->error('输入验证码错误');exit;
    		 } 
    		 $user = D('User');
    		 $map['name'] = I('name');
    		 $map['pass'] = I('pass','','md5');
    		 // dump($map);
             // $info = $user->where($map)->find();
             //大D是查找Model里的
    		 $info = $user->where($map)->login();
             // dump($info);
    		 if(empty($info)) {
    		 	$this->error('用户或密码输入错误');
    		 } else {
    		 	$_SESSION['admininfo'] = $info;
    		 	//redirect重定向跳转
    		 	$this->redirect('Index/index');
    		 }
    	} else {
    		
			$this->display();
    	}
	}
	public function code()
	{
			$config =    array(    
			'fontSize'    =>    25,    // 验证码字体大小    
			'length'      =>    3,     // 验证码位数    
			'useNoise'    =>    false, // 关闭验证码杂点
			'imageH'	  =>    45,
		);
		$Verify =     new \Think\Verify($config);// 设置验证码字符为纯数字
		$Verify->codeSet = '0123456789'; 
		$Verify->entry();
	}

	public function out()
	{
		unset($_SESSION['admininfo']);
		$this->redirect('Login/login');
	}
}
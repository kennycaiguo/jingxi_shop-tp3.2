<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller
{
	public function _initialize()
	{
		//判断用户是否已经登录
		if(!session('?admininfo')) {
			$this->redirect('Login/login');
		}

		$Controllername = CONTROLLER_NAME;
   		$Actionname = ACTION_NAME;
		if(empty($_SESSION['nodename'][$Controllername]) || !in_array($Actionname,$_SESSION['nodename'][$Controllername])) {
			$this->error('对不起,没有权限访问');
		}
	}
}
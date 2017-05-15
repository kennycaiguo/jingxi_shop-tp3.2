<?php
//声明命名空间
namespace Admin\Controller;
//引入父类控制器
use Think\Controller;
//声明类并继承父类控制器
class EmptyController extends Controller
{
	public function _empty()
	{
		$this->display('Empty/error');
	}
}
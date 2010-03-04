<?php
class Login extends Controller {

	function Login()
	{
		parent::Controller();
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
	}
	
	function index()
	{
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('content');
		$this->load->view('footer');
	}
}

/* End of file login.php */
/* Location: ./application/controllers/login.php */
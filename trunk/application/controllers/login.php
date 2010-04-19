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
		if(!$this->input->post('username'))
			redirect('login/page');
		
		if($this->input->post('username') == 'osa')
			redirect('osa');
		elseif($this->input->post('username') == 'org')
			redirect('organization');
		else
			redirect('student');
	}
	
	function page()
	{
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('layout/content/header');
		$this->load->view('layout/content/div_open');
		$this->load->view('login');
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
}

/* End of file login.php */
/* Location: ./application/controllers/login.php */
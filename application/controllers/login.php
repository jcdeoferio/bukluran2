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
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required|callback__authenticate_login');
		
		$this->form_validation->set_message('_authenticate_login', 'Invalid username/password combination.');
		
		if(!$this->form_validation->run()){
			$this->page();
			return;
		}
		
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
	
	function logout(){
		$this->session->unset_userdata(USER);
		redirect();
	}
	
	function _authenticate_login(){
		$this->load->model('Login_model');
		
		$user = $this->Login_model->authenticate_login($this->input->post('username'), $this->input->post('password'));
		
		if($user){
			unset($user['password']);
			$this->session->set_userdata(USER, $user);
			return(true);
		}
		else{
			$this->session->unset_userdata(USER);
			return(false);
		}
	}
}

/* End of file login.php */
/* Location: ./application/controllers/login.php */

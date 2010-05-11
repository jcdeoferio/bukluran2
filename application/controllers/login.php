<?php
class Login extends Controller {

	function Login()
	{
		parent::Controller();		
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->library('views');
	}
	
	function index()
	{
		if($this->session->logged_in()){
			$userdata = $this->session->userdata(USER);
			redirect($userdata['groupname']);
		}
		
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required|callback__authenticate_login');
		
		$this->form_validation->set_message('_authenticate_login', 'Invalid username/password combination.');
		if(!$this->form_validation->run()){
			$this->page();
			return;
		}
		redirect('main');
		/*
		if($this->input->post('username') == 'osa')
			redirect('osa');
		elseif($this->input->post('username') == 'org')
			redirect('organization');
		else
			redirect('student');
		*/
	}
	
	function page()
	{
		$data['stylesheets'] = array('login.css');
		$data['title'] = 'Login';
		$this->views->header($data);
		$this->load->view('login/user_pass');
		$this->views->footer();
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
	
	function link(){
		$data['stylesheets'] = array('login.css');
		$data['title'] = 'Login';
		$this->views->header($data);
		$this->load->view('login/link');
		$this->views->footer();
	}
	
	function link_submit(){
		$this->form_validation->set_rules('link', 'Link', 'required|callback__authenticate_link');
		
		$this->form_validation->set_message('_authenticate_link', 'Invalid code.');
		if(!$this->form_validation->run()){
			$this->link();
			return;
		}
		redirect('main');
	}
	
	function _authenticate_link(){
		$this->load->model('Login_model');
		$user = $this->Login_model->authenticate_link($this->input->get_post('link'));
		if($user){
			unset($user['hashcode']);
			$this->session->set_userdata(USER, $user);
			return(true);
		}
		else{
			$this->session->unset_userdata(USER);
			return(false);
		}
	}
	
	function lost_pass(){
		
	}
}

/* End of file login.php */
/* Location: ./application/controllers/login.php */

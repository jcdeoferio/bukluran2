<?php
class Student extends Controller {

	function Student()
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
		$this->load->view('layout/header');
		$this->load->view('layout/content');
		$this->load->view('layout/footer');
		$this->load->view('footer');
	}
}

/* End of file student.php */
/* Location: ./application/controllers/student.php */
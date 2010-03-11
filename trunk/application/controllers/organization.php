
<?php
class Organization extends Controller {

	function Organization()
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

/* End of file organization.php */
/* Location: ./application/controllers/organization.php */
<?php
class Main extends Controller {

	function Main()
	{
		parent::Controller();
	}

	function index()
	{
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('content-header');
		$this->load->view('content');
		$this->load->view('content-footer');
		$this->load->view('footer');
	}
}
?>

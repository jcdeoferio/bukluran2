<?php
class Main extends Controller {

	function __construct()
	{
		parent::Controller();
	}

	function index()
	{
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('content');
		$this->load->view('footer');
	}
}
?>

<?php
class Main extends Controller {
	function Main()
	{
		parent::Controller();
		$this->load->helper('url');
	}
	
	function fckeditorform(){
		$fckeditorConfig = array(
			'instanceName' => 'content',
			'BasePath' => base_url().'system/plugins/fckeditor/',
			'ToolbarSet' => 'Basic',
			'Width' => '100%',
			'Height' => '200',
			'Value' => ''
			);
		
		$this->load->library('fckeditor', $fckeditorConfig);
		$this->load->view('fckeditorView');
        
	}
	function fckeditorshowpost(){
    
        echo $this->input->post('content');
        
	} 

	function index()
	{
		//$this->load->view('ie6');
	
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('content-header');
		$this->load->view('content');
		$this->load->view('content-footer');
		$this->load->view('footer');
	
	}
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */
<?php
class Organization extends Controller {

	function Organization()
	{
		parent::Controller();
		
		if(!$this->session->user_group_is(ORG_GROUPID))
			redirect('login');
		
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('organization','organization/forms','organization/change_password');
		$this->sidebar_data['anchors'] = array('Announcements', 'Application Forms','Change Password');
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - ".$this->session->username();
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'organization/announcements/';
		$params['announcement']['forward_link'] = 'organization/announcements/';
		$params['announcement']['back_link'] = 'organization/announcements/';
		
		$this->load->library('views',$params);
	}
	
	function index()
	{
		redirect('organization/announcements');
	}
	
	function forms()
	{
		$data['title'] = "Application Forms - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/index');
		$this->views->footer();
	}
	
	function form1()
	{
		$data['title'] = "Information Sheet - ".$this->session->username();
		
		$fckeditorConfig = array(
			'instanceName' => 'org_description',
			'BasePath' => base_url().'system/plugins/fckeditor/',
			'ToolbarSet' => 'Basic',
			'Width' => '100%',
			'Height' => '200',
			'Value' => ''
			);
		
		$this->load->library('fckeditor', $fckeditorConfig);
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form1');
		$this->views->footer();
	}
	
	function form2()
	{
		$data['title'] = "Faculty Adviser and Finance Statement - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form2');
		$this->views->footer();
	}
	
	function form3()
	{
		$data['title'] = "Officer Roster - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form3');
		$this->views->footer();
	}
	
	function form4()
	{
		$data['title'] = "Member Roster - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form4');
		$this->views->footer();
	}
	
	function form5()
	{
		$data['title'] = "Accomplishment Report - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form5');
		$this->views->footer();
	}
	
	function form6()
	{
		$data['title'] = "Calendar of Activites - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form6');
		$this->views->footer();
	}
	
	function form7()
	{
		$data['title'] = "Acknowledgment - ".$this->session->username();
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form7');
		$this->views->footer();
	}
	
	function change_password()
	{
		$data['title'] = "Change Password  - ".$this->session->username();
		$data['message'] = false;
		$data['span'] = 19;
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/change_password',$data);
		$this->views->footer();
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
}

/* End of file organization.php */
/* Location: ./application/controllers/organization.php */
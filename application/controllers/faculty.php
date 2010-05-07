<?php
class Faculty extends Controller {

	function Faculty()
	{
		parent::Controller();
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('Osa_model');
		
		
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('faculty/announcements','faculty/organizations','faculty/view_profile','faculty/edit_profile');
		$this->sidebar_data['anchors'] = array('Announcements','Manage Organizations','View Profile','Edit Profile');
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - Faculty Webmail"; //TODO: get webmail from session data
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'faculty/announcements/';
		$params['announcement']['forward_link'] = 'faculty/announcements/';
		$params['announcement']['back_link'] = 'faculty/announcements/';
		
		$params['organization']['title'] = "Organizations - Faculty Webmail"; //TODO: get webmail from session data
		$params['organization']['span'] = 19;
		$params['organization']['site_link'] = 'faculty/organizations/';
		$params['organization']['confirm_link'] = 'faculty/confirm/';
		
		$this->load->library('views',$params);
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function organizations($page_no = 0)
	{
		$this->views->load_organizations($page_no);
	}
	
	function view_profile()
	{
		
	}
	
	function edit_profile()
	{
		
	}
	
	function confirm()
	{
		
	}
	
	function index()
	{
		$this->announcements();
	}
}

/* End of file faculty.php */
/* Location: ./application/controllers/faculty.php */
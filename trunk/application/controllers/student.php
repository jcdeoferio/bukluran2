<?php
class Student extends Controller {

	function Student()
	{
		parent::Controller();
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('Osa_model');
		
		
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('student/announcements','student/organizations');
		$this->sidebar_data['anchors'] = array('Announcements','Manage Organizations');
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - Student Webmail"; //TODO: get webmail from session data
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'student/announcements/';
		$params['announcement']['forward_link'] = 'student/announcements/';
		$params['announcement']['back_link'] = 'student/announcements/';
		
		$params['organization']['title'] = "Organizations - Student Webmail"; //TODO: get webmail from session data
		$params['organization']['span'] = 19;
		$params['organization']['site_link'] = 'student/organizations/';
		$params['organization']['confirm_link'] = 'student/confirm/';
		$params['organization']['unconfirm_link'] = 'student/unconfirm/';
		
		$this->load->library('views',$params);
		$this->load->model('Student_model');
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function organizations($page_no = 0)
	{
		$this->views->load_organizations($page_no);
	}
	
	function confirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Student_model->confirm($user['studentid'],$orgid);
		$this->organizations();
	}
	
	function unconfirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Student_model->unconfirm($user['studentid'],$orgid);
		$this->organizations();
	}
	
	function index()
	{
		$this->announcements();
	}
}

/* End of file student.php */
/* Location: ./application/controllers/student.php */
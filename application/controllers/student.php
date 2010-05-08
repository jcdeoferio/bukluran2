<?php
class Student extends Controller {

	function Student()
	{
		parent::Controller();
		
		if(!$this->session->user_group_is(STUDENT_GROUPID))
			redirect('login');
		
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
		$this->load->model('Organization_model');
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function organizations($page_no = 0, $message = FALSE)
	{
		$this->views->load_organizations($page_no, $message);
	}
	
	function confirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Student_model->confirm($user['studentid'],$orgid);
		$org = $this->Organization_model->get_organization($orgid);
		$this->organizations(0,'You have successfully confirmed your membership to '.$org['orgname'].'!');
	}
	
	function unconfirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Student_model->unconfirm($user['studentid'],$orgid);
		$org = $this->Organization_model->get_organization($orgid);
		$this->organizations(0,'You have successfully removed your membership from '.$org['orgname'].'!');
	}
	
	function index()
	{
		$this->announcements();
	}
}

/* End of file student.php */
/* Location: ./application/controllers/student.php */
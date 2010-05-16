<?php
class Faculty extends Controller {

	function Faculty()
	{
		parent::Controller();
		
		if(!$this->session->user_group_is(FACULTY_GROUPID))
			redirect('login');
			
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('Osa_model');
		
		
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('faculty/organizations','faculty/view_profile','faculty/edit_profile');
		$this->sidebar_data['anchors'] = array('Manage Organizations','View Profile','Edit Profile');
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - ".$this->session->username();
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'faculty/announcements/';
		$params['announcement']['forward_link'] = 'faculty/announcements/';
		$params['announcement']['back_link'] = 'faculty/announcements/';
		
		$params['organization']['title'] = "Organizations - ".$this->session->username();
		$params['organization']['span'] = 19;
		$params['organization']['site_link'] = 'faculty/organizations/';
		$params['organization']['confirm_link'] = 'faculty/confirm/';
		$params['organization']['unconfirm_link'] = 'faculty/unconfirm/';
		
		$this->load->library('views',$params);
		$this->load->model('Faculty_model');
		$this->load->model('Organization_model');
		$this->aysem = $this->Variable->current_application_aysem();
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function organizations($page_no = 0, $messages = FALSE)
	{
		$this->views->load_organizations($page_no, $messages);
	}
	
	function view_profile($messages = FALSE)
	{
		$user = $this->session->userdata(USER);
		if(!$this->Faculty_model->has_profile($user['facultyid'])){
			if(!$messages)$messages = array();
			$messages[] = "Your profile is not yet set. ".anchor('faculty/edit_profile','Click here')." to create your profile."; 
		}
		
		$data['title'] = 'Profile - '.$this->session->username();
		$data['span'] = 19;
		$data['messages'] = $messages;
		$data['faculty'] = $this->Faculty_model->get_profile($user['facultyid']);
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('faculty/view_profile',$data);
		$this->views->footer();
	}
	
	function edit_profile($messages = FALSE)
	{
		$data['title'] = 'Profile - '.$this->session->username();
		$data['span'] = 19;
		$data['messages'] = $messages;
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('faculty/edit_profile',$data);
		$this->views->footer();
	}
	
	function edit_profile_submit()
	{
		$this->edit_profile();
	}
	
	function confirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Faculty_model->confirm($user['facultyid'], $this->aysem, $orgid);
		$org = $this->Organization_model->get_organization($orgid);
		$this->organizations(0,array('You have successfully confirmed your membership to '.$org['orgname'].'!'));
	}
	
	function unconfirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Faculty_model->unconfirm($user['facultyid'], $this->aysem, $orgid);
		$org = $this->Organization_model->get_organization($orgid);
		$this->organizations(0,array('You have successfully removed your membership from '.$org['orgname'].'!'));
	}
	
	function index()
	{
		$this->organizations();
	}
}

/* End of file faculty.php */
/* Location: ./application/controllers/faculty.php */
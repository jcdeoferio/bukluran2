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
		
		$this->load->model('Student_model');
		$this->load->model('Organization_model');
		
		$this->sidebar_data['links'][0]['title'] = 'Announcements';
		$this->sidebar_data['links'][0]['hrefs'] = array('student/announcements');
		$this->sidebar_data['links'][0]['anchors'] = array('Home');
		$this->sidebar_data['links'][0]['selected'] = -1;
		$this->sidebar_data['links'][1]['title'] = 'Organizations';
		$this->sidebar_data['links'][1]['hrefs'] = array('student/organizations');
		$this->sidebar_data['links'][1]['anchors'] = array('Manage');
		$this->sidebar_data['links'][1]['selected'] = -1;
		$this->sidebar_data['links'][2]['title'] = 'Profile';
		$this->sidebar_data['links'][2]['hrefs'] = array('student/upload');
		$this->sidebar_data['links'][2]['anchors'] = array('Upload UP ID');
		$this->sidebar_data['links'][2]['selected'] = -1;
				
		//$this->sidebar_data['hrefs'] = array('student/organizations','student/upload');
		//$this->sidebar_data['anchors'] = array('Manage Organizations','Upload UP ID');		
		
		$params['sidebar'] = $this->sidebar_data;
		$params['announcement']['title'] = "Announcements - ".$this->session->username();
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'student/announcements/';
		$params['announcement']['forward_link'] = 'student/announcements/';
		$params['announcement']['back_link'] = 'student/announcements/';
		$params['organization']['title'] = "Organizations - ".$this->session->username();
		$params['organization']['span'] = 19;
		$params['organization']['site_link'] = 'student/organizations/';
		$params['organization']['confirm_link'] = 'student/confirm/';
		$params['organization']['unconfirm_link'] = 'student/unconfirm/';
		$this->load->library('views',$params);
		
		$this->aysem = $this->Variable->current_application_aysem();
		
		$config['upload_path'] = './uploads/';
		$config['file_name'] = $this->session->username().'-'.$this->aysem;
		$config['allowed_types'] = 'gif|jpg|png';
		$config['overwrite'] = TRUE;
		$config['max_size']	= '250';
		$this->load->library('upload', $config);
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function organizations($page_no = 0, $messages = FALSE)
	{
		$this->views->load_organizations($page_no, $messages);
	}
	
	function confirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Student_model->confirm($user['studentid'], $orgid, $this->aysem);
		$org = $this->Organization_model->get_organization($orgid,$this->Variable->current_application_aysem());
		$this->organizations(0,array('You have successfully confirmed your membership to '.$org['orgname'].'!'));
	}
	
	function unconfirm($orgid)
	{
		$user = $this->session->userdata('user');
		$this->Student_model->unconfirm($user['studentid'], $orgid, $this->aysem);
		$org = $this->Organization_model->get_organization($orgid,$this->Variable->current_application_aysem());
		$this->organizations(0,array('You have successfully removed your membership from '.$org['orgname'].'!'));
	}
	
	function upload()
	{
		$user_data = $this->session->userdata(USER);
		
		$data['title'] = 'Upload UP ID - '.$this->session->username();
		$data['span'] = 19;
		$data['message'] = FALSE;
		$data['stylesheets'] = array('login.css');
		$data['image'] = $this->Student_model->get_studentpicture($user_data['studentid'], $this->aysem);
		$this->sidebar_data['links'][2]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('student/upload',$data);
		$this->views->footer();
		$this->sidebar_data['links'][2]['selected'] = -1;
	}
	
	function do_upload()
	{
		$data['title'] = 'Upload UP ID - '.$this->session->username();
		$data['span'] = 19;
		$data['message'] = FALSE;
		$data['stylesheets'] = array('login.css');
		
		$user_data = $this->session->userdata(USER);
		$this->sidebar_data['links'][2]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->sidebar_data['links'][2]['selected'] = -1;
		if (!$this->upload->do_upload())
		{
			$data['message'] = $this->upload->display_errors();	
			$data['image'] = $this->Student_model->get_studentpicture($user_data['studentid'], $this->aysem);
			$this->load->view('student/upload', $data);
		}	
		else
		{	
			$img_data = $this->upload->data();
			$this->Student_model->set_studentpicture($user_data['studentid'], $this->aysem, $img_data['file_name']);
			
			$data['message'] = "Upload Successful!";			
			$data['image'] = $this->Student_model->get_studentpicture($user_data['studentid'],$this->aysem);
			
			$this->load->view('student/upload', $data);
		}
		$this->views->footer();
	}
	
	function index()
	{
		$this->organizations();
	}
}

/* End of file student.php */
/* Location: ./application/controllers/student.php */
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
		
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('student/announcements','student/organizations','student/upload');
		$this->sidebar_data['anchors'] = array('Announcements','Manage Organizations','Upload UP ID');		
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
		
		$config['upload_path'] = './uploads/';
		$config['file_name'] = $this->session->username().'-currentAYSEM'; //TODO current aysem
		$config['allowed_types'] = 'gif|jpg|png';
		$config['overwrite'] = TRUE;
		$config['max_size']	= '250';
		$this->load->library('upload', $config);
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
	
	function upload()
	{
		$user_data = $this->session->userdata(USER);
		
		$data['title'] = 'Upload UP ID - '.$this->session->username();
		$data['span'] = 19;
		$data['message'] = FALSE;
		$data['stylesheets'] = array('login.css');
		$data['image'] = $this->Student_model->get_studentpicture($user_data['studentid'],20093); //TODO Current AYSEM
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('student/upload',$data);
		$this->views->footer();
	}
	
	function do_upload()
	{
		$data['title'] = 'Upload UP ID - '.$this->session->username();
		$data['span'] = 19;
		$data['message'] = FALSE;
		$data['stylesheets'] = array('login.css');
		
		$user_data = $this->session->userdata(USER);
		
		$this->views->header($data,$this->sidebar_data);
		if (!$this->upload->do_upload())
		{
			$data['message'] = $this->upload->display_errors();	
			$data['image'] = $this->Student_model->get_studentpicture($user_data['studentid'],20093); //TODO Current AYSEM
			$this->load->view('student/upload', $data);
		}	
		else
		{	
			$img_data = $this->upload->data();
			$this->Student_model->set_studentpicture($user_data['studentid'],$img_data['file_name']);
			
			$data['message'] = "Upload Successful!";			
			$data['image'] = $this->Student_model->get_studentpicture($user_data['studentid'],20093); //TODO Current AYSEM
			
			$this->load->view('student/upload', $data);
		}
		$this->views->footer();
	}
	
	function index()
	{
		$this->announcements();
	}
}

/* End of file student.php */
/* Location: ./application/controllers/student.php */
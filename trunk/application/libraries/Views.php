<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Views {

	function Views($params)
	{	
		$this->CI =& get_instance();		
		$keys = array('sidebar','announcement','organization');
		foreach($keys as $key){
			if(array_key_exists($key,$params)){
				$this->data[$key] = $params[$key];
			}
		}
		
		$this->CI->load->model('Student_model');
		$this->CI->load->model('Faculty_model');
		$this->CI->load->model('Announcement_model');
	}
	
	function load_organizations($page_no = 0, $message = FALSE)
	{
		$this->data['stylesheets'] = array('organizations_list.css');
		$this->data['title'] = $this->data['organization']['title'];
		
		$limit = 20;
		$user = $this->CI->session->userdata(USER);
		if($this->CI->session->user_group_is(STUDENT_GROUPID)){
			$orgs = $this->CI->Student_model->get_organizations($user['studentid'] ,$limit, ($page_no - 1) * $limit);
		}else if($this->CI->session->user_group_is(FACULTY_GROUPID)){
			$orgs = $this->CI->Faculty_model->get_organizations($user['facultyid'] ,$limit, ($page_no - 1) * $limit);
		}
		
		$this->data['organization']['orgs'] = $orgs;
		$this->data['organization']['message'] = $message;
		
		$this->CI->load->view('htmlhead',$this->data);
		$this->CI->load->view('header');
		$this->CI->load->view('layout/content/header');
		
		$this->CI->load->view('layout/content/div_open');
		$this->CI->load->view('sidebar/links_only',$this->data['sidebar']);
		
		$this->CI->load->view('organizations/confirm_list', $this->data['organization']);
				
		$this->CI->load->view('layout/content/div_close');
		
		$this->CI->load->view('layout/content/footer');
		$this->CI->load->view('footer');
		
		$this->data['organization']['message'] = FALSE;
	}

    function load_announcements($page_no = 0, $announcement_id = -1)
    {	
		$limit = 20;
		
		$this->data['title'] = $this->data['announcement']['title'];
		$this->data['stylesheets'] = array('announcement.css');
		$this->data['announcement']['page_no'] = $page_no;
		
		$this->CI->load->view('htmlhead', $this->data);
		$this->CI->load->view('header');
		$this->CI->load->view('layout/content/header');
		
		$this->CI->load->view('layout/content/div_open');
		if(isset($this->data['sidebar'])){
			$this->CI->load->view('sidebar/links_only',$this->data['sidebar']);
		}
		if($announcement_id == -1){
			$this->data['announcement']['announcements'] = $this->CI->Announcement_model->get_announcements($limit, ($page_no - 1) * $limit);
			$this->CI->load->view('announcements/list', $this->data['announcement']);
		}else{
			$this->data['announcement']['announcement'] = $this->CI->Announcement_model->get_announcement($announcement_id);
			$this->CI->load->view('announcements/announcement', $this->data['announcement']);
		}
		
		$this->CI->load->view('layout/content/div_close');
		
		$this->CI->load->view('layout/content/footer');
		$this->CI->load->view('footer');
    }
}

?>
<?php
class Osa extends Controller {
	
	private $sidebar_data;

	function __construct(){
		parent::__construct();
		
		if(!$this->session->user_group_is(OSA_GROUPID))
			redirect('login');
			
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('osa/announcements', 'osa/create_announcement', 'osa/organizations', 'osa/manage_app_period');
		$this->sidebar_data['anchors'] = array('Announcements', 'Create Announcement', 'Manage Organizations', 'Manage Application Period');
		
		$this->load->helper('html');
		$this->load->helper('form');
		
		$this->load->model('Osa_model');
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - OSA";
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'osa/announcements/';
		$params['announcement']['forward_link'] = 'osa/announcements/';
		$params['announcement']['back_link'] = 'osa/announcements/';
		
		$this->load->library('views',$params);
	}
	
	function index(){
		$this->announcements();
	}
	
	function create_announcement(){
		$data['title'] = "Create Announcement - OSA";	
		
		$fckeditorConfig = array(
			'instanceName' => 'content',
			'BasePath' => base_url().'system/plugins/fckeditor/',
			'ToolbarSet' => 'Basic',
			'Width' => '100%',
			'Height' => '400',
			'Value' => ''
			);
		
		$this->load->library('fckeditor', $fckeditorConfig);
		
		$this->views->header($data,$this->sidebar_data);		
		$this->load->view('osa/create_announcement');
		$this->views->footer();
	}
	
	function create_organization()
	{
		//$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Add New Organization - OSA";	
		$content_data['submit_url'] = 'osa/create_organization_submit';
		
		$this->views->header($data,$this->sidebar_data);		
		$this->load->view('osa/create_organization', $content_data);
		$this->views->footer();
	}
	
	function create_organization_submit(){
		$this->form_validation->set_rules('username', 'Username', 'required|callback__orgusername_check');
		
		$this->form_validation->set_message('_orgusername_check', 'Username already exists, please use another.');
		
		if(!$this->form_validation->run()){
			$this->session->set_userdata(VALERR, validation_errors());
			redirect('osa/create_organization');
		}
		
		$orgname = $this->input->post('orgname');
		$username = $this->input->post('username');
		$password = $this->Osa_model->create_organization($orgname, $username);
		
		$this->_new_password("Successfully Added New Organization", $username, $password);
	}
	
	function _orgusername_check($username){
		return($this->Osa_model->is_unique_orgusername($username));
	}
	
	function _new_password($title, $username, $password){
		$data['title'] = $title;
		
		$this->views->header($data,$this->sidebar_data);		
		$this->load->view('osa/create_organization_success', compact('title', 'username', 'password'));
		$this->views->footer();
	}
	
	function reset_org_password($username = NULL){
		if(is_null($username))
			redirect('osa/organizations');
		
		$password = $this->Osa_model->reset_organization_password($username);
		
		$this->_new_password("New Password", $username, $password);
	}
		
	function edit_announcement($announcement_id)
	{
	}
	
	function edit_organization($organization_id,$form_no=1)
	{
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function organizations($page_no = 1){
		$data['stylesheets'] = array('organizations_list.css');
		$data['title'] = "Organizations - OSA";
		
		$limit = 20;
		
		$orgs = $this->Osa_model->get_organizations($limit, ($page_no - 1) * $limit);
		
		$content_data['orgs'] = $orgs;
		$content_data['span'] = 19;
		$content_data['site_link'] = 'osa/organizations/';
		$content_data['forward_link'] = 'osa/organizations/0/';
		
		$this->views->header($data,$this->sidebar_data);		
		$this->load->view('organizations/manage', $content_data);
		$this->views->footer();
	}
}

/* End of file osa.php */
/* Location: ./application/controllers/osa.php */
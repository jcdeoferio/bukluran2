<?php
class Osa extends Controller {
	
	private $sidebar_data;

	function __construct(){
		parent::__construct();
		
		if(!$this->session->user_group_is(OSA_GROUPID))
			redirect('login');
			
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('osa/announcements','osa/organizations','osa/create_announcement');
		$this->sidebar_data['anchors'] = array('Announcements', 'Manage Organizations','Create Announcement');
		
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
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('osa/create_announcement');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function create_organization()
	{
		//$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Add New Organization - OSA";	
		$content_data['submit_url'] = 'osa/create_organization_submit';
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('osa/create_organization', $content_data);
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
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
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('osa/create_organization_success', compact('title', 'username', 'password'));
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
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
/*	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Announcements - OSA";
		
		$announcement['title'] = 'Sample Announcement Title';
		$announcement['id'] = 10;
		$announcement['username'] = 'osa';
		$announcement['date'] = '11:30am, January 13, 2010';
		$announcement['content'] = '<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus dapibus fermentum. Pellentesque diam purus, sodales nec tincidunt at, porta nec neque. Pellentesque volutpat, leo commodo molestie feugiat, turpis neque malesuada lorem, ac rhoncus orci justo ac sapien. Mauris at ornare orci.
			</p>
			<p>
				Fusce sem lorem, posuere iaculis eleifend nec, molestie sed massa. Quisque semper turpis a nunc fermentum sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In consequat orci ac velit malesuada non aliquet lectus tristique. Vestibulum hendrerit fringilla ullamcorper.
			</p>';
		$announcements_data['announcements'] = array($announcement, $announcement);
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		if($announcement_id == -1){
			$announcements_data['announcements'] = array($announcement, $announcement);
			
			$announcements_data['span']=19;
			$announcements_data['site_link']='osa/announcements/';
			$announcements_data['forward_link']='osa/announcements/0/';
			
			$this->load->view('announcements/list', $announcements_data);
		}else{
			$announcements_data['announcement'] = $announcement;
			
			$announcements_data['span']=19;
			$announcements_data['back_link'] = 'osa/announcements';
			
			$this->load->view('announcements/announcement', $announcements_data);
		}
		
		$this->load->view('layout/content/div_close');
		
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
*/	
/*
	if($org_id == -1){
		$orgs_list['orgs_id'] = array(1,2,3);
		$orgs_list['orgs_name'] = array('UP Programming Guild', 'Organization Name1', 'Organization Name2');
		
		$orgs_list['span']=19;
		$orgs_list['site_link']='osa/organizations/';
		$orgs_list['forward_link']='osa/organizations/0/';
	}else{
		$org_data['name'] = 'UP Programming Guild';
		$org_data['acronym'] = 'UPPG';
		$org_data['established'] = '2009-07-24 ';
		$org_data['nature'] = '';
		$org_data['category'] = 'Special Interest';
		$org_data['mailing_address'] = '130 13th Avenue, Cubao Quezon City 1109 ';
		$org_data['org_email'] = 'upprogrammingguild@gmail.com ';
		$org_data['org_desc'] = 'This organization aims to broaden the appreciation for various forms and approaches to problem solving, enhance analytical skills, and use collaborative programming as a means for personal affirmation and social interaction';
		
		$org_data['span']=19;
		$org_data['back_link']='osa/organizations/';
		
		$this->load->view('organizations/profile',$org_data);
	}
*/
	
	function organizations($page_no = 1){
		$data['stylesheets'] = array('organizations_list.css');
		$data['title'] = "Organizations - OSA";
		
		$limit = 20;
		
		$orgs = $this->Osa_model->get_organizations($limit, ($page_no - 1) * $limit);
		
		$content_data['orgs'] = $orgs;
		$content_data['span'] = 19;
		$content_data['site_link'] = 'osa/organizations/';
		$content_data['forward_link'] = 'osa/organizations/0/';
		
		$this->load->view('htmlhead',$data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organizations/manage', $content_data);
				
		$this->load->view('layout/content/div_close');
		
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
}

/* End of file osa.php */
/* Location: ./application/controllers/osa.php */
<?php
class Osa extends Controller {

	function Osa()
	{
		parent::Controller();
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
	}
	
	function index()
	{
		redirect('osa/announcements');
	}
	
	function create_announcement()
	{
		$data['title'] = "Create Announcement - OSA";	
		$sidebar_data['hrefs'] = array('osa/announcements','osa/organizations','osa/create_organization','osa/create_announcement');
		$sidebar_data['anchors'] = array('Announcements', 'Organizations List','Create Organization','Create Announcement');
		
		$fckeditorConfig = array(
			'instanceName' => 'content',
			'BasePath' => base_url().'system/plugins/fckeditor/',
			'ToolbarSet' => 'Basic',
			'Width' => '100%',
			'Height' => '200',
			'Value' => ''
			);
		
		$this->load->library('fckeditor', $fckeditorConfig);
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$sidebar_data);
		
		$this->load->view('osa/create_announcement');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function create_organization()
	{
		//$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Create Organization - OSA";	
		$sidebar_data['hrefs'] = array('osa/announcements','osa/organizations','osa/create_organization','osa/create_announcement');
		$sidebar_data['anchors'] = array('Announcements', 'Organizations List','Create Organization','Create Announcement');
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$sidebar_data);
		
		$this->load->view('osa/create_organization');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
		
	function edit_announcement($announcement_id)
	{
	}
	
	function edit_organization($organization_id,$form_no=1)
	{
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Announcements - OSA";
		$sidebar_data['hrefs'] = array('osa/announcements','osa/organizations','osa/create_organization','osa/create_announcement');
		$sidebar_data['anchors'] = array('Announcements', 'Organizations List','Create Organization','Create Announcement');
		
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
		$this->load->view('sidebar/links_only',$sidebar_data);
		
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
	
	function organizations($page_no = 0,$org_id = -1)
	{
		$data['stylesheets'] = array('organizations_list.css');
		$data['title'] = "Organizations - OSA";
		$sidebar_data['hrefs'] = array('osa/announcements','osa/organizations','osa/create_organization','osa/create_announcement');
		$sidebar_data['anchors'] = array('Announcements', 'Organizations List','Create Organization','Create Announcement');
		
		$this->load->view('htmlhead',$data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$sidebar_data);
		
		if($org_id == -1){
			$orgs_list['orgs_id'] = array(1,2,3);
			$orgs_list['orgs_name'] = array('UP Programming Guild', 'Organization Name1', 'Organization Name2');
			
			$orgs_list['span']=19;
			$orgs_list['site_link']='osa/organizations/';
			$orgs_list['forward_link']='osa/organizations/0/';
			
			$this->load->view('organizations/list', $orgs_list);
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
		
		$this->load->view('layout/content/div_close');
		
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
}

/* End of file osa.php */
/* Location: ./application/controllers/osa.php */
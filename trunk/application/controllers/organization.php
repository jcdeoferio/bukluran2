<?php
class Organization extends Controller {

	function Organization()
	{
		parent::Controller();
		
		if(!$this->session->user_group_is(ORG_GROUPID))
			redirect('login');
		
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		
		$this->sidebar_data = array();
		$this->sidebar_data['hrefs'] = array('organization','organization/forms','organization/change_password');
		$this->sidebar_data['anchors'] = array('Announcements', 'Application Forms','Change Password');
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - Organization";
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'organization/announcements/';
		$params['announcement']['forward_link'] = 'organization/announcements/';
		$params['announcement']['back_link'] = 'organization/announcements/';
		
		$this->load->library('views',$params);
	}
	
	function index()
	{
		redirect('organization/announcements');
	}
	
	function forms()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/index');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form1()
	{
		$data['title'] = "Application Forms - Organization";
		
		$fckeditorConfig = array(
			'instanceName' => 'org_description',
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
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form1');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form2()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form2');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form3()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form3');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form4()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form4');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form5()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form5');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form6()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form6');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function form7()
	{
		$data['title'] = "Application Forms - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('organization/forms/form7');
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function change_password()
	{
		$data['title'] = "Change Password - Organization";
		
		$this->load->view('htmlhead', $data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		
		$this->load->view('layout/content/div_open');
		$this->load->view('sidebar/links_only',$this->sidebar_data);
		
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
/*	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Announcements - Organization";
		
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
			$announcements_data['site_link']='organization/index/';
			$announcements_data['forward_link']='organization/index/0/';
			
			$this->load->view('announcements/list', $announcements_data);
		}else{
			$announcements_data['announcement'] = $announcement;
			
			$announcements_data['span']=19;
			$announcements_data['back_link'] = 'organization';
			
			$this->load->view('announcements/announcement', $announcements_data);
		}
		
		$this->load->view('layout/content/div_close');
		
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
*/
}

/* End of file organization.php */
/* Location: ./application/controllers/organization.php */
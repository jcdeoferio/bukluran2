<?php
class Main extends Controller {
	function Main()
	{
		parent::Controller();
		$this->load->helper('url');
	}
	
	function fckeditorform(){
		$fckeditorConfig = array(
			'instanceName' => 'content',
			'BasePath' => base_url().'system/plugins/fckeditor/',
			'ToolbarSet' => 'Basic',
			'Width' => '100%',
			'Height' => '200',
			'Value' => ''
			);
		
		$this->load->library('fckeditor', $fckeditorConfig);
		$this->load->view('fckeditorView');
        
	}
	function fckeditorshowpost(){
    
        echo $this->input->post('content');
        
	} 
	function announcements($page_no = 0,$announcement_id = -1){
		$data['stylesheets'] = array('announcement.css');
		$data['title'] = "Announcements";
		
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
		
		$this->load->view('htmlhead',$data);
		$this->load->view('header');
		$this->load->view('content-header');
		if($announcement_id == -1){
			$announcements_data['announcements'] = array($announcement, $announcement);
			$this->load->view('announcements/list', $announcements_data);
		}else{
			$announcements_data['announcement'] = $announcement;
			$this->load->view('announcements/announcement', $announcements_data);
		}
		$this->load->view('content-footer');
		$this->load->view('footer');
	}
	
	function organizations($page_no = 0,$org_id = -1){
		
		$data['stylesheets'] = array('organizations_list.css');
		$data['title'] = "Organizations";
		$this->load->view('htmlhead',$data);
		$this->load->view('header');
		$this->load->view('content-header');
		if($org_id == -1){
			$orgs_list['orgs_id'] = array(1,2,3);
			$orgs_list['orgs_name'] = array('UP Programming Guild', 'Organization Name1', 'Organization Name2');
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
			$this->load->view('organizations/profile',$org_data);
		}
		$this->load->view('content-footer');
		$this->load->view('footer');
		
	}
	
	function contact(){
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('content-header');
		$this->load->view('contact');
		$this->load->view('content-footer');
		$this->load->view('footer');
	}	

	function index()
	{	
		redirect('main/announcements');
	}
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */
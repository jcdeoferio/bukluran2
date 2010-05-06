<?php
class Main extends Controller {
	function Main()
	{
		parent::Controller();
		$this->load->helper('url');
		
		$params['title'] = "Announcements - Organization";
		//$params['sidebar'] = $this->sidebar_data;
		
		$params['span'] = 24;
		$params['site_link'] = 'main/announcements/';
		$params['forward_link'] = 'main/announcements/0/';
		$params['back_link'] = 'main/announcements/0/';
		
		$this->load->library('announcement',$params);
	}
	
	function index()
	{	
		if($this->session->userdata(USER)){
			$userdata = $this->session->userdata(USER);
			redirect($userdata['groupname']);
		}
		redirect('main/announcements');
	}
	
	function fckeditorform()
	{
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
	function fckeditorshowpost()
	{
    
        echo $this->input->post('content');
        
	} 
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->announcement->load_announcements($page_no,$announcement_id);
	}
/*	
	function announcements($page_no = 0,$announcement_id = -1)
	{	
		if($this->session->userdata(USER)){
			$userdata = $this->session->userdata(USER);
			redirect($userdata['groupname'].'/announcements');
		}
		
		$params['title'] = "Announcements";
		
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
		$this->load->view('layout/content/header');
		$this->load->view('layout/content/div_open');
		if($announcement_id == -1){
			$announcements_data['announcements'] = array($announcement, $announcement);
			
			$announcements_data['span']=24;
			$announcements_data['site_link']='main/announcements/';
			$announcements_data['forward_link']='main/announcements/0/';
			
			$this->load->view('announcements/list', $announcements_data);
		}else{
			$announcements_data['announcement'] = $announcement;
			
			$announcements_data['span']=24;
			$announcements_data['back_link'] = 'main/announcements';
			
			$this->load->view('announcements/announcement', $announcements_data);
		}
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
*/	
	function organizations($page_no = 0,$org_id = -1)
	{
		if($this->session->userdata(USER)){
			$userdata = $this->session->userdata(USER);
			if($userdata['groupname'] == 'osa')
				redirect($userdata['groupname'].'/organizations');
		}
	
		$data['stylesheets'] = array('organizations_list.css');
		$data['title'] = "Organizations";
		$this->load->view('htmlhead',$data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		$this->load->view('layout/content/div_open');
		if($org_id == -1){
			$orgs_list['orgs_id'] = array(1,2,3);
			$orgs_list['orgs_name'] = array('UP Programming Guild', 'Organization Name1', 'Organization Name2');
			
			$orgs_list['span']=24;
			$orgs_list['site_link']='main/organizations/';
			$orgs_list['forward_link']='main/organizations/0/';
			
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
			
			$org_data['span']=24;
			$org_data['back_link']='main/organizations/';
			
			$this->load->view('organizations/profile',$org_data);
		}
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
		
	}
	
	function contact()
	{
		$this->load->view('htmlhead');
		$this->load->view('header');
		$this->load->view('layout/content/header');
		$this->load->view('layout/content/div_open');
		$this->load->view('contact');
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}	
	
	function jquery()
	{
		$header_data['other'] = <<<TEXT
		
		<script type="text/javascript">
		$(function(){

			// Accordion
			$("#accordion").accordion({ header: "h3" });

			// Tabs
			$('#tabs').tabs();


			// Dialog			
			$('#dialog').dialog({
				autoOpen: false,
				width: 600,
				buttons: {
					"Ok": function() { 
						$(this).dialog("close"); 
					}, 
					"Cancel": function() { 
						$(this).dialog("close"); 
					} 
				}
			});
			
			// Dialog Link
			$('#dialog_link').click(function(){
				$('#dialog').dialog('open');
				return false;
			});

			// Datepicker
			$('#datepicker').datepicker({
				inline: true
			});
			
			// Slider
			$('#slider').slider({
				range: true,
				values: [17, 67]
			});
			
			// Progressbar
			$("#progressbar").progressbar({
				value: 20 
			});
			
			//hover states on the static widgets
			$('#dialog_link, ul#icons li').hover(
				function() { $(this).addClass('ui-state-hover'); }, 
				function() { $(this).removeClass('ui-state-hover'); }
			);
			
		});
	</script>
	<style type="text/css">
		/*demo page css*/
		body{ font: 62.5% "Trebuchet MS", sans-serif; margin: 50px;}
		.demoHeaders { margin-top: 2em; }
		#dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative;}
		#dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
		ul#icons {margin: 0; padding: 0;}
		ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
		ul#icons span.ui-icon {float: left; margin: 0 4px;}
	</style>

TEXT;
		
		$this->load->view('htmlhead', $header_data);
		$this->load->view('header');
		$this->load->view('layout/content/header');
		$this->load->view('layout/content/div_open');
		$this->load->view('jqueryui-test');
		$this->load->view('layout/content/div_close');
		$this->load->view('layout/content/footer');
		$this->load->view('footer');
	}
	
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */
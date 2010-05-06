<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Announcement {

	function Announcement($params)
	{	
		$this->CI =& get_instance();
		$this->data['stylesheets'] = array('announcement.css');
		$this->data['title'] = $params['title'];
		if(array_key_exists('sidebar',$params)){
			$this->sidebar_data = $params['sidebar'];
		}
		$this->announcements_data['span'] = $params['span'];
		$this->announcements_data['site_link'] = $params['site_link'];
		$this->announcements_data['forward_link'] = $params['forward_link'];
		$this->announcements_data['back_link'] = $params['back_link'];
	}

    function load_announcements($page_no = 0, $announcement_id = -1)
    {	
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
		
		$this->CI->load->view('htmlhead', $this->data);
		$this->CI->load->view('header');
		$this->CI->load->view('layout/content/header');
		
		$this->CI->load->view('layout/content/div_open');
		if(isset($this->sidebar_data)){
			$this->CI->load->view('sidebar/links_only',$this->sidebar_data);
		}
		
		$this->announcements_data['page_no'] = $page_no;
		if($announcement_id == -1){
			$this->announcements_data['announcements'] = array($announcement, $announcement);
			$this->CI->load->view('announcements/list', $this->announcements_data);
		}else{
			$this->announcements_data['announcement'] = $announcement;
			$this->CI->load->view('announcements/announcement', $this->announcements_data);
		}
		
		$this->CI->load->view('layout/content/div_close');
		
		$this->CI->load->view('layout/content/footer');
		$this->CI->load->view('footer');
    }
}

?>
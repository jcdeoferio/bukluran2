<?php
class Organization extends Controller {

	function Organization()
	{
		parent::Controller();
		
		if(!$this->session->user_group_is(ORG_GROUPID) && !$this->session->user_group_is(OSA_GROUPID))
			redirect('login');
		
		$this->load->helper('html');
		$this->load->helper('url');
		$this->load->helper('form');
		
		$this->load->model('Variable');
		$this->load->model('organization_model');
		$this->load->model('email_queue_model');
		$this->load->model('orgform2_model');
		$this->load->model('orgregistration_model');
		
		if($this->session->user_group_is(OSA_GROUPID)){
			$this->sidebar_data['links'][0]['title'] = 'Announcements';
			$this->sidebar_data['links'][0]['hrefs'] = array('osa/announcements','osa/create_announcement');
			$this->sidebar_data['links'][0]['anchors'] = array('Home','Create Announcement');
			$this->sidebar_data['links'][0]['selected'] = -1;
			$this->sidebar_data['links'][1]['title'] = 'Registration';
			$this->sidebar_data['links'][1]['hrefs'] = array('osa/organizations','osa/manage_reqs');
			$this->sidebar_data['links'][1]['anchors'] = array('Manage Organizations','Requirements');
			$this->sidebar_data['links'][1]['selected'] = -1;
			$this->sidebar_data['links'][2]['title'] = 'Application Period';
			$this->sidebar_data['links'][2]['hrefs'] = array('osa/manage_app_period');
			$this->sidebar_data['links'][2]['anchors'] = array('Manage');
			$this->sidebar_data['links'][2]['selected'] = -1;
		}else{
			$this->sidebar_data['links'][0]['title'] = 'Announcements';
			$this->sidebar_data['links'][0]['hrefs'] = array('organization/announcements');
			$this->sidebar_data['links'][0]['anchors'] = array('Home');
			$this->sidebar_data['links'][0]['selected'] = -1;
			$this->sidebar_data['links'][1]['title'] = 'Registration';
			$this->sidebar_data['links'][1]['hrefs'] = array('organization/forms','organization/requirements');
			$this->sidebar_data['links'][1]['anchors'] = array('Forms','Requirements');
			$this->sidebar_data['links'][1]['selected'] = -1;
			$this->sidebar_data['links'][2]['title'] = 'Account';
			$this->sidebar_data['links'][2]['hrefs'] = array('organization/change_password');
			$this->sidebar_data['links'][2]['anchors'] = array('Change Password');
			$this->sidebar_data['links'][2]['selected'] = -1;
		}
		
		define('CURRENT_APPSEM', $this->Variable->current_application_aysem());
		
		$params['sidebar'] = $this->sidebar_data;
		
		$params['announcement']['title'] = "Announcements - ".$this->session->username();
		$params['announcement']['span'] = 19;
		$params['announcement']['site_link'] = 'organization/announcements/';
		$params['announcement']['forward_link'] = 'organization/announcements/';
		$params['announcement']['back_link'] = 'organization/announcements/';
		
		$this->load->library('views',$params);
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="ui-widget"><div class="ui-state-error ui-corner-all notification" title="Login Error"><span class="ui-icon ui-icon-alert notification-icon"></span>', '<span class="ui-icon ui-icon-close notification-close" style="display:none;"></span></div></div>');
	}
	
	function index()
	{
		$this->forms();
	}
	
	function forms()
	{
		$data['title'] = "Application Forms - ".$this->session->username();
		$user = $this->session->userdata(USER);
		$data['clarifications'] = $this->organization_model->get_clarifications($user['organizationid'], $this->Variable->current_application_aysem());
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/index',$data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form1($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		
		$data['title'] = "Information Sheet - ".$this->session->username();
		
		$fckeditorConfig = array(
			'instanceName' => 'description',
			'BasePath' => base_url().'system/plugins/fckeditor/',
			'ToolbarSet' => 'Basic',
			'Width' => '100%',
			'Height' => '200',
			'Value' => ''
			);	
		$this->load->library('fckeditor', $fckeditorConfig);
		$categories = $this->organization_model->get_orgcategories();
		foreach($categories as $cat){
			$content_data['categories'][$cat['orgcategoryid']] = $cat['description'];
		}
		
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form1/';
		$content_data['organization'] = $organization;	

		$this->sidebar_data['links'][1]['selected'] = 0;		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form1', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form1_submit($appsemid, $organizationid){
		if($this->session->user_group_is(OSA_GROUPID)){
			$this->form_validation->set_rules('name', 'Organization Name', 'required');
		}
		$this->form_validation->set_rules('acronym', 'Acronym', 'required');
		$this->form_validation->set_rules('date_established', 'Date Established', 'required|callback__valid_date');
		if($this->input->post('sec_incorporated')){
			$this->form_validation->set_rules('date_incorporated', 'Date Incorporated', 'required|callback__valid_date');
		}
		$this->form_validation->set_rules('mailaddr', 'Mailing Address', 'required');
		$this->form_validation->set_rules('orgemail', 'Email Address', 'required|valid_email');
		$this->form_validation->set_rules('heademail', "Head's Email Address", 'required|valid_email');
		$this->form_validation->set_rules('description', 'Description', 'required');
		$this->form_validation->set_rules('category', 'Category', 'required');
		$this->form_validation->set_rules('sec_incorporated', 'SEC Incorporation', 'required');
		
		$this->form_validation->set_message('_valid_date', "The %s field is not a valid date.");
		
		if(!$this->form_validation->run()){
			$this->form1();
		}else{
			if($this->session->user_group_is(OSA_GROUPID)){
				$this->organization_model->save_organization($organizationid,$this->input->post('name'));
			}
			$profile['acronym'] = $this->input->post('acronym');
			$profile['establisheddate'] = $this->input->post('date_established');
			$profile['orgcategoryid'] = $this->input->post('category');
			$profile['secincorporated'] = $this->input->post('sec_incorporated');
			$profile['incorporationdate'] = $this->input->post('date_incorporated')?:NULL;
			$profile['secincorporated'] = $profile['secincorporated']?'true':'false';
			$profile['mailaddr'] = $this->input->post('mailaddr');
			$profile['orgemail'] = $this->input->post('orgemail');
			$profile['heademail'] = $this->input->post('heademail');
			$profile['orgdescription'] = $this->input->post('description');
			
			
			$this->organization_model->save_organization_profile($organizationid,$appsemid,$profile);
			if($this->session->user_group_is(OSA_GROUPID)){
				redirect("osa/view_application/{$organizationid}/{$appsemid}");
			}else{
				redirect('organization/forms');
			}
		}		
	}
	
	function _valid_date($str){
		$date = preg_split("/-/",$str);	
		return count($date) == 3 && checkdate(intval($date[1]),intval($date[2]),intval($date[0]));
	}

	function form1_faculty_adviser($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$data['title'] = "Faculty Advisers - ".$this->session->username();
		
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form1_faculty_adviser/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		$content_data['add_adviser_url'] = "organization/form1_add_adviser/{$appsemid}/{$organizationid}";
		$content_data['advisers'] = $this->organization_model->get_advisers($organizationid, $appsemid);
	
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form1_faculty_adviser', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form1_add_adviser($appsemid, $organizationid){
		if(!is_numeric($appsemid) || !is_numeric($organizationid))
			redirect('organization/forms');
		
		$data['title'] = "Add Faculty Adviser - ".$this->session->username();
		
		if(!$this->session->user_group_is(OSA_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		$orgname = $organization['orgname'];
		
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['orgname'] = $orgname;
		$content_data['submit_url'] = "organization/form1_add_adviser_submit/{$appsemid}/{$organizationid}";
		$content_data['postback'] = $this->session->postback_variable();

		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form1_add_adviser', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form1_add_adviser_submit($appsemid, $organizationid){
		if(!is_numeric($appsemid) || !is_numeric($organizationid))
			redirect('organization/forms');
					
		if(!$this->session->user_group_is(OSA_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		$this->form_validation->set_rules('webmail', 'UP Webmail', 'required|valid_email');
		$this->form_validation->set_rules('email', 'Email Address', 'valid_email');
		
		$postback['webmail'] = $this->input->post('webmail');
		$postback['email'] = $this->input->post('email');
		
		if(!$this->form_validation->run()){
			$this->session->save_validation_errors();
			$this->session->save_postback_variable($postback);
			
			$this->form1_add_adviser($appsemid,$organizationid);
		}
		else{
			$add_success = $this->organization_model->add_faculty($organizationid, $appsemid, $postback['webmail'], $postback['email']);
			
			if($add_success)
				$this->form1_faculty_adviser($appsemid,$organizationid);
			else{
				$this->load->helper('inflector');
				
				$this->session->add_validation_error("{$postback['webmail']} is already a faculty adviser");
				$this->session->save_postback_variable($postback);
				
				$this->form1_add_adviser($appsemid,$organizationid);
			}
		}
	}
	
	function form2($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$this->load->model('orgform2_model');
		
		$data['title'] = "Finance Statement - ".$this->session->username();
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form2/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		$content_data['start_bal'] = $organization['startingbalance'];
		$content_data['collections'] = $this->orgform2_model->get_collections($organizationid,$appsemid);
		$content_data['disbursements'] = $this->orgform2_model->get_disbursements($organizationid,$appsemid);
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form2', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form2_submit($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		
		$this->orgform2_model->update_starting_balance($organizationid,$appsemid,$this->input->post('start_bal'));
		
		$n_collections = $this->input->post('collections_no');
		
		for($i=1;$i<=$n_collections;$i++){
			$id = $this->input->post("collection_id_{$i}");
			$desc = $this->input->post("collection_detail_{$i}");
			$amount = $this->input->post("collection_amount_{$i}");
			if($this->orgform2_model->collection_belongs($id,$organizationid)){
				$this->orgform2_model->update_collection($id,$desc,$amount);
			}
		}
		
		$n_disbursements = $this->input->post('disbursements_no');
		
		for($i=1;$i<=$n_disbursements;$i++){
			$id = $this->input->post("disbursement_id_{$i}");
			$desc = $this->input->post("disbursement_detail_{$i}");
			$amount = $this->input->post("disbursement_amount_{$i}");
			if($this->orgform2_model->disbursement_belongs($id,$organizationid)){
				$this->orgform2_model->update_disbursement($id,$desc,$amount);
			}
		}
		
		$this->form2($appsemid,$organizationid);
	}
	
	function form2_add_collection($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$this->load->model('orgform2_model');
		
		$data['title'] = "Finance Statement - ".$this->session->username();
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form3/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		$content_data['collections'] = $this->orgform2_model->get_collections($organizationid,$appsemid);
		$content_data['disbursements'] = $this->orgform2_model->get_disbursements($organizationid,$appsemid);
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form2_add_collection', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form2_add_collection_submit($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		
		$this->orgform2_model->insert_collection($organizationid,$appsemid,$this->input->post('amount'),$this->input->post('description'));
		$this->form2($appsemid,$organizationid);
	}
	
	function form2_add_disbursement($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$data['title'] = "Finance Statement - ".$this->session->username();
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form3/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		$content_data['collections'] = $this->orgform2_model->get_collections($organizationid,$appsemid);
		$content_data['disbursements'] = $this->orgform2_model->get_disbursements($organizationid,$appsemid);
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form2_add_disbursement', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form2_add_disbursement_submit($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		
		$this->orgform2_model->insert_disbursement($organizationid,$appsemid,$this->input->post('amount'),$this->input->post('description'));
		$this->form2($appsemid,$organizationid);
	}
	
	function delete_collection($id, $appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		
		if($this->orgform2_model->collection_belongs($id,$organizationid))
			$this->orgform2_model->delete_collection($id);
		
		$this->form2($appsemid,$organizationid);
	}
	
	function delete_disbursement($id, $appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		
		if($this->orgform2_model->disbursement_belongs($id,$organizationid))
			$this->orgform2_model->delete_disbursement($id);
		
		$this->form2($appsemid,$organizationid);
	}
	
	function form3($appsemid = CURRENT_APPSEM, $organizationid = NULL){
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$data['title'] = "Officer and Member Roster - ".$this->session->username();
		
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form3/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		$content_data['add_officer_url'] = "organization/form3_add_student/true/{$appsemid}/{$organizationid}";
		$content_data['add_member_url'] = "organization/form3_add_student/false/{$appsemid}/{$organizationid}";
		$content_data['officers'] = $this->organization_model->get_officers($organizationid, $appsemid);
		$content_data['members'] = $this->organization_model->get_members($organizationid, $appsemid);
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form3', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form3_add_student($isofficer, $appsemid, $organizationid){
		if(!is_numeric($appsemid) || !is_numeric($organizationid))
			redirect('organization/forms');
		
		$isofficer = $isofficer=='true'?TRUE:FALSE;
		if($isofficer)
			$isofficerstr = 'true';
		else
			$isofficerstr = 'false';
		
		$data['title'] = "Add Officer - ".$this->session->username();
		
		if(!$this->session->user_group_is(OSA_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		$orgname = $organization['orgname'];
		
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['orgname'] = $orgname;
		$content_data['isofficer'] = $isofficer;
		$content_data['submit_url'] = "organization/form3_add_student_submit/{$isofficerstr}/{$appsemid}/{$organizationid}";
		$content_data['postback'] = $this->session->postback_variable();

		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form3_add_student', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form3_add_student_submit($isofficer, $appsemid, $organizationid){
		if(!is_numeric($appsemid) || !is_numeric($organizationid))
			redirect('organization/forms');
		
		$isofficer = $isofficer=='true'?TRUE:FALSE;
		if($isofficer)
			$isofficerstr = 'true';
		else
			$isofficerstr = 'false';
			
		if(!$this->session->user_group_is(OSA_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		$this->form_validation->set_rules('webmail', 'UP Webmail', 'required|valid_email');
		$this->form_validation->set_rules('email', 'Email Address', 'valid_email');
		
		if($isofficer)
			$this->form_validation->set_rules('position', 'Position', 'required');
		
		$postback['webmail'] = $this->input->post('webmail');
		$postback['email'] = $this->input->post('email');
		$postback['position'] = $isofficer?$this->input->post('position'):NULL;
		
		if(!$this->form_validation->run()){
			$this->session->save_validation_errors();
			$this->session->save_postback_variable($postback);
			
			redirect("organization/form3_add_student/{$isofficerstr}/{$appsemid}/{$organizationid}");
		}
		else{
			$add_success = $this->organization_model->roster_add_student($organizationid, $appsemid, $postback['webmail'], $postback['email'], $postback['position']);
			
			if($add_success)
				redirect("organization/form3/{$appsemid}/{$organizationid}");
			else{
				$this->load->helper('inflector');
				
				$studenttype = articlize($isofficer?'officer':'member');
				$this->session->add_validation_error("{$postback['webmail']} is already $studenttype");
				$this->session->save_postback_variable($postback);
				
				redirect("organization/form3_add_student/{$isofficerstr}/{$appsemid}/{$organizationid}");
			}
		}
	}
	
	function form5($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$data['title'] = "Accomplishment Report - ".$this->session->username();
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form5/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form5', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form6($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$data['title'] = "Calendar of Activites - ".$this->session->username();
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form6/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form6', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form7($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		$orgname = NULL;
		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
			$orgname = $this->session->orgname();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		$organization = $this->organization_model->get_organization($organizationid,$appsemid);	
		if($this->session->user_group_is(OSA_GROUPID)){
			//$organization = $this->organization_model->get_organization($organizationid,$appsemid);
			$orgname = $organization['orgname'];
		}
		
		$data['title'] = "Acknowledgment - ".$this->session->username();
		$content_data['appsemid'] = $appsemid;
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($appsemid);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['change_appsem_submit_url'] = 'organization/form_change_appsem_submit/form7/';
		$content_data['orgname'] = $orgname;
		$content_data['orgid'] = $organizationid;
		$content_data['organization'] = $organization;
		
		$this->sidebar_data['links'][1]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/forms/form7', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function form7_submit($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{		
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
			
		if($this->session->user_group_is(OSA_GROUPID)){
			$organization = $this->organization_model->get_organization($organizationid,$appsemid);
		}
		$acknowledged = $this->input->post('acknowledged');
		$this->organization_model->save_acknowledged($organizationid,$appsemid,$acknowledged);
		
		if($this->session->user_group_is(OSA_GROUPID)){
			redirect("osa/view_application/{$organizationid}/{$appsemid}");
		}else{
			redirect('organization/forms');
		}
	}
	
	function form_change_appsem_submit($url_form_part){
		redirect("organization/{$url_form_part}/{$this->input->post('appsem')}/{$this->input->post('orgid')}");
	}
	
	function change_password()
	{
		$data['title'] = "Change Password  - ".$this->session->username();
		$data['span'] = 19;
		$data['stylesheets'] = array('login.css');
		
		$this->sidebar_data['links'][2]['selected'] = 0;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/change_password',$data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function change_password_submit()
	{
		$this->form_validation->set_rules('old_pass', '"Current Password"', 'required|callback__password_check');
		$this->form_validation->set_message('_password_check', "The %s field doesn't match the current password of your account.");
		$this->form_validation->set_rules('new_pass_1', '"New Password"', 'required');
		$this->form_validation->set_rules('new_pass_2', '"New Password Confirmation"', 'required|matches[new_pass_1]');
		
		if (!$this->form_validation->run())
		{
			$this->change_password();
		}else{
			$this->load->model('osa_model');
			$this->osa_model->change_organization_password($this->session->username(),$this->input->post('new_pass_1'));
			
			$data['title'] = "Change Password  - ".$this->session->username();
			$data['span'] = 19;
			$data['stylesheets'] = array('login.css');
			
			$this->sidebar_data['links'][2]['selected'] = 0;
			$this->views->header($data,$this->sidebar_data);
			$this->load->view('organization/change_password_success',$data);
			$this->views->footer();
			$this->sidebar_data['links'][2]['selected'] = -1;
		}
	}
	
	function _password_check()
	{
		$this->load->model('login_model');
		$res = $this->login_model->authenticate_login($this->session->username(),$this->input->post('old_pass'));
		
		if(count($res) == 0){
			
			return FALSE;
		}
		return TRUE;
	}
	
	function announcements($page_no = 0,$announcement_id = -1)
	{
		$this->views->load_announcements($page_no,$announcement_id);
	}
	
	function send_member_confirmation_email($studentid, $appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');

		$member['studentid'] = $studentid;
		$this->email_queue_model->queue_member_confirmation_email($organizationid,array($member));
		$this->form3($appsemid,$organizationid);
	}
	
	function send_adviser_confirmation_email($facultyid, $appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
	
		$adviser['facultyid'] = $facultyid;
		$this->email_queue_model->queue_faculty_confirmation_email($organizationid,array($adviser));
		$this->form1_faculty_adviser($appsemid,$organizationid);
	}
		
	function send_member_confirmation_emails($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');

		$members = $this->organization_model->get_members_and_officers($organizationid,$appsemid);
		$this->email_queue_model->queue_member_confirmation_email($organizationid,$members);
		$this->form3($appsemid,$organizationid);
	}
	
	function send_adviser_confirmation_emails($appsemid = CURRENT_APPSEM, $organizationid = NULL)
	{
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
	
		$advisers = $this->organization_model->get_advisers($organizationid,$appsemid);
		$this->email_queue_model->queue_faculty_confirmation_email($organizationid,$advisers);
		$this->form1_faculty_adviser($appsemid,$organizationid);
	}
	
	function view_clarification($id){
		$data['clarification'] = $this->organization_model->get_clarification($id);
		$data['title'] = "View Message  - ".$this->session->username();
		$data['message'] = false;
		$data['span'] = 19;
		$data['back_link'] = $this->session->user_group_is(OSA_GROUPID)?
								"osa/view_application/{$data['clarification']['organizationid']}/{$data['clarification']['appsemid']}":
								"organization";
		
		$user = $this->session->userdata(USER);
		
		if(!$this->session->user_group_is(OSA_GROUPID) && 
			$data['clarification']['organizationid'] != $user['organizationid'] &&
			$data['clarification']['appsemid'] == $this->Variable->current_application_aysem())
			redirect('organization');
		
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/clarification',$data);
		$this->views->footer();
	}
	
	function delete_member($studentid, $appsemid = CURRENT_APPSEM, $organizationid = NULL){				
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
		
		$this->organization_model->delete_member($organizationid,$studentid,$appsemid);
		
		if($this->session->user_group_is(OSA_GROUPID)){
			$this->form3($appsemid,$organizationid);
		}else{
			$this->form3();
		}
	}
	
	function delete_adviser($facultyid, $appsemid = CURRENT_APPSEM, $organizationid = NULL){				
		if($this->session->user_group_is(ORG_GROUPID)){
			$appsemid = CURRENT_APPSEM;
			$organizationid = $this->session->organizationid();
		}
		
		if(is_null($organizationid))
			redirect('organization');
		
		$this->organization_model->delete_adviser($organizationid,$facultyid,$appsemid);
		
		if($this->session->user_group_is(OSA_GROUPID)){
			$this->form1_faculty_adviser($appsemid,$organizationid);
		}else{
			$this->form1_faculty_adviser();
		}
	}
	
	function requirements()
	{
		$data['title'] = "Requirements - ".$this->session->username();
		
		$this->load->model('Orgrequirement_model');
		$this->load->model('organization_model');
		
		$content_data['org_reqs'] = $this->Orgrequirement_model->get_requirements_appsem($this->session->organizationid(), $this->Variable->current_application_aysem());
		$content_data['org'] = $this->organization_model->get_organization($this->session->organizationid(),$this->Variable->current_application_aysem());
		$content_data['appsemid'] = $this->Variable->current_application_aysem();
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($this->Variable->current_application_aysem());
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		
		$this->sidebar_data['links'][1]['selected'] = 1;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/requirements', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
	
	function view_req($requirementid){
		$organizationid = $this->session->organizationid();
		$data['title'] = "View Organization Requirement Details - ".$this->session->username();
		
		$this->load->model('Orgrequirement_model');
		$this->load->model('organization_model');
		
		$org_req = $this->Orgrequirement_model->get_requirement($organizationid, $requirementid);
		
		$content_data['org_req'] = $org_req;
		$content_data['org'] = $this->organization_model->get_organization($organizationid,$this->Variable->current_application_aysem());
		$content_data['pretty_application_aysem'] = $this->Variable->pretty_application_aysem($org_req['appsemid']);
		$content_data['appsems'] = result_to_option_array($this->Variable->get_valid_appsems_pretty(), 'appsemid', 'pretty');
		$content_data['submit_url'] = "organization/manage_org_req_submit/{$organizationid}/{$requirementid}";
		$content_data['editable'] = FALSE;
		$content_data['postback'] = $this->session->postback_variable();
		
		$this->sidebar_data['links'][1]['selected'] = 1;
		$this->views->header($data,$this->sidebar_data);
		$this->load->view('organization/req_details', $content_data);
		$this->views->footer();
		$this->sidebar_data['links'][1]['selected'] = -1;
	}
}

/* End of file organization.php */
/* Location: ./application/controllers/organization.php */

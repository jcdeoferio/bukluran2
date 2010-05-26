<?php
class Email_queue extends Controller {
	function Email_queue()
	{
		parent::Controller();
		$this->load->model('email_queue_model');
		$this->load->model('organization_model');
		$this->load->model('announcement_model');
		$this->load->model('student_model');
		$this->load->model('faculty_model');
		$this->load->model('variable');
		$this->load->library('emailer');
		$this->load->helper('html');
	}
	
	function index()
	{	
/*
		$orgs = $this->organization_model->get_organizations();
		$advisers = $this->organization_model->get_advisers(1,20093);
		$members = $this->organization_model->get_members_and_officers(1,20093);
		$this->email_queue_model->queue_announcement_email(1,$orgs);
		$this->email_queue_model->queue_osa_to_organization_email(1,1);
		$this->email_queue_model->queue_faculty_confirmation_email(1,$advisers);
		$this->email_queue_model->queue_member_confirmation_email(1,$members);
*/
	}
	
	function send_email($N = 5)
	{
		
		$result = $this->email_queue_model->get_queued_emails($N);
		foreach($result as $row){
			$done[] = $row['emailqueueid'];
			switch($row['emailtypeid']){
				case MEMBER_CONFIRMATION_EMAIL:
					$data = array();
					$data['member'] = $this->student_model->get_profile($row['studentid']);
					$data['member']['position'] = $this->organization_model->get_position($row['studentid'],$row['organizationid'],$this->variable->current_application_aysem());
					$data['organization'] = $this->organization_model->get_organization($row['organizationid'],$this->variable->current_application_aysem());
					$subject = "Bukluran: ".$data['organization']['orgname']." has added you as a member";
					$content = $this->load->view('emails/member_confirmation',$data,true);
					echo($subject.br(2).$content.br(3));
/*
					$this->emailer->send_email($data['member']['webmail'],$subject,$content);
*/
				break;
				case FACULTY_CONFIRMATION_EMAIL:
					$data = array();
					$data['faculty'] = $this->faculty_model->get_profile_and_details($row['facultyid']);
					$data['organization'] = $this->organization_model->get_organization($row['organizationid'],$this->variable->current_application_aysem());
					$data['clarification'] = $this->organization_model->get_clarification($row['orgclarificationid']);
					$subject = "Bukluran: ".$data['organization']['orgname']." has added you as a faculty adviser";
					$content = $this->load->view('emails/faculty_confirmation',$data,true);
/*
					echo($subject.br(2).$content.br(3));
*/
					$this->emailer->send_email($data['faculty']['webmail'],$subject,$content);
				break;
				case OSA_TO_ORGANIZATION_EMAIL:
					$data = array();
					$data['clarification'] = $this->organization_model->get_clarification($row['orgclarificationid']);
					$org = $this->organization_model->get_organization_profile($row['organizationid'],$this->variable->current_application_aysem());
					$subject = "Bukluran: Message from OSA regarding your application";
					$content = $this->load->view('emails/clarification',$data,true);
/*
					echo($subject.br(2).$content.br(3));
*/
					$this->emailer->send_email($org['heademail'],$subject,$content);
				break;
				case ANNOUNCEMENT_EMAIL:
					$data = array();
					$data['announcement'] = $this->announcement_model->get_announcement($row['announcementid']);
					$org = $this->organization_model->get_organization_profile($row['organizationid'],$this->variable->current_application_aysem());
					$subject = "Bukluran Announcement: ".$data['announcement']['title'];
					$content = $this->load->view('emails/announcement',$data,true);
/*
					echo($subject.br(2).$content.br(3));
*/
					$this->emailer->send_email($org['heademail'],$subject,$content);
				break;
			}
		}
		if(count($result))
			$this->email_queue_model->done($done);
	}
}

/* End of file email_queue.php */
/* Location: ./application/controllers/email_queue.php */

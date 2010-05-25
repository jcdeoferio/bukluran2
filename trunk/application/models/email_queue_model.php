<?php

class Email_queue_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function queue_member_confirmation_email($organizationid,$students)
	{
		foreach($students as $student){
			$id = $student['studentid'];
			$rows[] = "{$organizationid},{$id},".MEMBER_CONFIRMATION_EMAIL;
		}
		$values = "(".implode('),(',$rows).")";
		$sql = "INSERT INTO email_queue (organizationid, studentid, emailtypeid) VALUES {$values}";
		return $this->db->simple_query($sql);
	}
	
	function queue_faculty_confirmation_email($organizationid,$advisers)
	{
		foreach($advisers as $adviser){
			$id = $adviser['facultyid'];
			$rows[] = "{$organizationid},{$id},".FACULTY_CONFIRMATION_EMAIL;
		}
		$values = "(".implode('),(',$rows).")";
		$sql = "INSERT INTO email_queue (organizationid, facultyid, emailtypeid) VALUES {$values}";
		return $this->db->simple_query($sql);
	}
	
	function queue_osa_to_organization_email($orgclarificationid,$organizationid)
	{
		$this->db->insert('email_queue',array(
			'orgclarificationid'=>$orgclarificationid,
			'organizationid'=>$organizationid,
			'emailtypeid'=>OSA_TO_ORGANIZATION_EMAIL
		));
	}
	
	function queue_announcement_email($announcementid,$organizations)
	{
		foreach($organizations as $org){
			$id = $org['organizationid'];
			$rows[] = "{$announcementid},{$id},".ANNOUNCEMENT_EMAIL;
		}
		$values = "(".implode('),(',$rows).")";
		$sql = "INSERT INTO email_queue (announcementid, organizationid, emailtypeid) VALUES {$values}";
		return $this->db->simple_query($sql);
	}
	
	function get_queued_emails($limit = 5)
	{
		$this->db->from('email_queue q');
		$this->db->join('email_types t','q.emailtypeid = t.emailtypeid');
		$this->db->where('sent','false');
		$this->db->limit($limit);
		$query = $this->db->get();
		return $query->result_array();
	}
	
	function done($ids)
	{
		$this->db->where_in('emailqueueid',$ids);
		$this->db->update('email_queue', array('sent'=>'true')); 
	}
}


<?php

class Organization_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organization($organizationid){
		$this->db->from('organizations o');
		$this->db->join('orgprofiles p','o.organizationid = p.organizationid');
		$this->db->join('orgcategories cat','cat.orgcategoryid = p.orgcategoryid');
		$this->db->join('orgstatuses stat','stat.orgstatusid = p.orgstatusid');
		$this->db->where('o.organizationid', $organizationid);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function get_organizations($limit = 20, $offset = 0){
		$this->db->from('organizations o');
		$this->db->order_by('orgname');
		//$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_organization_profile($orgid, $sem){
		//$sem = $this->Variable->current_app_aysem();
		$this->db->from('orgprofiles p');
		$this->db->where('p.appsemid', $sem);
		$this->db->where('p.organizationid', $orgid);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function get_organization_profiles($aysem){
		$this->db->from('orgprofiles p');
		$this->db->where('p.appsemid', $aysem);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_members_and_officers($organizationid, $appsemid){
		$this->db->from('students s');
		$this->db->join('orgmemberships m', 's.studentid = m.studentid');
		$this->db->where('organizationid', $organizationid);
		$this->db->where('appsemid', $appsemid);
		//$this->db->where('position', NULL);
		$this->db->order_by('webmail', 'asc');
		
		$query = $this->db->get();
		return($query->result_array());	
	}
	
	function get_members($organizationid, $appsemid){
		$this->db->from('students s');
		$this->db->join('orgmemberships m', 's.studentid = m.studentid');
		$this->db->where('organizationid', $organizationid);
		$this->db->where('appsemid', $appsemid);
		$this->db->where('position', NULL);
		$this->db->order_by('webmail', 'asc');
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_officers($organizationid, $appsemid){
		$this->db->from('students s');
		$this->db->join('orgmemberships m', 's.studentid = m.studentid');
		$this->db->where('organizationid', $organizationid);
		$this->db->where('appsemid', $appsemid);
		$this->db->where('position IS NOT NULL', NULL, FALSE);
		$this->db->order_by('webmail', 'asc');
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function roster_add_student($organizationid, $appsemid, $webmail, $email, $position = NULL){
		$student = $this->assertive_get_student($webmail, $email);
		$studentid = $student['studentid'];
		
		if($this->membership_exists($studentid, $organizationid, $appsemid))
			return(FALSE);
		
		$this->insert_membership($studentid, $organizationid, $appsemid, $email, $position);
		
		return(TRUE);
	}
	
	function assertive_get_student($webmail, $email = NULL){
		if(!$this->student_exists($webmail))
			$this->insert_student($webmail, $email);
			
		return($this->get_student($webmail));
	}
	
	function get_student($webmail){
		$this->db->from('students');
		$this->db->where('webmail', $webmail);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function insert_student($webmail, $email){
		$this->db->set('webmail', $webmail);
		$this->db->insert('students');
	}
	
	function insert_membership($studentid, $organizationid, $appsemid, $email, $position = NULL){
		$this->db->set('studentid', $studentid);
		$this->db->set('organizationid', $organizationid);
		$this->db->set('appsemid', $appsemid);
		$this->db->set('email', $email);
		$this->db->set('position', $position);
		$this->db->insert('orgmemberships');
	}
	
	function student_exists($webmail){
		$this->db->from('students');
		$this->db->where('webmail', $webmail);
		
		return($this->db->count_all_results() > 0);
	}
	
	function membership_exists($studentid, $organizationid, $appsemid){
		$this->db->from('orgmemberships');
		$this->db->where('studentid', $studentid);
		$this->db->where('organizationid', $organizationid);
		$this->db->where('appsemid', $appsemid);
		
		return($this->db->count_all_results() > 0);
	}
	
	function get_advisers($orgid, $sem){
		//$sem = $this->Variable->current_app_aysem();
		$this->db->from('faculty f');
		$this->db->join('orgadvisers a', 'f.facultyid = a.facultyid');
		$this->db->where('a.organizationid', $orgid);
		$this->db->where('a.appsemid', $sem);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_clarifications($orgid, $aysem){
		$this->db->from('orgclarifications');
		$this->db->where('organizationid',$orgid);
		$this->db->where('appsemid',$aysem);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_clarification($id){
		$this->db->from('orgclarifications');
		$this->db->where('orgclarificationid',$id);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function create_clarification($orgid,$aysem,$description){
		$arr = array(
			'appsemid' => $aysem,
			'organizationid' => $orgid,
			'description' => $description
		);
		$this->db->insert('orgclarifications',$arr);
		
		$query = $this->db->get_where('orgclarifications',$arr);
		return $query->row_array();
	}
}

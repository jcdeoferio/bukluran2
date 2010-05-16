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
	
	function get_organization_profile($orgid){
		$sem = $this->Variable->current_app_aysem();
		$this->db->from('orgprofiles p');
		$this->db->where('p.appsemid', $sem);
		$this->db->where('p.organizationid', $orgid);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function get_organization_profiles($limit = 20, $offset = 0){
		$sem = $this->Variable->current_app_aysem();
		$this->db->from('orgprofiles p');
		$this->db->where('p.appsemid', $sem);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_members($orgid){
		$sem = $this->Variable->current_app_aysem();
		$this->db->from('students s');
		$this->db->join('orgmemberships m', 's.studentid = m.studentid');
		$this->db->where('m.organizationid', $orgid);
		$this->db->where('m.appsemid', $sem);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_advisers($orgid){
		$sem = $this->Variable->current_app_aysem();
		$this->db->from('faculty f');
		$this->db->join('orgadvisers a', 'f.facultyid = a.facultyid');
		$this->db->where('a.organizationid', $orgid);
		$this->db->where('a.appsemid', $sem);
		
		$query = $this->db->get();
		return($query->result_array());
	}
}

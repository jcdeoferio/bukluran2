<?php

class Faculty_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organizations($facultyid, $limit = 20, $offset = 0){
		$this->db->from('organizations o');
		$this->db->join('orgadvisers oa', 'oa.organizationid = o.organizationid');
		$this->db->where('facultyid', $facultyid);
		$this->db->order_by('orgname');
		$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function confirm($facultyid, $orgid){
		$this->db->where('facultyid',$facultyid);
		$this->db->where('organizationid',$orgid);
		$this->db->update('orgadvisers',array('confirmed'=>true));
	}
	
	function unconfirm($facultyid, $orgid){
		$this->db->where('facultyid',$facultyid);
		$this->db->where('organizationid',$orgid);
		$this->db->update('orgadvisers',array('confirmed'=>false));
	}
}



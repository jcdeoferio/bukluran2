<?php

class Faculty_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organizations($facultyid, $aysem, $limit = 20, $offset = 0){
		$this->db->from('organizations o');
		$this->db->join('orgadvisers oa', 'oa.organizationid = o.organizationid');
		$this->db->where('facultyid', $facultyid);
		$this->db->where('aysem',$aysem);
		$this->db->order_by('orgname');
		//$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function has_profile($facultyid){
		$this->db->from('facultyprofile');
		$this->db->where('facultyid',$facultyid);
		return $this->db->count_all_results() == 1;
	}
	
	function get_profile($facultyid){
		$this->db->from('facultyprofile');
		$this->db->where('facultyid',$facultyid);
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function confirm($facultyid, $aysem, $orgid){
		$this->db->where('facultyid',$facultyid);
		$this->db->where('organizationid',$orgid);
		$this->db->where('aysem',$aysem);
		$this->db->update('orgadvisers',array('confirmed'=>'true'));
	}
	
	function unconfirm($facultyid, $aysem, $orgid){
		$this->db->where('facultyid',$facultyid);
		$this->db->where('organizationid',$orgid);
		$this->db->where('aysem',$aysem);
		$this->db->update('orgadvisers',array('confirmed'=>'false'));
	}
}



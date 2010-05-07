<?php

class Student_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organizations($studentid, $limit = 20, $offset = 0){
		$this->db->from('organizations o');
		$this->db->join('orgmemberships om', 'om.organizationid = o.organizationid');
		$this->db->where('studentid', $studentid);
		$this->db->order_by('orgname');
		$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function confirm($studentid, $orgid){
		$this->db->where('studentid',$studentid);
		$this->db->where('organizationid',$orgid);
		$this->db->update('orgmemberships',array('confirmed'=>'true'));
	}
	
	function unconfirm($studentid, $orgid){
		$this->db->where('studentid',$studentid);
		$this->db->where('organizationid',$orgid);
		$this->db->update('orgmemberships',array('confirmed'=>'false'));
	}
}


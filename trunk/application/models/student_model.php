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
	
	function set_studentpicture($studentid,$path){
		if($this->get_studentpicture($studentid,20093)){ //TODO current aysem
			$this->db->where('studentid', $studentid);
			$this->db->where('aysem', 20093); //TODO current aysem
			$this->db->update('studentpictures',array('filepath'=>$path));//TODO current aysem
		}else{
			$this->db->insert('studentpictures',array('studentid'=>$studentid,'aysem'=>20093,'filepath'=>$path));//TODO current aysem
		}
	}
	
	function get_studentpicture($studentid,$aysem){
		$this->db->from('studentpictures p');
		$this->db->where('studentid', $studentid);
		$this->db->where('aysem', $aysem);
		
		$query = $this->db->get();
		return($query->row_array());
	}

}


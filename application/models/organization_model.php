<?php

class Organization_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organization($organizationid){
		$this->db->from('organizations o');
		$this->db->where('organizationid', $organizationid);
		
		$query = $this->db->get();
		return($query->row_array());
	}
}


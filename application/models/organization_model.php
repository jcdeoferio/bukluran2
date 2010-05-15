<?php

class Organization_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organization($organizationid){
		$this->db->from('organizations o');
		$this->db->join('orgprofiles p','o.organizationid = p.organizationid');
		$this->db->join('(SELECT orgcategoryid, description AS categorydesc FROM orgcategories) cat','cat.orgcategoryid = p.orgcategoryid');
		$this->db->join('(SELECT orgstatusid, description AS statusdesc FROM orgstatuses) stat','stat.orgstatusid = p.orgstatusid');
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
}
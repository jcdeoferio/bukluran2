<?php

class Osa_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	/*
	function get_organizations(){
		$this->db->from('organizations o');
		$this->db->join('loginaccounts l', 'o.loginaccountid = l.loginaccountid', 'right');
		$this->db->where('groupid', ORG_GROUPID);
		$this->db->order_by('orgname');
		$this->db->order_by('username');
		
		$query = $this->db->get();
		return($query->result_array());
	}
	*/
	function is_unique_orgusername($username){
		$this->db->from('loginaccounts');
		$this->db->where('username', $username);
		
		return($this->db->count_all_results() == 0);
	}
	
	function create_organization($orgname, $username){
		$this->db->trans_start();
		
		$password = $this->generate_password();
		
		$this->db->set('groupid', ORG_GROUPID);
		$this->db->set('username', $username);
		$this->db->set('password', md5($password));
		$this->db->insert('loginaccounts');
		
		$this->db->select('loginaccountid');
		$this->db->from('loginaccounts');
		$this->db->where('username', $username);
		$query = $this->db->get();
		$loginaccount = $query->row_array();
		
		$loginaccountid = $loginaccount['loginaccountid'];
		
		$this->db->set('loginaccountid', $loginaccountid);
		$this->db->set('orgname', $orgname);
		$this->db->insert('organizations');
		
		$this->db->from('organizations');
		$this->db->where('loginaccountid', $loginaccountid);
		$this->db->where('orgname', $orgname);
		$query = $this->db->get();
		$org = $query->row_array();
		
		$this->db->trans_complete();
		
		return(array('password'=>$password,'organizationid'=>$org['organizationid']));
	}
	
	function create_organization_profile($organizationid, $aysem){
		$this->db->set('organizationid',$organizationid);
		$this->db->set('appsemid',$aysem);
		$this->db->set('orgstatusid',1);
		$this->db->set('orgcategoryid',1);
		$this->db->insert('orgprofiles');
	}
	
	function reset_organization_password($username){
		$password = $this->generate_password();
		
		$this->db->set('password', md5($password));
		$this->db->where('username', $username);
		$this->db->update('loginaccounts');
		
		return($password);
	}
	
	function generate_password($length = 8){
		$validchars = "0123456789abcdfghjkmnpqrstvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

		$password  = "";
		$counter   = 0;

		while ($counter < $length) {
			$randdex = rand(0, strlen($validchars)-1);
			$randchar = substr($validchars, $randdex, 1);

			// All character must be different
			if (!strstr($password, $randchar)) {
				$password .= $randchar;
				$counter++;
			}
		}

		return $password;
	}
	
	function requirements_appsem($appsemid){
		$this->db->select('requirementid, name, description');
		$this->db->from('requirements');
		$this->db->where('appsemid', $appsemid);
		$this->db->order_by('name');
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function get_requirement($requirementid){
		$this->db->select('requirementid, appsemid, name, description');
		$this->db->from('requirements');
		$this->db->where('requirementid', $requirementid);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function add_req($appsemid, $name, $description){
		$this->db->set('appsemid', $appsemid);
		$this->db->set('name', $name);
		$this->db->set('description', $description);
		$this->db->set('insertedby', $this->session->loginaccountid());
		$this->db->insert('requirements');
	}
	
	function edit_req($requirementid, $name, $description){
		if(!is_null($name))
			$this->db->set('name', $name);
			
		$this->db->set('description', $description);
		$this->db->set('updatedon', 'now()', FALSE);
		$this->db->set('updatedby', $this->session->loginaccountid());
		$this->db->update('requirements');
	}
	
	function is_unique_req_name($name){
		$this->db->from('requirements');
		$this->db->where('name', $name);
		
		return($this->db->count_all_results() == 0);
	}
	
}


<?php

class Osa_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_organizations($limit = 20, $offset = 0){
		$this->db->from('organizations o');
		$this->db->join('loginaccounts l', 'o.loginaccountid = l.loginaccountid', 'right');
		$this->db->where('groupid', ORG_GROUPID);
		$this->db->order_by('orgname');
		$this->db->order_by('username');
		$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		return($query->result_array());
	}
	
	function is_unique_orgusername($username){
		$this->db->from('loginaccounts');
		$this->db->where('username', $username);
		
		return($this->db->count_all_results() == 0);
	}
	
	function create_organization_account($username){
		$password = $this->generate_password();
		
		$this->db->set('groupid', ORG_GROUPID);
		$this->db->set('username', $username);
		$this->db->set('password', md5($password));
		$this->db->insert('loginaccounts');
		
		return($password);
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
	
}


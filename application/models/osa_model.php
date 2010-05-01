<?php

class Osa_model extends Model{

	public function __construct(){
		parent::__construct();
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
	
	function reset_organization_password($loginaccountid){
		$password = $this->generate_password();
		
		$this->db->set('password', $md5($password));
		$this->db->where('loginaccountid', $loginaccountid);
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


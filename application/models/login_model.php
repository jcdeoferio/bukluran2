<?php

class Login_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function authenticate_login($username, $password){
		$this->db->from('loginaccounts l');
		$this->db->join('groups g', 'l.groupid = g.groupid');
		$this->db->where('username', $username);
		$this->db->where('password', md5($password));
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
}


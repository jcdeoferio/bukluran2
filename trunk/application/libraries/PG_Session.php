<?php

class PG_Session extends CI_Session{
	
	function __construct(){
		parent::__construct();
	}
	
	function logged_in(){
		return($this->userdata(USER) !== FALSE);
	}
	
	function username(){
		if($this->userdata(USER)){
			$user = $this->userdata(USER);
			return($user['username']);
		}
		else
			return('guest');
	}
}

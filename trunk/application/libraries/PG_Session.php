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
	
	function validation_errors(){
		if($this->userdata(VALERR)){
			$validation_errors = $this->userdata(VALERR);
			$this->unset_userdata(VALERR);
			return($validation_errors);
		}
		else
			return(validation_errors());
	}
}

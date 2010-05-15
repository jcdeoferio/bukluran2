<?php

class PG_Session extends CI_Session{
	
	function __construct(){
		parent::__construct();
	}
	
	function logged_in(){
		return($this->userdata(USER) !== FALSE);
	}
	
	function user_group_is($groupid){
		if(!$this->logged_in())
			return(FALSE);
		
		$user = $this->userdata(USER);
		return($user['groupid'] == $groupid);
	}
	
	function username(){
		if($this->userdata(USER)){
			$user = $this->userdata(USER);
			return($user['username']);
		}
		else
			return('guest');
	}
	
	function save_validation_errors(){
		$this->set_userdata(VALERR, validation_errors());
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

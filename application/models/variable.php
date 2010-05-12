<?php

define('VARTAB', 'variables');
define('APP_IS_OPEN', 'appisopen');
define('CURRENT_APP_AYSEM', 'curappaysem');

class Variable extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	private function set($varname, $value){
		$this->db->set('value', $value);
		
		if($this->var_has_entry($varname)){
			$this->db->where('varname', $varname);
			$this->db->update(VARTAB);
		}
		else{
			$this->db->set('varname', $varname);
			$this->db->insert(VARTAB);
		}
	}
	
	private function get($varname){
		if(!$this->var_has_entry($varname))
			return(NULL);
		
		$this->db->select('value');
		$this->db->from(VARTAB);
		$this->db->where('varname', $varname);
		
		$query = $this->db->get();
		$result = $query->row_array();
		
		return($result['value']);
	}
	
	private function var_has_entry($varname){
		$this->db->where('varname', $varname);
		return($this->db->count_all_results(VARTAB) > 0);
	}
	
	function app_is_open(){
		$app_open_state = $this->get(APP_IS_OPEN);
		
		if(is_null($app_open_state))
			log_message('error', 'Illegal state: no APP_IS_OPEN variable entry in variables table');
		
		return($app_open_state);
	}
	
	function set_app_open_state($openness){
		if(!is_bool($openness))
			throw new Exception("Illegal argument type: {$openness}");
		
		$this->set(APP_IS_OPEN, $openness);
	}
	
	function current_application_aysem(){
		$current_app_aysem = $this->get(CURRENT_APP_AYSEM);
		
		if(is_null($current_app_aysem))
			log_message('error', 'Illegal state: no CURRENT_APP_AYSEM variable entry in variables table');
		
		return($current_app_aysem);
	}
	
	function pretty_current_application_aysem(){
		$pretty_sem = $this->pretty_current_sem();
		$pretty_acadyear = $this->pretty_current_acadyear();
		
		$pretty_app_aysem = "{$pretty_sem} {$pretty_acadyear}";
		return($pretty_app_aysem);
	}
	
	function current_sem(){
		$current_app_aysem = $this->current_application_aysem();
		
		$sem = substr($current_app_aysem, 4, 1);
		
		return($sem);
	}
	
	function pretty_current_sem(){
		$sem = $this->current_sem();
		$pretty_sem = NULL;
		switch($sem){
			case 1:
				$pretty_sem = '1st Semester';
				break;
			case 2:
				$pretty_sem = '2nd Semester';
				break;
			case 3:
				$pretty_sem = 'Summer';
				break;
			default:
				log_message('error', 'Illegal value for sem in CURRENT_APP_AYSEM');
		}
		
		return($pretty_sem);
	}
	
	function current_acadyear(){
		$current_app_aysem = $this->current_application_aysem();
		
		$acadyear = substr($current_app_aysem, 0, 4);
		
		return($acadyear);
	}
	
	function pretty_current_acadyear(){		
		$acadyear = $this->current_acadyear();
		$pretty_acadyear = "academic year {$acadyear}";
		
		return($pretty_acadyear);
	}
	
	function set_current_aysem($aysem){
		if(!$this->is_legal_aysem($aysem))
			throw new UnexpectedValueException("Illegal aysem format: '{$aysem}'"); //Change to better exception
		
		$this->set(CURRENT_APP_AYSEM, $aysem);
	}
	
	private function is_legal_aysem($aysem){
		return(preg_match('/^\d+[123]$/', $aysem));
	}

}

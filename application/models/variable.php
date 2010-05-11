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
		return($this->get(APP_IS_OPEN));
	}
	
	function set_app_open_state($openness){
		if(!is_bool($openness))
			throw new Exception("Illegal argument type: {$openness}");
		
		$this->set(APP_IS_OPEN, $openness);
	}
	
	function current_application_aysem(){
		return($this->get(CURRENT_APP_AYSEM));
	}
	
	function set_current_aysem($aysem){
		if(!$this->is_legal_aysem($aysem))
			throw new Exception("Illegal aysem format: '{$aysem}'"); //Change to better exception
		
		$this->set(CURRENT_APP_AYSEM, $aysem);
	}
	
	private function is_legal_aysem($aysem){
		return(preg_match('/^\d{4}[123]$/', $aysem));
	}

}

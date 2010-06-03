<?php

class Orgregistration_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function form1($organizationid, $appsemid){
		$org = $this->get_profile($organizationid, $appsemid);
		
		return $org['acronym'] && $org['establisheddate'] &&
			$org['orgcategoryid'] && 
			(($org['secincorporated'] == 't' && $org['incorporationdate']) || 
			$org['secincorporated'] == 'f') &&
			$org['mailaddr'] && $org['orgemail'] &&
			$org['heademail'] && $org['orgdescription'];
	}
	
	function form1_advisers($organizationid, $appsemid){
		$this->db->from('orgadvisers');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$no_advisers = $this->db->count_all_results();
		
		$this->db->from('orgadvisers');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$this->db->where('confirmed','true');
		$no_confirmed = $this->db->count_all_results();
		
		return  $no_advisers > 0 && $no_confirmed > 0;
	}
	
	function form2($organizationid, $appsemid){
		if($this->is_new_profile($organizationid,$appsemid)){
			return true;
		}
		$org = $this->get_profile($organizationid, $appsemid);
		
		$this->db->from('orgcollections');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$collections = $this->db->count_all_results();
		
		$this->db->from('orgdisbursements');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$disbursements = $this->db->count_all_results();
		
		return $org['startingbalance'] > 0 && $collections > 0 && $disbursements;
	}
	
	function form3_members($organizationid, $appsemid){
		$this->db->from('orgmemberships');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$this->db->where('confirmed','true');
		$this->db->where('position', NULL);
		
		return $this->db->count_all_results() >= 15;
	}
	
	function form3_officers($organizationid, $appsemid){
		$this->db->from('orgmemberships');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$this->db->where('confirmed','true');
		$this->db->where('position IS NOT NULL', NULL, FALSE);
		
		return $this->db->count_all_results() >= 5;
	}
	
	function form5_eventreports($organizationid, $appsemid){
		if($this->is_new_profile($organizationid,$appsemid)){
			return true;
		}
		
		$categories = $this->get_eventcategories();
		
		$this->db->from('eventreports');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$reports = $this->db->get();
		$reports = $reports->result_array();
		
		foreach($reports as $report){
			if(count($categories) == 0)
				return true;
			unset($categories[$report['eventcategoryid']]);
		}
		
		return count($categories) == 0;
	}
	
	function form5_awards($organizationid, $appsemid){
		if($this->is_new_profile($organizationid,$appsemid)){
			return true;
		}
		
		$this->db->from('orgawards');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		
		return $this->db->count_all_results() > 0;
	}
	
	function form6($organizationid, $appsemid){
		$categories = $this->get_eventcategories();
		
		$this->db->from('plannedevents');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$events = $this->db->get();
		$events = $events->result_array();
		
		foreach($events as $event){
			if(count($categories) == 0)
				return true;
			unset($categories[$event['eventcategoryid']]);
		}
		
		return count($categories) == 0;
	}
	
	function form7($organizationid, $appsemid){
		$org = $this->get_profile($organizationid, $appsemid);
		
		return $org['acknowledged'] == 't';
	}
	
	function requirements($organizationid, $appsemid){
		//select * from requirements r where requirementid not in (select requirementid from orgsubmittedrequirements where organizationid = 1) and appsemid = 20093;
		$this->db->from('requirements r');
		$this->db->where('requirementid not in',"(select requirementid from orgsubmittedrequirements where organizationid = {$organizationid})",false);
		$this->db->where('appsemid',$appsemid);
		
		return $this->db->count_all_results() == 0;
	}
	
	private function get_profile($organizationid, $appsemid){
		$this->db->from('orgprofiles');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid',$appsemid);
		$query = $this->db->get();
		return $query->row_array();
	}
	
	private function is_new_profile($organizationid,$appsemid){
		$this->db->from('orgprofiles');
		$this->db->where('organizationid',$organizationid);
		$this->db->where('appsemid <=',$appsemid);
		return $this->db->count_all_results() == 1;
	}
	
	private function get_eventcategories(){
		$this->db->from('eventcategories');
		$query = $this->db->get();
		$rows = $query->result_array();
		
		foreach($rows as $row){
			$result[$row['eventcategoryid']] = $row['description'];
		}
		
		return $result;
	}
}
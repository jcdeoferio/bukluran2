<?php

class Award_model extends Model {
	function Awards_model() {
		parent::Model();
	}
	
	function get_awards($appsemid,$organizationid) {
		$this->db->where('appsemid', $appsemid);
		$this->db->where('organizationid', $organizationid);
		$this->db->orderby('awardclassificationid');
		$query = $this->db->get('orgawards');
		return ($query->result_array());		
	}
	
	function add_award($appsemid,$organizationid, $awarddetails) {
		$awarddetails['organizationid'] = $organizationid;
		$awarddetails['appsemid'] = $appsemid;
		$this->db->insert('orgawards', $awarddetails);
	}
	
	function get_awardclassifications() {
		$this->db->from('awardclassifications');
		$query = $this->db->get();
		return ($query->result_array());
	}
	
	function get_awardcategories() {
		
	}
}

//end of awards_model.php
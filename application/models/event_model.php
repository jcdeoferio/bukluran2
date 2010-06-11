<?php

class Event_model extends Model {

	public function __construct() {
		parent::Model();
	}

	function get_eventcategories() {
		$this->db->from('eventcategories');
		$query = $this->db->get();
		return ($query->result_array());
	}

	function get_plannedevents($appsemid,$organizationid,$eventcategoryid) {
		$this->db->where(array('appsemid' => $appsemid, 'organizationid' => $organizationid, 'eventcategoryid' => $eventcategoryid));
		$this->db->order_by('eventdate asc');
		$query = $this->db->get('plannedevents');
		return ($query->result_array());
	}

	function add_plannedevent($appsemid,$organizationid,$eventdetails) {
		$eventdetails['organizationid'] = $organizationid;
		$eventdetails['appsemid'] = $appsemid;
		$this->db->insert('plannedevents',$eventdetails);
	}

	function get_eventreports($appsemid,$organizationid, $eventcategoryid) {
		$this->db->where(array('appsemid' => $appsemid, 'organizationid' => $organizationid,'eventcategoryid' => $eventcategoryid));
		$this->db->order_by('eventdate asc');
		$query = $this->db->get('eventreports');
		return ($query->result_array());
	}

	function add_eventreport($appsemid,$organizationid,$eventdetails) {
		$eventdetails['organizationid'] = $organizationid;
		$eventdetails['appsemid'] = $appsemid;
		$this->db->insert('eventreports',$eventdetails);
	}
}
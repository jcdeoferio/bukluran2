<?php

class Announcement_model extends Model{

	public function __construct(){
		parent::__construct();
	}
	
	function get_announcement($announcementid){
		$this->db->from('announcements a');
		$this->db->join('loginaccounts l','a.loginaccountid = l.loginaccountid');
		$this->db->where('a.announcementid', $announcementid);
		
		$query = $this->db->get();
		return($query->row_array());
	}
	
	function get_announcements($limit = 20, $offset = 0){
		$this->db->from('announcements a');
		$this->db->join('loginaccounts l','a.loginaccountid = l.loginaccountid');
		$this->db->order_by('date_modified','desc');
		$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		return($query->result_array());
	}
}
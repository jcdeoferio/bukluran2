<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');class Emailer {	function Emailer()	{		$this->CI =& get_instance();		$this->CI->load->library('email');		//$config['protocol'] = 'sendmail';		//$this->CI->email->initialize($config);	}    function send_email($email, $subject, $message)    {			$this->CI->email->from('up.bukluran@gmail.com', 'UPD OSA Bukluran');		$this->CI->email->to($email);		$this->CI->email->subject($subject);				$this->CI->email->message($message);		$this->CI->email->send();		echo $this->CI->email->print_debugger();    }}
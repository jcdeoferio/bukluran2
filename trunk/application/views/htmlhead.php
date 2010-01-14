<?php 
	$this->load->helper('html');
	$this->load->helper('url');
	$this->load->helper('form');
?>

<html>
<head>
	<title>Bukluran 2.0</title>
	<link  href="images/favicon.png" rel="shortcut icon" type="image/ico" />
	<?php echo link_tag('layout/css/blueprint/screen.css');?>
	<?php echo link_tag('layout/css/blueprint/print.css');?>
	<?php echo link_tag('layout/css/style.css');?>
	<!--[if lt IE 8]><?php echo link_tag('layout/css/blueprint/ie.css');?><![endif]-->


<!--sliding login panel-->
	<!-- stylesheets -->
	<?php echo link_tag('layout/css/loginpanel/style.css');?>
	<?php echo link_tag('layout/css/loginpanel/slide.css');?>
  	<!-- PNG FIX for IE6 -->
  	<!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script src="<?php echo base_url().'layout/js/loginpanel/pngfix/supersleight-min.js';?>" type="text/javascript"></script>
	<![endif]-->
	 
    <!-- jQuery - the core -->
	<script src="<?php echo base_url().'layout/js/loginpanel/jquery-1.3.2.min.js';?>" type="text/javascript"></script>
	<!-- Sliding effect -->
	<script src="<?php echo base_url().'layout/js/loginpanel/slide.js';?>" type="text/javascript"></script>
<!--sliding login panel-->
</head>
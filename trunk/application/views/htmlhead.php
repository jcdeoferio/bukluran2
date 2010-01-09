<?php 
	$this->load->helper('html');
	$this->load->helper('url');
?>

<html>
<head>
	<title>Bukluran 2.0</title>
	<link  href="images/favicon.png" rel="shortcut icon" type="image/ico" />
	<?php echo link_tag('layout/css/blueprint/screen.css');?>
	<?php echo link_tag('layout/css/blueprint/print.css');?>
	<?php echo link_tag('layout/css/style.css');?>
<!--
	<link rel="stylesheet" href="css/blueprint/screen.css" type="text/css" media="screen, projection">
	<link rel="stylesheet" href="css/blueprint/print.css" type="text/css" media="print">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection">
-->
	<!--[if lt IE 8]><link rel="stylesheet" href="css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->


<!--sliding login panel-->
	<!-- stylesheets -->
	<?php echo link_tag('layout/css/loginpanel/style.css');?>
	<?php echo link_tag('layout/css/loginpanel/slide.css');?>
<!--	
  	<link rel="stylesheet" href="css/loginpanel/style.css" type="text/css" media="screen" />
  	<link rel="stylesheet" href="css/loginpanel/slide.css" type="text/css" media="screen" />
-->	
  	<!-- PNG FIX for IE6 -->
  	<!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script type="text/javascript" src="js/loginpanel/pngfix/supersleight-min.js"></script>
	<![endif]-->
	 
    <!-- jQuery - the core -->
	<script src="<?php echo base_url().'layout/js/loginpanel/jquery-1.3.2.min.js';?>" type="text/javascript"></script>
	<!-- Sliding effect -->
	<script src="<?php echo base_url().'layout/js/loginpanel/slide.js';?>" type="text/javascript"></script>
<!--sliding login panel-->
</head>
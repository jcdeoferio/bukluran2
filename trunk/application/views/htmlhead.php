<?php 
	$this->load->helper('html');
	$this->load->helper('url');
	$this->load->helper('form');
?>
<html>
<head>
	<title>Bukluran 2.0</title>
	<?php echo link_tag(array('href'=>'layout/images/favicon.png','rel'=>'shortcut icon','type'=>'image/ico'))."\n";?>
	<?php echo link_tag(array('href'=>'layout/css/blueprint/screen.css','rel'=>'stylesheet','type'=>'text/css','media'=>'screen, projection'))."\n";?>
	<?php echo link_tag(array('href'=>'layout/css/blueprint/print.css','rel'=>'stylesheet','type'=>'text/css','media'=>'print'))."\n";?>
	<?php echo link_tag(array('href'=>'layout/css/style.css','rel'=>'stylesheet','type'=>'text/css','media'=>'screen, projection'))."\n";?>
	<!--[if lt IE 8]><?php echo link_tag(array('rel'=>'stylesheet','href'=>'layout/css/blueprint/ie.css','type'=>'text/css','media'=>'screen, projection'));?><![endif]-->
<!--sliding login panel-->
	<!-- stylesheets -->
	<?php echo link_tag(array('rel'=>'stylesheet','href'=>'layout/css/loginpanel/style.css','type'=>'text/css','media'=>'screen'))."\n";?>
	<?php echo link_tag(array('rel'=>'stylesheet','href'=>'layout/css/loginpanel/slide.css','type'=>'text/css','media'=>'screen'))."\n";?>

  	<!-- PNG FIX for IE6 http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script src="<?php echo base_url().'layout/js/loginpanel/pngfix/supersleight-min.js';?>" type="text/javascript"></script>
	<![endif]-->
	 
    <!-- jQuery - the core -->
	<script src="<?php echo base_url().'layout/js/loginpanel/jquery-1.3.2.min.js';?>" type="text/javascript"></script>
	<!-- Sliding effect -->
	<script src="<?php echo base_url().'layout/js/loginpanel/slide.js';?>" type="text/javascript"></script>
<!-- / sliding login panel-->
</head>

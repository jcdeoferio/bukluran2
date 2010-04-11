<?php 
	$this->load->helper('html');
	$this->load->helper('url');
	$this->load->helper('form');
	$this->load->library('pagination');
?>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=7" /> <!--meta data to force IE8 to render in IE8 Mode. Otherwise it will render in IE6 mode-->
	<title><?php if(isset($title)) echo $title.' - '; ?>Bukluran 2.0</title>
	<?php //href, with optional rel, type, title, media and index_page. index_page is a TRUE/FALSE value that specifics if the href should have the page specified by $config['index_page'] added to the address it creates. ?>
	<?= link_tag('layout/images/favicon.png','shortcut icon','image/ico')."\n";?>
	<?= link_tag('layout/css/blueprint/screen.css','stylesheet','text/css','','screen, projection')."\n";?>
	<?= link_tag('layout/css/blueprint/print.css','stylesheet','text/css','','print')."\n";?>
	<?= link_tag('layout/css/style.css','stylesheet','text/css','','screen, projection')."\n";?>
	<!--[if lt IE 8]><?= link_tag('layout/css/blueprint/ie.css','stylesheet','text/css','','screen, projection');?><![endif]-->
<!--page specific stylesheets-->
	<?php if(isset($stylesheets)):?>
		<?php foreach ($stylesheets as $stylesheet):?>
			<?= link_tag('layout/css/'.$stylesheet,'stylesheet','text/css','','screen, projection')."\n";?>
		<?php endforeach;?>
	<?php endif;?>
<!--/page specific stylesheets-->		
<!-- sliding login panel http://web-kreation.com/demos/Sliding_login_panel_jquery/ -->
	<!-- stylesheets -->
	<?= link_tag('layout/css/loginpanel/style.css','stylesheet','text/css','','screen')."\n";?>
	<?= link_tag('layout/css/loginpanel/slide.css','stylesheet','text/css','','screen')."\n";?>

  	<!-- PNG FIX for IE6 http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script src="<?= base_url().'layout/js/loginpanel/pngfix/supersleight-min.js';?>" type="text/javascript"></script>
	<![endif]-->
	 
    <!-- jQuery - the core -->
	<script src="<?= base_url().'layout/js/jquery-1.4.2.min.js';?>" type="text/javascript"></script>
	<!-- Sliding effect -->
	<script src="<?= base_url().'layout/js/loginpanel/slide.js';?>" type="text/javascript"></script>
<!-- /sliding login panel -->
</head>

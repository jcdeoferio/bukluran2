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
	<?= link_tag('layout/css/bluesorter/style.css','stylesheet','text/css','','print')."\n";?>
	<?= link_tag('layout/css/blueprint/screen.css','stylesheet','text/css','','screen, projection')."\n";?>
	<?= link_tag('layout/css/blueprint/print.css','stylesheet','text/css','','print')."\n";?>
	<?= link_tag('layout/css/print.css','stylesheet','text/css','','print')."\n";?>
	<!--[if lt IE 8]><?= link_tag('layout/css/blueprint/ie.css','stylesheet','text/css','','screen, projection');?><![endif]-->
	<?= link_tag('layout/css/style.css','stylesheet','text/css','','screen, projection')."\n";?>
<!--page specific stylesheets-->
	<?php if(isset($stylesheets)):?>
		<?php foreach ($stylesheets as $stylesheet):?>
			<?= link_tag('layout/css/'.$stylesheet,'stylesheet','text/css','','screen, projection')."\n";?>
		<?php endforeach;?>
	<?php endif;?>
<!--/end page specific stylesheets-->
	<script type="text/javascript">
		var base_url = "<?=base_url()?>"
		var site_url = "<?=site_url()?>"
	</script>
    <!-- jQuery - the core -->
	<script src="<?= base_url().'layout/js/jquery-1.4.2.min.js' ?>" type="text/javascript"></script>
	<!-- jQuery UI -->
	<script src="<?= base_url().'layout/js/jquery-ui-1.8.custom.min.js' ?>" type="text/javascript"></script>
	<!-- jQuery Tablesorter 2.0 Plug-in -->
	<script src="<?= base_url().'layout/js/jquery.tablesorter.min.js' ?>" type="text/javascript"></script>
	<!-- jQuery UI Blitzer Theme -->
	<?= link_tag('layout/css/blitzer/jquery-ui-1.8.custom.css','stylesheet','text/css','','screen')."\n";?>
	
<!-- jReject Script http://jreject.turnwheel.com/ -->
	<script src="<?= base_url().'layout/js/jReject/jquery.reject.js';?>"></script>
	<script>
	window.onload=function(){$.reject({
	/*
	reject: {
		safari: true, // Apple Safari
		chrome: true, // Google Chrome
		firefox: true, // Mozilla Firefox
		msie: true, // Microsoft Internet Explorer
		opera: true, // Opera
		konqueror: true, // Konqueror (Linux)
		unknown: true // Everything else
	},
	*/
	imagePath: '<?= base_url().'layout/images/browsers/';?>',
	afterReject: function(){$('div#toppanel').hide();},
	afterClose: function(){$('div#toppanel').fadeIn();},
	});return false;}
	</script>
<!--/end jReject Script -->
	
<!-- sliding login panel http://web-kreation.com/demos/Sliding_login_panel_jquery/ -->
	<!-- stylesheets -->
	<?= link_tag('layout/css/loginpanel/style.css','stylesheet','text/css','','screen')."\n";?>
	<?= link_tag('layout/css/loginpanel/slide.css','stylesheet','text/css','','screen')."\n";?>

  	<!-- PNG FIX for IE6 http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script src="<?= base_url().'layout/js/loginpanel/pngfix/supersleight-min.js';?>" type="text/javascript"></script>
	<![endif]-->
	<!-- Sliding effect -->
	<script src="<?= base_url().'layout/js/loginpanel/slide.js';?>" type="text/javascript"></script>
<!--/end sliding login panel -->
	<script src="<?= base_url().'layout/js/startup.js';?>" type="text/javascript"></script>
	<?php if(isset($other)) echo $other;?>
</head>

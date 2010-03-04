<body>
<!-- jReject Script http://jreject.turnwheel.com/ -->
<script src="<?php echo base_url().'layout/js/jReject/jquery.reject.js';?>"></script>
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
imagePath: '<?php echo base_url().'layout/images/browsers/';?>'
});return false;}
</script>
<!-- /jReject Script -->
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
			<div class="left">
				<h1>Welcome to Bukluran</h1>
				<p class="grey">Online registration system for organizations of University of the Philippines Diliman</p>
				<?php echo br(13)."\n";?>
			</div>
			<div class="left">
				<h3>For Students:</h3>
				<p class="grey">use your UP Webmail account for logging in</p>
				<h3>For Organizations:</h3>
				<p class="grey">use the account details provided by OSA</p>
				<?php echo br(10)."\n";?>
			</div>
			<div class="left right">
				<?php echo form_open('login/',array('class'=>'clearfix'))."\n";?>
					<h1>Login</h1>
					<?php echo form_label('Username:','log',array('class'=>'grey'))."\n"; ?>
					<?php echo form_input(array('class'=>'field','type'=>'text','name'=>'log','id'=>'log','value'=>'','size'=>'23'))."\n";?>
					<?php echo form_label('Password:','pwd',array('class'=>'grey'))."\n"; ?>
					<?php echo form_input(array('class'=>'field','type'=>'password','name'=>'pwd','id'=>'pwd','size'=>'23'))."\n";?>
					<?php echo form_label(form_input(array('type'=>'checkbox','name'=>'rememberme','id'=>'rememberme','checked'=>'checked','value'=>'forever')).' &nbsp;Remember me')."\n";?>
					<div class="clear"></div>
					<?php echo form_submit('submit','Login','class="bt_login"')."\n";?>
					<a class="lost-pwd" href="#">Lost your password?</a>
				<?php echo form_close()."\n";?>
			</div>
		</div>
	</div>
	<div class="tab">
		<ul class="login">
	    	<li class="left">&nbsp;</li>
	        <li>Hello Guest!</li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#">Log In</a>
				<a id="close" style="display: none;" class="close" href="#">Close Panel</a>			
			</li>
	    	<li class="right">&nbsp;</li>
		</ul> 
	</div>
</div> 
<!-- / Panel -->

<div id="headerWrapper">
<div class="container">
<div class="span-24 last" id="header">
<?php echo img('layout/images/header.png');?>
</div>
</div>
</div>

<div id="topnavWrapper">
<div class="container">
<div class="span-24 last" id="topnav">
<a href="#">announcements</a> | <a href="#">organizations list</a> | <a href="#">contact us</a>
</div>
</div>
</div>

<body>
<!--
<div id="jr_reject"><div id="jr_overlay" style="width: 100%; height: 100%; position: absolute; top: 0px; left: 0px; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(0, 0, 0); z-index: 200; opacity: 0.8; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-position: initial initial; background-repeat: initial initial; "></div><div id="jr_wrap" style="position: absolute; width: 100%; top: 99.25px; left: 0px; z-index: 300; text-align: center; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><div id="jr_inner" style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); font-family: 'Lucida Grande', 'Lucida Sans Unicode', Arial, Verdana, sans-serif; color: rgb(79, 79, 79); margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto; position: relative; height: auto; min-width: 500px; max-width: 700px; width: auto; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px; font-size: 12px; background-position: initial initial; background-repeat: initial initial; "><h1 id="jr_header" style="display: block; font-size: 1.3em; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-weight: bold; text-align: left; padding-top: 5px; padding-right: 5px; padding-bottom: 5px; padding-left: 5px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">This Application Requires JavaScript to be enabled</h1><p style="text-align: left; padding-top: 5px; padding-right: 5px; padding-bottom: 5px; padding-left: 5px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">please enable JavaScript to continue.</p></div></div></div>
-->
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
			<div class="left">
				<h1>Welcome to Bukluran</h1>
				<p class="grey">Online registration system for organizations of University of the Philippines Diliman</p>
				<?= br(13)."\n";?>
			</div>
			<div class="left">
				<h3>For Students:</h3>
				<p class="grey">use your UP Webmail account for logging in</p>
				<h3>For Organizations:</h3>
				<p class="grey">use the account details provided by OSA</p>
				<?= br(10)."\n";?>
			</div>
			<div class="left right">
				<?= form_open('login/',array('class'=>'clearfix'))."\n";?>
					<h1>Login</h1>
					<?= form_label('Username:','username',array('class'=>'grey'))."\n"; ?>
					<?= form_input(array('class'=>'field','type'=>'text','name'=>'username','id'=>'username','value'=>'','size'=>'23'))."\n";?>
					<?= form_label('Password:','password',array('class'=>'grey'))."\n"; ?>
					<?= form_input(array('class'=>'field','type'=>'password','name'=>'password','id'=>'password','size'=>'23'))."\n";?>
					<?= form_label(form_input(array('type'=>'checkbox','name'=>'rememberme','id'=>'rememberme','checked'=>'checked','value'=>'forever')).' &nbsp;Remember me')."\n";?>
					<div class="clear"></div>
					<?= form_submit('submit','Login','class="bt_login"')."\n";?>
					<a class="lost-pwd" href="#">Lost your password?</a>
				<?= form_close()."\n";?>
			</div>
		</div>
	</div>
	<div class="tab">
		<ul class="login">
	    	<li class="left">&nbsp;</li>
	        <li>Hello Guest!</li> <!--should change to "Hello username! | Logout"  when the user is logged in-->
			<li class="sep">|</li>
			<li id="toggle">
				<?= anchor('login','Log In','id="open" class="open"')?>
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
<?= anchor('main', img('layout/images/header.png')); ?>
</div>
</div>
</div>

<div id="topnavWrapper">
<div class="container">
<div class="span-24 last" id="topnav">
<?= anchor('main/announcements','announcements');?> | <?= anchor('main/organizations','organizations list');?> | <?= anchor('main/contact','contact us');?>
</div>
</div>
</div>

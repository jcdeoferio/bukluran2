<body>
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

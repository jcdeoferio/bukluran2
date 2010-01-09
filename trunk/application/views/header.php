<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
			<div class="left">
				<h1>Welcome to Bukluran</h1>
				<p class="grey">Online registration system for organizations of University of the Philippines Diliman</p>
			</div>
			<div class="left">
				<h3>For Students:</h3>
				<p class="grey">use your UP Webmail account for logging in</p>
				<h3>For Organizations:</h3
				<p class="grey">use the account details provided by OSA</p>
			</div>
			<div class="left right">
				<!-- Login Form -->
				<form class="clearfix" action="#" method="post">
					<h1>Login</h1>
					<label class="grey" for="log">Username:</label>
					<input class="field" type="text" name="log" id="log" value="" size="23" />
					<label class="grey" for="pwd">Password:</label>
					<input class="field" type="password" name="pwd" id="pwd" size="23" />
	            	<label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;Remember me</label>
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Login" class="bt_login" />
					<a class="lost-pwd" href="#">Lost your password?</a>
				</form>
			</div>
			
		</div>
	</div> <!-- /login -->	

    <!-- The tab on top -->	
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
	</div> <!-- / top -->
	
</div> 
<!--panel -->

<div id="header">
<div class="container">
<div class="span-24 last">
<?php echo img('layout/images/header.png');?>
</div>
<!--
<div class="clear prepend-14 span-12 last header-footer-text">
</br></br>
online registration system for student organizations of UP Diliman
</div>
-->
</div>
</div>
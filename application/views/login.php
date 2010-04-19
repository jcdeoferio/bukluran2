<div class="span-5">&nbsp;</div>
<div class="span-14" id="content">
	<div class="contentHeader_text middle">
		
	</div>
		<?= form_open('login/')."\n";?>
			<?= form_label('Username:','username').br(1)."\n"; ?>
			<?= form_input(array('class'=>'loginPage_bigText','type'=>'text','name'=>'username','id'=>'username','value'=>'','size'=>'23')).br(1)."\n";?>
			<?= form_label('Password:','password').br(1)."\n"; ?>
			<?= form_input(array('class'=>'loginPage_bigText','type'=>'password','name'=>'password','id'=>'password','size'=>'23')).br(1)."\n";?>
			<?= form_label(form_input(array('type'=>'checkbox','name'=>'rememberme','id'=>'rememberme','checked'=>'checked','value'=>'forever')).' &nbsp;Remember me').br(1)."\n";?>
			<div class="clear"></div>
			<?= form_submit('submit','Log in','class="loginPage_bigButton"')."\n";?>
			<a class="loginPage_lostpass" href="#">Lost your password?</a>
		<?= form_close()."\n";?>
</div>
<div class="span-5 last">&nbsp;</div>
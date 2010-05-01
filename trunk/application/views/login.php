<div class="span-14 prepend-5 append-5" id="content">
	<div class="contentHeader_text middle">
		Login
	</div>
		<?= validation_errors(); ?>
		<?= form_open('login/',array('class'=>'loginpage_form'))."\n";?>
			<span class="text_input">
			<?= form_label('username','loginpage_form_username').br(1)."\n"; ?>
			<?= form_input(array('type'=>'text','name'=>'username','id'=>'loginpage_form_username','value'=>set_value('username'),'size'=>'23')).br(1)."\n";?>
			</span>
			
			<span class="text_input">
			<?= form_label('password','loginpage_form_password').br(1)."\n"; ?>
			<?= form_input(array('type'=>'password','name'=>'password','id'=>'loginpage_form_password','size'=>'23')).br(1)."\n";?>
			</span>
			
			<span class="checkbox">
			<?= form_label('remember me','loginpage_form_rememberme')."\n"; ?>
			<?= form_input(array('type'=>'checkbox','name'=>'rememberme','id'=>'loginpage_form_rememberme','value'=>'forever')).br(1)."\n";?>
			</span>
			
			<span class="submit">
			<?= form_submit('submit','Log in')."\n";?>
			</span>
			<span class="lost_password">
			<?=anchor('login/lost_pass','Lost your password?');?>
			</span>
		<?= form_close()."\n";?>
		
</form>

<script type="text/javascript">
	$('.loginpage_form .submit input').button();
	$('.loginpage_form .checkbox input').button();
</script>

</div>
<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Create Organization
	</div>
<?php $this->load->helper('form');?>
<?=form_open('osa/create_organization');?>
<?=form_label('Username:','org_username');?>
<?=form_input('org_username');?>
<?=form_label('Password:','org_password');?>
<?=form_password('org_password');?>
<?=form_submit('submit','Submit');?>
<?=form_close();?>
</div>

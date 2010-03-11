<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Create Announcement
	</div>
<?php $this->load->helper('form');?>
<?=form_open('osa/create_announcement');?>
<?=form_label('Title:','title');?>
<?=form_input('title');?>
<?=br(1);?>
<?=form_label('Content:','content');?>
<?=$this->fckeditor->Create();?>
<?=form_submit('submit','Submit');?>
<?=form_close();?>
</div>

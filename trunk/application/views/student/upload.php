<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Upload UP ID
	</div>
	<?if($message):?>
	<div class="ui-widget">
	<div class="ui-state-highlight ui-corner-all notification">
		<span class="ui-icon ui-icon-info notification-icon"></span> 
		<?=$message?>
	</div>
	</div>
	<?endif;?>
	
	<?if(isset($image)):?>
	Current Picture:<?=br(2)?>
	<?=img(array('src'=>'./uploads/'.$image['filepath'],'width'=>'100%'))?>
	<?endif;?>
	
	<?=form_open_multipart('student/do_upload');?>
	<?=form_upload('userfile','','class="text_input"');?>
	<?=form_submit('upload','Upload','class="submit_default" id="submit"');?>
	<?=form_close();?>
	
</div>

<script type="text/javascript">
	$('#submit').removeClass('submit_default').button();
</script>
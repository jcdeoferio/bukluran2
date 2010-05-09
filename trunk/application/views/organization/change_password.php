<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Change Password
	</div>
	<?if($message):?>
	<div class="ui-widget">
	<div class="ui-state-highlight ui-corner-all notification">
		<span class="ui-icon ui-icon-info notification-icon"></span> 
		<?=$message?>
	</div>
	</div>
	<?endif;?>
	
</div>

<script type="text/javascript">
	$('#submit').removeClass('submit_default').button();
</script>
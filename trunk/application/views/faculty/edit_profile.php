<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Edit Profile
	</div>
	<?if($messages):?>
	<?foreach($messages as $message):?>
	<div class="ui-widget">
	<div class="ui-state-highlight ui-corner-all notification">
		<span class="ui-icon ui-icon-info notification-icon"></span> 
		<?=$message?>
		<span class="ui-icon ui-icon-close notification-close" style="display:none;"></span> 
	</div>
	</div>
	<?endforeach;?>
	<?endif;?>
	
	
	
</div>
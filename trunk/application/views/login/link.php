<div class="span-14 prepend-5 append-5" id="content">
	<div class="contentHeader_text middle">
		Login for Students and Faculty
	</div>
		<? if(validation_errors()):?>
		<div class="ui-widget">
		<div class="ui-state-highlight ui-corner-all notification" title="Login Error">
			<span class="ui-icon ui-icon-info notification-icon"></span> 
			<?= validation_errors(); ?>
		</div>
		</div>
		<?endif?>
		<?= form_open('login/link_submit',array('class'=>'loginpage_form','method'=>'post'))."\n";?>
			<?= form_label('Code','loginpage_form_link',array('class'=>'label')).br(1)."\n"; ?>
			<?= form_input(array('type'=>'text','name'=>'link','id'=>'link','value'=>'','size'=>'23','class'=>'text_input')).br(1)."\n";?>
			<?= form_submit('submit','Login','class="submit_default" id="submit"')."\n";?>
		<?= form_close().br(2)."\n";?>
		
		For Organizations and OSA, click <?=anchor('login','here')?>.

<script type="text/javascript">
	$('.loginpage_form #submit').removeClass('submit_default').button();
</script>

</div>

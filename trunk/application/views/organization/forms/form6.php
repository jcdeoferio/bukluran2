<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Form 6
	</div>
	<?if($this->session->user_group_is(ORG_GROUPID) && !$this->Variable->app_is_open()):?>
		Registration is Currently Closed.
	<?else:?>
	
	<p>
	Currently viewing form 3 of organization <strong><?= $orgname ?></strong><br/>
	for application period <strong><?= $pretty_application_aysem ?></strong>
	</p>
	
	<? if($this->session->user_group_is(OSA_GROUPID) && count($appsems) > 1): ?>
	
	<?= form_open($change_appsem_submit_url) ?>
	View application form for different application period:
	<?= form_dropdown('appsem', $appsems, $appsemid) ?>
	<?= form_hidden('orgid',$orgid)?>
	<?= form_submit('submit', 'Go') ?>
	<?= form_close(); ?>
	
	<? endif; ?>
	
		<!--insert actual form here-->
	
	<? endif; ?>
</div>


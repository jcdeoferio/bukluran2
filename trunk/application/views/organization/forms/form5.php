<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Form 5
	</div>
	<?if($this->session->user_group_is(ORG_GROUPID) && !$this->Variable->app_is_open()):?>
		Registration is Currently Closed.
	<?else:?>
	
	<p>
	Currently viewing form 5 of organization <strong><?= $orgname ?></strong><br/>
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

	<h2>Accomplishment Report</h2>
	
	<!-- links -->

	<!-- report of activities -->

	<h2>Activities</h2>
	<?= anchor($add_event_url, 'Add An Event') ?>
	<?=br(2)?>
	<?foreach($eventcategories as $eventcategory):?>
		<h3><?=$eventcategory['description']?></h3>
		<? if(count($eventcategory['plannedevents']) > 0): ?>
			<?$this->table->set_heading('TITLE OF ACTIVITY','BRIEF DESCRIPTION OF ACTIVITY','VENUE','DATE');?>
			<?foreach ($eventcategory['plannedevents'] as $event): ?>
				<?$this->table->add_row($event['eventname'],$event['description'],$event['venue'],$event['eventdate'])?>
			<?endforeach;?>
			<?=$this->table->generate()?>
			<?$this->table->clear()?>
		<? else: ?>
			<p><?=nbs(5)?>There are no events listed.</p>
		<? endif;?>
		<hr/>
	<?endforeach;?>

	<!-- awards -->

	<h2>Awards/Citations Received</h2>
	<?= anchor($add_award_url, 'Add An Award') ?>
	<?=br(2)?>
	<? if (count($orgawards) > 0):?>
		<? $this->table->set_heading('AWARD CLASSIFICATION','AWARD/CITATION','DESCRIPTION','AWARD-GIVING BODY');?>	
		<? foreach($orgawards as $award):?>
			<?$this->table->add_row($awardclassifications[$award['awardclassificationid']],$award['awardname'],$award['description'],$award['giver'])?>
		<? endforeach;?>	
		<?=$this->table->generate()?>
		<?$this->table->clear()?>
	<? else :?>
		<p><?=nbs(5)?>There are no awards listed.</p>		
	<? endif;?>
	
	<? endif; ?>
</div>


<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Form 1 - Faculty Advisers
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
	<?= form_submit('submit', 'Go') ?>
	<?= form_close(); ?>
	
	<? endif; ?>
	
	
	<p>
	<h2>Faculty Advisers</h2>
	
	<? if(count($advisers) > 0): ?>
	
	<?= anchor($add_adviser_url, 'Add A Faculty Adviser') ?>
	
	<table class="tablesorter">
	<thead>
	<tr>
		<th>UP Webmail</th>
		<th>Email Address</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	</thead>
	<tbody>
	<? foreach($advisers as $adviser): ?>
		<tr>
			<td><?= $adviser['webmail'] ?></td>
			<td><?= $adviser['email'] ?></td>
			<td><?=$adviser['confirmed'] == 't'?'Confirmed':'Not Confirmed'?></td>
			<td>
				<?= anchor("organization/delete_adviser/{$adviser['facultyid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Delete')?>
				<?= anchor("organization/send_adviser_confirmation_email/{$adviser['facultyid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation')?>
			</td>
		</tr>
	<? endforeach; ?>
	</tbody>
	</table>
	<div id="pagination">
		<?=form_open()?>
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/first.png",'class'=>"first"))?>
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/prev.png",'class'=>"prev"))?>
			<?=form_input(array('class'=>'pagedisplay'))?>
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/next.png",'class'=>"next"))?> 
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/last.png",'class'=>"last"))?> 
			<?=form_dropdown('pagesize',array(
				10=>10,
				20=>20,
				30=>30,
				40=>40
			),'10','class="pagesize"')?>
		<?=form_close()?>
		Search: <input name="filter" id="filter-box" value="" maxlength="30" size="30" type="text"> <input id="filter-clear-button" type="submit" value="Clear"/>
	</div>
	
	<? else: ?>
	
	<p>No faculty advisers listed</p>
	
	<? endif; ?>
	
	<?= anchor($add_adviser_url, 'Add A Faculty Adviser') ?>
	</p>
	<?= anchor("organization/send_adviser_confirmation_emails".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation Emails')?>
	<?endif;?>
</div>

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
		<th>Action</th>
	</tr>
	</thead>
	<tbody>
	<? foreach($advisers as $adviser): ?>
		<tr>
			<td><?= $adviser['webmail'] ?></td>
			<td><?= $adviser['email'] ?></td>
			<td>
				<?= anchor("organization/delete_adviser/{$adviser['facultyid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Delete')?>
				<?= anchor("organization/send_adviser_confirmation_email/{$adviser['facultyid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation')?>
			</td>
		</tr>
	<? endforeach; ?>
	</tbody>
	</table>
	
	<? else: ?>
	
	<p>No faculty advisers listed</p>
	
	<? endif; ?>
	
	<?= anchor($add_adviser_url, 'Add A Faculty Adviser') ?>
	</p>
	<?= anchor("organization/send_adviser_confirmation_emails".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation Emails')?>
	<?endif;?>
</div>


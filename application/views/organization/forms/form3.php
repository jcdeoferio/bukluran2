<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Forms 3 and 4 - Officer and Member Roster
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
	<h2>Officer Roster</h2>
	
	<? if(count($officers) > 0): ?>
	
	<?= anchor($add_officer_url, 'Add An Officer') ?>
	
	<table class="tablesorter">
	<thead>
	<tr>
		<th>UP Webmail</th>
		<th>Email Address</th>
		<th>Position</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	</thead>
	<tbody>
	<? foreach($officers as $officer): ?>
		<tr>
			<td><?= $officer['webmail'] ?></td>
			<td><?= $officer['email'] ?></td>
			<td><?= $officer['position'] ?></td>
			<td><?=$officer['confirmed'] == 't'?'Confirmed':'Not Confirmed'?></td>
			<td>
				<?= anchor("organization/delete_member/{$officer['studentid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Delete')?>
				<?= anchor("organization/send_member_confirmation_email/{$officer['studentid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation')?>
			</td>
		</tr>
	<? endforeach; ?>
	</tbody>
	</table>
	
	<? else: ?>
	
	<p>No officers listed</p>
	
	<? endif; ?>
	
	<?= anchor($add_officer_url, 'Add An Officer') ?>
	</p>
	
	<p>
	<h2>Member Roster</h2>
	
	<? if(count($members) > 0): ?>
	
	<?= anchor($add_member_url, 'Add A Member') ?>
	
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
	<? foreach($members as $member): ?>
		<tr>
			<td><?= $member['webmail'] ?></td>
			<td><?= $member['email'] ?></td>
			<td><?=$member['confirmed'] == 't'?'Confirmed':'Not Confirmed'?></td>
			<td>
				<?= anchor("organization/delete_member/{$member['studentid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Delete')?>
				<?= anchor("organization/send_member_confirmation_email/{$member['studentid']}".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation')?>
			</td>
		</tr>
	<? endforeach; ?>
	</tbody>
	</table>
	
	<? else: ?>
	
	<p>No members listed</p>
	
	<? endif; ?>
	
	<?= anchor($add_member_url, 'Add A Member') ?>
	</p>
	<?= anchor("organization/send_member_confirmation_emails".($this->session->user_group_is(OSA_GROUPID)?"/{$appsemid}/{$orgid}":''),'Send Confirmation Emails')?>
	<?endif;?>
	
</div>


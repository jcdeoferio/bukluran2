<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Form 3 - Officer and Member Roster
	</div>
	
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
	</tr>
	</thead>
	<tbody>
	<? foreach($officers as $officer): ?>
		<tr>
			<td><?= $officer['webmail'] ?></td>
			<td><?= $officer['email'] ?></td>
			<td><?= $officer['position'] ?></td>
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
	</tr>
	</thead>
	<tbody>
	<? foreach($members as $member): ?>
		<tr>
			<td><?= $member['webmail'] ?></td>
			<td><?= $member['email'] ?></td>
		</tr>
	<? endforeach; ?>
	</tbody>
	</table>
	
	<? else: ?>
	
	<p>No members listed</p>
	
	<? endif; ?>
	
	<?= anchor($add_member_url, 'Add A Member') ?>
	</p>
</div>


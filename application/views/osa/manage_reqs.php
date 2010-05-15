<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Manage Requirements
	</div>
	
	Currently managing requirements for application period <strong><?= $pretty_application_aysem ?></strong>
	
	<? if(count($appsems) > 0): ?>
	
	<?= form_open('osa/manage_reqs_change_appsem') ?>
	Manage requirements for different application period:
	<?= form_dropdown('appsem', $appsems, $appsemid) ?>
	<?= form_submit('submit', 'Go') ?>
	<?= form_close(); ?>
	
	<? endif; ?>
	
	<? if(count($reqs) > 0): ?>
	<a href="<?= site_url("osa/add_req/{$appsemid}") ?>">Add a Requirement</a>
	<table class="tablesorter">
		<thead>
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		</thead>
		<tbody>
		<? foreach($reqs as $req): ?>
		<tr>
			<td><?= $req['name'] ?></td>
			<td><a href="<?= site_url("osa/edit_req/{$req['requirementid']}") ?>">Edit</a></td>
		</tr>
		<? endforeach; ?>
		</tbody>
	</table>
	
	<? else: ?>
		<p>There are currently no requirements for this application period.</p>
	<? endif;?>
	
	<a href="<?= site_url("osa/add_req/{$appsemid}") ?>">Add a Requirement</a>
</div>

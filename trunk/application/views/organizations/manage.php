<?php
$config['base_url'] = site_url($site_link);
$config['total_rows'] = count($orgs);
$config['per_page'] = '20'; 

$this->pagination->initialize($config); 
?>
<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Manage Organizations
	</div>
	<?= anchor('osa/create_organization', 'Add New Organization'); ?>
	<?php if(isset($orgs) && count($orgs) > 0):?>
	<table class="tablesorter">
	<thead>
		<tr>
			<th>Organization</th>
			<th>Username</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach($orgs as $org): ?>
		<tr>
		<td><?= $org['orgname'] ?></td>
		<td><?= $org['username'] ?></td>
		<td>
			<? if($org['organizationid']): ?><?= anchor($forward_link.$org['organizationid'], 'View Profile') ?><br/><? endif; ?>
			<?= anchor("osa/reset_org_password/{$org['username']}", 'Reset Password') ?>
		</td>
		</tr>
		<?php endforeach;?>
	</tbody>
	</table>
	<?=$this->pagination->create_links();?>
	<br/>
	<?= anchor('osa/create_organization', 'Add New Organization'); ?>
	<?php endif;?>
</div>

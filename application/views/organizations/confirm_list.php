<?php
$config['base_url'] = site_url($site_link);
$config['total_rows'] = count($orgs); //TODO: should be passed from model
$config['per_page'] = '20'; 

$this->pagination->initialize($config); 
?>
<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Manage Organizations
	</div>
	<?php if(isset($orgs) && count($orgs) > 0):?>
	<table class="tablesorter">
	<thead>
		<tr>
			<th>Organization</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach($orgs as $org): ?>
		<tr>
		<td><?= $org['orgname'] ?></td>
		<td>
			<?= anchor($confirm_link.$org['organizationid'],'Confirm') ?>
		</td>
		</tr>
		<?php endforeach;?>
	</tbody>
	</table>
	<?=$this->pagination->create_links();?>
	<br/>
	<?php endif;?>
</div>

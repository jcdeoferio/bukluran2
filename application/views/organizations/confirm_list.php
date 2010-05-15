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
	<?if($messages):?>
	<?foreach($messages as $message):?>
	<div class="ui-widget">
	<div class="ui-state-highlight ui-corner-all notification">
		<span class="ui-icon ui-icon-info notification-icon"></span> 
		<?=$message?>
		<span class="ui-icon ui-icon-close notification-close" style="display:none;"></span> 
	</div>
	</div>
	<?endforeach;?>
	<?endif;?>
	<?php if(isset($orgs) && count($orgs) > 0):?>
	<table class="tablesorter">
	<thead>
		<tr>
			<th>Organization</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach($orgs as $org): ?>
		<tr>
		<td><?= $org['orgname'] ?></td>
		<td><?if($org['confirmed']=='t'):?>
				Confirmed
			<?else:?>
				Unconfirmed
			<?endif;?></td>
		<td>
			<?if($org['confirmed']=='t'):?>
				<?= anchor($unconfirm_link.$org['organizationid'],'Unconfirm') ?>
			<?else:?>
				<?= anchor($confirm_link.$org['organizationid'],'Confirm') ?>
			<?endif;?>
		</td>
		</tr>
		<?php endforeach;?>
	</tbody>
	</table>
	<?=$this->pagination->create_links();?>
	<br/>
	<?php endif;?>
</div>
<?php
$config['base_url'] = site_url($site_link);
$config['total_rows'] = count($orgs); //TODO:GET FROM MODEL
$config['per_page'] = '20'; 

$this->pagination->initialize($config); 
?>
<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Organizations List
	</div>
	<?php if(isset($orgs)):?>
	<table class="tablesorter">
	<thead>
		<tr>
			<th>Organization</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<? foreach($orgs as $org):?>
		<tr>
			<td><?=$org['orgname']?></td>
			<td><?=anchor($forward_link.$org['organizationid'], 'View Profile')?></td>
		<tr>
		<? endforeach;?>
	</tbody>
	</table>
	<?=$this->pagination->create_links();?>
	<?php endif;?>
</div>
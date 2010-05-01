<?php
$config['base_url'] = site_url($site_link);
$config['total_rows'] = '200';
$config['per_page'] = '20'; 

$this->pagination->initialize($config); 
?>
<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Organizations List
	</div>
	<?php if(isset($orgs_id, $orgs_name)):?>
	<table class="tablesorter">
	<thead>
		<tr>
			<th>Organization</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php for($i=0;$i<count($orgs_id);$i++): ?>
		<tr>
		<td><?= $orgs_name[$i] ?></td>
		<td><?= anchor($forward_link.$orgs_id[$i], 'View Profile') ?></td>
		</tr>
		<?php endfor;?>
	</tbody>
	</table>
	<?=$this->pagination->create_links();?>
	<?php endif;?>
</div>

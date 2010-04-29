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
	<ul>
		<?php for($i=0;$i<count($orgs_id);$i++): ?>
		<li class="organizationList_name">
			<?= anchor($forward_link.$orgs_id[$i],$orgs_name[$i])?>
		</li>
		<?php endfor;?>
	</ul>
	<?=$this->pagination->create_links();?>
	<?php endif;?>
</div>
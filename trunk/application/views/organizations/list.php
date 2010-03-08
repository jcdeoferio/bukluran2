<div id="contentWrapper">
<div class="container">
<div class="span-24 last" id="content">
	<div class="contentHeader_text">
		Organizations List
	</div>
	<?php if(isset($orgs_id, $orgs_name)):?>
	<ul>
		<?php for($i=0;$i<count($orgs_id);$i++): ?>
		<li class="organizationList_name">
			<?= anchor('main/organizations/0/'.$orgs_id[$i],$orgs_name[$i])?>
		</li>
		<?php endfor;?>
	</ul>
	<?php endif;?>
</div>
</div>
</div>
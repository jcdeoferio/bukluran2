<?php
$config['base_url'] = site_url($site_link);
$config['total_rows'] = '200';
$config['per_page'] = '20'; 

$this->pagination->initialize($config); 
?>

<div class="span-<?=isset($span)?$span:24?> last" id="content_main">
	<div class="contentHeader_text">
		Announcements
	</div>
	<?php if(isset($announcements)):?>
		<?php foreach($announcements as $announcement):?>
	<div class="announcement">
		<div class="announcementDetails_title">
			<?=anchor($forward_link.$page_no.'/'.$announcement['id'],$announcement['title'])?>
		</div>
		<div class="announcementDetails_postInfo">
			posted by <span class="announcementDetails_username"><?=$announcement['username']?></span> at <span class="announcementDetails_date"><?=$announcement['date']?></span>
		</div>
		<div class="announcementDetails_content">
			<?=$announcement['content']?>
		</div>
	</div>
		<?php endforeach;?>
		<?=$this->pagination->create_links();?>
	<?php endif; ?>
</div>

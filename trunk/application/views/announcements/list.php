<div id="contentWrapper">
<div class="container">
<div class="span-24 last" id="content">
	<div class="contentHeader_text">
		Announcements
	</div>
	<?php if(isset($announcements)):?>
		<?php foreach($announcements as $announcement):?>
	<div class="announcement">
		<div class="announcementDetails_title">
			<?=anchor('/main/announcements/0/'.$announcement['id'],$announcement['title'])?>
		</div>
		<div class="announcementDetails_postInfo">
			posted by <span class="announcementDetails_username"><?=$announcement['username']?></span> at <span class="announcementDetails_date"><?=$announcement['date']?></span>
		</div>
		<div class="announcementDetails_content">
			<?=$announcement['content']?>
		</div>
	</div>
		<?php endforeach;?>
	<?php endif; ?>
</div>
</div>
</div>
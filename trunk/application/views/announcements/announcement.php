<div id="contentWrapper">
<div class="container">
<div class="span-24 last" id="content">
	<div class="contentHeader_text">
		Announcements
	</div>
	<?php if(isset($announcement)):?>
	<div class="announcement">
		<div class="announcementDetails_title">
			<?=$announcement['title']?>
		</div>
		<div class="announcementDetails_postInfo">
			posted by <span class="announcementDetails_username"><?=$announcement['username']?></span> at <span class="announcementDetails_date"><?=$announcement['date']?></span>
		</div>
		<div class="announcementDetails_content">
			<?=$announcement['content']?>
		</div>
	</div>
	<?php endif; ?>
	<?=anchor('/main/announcements/','Back to List');?>
</div>
</div>
</div>
<div class="span-5 last" id="content_sidebar">
	<?php if(isset($hrefs)):?>
	<ul id="sidebar_links">
		<?php for($i=0;$i<count($hrefs);$i++): ?>
		<li class="sidebar_link">
			<?= anchor($hrefs[$i],$anchors[$i])?>
		</li>
		<?php endfor;?>
	</ul>
	<?php endif;?>
</div>
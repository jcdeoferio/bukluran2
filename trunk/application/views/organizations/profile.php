<div class="span-<?=isset($span)?$span:24?> last" id="contentP_main">
	<div class="contentHeader_text">
		<?= $name ?>
	</div>
	<div class="organizationProfile">
		<p>
		<b>Other Names:</b> <?=$acronym?> <br />
		</p><p>
		<b>Date Established:</b> <?=$established?> <br />
		</p><p>
		<b>Nature of the Organization:</b> <?=$nature?> <br />
		</p><p>
		<b>Category:</b> <?=$category?> <br />
		</p><p>
		<b>Mailing Address:</b> <?=$mailing_address?> <br />
		</p><p>
		<b>Organization E-Mail Address:</b> <?=$org_email?> <br />
		</p><p>
		<b>Description:</b> <?=$org_desc?> <br />
		</p>
	</div>
	<?=anchor($back_link,'Back to List');?>
</div>
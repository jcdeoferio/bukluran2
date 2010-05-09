<div class="span-<?=isset($span)?$span:24?> last" id="contentP_main">
	<div class="contentHeader_text">
		<?= $org['orgname'] ?>
	</div>
	<div class="organizationProfile">
		<p>
		<b>Other Names:</b> <?=$org['acronym']?> <br />
		</p><p>
		<b>Date Established:</b> <?=$org['establisheddate']?> <br />
		</p><p>
		<b>Nature of the Organization:</b> <?=$org['naturedesc']?> <br />
		</p><p>
		<b>Category:</b> <?=$org['categorydesc']?> <br />
		</p><p>
		<b>Mailing Address:</b> <?=$org['mailaddr']?> <br />
		</p><p>
		<b>Organization E-Mail Address:</b> <?=$org['orgemail']?> <br />
		</p><p>
		<b>Description:</b> <?=$org_desc?> <br />
		</p>
	</div>
	<?=anchor($back_link,'Back to List');?>
</div>
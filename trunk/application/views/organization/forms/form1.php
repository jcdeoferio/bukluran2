<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Information Sheet
	</div>
	
	<p>
	Currently viewing form 1 of organization <strong><?= $organization['orgname'] ?></strong><br/>
	for application period <strong><?= $pretty_application_aysem ?></strong>
	</p>
	
	<? if($this->session->user_group_is(OSA_GROUPID) && count($appsems) > 1): ?>
	
	<?= form_open($change_appsem_submit_url) ?>
	View application form for different application period:
	<?= form_dropdown('appsem', $appsems, $appsemid) ?>
	<?= form_submit('submit', 'Go') ?>
	<?= form_close(); ?>
	
	<? endif; ?>
	
	
	<?=form_open('organization/form1_submit')?>
	<table>
		<tr>
			<td><?=form_label('Official Name of the Organization:','name')?></td>
			<td><?=form_input('name',$organization['orgname'])?></td>
		</tr>
		<tr>
			<td><?=form_label('Acronym or Other Names:','acronym')?></td>
			<td><?=form_input('acronym')?></td>
		</tr>
		<tr>
			<td><?=form_label('Date Established (yyyy-mm-dd):','date_established')?></td>
			<td><?=form_input('date_established','','class="datepicker"')?></td>
		</tr>
		<tr>
			<td><?=form_label('Category:','category')?></td>
			<td><?=form_dropdown('category',$categories)?></td>
		</tr>
		<tr>
			<td><?=form_label('Is your organization incorporated with the<br/>Securities & Exchange Commission?','sec_incorporated')?></td>
			<td>
				<div class="radio">
				<?=form_radio('sec_incorporated',true,false,'id="sec_incorporated_yes"')?>
				<?=form_label('Yes','sec_incorporated_yes')?>
				<?=form_radio('sec_incorporated',false,true,'id="sec_incorporated_no"')?>
				<?=form_label('No','sec_incorporated_no')?>
				</div>
			</td>
		</tr>
		<tr id="incorporated">
			<td><?=form_label('Date Incorporated (yyyy-mm-dd):','date_incorporated')?></td>
			<td><?=form_input('date_incorporated','','class="datepicker"')?></td>
		</tr>
		<tr>
			<td><?=form_label('Mailing Address:','mailaddr')?></td>
			<td><?=form_input('mailaddr')?></td>
		</tr>
		<tr>
			<td><?=form_label("Permanent Email Address:",'orgemail')?></td>
			<td><?=form_input('orgemail')?></td>
		</tr>
		<tr>
			<td><?=form_label("Head's Email Address:",'heademail')?></td>
			<td><?=form_input('heademail')?></td>
		</tr>
		
	</table>
	
	<?=form_submit('submit','Save')?>
	<?=form_close()?>
</div>

<script>
	$('.datepicker').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',
		minDate: '1908-06-01',
		maxDate: 0
	});
	$('.radio').buttonset();
	
	$('#incorporated').hide();
	
	$('#sec_incorporated_yes').click(function(){
		$('#incorporated').fadeIn('slow');
	});
	
	$('#sec_incorporated_no').click(function(){
		$('#incorporated').fadeOut('slow');
	});
	
</script>


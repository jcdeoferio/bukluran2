<div class="span-19 last" id="content_main">
	<? 
		$this->load->helper('inflector');
	?>

	<div class="contentHeader_text">
		Form 1 - Add Faculty Adviser
	</div>
	
	<p><?= $this->session->validation_errors() ?></p>
	
	<p>
	Currently adding Faculty Adviser to form 1 of organization <strong><?= $orgname ?></strong><br/>
	for application period <strong><?= $pretty_application_aysem ?></strong>
	</p>
	
	<?= form_open($submit_url) ?>
	<table>
	<tr>
		<td><?= form_label('UP Webmail', 'webmail') ?></td>
		<td><?= form_input('webmail', $postback['webmail']) ?></td>
	</tr>
	<tr>
		<td><?= form_label('Email Address', 'email') ?></td>
		<td><?= form_input('email', $postback['email']) ?></td>
	</tr>
	<tr>
		<td></td>
		<td><?= form_submit('submit', "Add Faculty Adviser") ?></td>
	</tr>
	</table>
	<?= form_close() ?>
</div>

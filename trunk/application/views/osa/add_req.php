<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Add a Requirement
	</div>
	<p><?= $this->session->validation_errors() ?></p>
	Adding a requirement for application period: <strong><?= $pretty_application_aysem ?></strong>
	<?= form_open("osa/add_req_submit/{$appsemid}") ?>
	<table>
		<tr>
			<td><?= form_label('Name:', 'name') ?></td>
			<td><?= form_input('name') ?></td>
		</tr>
		<tr>
			<td><?= form_label('Description:', 'description') ?></td>
			<td><?= form_textarea('description') ?></td>
		</tr>
		<tr>
			<td></td>
			<td><?= form_submit('submit', 'Add Requirement') ?></td>
		</tr>
	</table>
	<?= form_close() ?>
</div>

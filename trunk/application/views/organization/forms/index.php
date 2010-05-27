<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Application Forms
	</div>
	<div>
		<?=anchor('organization/form1',"Form 1 - Information Sheet");?><br />
		<?=anchor('organization/form1_faculty_adviser',"Form 1 - Faculty Advisers");?><br />
		<?=anchor('organization/form2',"Form 2 - Finance Statement");?><br />
		<?=anchor('organization/form3',"Forms 3 and 4 - Officer and Member Roster");?><br />
		<?=anchor('organization/form5',"Form 5 - Accomplishment Report");?><br />
		<?=anchor('organization/form6',"Form 6 - Calendar of Activities");?><br />
		<?=anchor('organization/form7',"Form 7 - Acknowledgement");?><br /><br /><br />
	</div>
	
	<div class="contentHeader_text">
		Messages from OSA
	</div>
	
	<? if($this->session->user_group_is(OSA_GROUPID)):?>
		<?=anchor('osa/create_clarification/'.$org['organizationid'].'/'.$aysem,'Add Message').br(2)?>
	<? endif;?>
	
	<? if(count($clarifications)):?>
	<table class="tablesorter">
	<thead>
		<tr>
			<th>Date Sent</th>
			<th>Message</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach($clarifications as $clarification): ?>
		<tr>
			<td><?= $clarification['date_created'] ?></td>
			<td><?= $clarification['description'] ?></td>
			<td>
				<?= anchor('organization/view_clarification/'.$clarification['orgclarificationid'],'View') ?> 
				<? if($this->session->user_group_is(OSA_GROUPID)): ?>
					<?= anchor("osa/edit_clarification/{$org['organizationid']}/{$aysem}/{$clarification['orgclarificationid']}",'Edit')?>
					<?= anchor("osa/delete_clarification/{$clarification['orgclarificationid']}/{$org['organizationid']}/{$aysem}",'Delete')?>					
				<? endif;?>
			</td>
		</tr>
		<?php endforeach;?>
	</tbody>
	</table>
	<div id="pagination">
		<?=form_open()?>
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/first.png",'class'=>"first"))?>
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/prev.png",'class'=>"prev"))?>
			<?=form_input(array('class'=>'pagedisplay'))?>
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/next.png",'class'=>"next"))?> 
			<?=img(array('src'=>"layout/images/tablesorter.pager.icons/last.png",'class'=>"last"))?> 
			<?=form_dropdown('pagesize',array(
				10=>10,
				20=>20,
				30=>30,
				40=>40
			),'10','class="pagesize"')?>
		<?=form_close()?>
		Search: <input name="filter" id="filter-box" value="" maxlength="30" size="30" type="text"> <input id="filter-clear-button" type="submit" value="Clear"/>
	</div>
	<? if($this->session->user_group_is(OSA_GROUPID)):?>
		<?=br(2).anchor('osa/create_clarification/'.$org['organizationid'].'/'.$aysem,'Add Message')?>
	<? endif;?>
	<? else:?>
		No Messages From OSA
	<? endif;?>
	
</div>


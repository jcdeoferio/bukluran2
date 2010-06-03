<?
	if($this->session->user_group_is(ORG_GROUPID)){
		$progress_form1 = $this->orgregistration_model->form1($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form1_advisers = $this->orgregistration_model->form1_advisers($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form2 = $this->orgregistration_model->form2($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form3_members = $this->orgregistration_model->form3_members($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form3_officers = $this->orgregistration_model->form3_officers($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form5_eventreports = $this->orgregistration_model->form5_eventreports($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form5_awards = $this->orgregistration_model->form5_awards($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form6 = $this->orgregistration_model->form6($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_form7 = $this->orgregistration_model->form7($this->session->organizationid(),$this->Variable->current_application_aysem());
		$progress_reqs = $this->orgregistration_model->requirements($this->session->organizationid(),$this->Variable->current_application_aysem());
	}else{
		$progress_form1 = $this->orgregistration_model->form1($org['organizationid'],$aysem);
		$progress_form1_advisers = $this->orgregistration_model->form1_advisers($org['organizationid'],$aysem);
		$progress_form2 = $this->orgregistration_model->form2($org['organizationid'],$aysem);
		$progress_form3_members = $this->orgregistration_model->form3_members($org['organizationid'],$aysem);
		$progress_form3_officers = $this->orgregistration_model->form3_officers($org['organizationid'],$aysem);
		$progress_form5_eventreports = $this->orgregistration_model->form5_eventreports($org['organizationid'],$aysem);
		$progress_form5_awards = $this->orgregistration_model->form5_awards($org['organizationid'],$aysem);
		$progress_form6 = $this->orgregistration_model->form6($org['organizationid'],$aysem);
		$progress_form7 = $this->orgregistration_model->form7($org['organizationid'],$aysem);
		$progress_reqs = $this->orgregistration_model->requirements($org['organizationid'],$aysem);
	}
	$progress_total = $progress_form1+
		$progress_form1_advisers+
		$progress_form2+
		($progress_form3_members&&$progress_form3_officers)+
		$progress_form5_eventreports+
		$progress_form6+
		$progress_form7+
		$progress_reqs+
		($org['orgstatusid']>APP_NOT_SUBMITTED)+
		($org['orgstatusid']==APP_RENEWED);
?>

<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Registration
	</div>
	<?if($this->session->user_group_is(ORG_GROUPID) && !$this->Variable->app_is_open()):?>
		Registration is Currently Closed.
	<?else:?>
	<div id="progress"></div>
	Progress: <?=round($progress_total*10,2)?>%<?=br(1)?>
	Status: <?=$org['orgstatusdesc']?>
	<?=br(2)?>
	<div>
	<? if($this->session->user_group_is(OSA_GROUPID)):?>
		<div title= "<?=($progress_form1)?"OK":"Form1 Needs to be filled up"?>">
		<span id="progress_form1" class="ui-icon ui-icon-<?=($progress_form1)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form1/{$aysem}/{$org['organizationid']}","Form 1 - Information Sheet");?><br />
		</div>
		
		<div title= "<?=($progress_form1_advisers)?"OK":"You need at least one confirmed adviser"?>">
		<span id="progress_form1_advisers" class="ui-icon ui-icon-<?=($progress_form1_advisers)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form1_faculty_adviser/{$aysem}/{$org['organizationid']}","Form 1 - Faculty Advisers");?><br />
		</div>
		
		<div title= "<?=($progress_form2)?"OK":"You need to have an entry in the Starting Balance Field and the Collections and Disbursements Table"?>">
		<span id="progress_form2" class="ui-icon ui-icon-<?=($progress_form2)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form2/{$aysem}/{$org['organizationid']}","Form 2 - Finance Statement");?><br />
		</div>
		
		<div title= "<?=($progress_form3_officers)?(($progress_form3_members)?"OK":"You need at least 15 confirmed members"):($progress_form3_members)?"You need at least 5 confirmed officers":"You need at least 5 confirmed officers and 15 confirmed members"?>">
		<span id="progress_form3" class="ui-icon ui-icon-<?=($progress_form3_officers && $progress_form3_members)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form3/{$aysem}/{$org['organizationid']}","Forms 3 and 4 - Officer and Member Roster");?><br />
		</div>
		
		<div title= "<?=($progress_form5_eventreports)?(($progress_form5_awards)?"OK":"There are no Awards [Not Required]"):"All event categories should have at least one event"?>">
		<span id="progress_form5" class="ui-icon ui-icon-<?=($progress_form5_eventreports)?(($progress_form5_awards)?"check":"alert"):"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form5/{$aysem}/{$org['organizationid']}","Form 5 - Accomplishment Report");?><br />
		</div>
		
		<div title= "<?=($progress_form6)?"OK":"All event categories should have at least one event"?>">
		<span id="progress_form6" class="ui-icon ui-icon-<?=($progress_form6)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form6/{$aysem}/{$org['organizationid']}","Form 6 - Calendar of Activities");?><br />
		</div>
		
		<div title= "<?=($progress_form7)?"OK":"Acknowledgment needed"?>">
		<span id="progress_form7" class="ui-icon ui-icon-<?=($progress_form7)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form7/{$aysem}/{$org['organizationid']}","Form 7 - Acknowledgment");?><br />
		</div>
		
		<div title= "<?=($progress_reqs)?"OK":"Some requirements are not yet submitted"?>">
		<span id="progress_reqs" class="ui-icon ui-icon-<?=($progress_reqs)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("osa/org_reqs/{$org['organizationid']}","Requirements");?><br />
		</div>
		
		<div title= "<?=$org['orgstatusdesc']?>">
		<span id="progress_reqs" class="ui-icon ui-icon-<?=($org['orgstatusid']>1)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/submit_forms/{$aysem}/{$org['organizationid']}","Submit to OSA");?><br />
		</div><br /><br />
	<? else:?>
		<div title= "<?=($progress_form1)?"OK":"Form1 Needs to be filled up"?>">
		<span id="progress_form1" class="ui-icon ui-icon-<?=($progress_form1)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form1","Form 1 - Information Sheet");?><br />
		</div>
		
		<div title= "<?=($progress_form1_advisers)?"OK":"You need at least one confirmed adviser"?>">
		<span id="progress_form1_advisers" class="ui-icon ui-icon-<?=($progress_form1_advisers)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form1_faculty_adviser","Form 1 - Faculty Advisers");?><br />
		</div>
		
		<div title= "<?=($progress_form2)?"OK":"You need to have an entry in the Starting Balance Field and the Collections and Disbursements Table"?>">
		<span id="progress_form2" class="ui-icon ui-icon-<?=($progress_form2)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form2","Form 2 - Finance Statement");?><br />
		</div>
		
		<div title= "<?=($progress_form3_officers)?(($progress_form3_members)?"OK":"You need at least 15 confirmed members"):($progress_form3_members)?"You need at least 5 confirmed officers":"You need at least 5 confirmed officers and 15 confirmed members"?>">
		<span id="progress_form3" class="ui-icon ui-icon-<?=($progress_form3_officers && $progress_form3_members)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form3","Forms 3 and 4 - Officer and Member Roster");?><br />
		</div>
		
		<div title= "<?=($progress_form5_eventreports)?(($progress_form5_awards)?"OK":"There are no Awards [Not Required]"):"All event categories should have at least one event"?>">
		<span id="progress_form5" class="ui-icon ui-icon-<?=($progress_form5_eventreports)?(($progress_form5_awards)?"check":"alert"):"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form5","Form 5 - Accomplishment Report");?><br />
		</div>
		
		<div title= "<?=($progress_form6)?"OK":"All event categories should have at least one event"?>">
		<span id="progress_form6" class="ui-icon ui-icon-<?=($progress_form6)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form6","Form 6 - Calendar of Activities");?><br />
		</div>
		
		<div title= "<?=($progress_form7)?"OK":"Acknowledgment needed"?>">
		<span id="progress_form7" class="ui-icon ui-icon-<?=($progress_form7)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/form7","Form 7 - Acknowledgment");?><br />
		</div>
		
		<div title= "<?=($progress_reqs)?"OK":"Some requirements are not yet submitted"?>">
		<span id="progress_reqs" class="ui-icon ui-icon-<?=($progress_reqs)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/requirements","Requirements");?><br />
		</div>
		
		<div title= "<?=$org['orgstatusdesc']?>">
		<span id="progress_reqs" class="ui-icon ui-icon-<?=($org['orgstatusid']>1)?"check":"closethick"?> progress-check-icon"></span>
		<?=anchor("organization/submit_forms","Submit to OSA");?><br />
		</div><br /><br />
	<? endif;?>
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
	<script>
		var progress = <?=$progress_total*10?>;
		$('#progress').progressbar({value:0});
		$('#progress .ui-progressbar-value').delay(300).animate({width:progress+"%"},3000,"easeOutBounce",function(){$('#progress').progressbar({value:progress});});
	</script>
	<?endif;?>
</div>


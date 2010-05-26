<div class="span-19 last" id="content_main">
	<div class="contentHeader_text">
		Information Sheet
	</div>
	<div>
		<?php 
			$this->load->helper('form');
			$months = array(
						'1' => 'January',
						'2' => 'February',
						'3' => 'March',
						'4' => 'April',
						'5' => 'May',
						'6' => 'June',
						'7' => 'July',
						'8' => 'August',
						'9' => 'September',
						'10' => 'October',
						'11' => 'November',
						'12' => 'December');
			$days = array();
			for($i=1;$i<=31;$i++){
				$days[$i] = $i;
			}
			$years = array();
			for($i=1908;$i<=2010;$i++){
				$years[$i] = $i;
			}
			$categories = array('Academic','Alliance','Cause-Oriented','Community Service','Dormitory Association','Fraternity','Regional/Provincial','Religious','Sorority','Special Interest','Sports and Recreatio');			
		?>
		<em><em class="required">*</em> Required Fields</em><?=br(3)?>
		<?php if(isset($error)):?>
		<div class="error">test</div>
		<?php endif;?>
		<?=form_open('organization/form1');?>
		<?=form_fieldset('Organization Details');?>
		<ol>
		<li>
		<?=form_label('Official Name<em class="required">*</em>:','org_name',array('class'=>'top'));?>
		<?=form_input('org_name','','id="org_name" size="90"');?>
		</li>
		<li>
		<?=form_label('Other Name(s)/Acronym<em class="required">*</em>:','org_other_names',array('class'=>'top'));?>
		<?=form_input('org_other_names','','id="org_other_names" size="90"');?><br/>
		</li>
		<li>
		<?=form_label('Date Establised<em class="required">*</em>:','established_month',array('class'=>'top'))?>
		<?=form_dropdown('establised_month',$months,'','id="established_month"')?>
		<?=form_dropdown('establised_day',$days)?>
		<?=form_dropdown('establised_year',$years)?>
		</li>
		<li>
		<?=form_label('Category<em class="required">*</em>:','org_category',array('class'=>'top'))?>
		<?=form_dropdown('org_category',$categories,'','id="org_category"');?><br/>
		</li>
		<li>
		Is your organization incorporated with the Securities &amp; Exchange Commission<em class="required">*</em>?<br/>
		<?=form_radio(array('name'=>'sec_incorporation','value'=>'yes','id'=>'sec_yes'))?><?=form_label('Yes','sec_yes')?>
		<div id="sec_date">
		Specify Date:
		<?=form_dropdown('sec_month',$months)?>
		<?=form_dropdown('sec_day',$days)?>
		<?=form_dropdown('sec_year',$years)?>
		</div>
		<?=form_radio(array('name'=>'sec_incorporation','value'=>'no','id'=>'sec_no','checked'=>'checked'))?><?=form_label('No','sec_no')?>
		</li>
		<li>
		<?=form_label('Organization Description<em class="required">*</em>:','org_description',array('class'=>'top')).br(1)?>
		<?=$this->fckeditor->Create();?>
		</li>
		</ol>
		<?=form_fieldset_close();?>
		
		<?=form_fieldset('Organization Contact Information');?>
		<ol>
		<li>
		<?=form_label('Mailing Address<em class="required">*</em>:','org_mailing_address',array('class'=>'top'));?>
		<?=form_input('org_mailing_address','','id="org_mailing_address" size="90"');?><br/>
		</li>
		<li>
		<?=form_label('Organization Email Address<em class="required">*</em>:','org_email',array('class'=>'top'));?>
		<?=form_input('org_email','','id="org_email" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Organization Head\'s Email Address<em class="required">*</em>:','org_head_email',array('class'=>'top'));?>
		<?=form_input('org_head_email','','id="org_head_email" size="50"');?><br/>
		</li>
		</ol>
		<?=form_fieldset_close();?>
				
		<?=form_fieldset('',array('class'=>'submit'));?>
		<?=form_submit('submit','Save Details');?>		
		<?=form_fieldset_close();?>
		<?=form_close();?>
	</div>
</div>


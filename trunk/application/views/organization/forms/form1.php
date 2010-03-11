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
		<div class="error">test</div>
		<?=form_open('organization/form1');?>
		<?=form_fieldset('Organization Details');?>
		<ol>
		<li>
		<?=form_label('Official Name<em class="required">*</em>:','org_name',array('class'=>'top'));?>
		<?=form_input('org_name','','id="org_name" size="110"');?>
		</li>
		<li>
		<?=form_label('Other Name(s)/Acronym<em class="required">*</em>:','org_other_names',array('class'=>'top'));?>
		<?=form_input('org_other_names','','id="org_other_names" size="110"');?><br/>
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
		<?=form_input('org_mailing_address','','id="org_mailing_address" size="110"');?><br/>
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
		
		<?=form_fieldset('Faculty Adviser');?>
		<ol>
		<li>
		<?=form_label('Name<em class="required">*</em>:','adviser_name',array('class'=>'top'));?>
		<?=form_input('adviser_name','','id="adviser_name" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Department &amp; College<em class="required">*</em>:','adviser_dept',array('class'=>'top'));?>
		<?=form_input('adviser_dept','','id="adviser_dept" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Designated Faculty Position &amp; Rank<em class="required">*</em>:','adviser_position',array('class'=>'top'));?>
		<?=form_input('adviser_position','','id="adviser_position" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Mobile Number<em class="required">*</em>:','adviser_mobile',array('class'=>'top'));?>
		<?=form_input('adviser_mobile','','id="adviser_mobile" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Home Number<em class="required">*</em>:','adviser_home',array('class'=>'top'));?>
		<?=form_input('adviser_home','','id="adviser_home" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Office Number<em class="required">*</em>:','adviser_office',array('class'=>'top'));?>
		<?=form_input('adviser_office','','id="adviser_office" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Email Address<em class="required">*</em>:','adviser_email',array('class'=>'top'));?>
		<?=form_input('adviser_email','','id="adviser_email" size="50"');?><br/>
		</li>
		</ol>
		<?=form_fieldset_close();?>
		
		<?=form_fieldset('1st Co-Adviser');?>
		<ol>
		<li>
		<?=form_label('Name:','coadviser1_name',array('class'=>'top'));?>
		<?=form_input('coadviser1_name','','id="coadviser1_name" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Department &amp; College:','coadviser1_dept',array('class'=>'top'));?>
		<?=form_input('coadviser1_dept','','id="coadviser1_dept" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Designated Faculty Position &amp; Rank:','coadviser1_position',array('class'=>'top'));?>
		<?=form_input('coadviser1_position','','id="coadviser1_position" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Mobile Number:','coadviser1_mobile',array('class'=>'top'));?>
		<?=form_input('coadviser1_mobile','','id="coadviser1_mobile" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Home Number:','coadviser1_home',array('class'=>'top'));?>
		<?=form_input('coadviser1_home','','id="coadviser1_home" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Office Number:','coadviser1_office',array('class'=>'top'));?>
		<?=form_input('coadviser1_office','','id="coadviser1_office" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Email Address:','coadviser1_email',array('class'=>'top'));?>
		<?=form_input('coadviser1_email','','id="coadviser1_email" size="50"');?><br/>
		</li>
		</ol>
		<?=form_fieldset_close();?>	
		
		<?=form_fieldset('2nd Co-Adviser');?>
		<ol>
		<li>
		<?=form_label('Name:','coadviser2_name',array('class'=>'top'));?>
		<?=form_input('coadviser2_name','','id="coadviser2_name" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Department &amp; College:','coadviser2_dept',array('class'=>'top'));?>
		<?=form_input('coadviser2_dept','','id="coadviser2_dept" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Designated Faculty Position &amp; Rank:','coadviser2_position',array('class'=>'top'));?>
		<?=form_input('coadviser2_position','','id="coadviser2_position" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Mobile Number:','coadviser2_mobile',array('class'=>'top'));?>
		<?=form_input('coadviser2_mobile','','id="coadviser2_mobile" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Home Number:','coadviser2_home',array('class'=>'top'));?>
		<?=form_input('coadviser2_home','','id="coadviser2_home" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Office Number:','coadviser2_office',array('class'=>'top'));?>
		<?=form_input('coadviser2_office','','id="coadviser2_office" size="50"');?><br/>
		</li>
		<li>
		<?=form_label('Email Address:','coadviser2_email',array('class'=>'top'));?>
		<?=form_input('coadviser2_email','','id="coadviser2_email" size="50"');?><br/>
		</li>
		</ol>
		<?=form_fieldset_close();?>
		
		<?=form_fieldset('',array('class'=>'submit'));?>
		<?=form_submit('submit','Save Form');?>		
		<?=form_fieldset_close();?>
		<?=form_close();?>
	</div>
</div>


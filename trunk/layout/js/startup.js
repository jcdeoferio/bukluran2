function load(location){
	document.location.replace(site_url+'/'+location);
}

$(document).ready(function(){
	//$('#jr_reject').hide();
	//$('div#toppanel').fadeIn();
	$('.tab').click(function(){
		if($('#open:visible').length==1)
			load('');
	});

	$('.tablesorter').tablesorter();
	
	var notification = $('.notification');
	var parent = $('.notification').parent();
	$('.notification').dialog({
		resizable:false,
		modal:true,
		buttons: {
			Ok: function() {
				$(this).dialog('close');
			}
		},
		close:function(){
			notification.css('min-height','0px');
			parent.append(notification).show('slide',500);
			//notification.appendTo(parent).show('slide',500);
		}
	});
});
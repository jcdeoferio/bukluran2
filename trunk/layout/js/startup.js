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
});
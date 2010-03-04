<html>
<head>
</head>
<body>
<!--[if lte IE 6]>
<![endif]-->
<script src="<?php echo base_url().'layout/js/jquery-1.4.2.min.js';?>"></script>
<script src="<?php echo base_url().'layout/ie6/jquery.reject.js';?>"></script>
<script>
window.onload=function(){$.reject({
imagePath: '<?php echo base_url().'layout/ie6/browsers/';?>'
});return false;}
</script>
</body>
</html>
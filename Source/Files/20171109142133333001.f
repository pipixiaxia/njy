<!VDNDOC "PageBase":"nvo_bill","IniEvent":"ViewBill","NotClientCache":true>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title><!--INCLUDE:title--></title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="css/app.css" />
		<style>
			h5 {
				margin: 5px 7px;
			}
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-left-nav mui-pull-left" href="main.html"></a>
			<h1 class="mui-title mui-left"><!--INCLUDE:title--></h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
				<form id='form1' method="post">
					<div id="d_content" class="content">
					</div>
				</form>
				<div style="text-align:center;">
				<a type="button" class="mui-btn mui-btn-blue mui-icon mui-icon-home" href="main.html">
		           返回首页
		        </a>
		        </div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script>
			mui.init();
		</script>
	</body>

</html>
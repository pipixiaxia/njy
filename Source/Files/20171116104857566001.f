<!VDNDOC "PageBase":"nvo_cookie","IniEvent":"PageIni","NotClientCache":true,"ServerValueList":"all">
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>Cookie</title>
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
		<!--header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">cookie</h1>
		</header-->
		<div class="mui-content-padded">
			<p style="text-indent: 22px;">cookie是存储在客户端的值.在PB后台可以通过wa_setcookie和wa_getcookie函数进行操作。</p>
			<p style="text-indent: 22px;">注意如果页面要操作cookie,页面指令中设置"ServerValueList":"all" 或列值中包含cookie</p>
			<p style="text-indent: 22px;">
				cookie-1的值是当前有效，当关闭浏览器或者微信后再次打开该值就超时失效.
			</p>
			<p style="text-indent: 22px;">
				cookie-2的值设置超时时间为1天.详见后台代码nvo_cookie.
			</p>
		</div>
		<div class="mui-content">
			<div class="mui-content-padded" style="margin: 5px;">
				<form id="form1" method="post" class="mui-input-group">
					<div class="mui-input-row">
						<label>Cookie-1</label>
						<input name="t_value_1" id="t_value_1" type="text" class="mui-input-clear" placeholder="请输入Cookie值">
					</div>
					<div class="mui-input-row">
						<label>Cookie-2</label>
						<input name="t_value_2" id="t_value_2" type="text" class="mui-input-clear" placeholder="请输入Cookie值">
					</div>
					<div class="mui-button-row">
						<button type="button" id="b_set" class="mui-btn mui-btn-primary">保存到Cookie</button>&nbsp;&nbsp;
						<a href="cookie.html" class="mui-btn mui-btn-warning">重新加载</a>&nbsp;&nbsp;
						<a class="mui-btn mui-btn-danger" href="main.html">返回</a>
					</div>
					<script src="js/mui.min.js"></script>
					<script>
						mui.init();
					</script>
				</form>
			</div>
		</div>
	</body>

</html>
<!VDNDOC "PageBase":"nvo_control","IniEvent":"PageIni","NotClientCache":true,"ServerValueList":"all">
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>事件与属性</title>
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
			<h1 class="mui-title mui-left">事件与属性</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded" style="margin: 5px;">
				<p style="text-indent: 22px;">本例演示后台代码如何初始化组件的属性及值，以及前台组件如何触发服务器端事件.后台对应nvo_control.</p>
			</div>
			<form id="form1" method="post" class="mui-input-group">
				<p>&nbsp;</p>
				<h5>通过后台设置组件的属性和值：</h5>
				<div class="mui-input-row">
					<label name="l_date">标签:</label>
					<input name="t_date" id="t_date" placeholder="请输入到店日期" type="date" />
				</div>
				<h5>输入框被禁止输入</h5>
				<div class="mui-input-row">
					<label>姓名:</label>
					<input name="t_name" type="text" placeholder="姓名">
				</div>
				<h5>通过后台设置按钮的属性</h5>
				<div class="mui-button-row">
					<button name="b_enabled" type="button" class="mui-btn mui-btn-primary">我是无效的</button>
					<button name="b_class" id="b_class" type="button" class="mui-btn mui-btn-danger">变色</button>
					<button name="b_script" type="button" class="mui-btn mui-btn-green">动态脚本</button>
				</div>
				<h5>触发服务器端事件：</h5>
				<p>1、选择框AutoPost属性：</p>
				<div class="mui-button-row">
				<select name="d_list" AutoPost="true">
						<option value="VDN">VDN</option>
						<option value="PB">PB</option>
						<option value="H5">H5</option>
					</select>
				</div>
				<p>2、ServerEvent属性：</p>
				<div class="mui-button-row">
				<button name="b_submit_1" type="button" class="mui-btn mui-btn-blue" ServerEvent="submit_1">ServerEvent</button>
				</div>
				<p>3、ServerArgs属性：</p>
				<div class="mui-button-row">
				<button name="b_submit_2" type="button" class="mui-btn mui-btn-green" ServerEvent="submit_2" ServerArgs="a1/a2">ServerArgs</button>
				</div>
			</form>
		</div>

		<script src="js/mui.min.js"></script>
		<script>
			mui.init();
		</script>
	</body>

</html>
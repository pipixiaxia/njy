<!VDNDOC "NotClientCache":true>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>Ajax</title>
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
			<h1 class="mui-title">VDN Ajax</h1>
		</header-->
		<div class="mui-content-padded">
			<p style="text-indent: 22px;">本例通过调用vdn.js中的函数实现数据的动态加载，页面的Ajax初始化及提交.后台对应nvo_ajax.</p>
			<p style="text-indent: 22px;">
				vdn.js主要是对JQuery的ajax函数进行打包,简化为几个简单的函数，更便于调用VDN的WebAPI.
			</p>
		</div>
		<div class="mui-content">
			<div class="mui-content-padded" style="margin: 5px;">
				<form id="form1" class="mui-input-group">
					<div class="mui-input-row">
						<label>姓名</label>
						<input name="t_name" id="t_name" type="text" class="mui-input-clear" placeholder="请输入用户名">
					</div>
					<div class="mui-input-row">
						<label>门店</label>
						<select name="d_store" id="d_store">
						</select>
					</div>

					<div class="mui-input-row">
						<label>员工</label>
						<select name="d_oper" id="d_oper">
						</select>
					</div>
					<div class="mui-input-row" style="margin: 10px 5px;height:150px;">
						<textarea id="t_desc" name="t_desc" rows="5" placeholder="感言..."></textarea>
					</div>
					<div class="mui-button-row">
						<button type="button" id="b_submit" class="mui-btn mui-btn-primary" onclick="return false;">Ajax&nbsp;提交</button>&nbsp;&nbsp;
						<button type="button" id="b_error" class="mui-btn mui-btn-warning" onclick="return false;">模拟错误</button>&nbsp;&nbsp;
						<a class="mui-btn mui-btn-danger" href="main.html">返回</a>
					</div>
				</form>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script src="js/vdn.js"></script>
		<script>
			mui.init({
				swipeBack: true //启用右滑关闭功能
			});
			//获取门店员工
			function GetOper() {
				vdn.get({
						"method": "nvo_ajax.getoper_json",
						"params": $("#d_store").val()
					}, function(data) {
						$("#d_oper").empty();
						$.each(data.Result, function(index, item) {
							$("#d_oper").append("<option value='" + item + "'>" + item + "</option>");
						});
					},
					function(err) {
						mui.toast(err.Message + "(" + err.Code.toString() + ")");
					}
				);
			}
			//页面加载
			mui.ready(function() {
				//同步加载
				vdn.async = true;
				//获取门店
				vdn.get({
						"method": "nvo_ajax.getstore_json",
						"params": ""
					}, function(data) {
						$.each(data.Result, function(index, item) {
							$("#d_store").append("<option value='" + item + "'>" + item + "</option>");
						});
					},
					function(err) {
						mui.toast(err.Message + "(" + err.Code.toString() + ")");
					}
				);
				//门店连动员工列表
				$('#d_store').change(function() {
					GetOper();
				});
				//页面信息初始化
				vdn.get({
						"method": "nvo_ajax.pageini_json",
					}, function(data) {
						vdn.iniform(data);
					},
					function(err) {
						mui.toast(err.Message + "(" + err.Code.toString() + ")");
					}
				);
			});

			//Ajax提交
			mui("#form1").on('click', '#b_submit', function() {
				vdn.submit("form1", {
						"method": "nvo_ajax.submit_json",
						"params": ""
					}, function(data) {
						$(location).prop('href', data.Result.redirect);
					},
					function(err) {
						mui.toast(err.Message + "(" + err.Code.toString() + ")");
					}
				);
			});
			//Ajax提交,模拟错误
			mui("#form1").on('click', '#b_error', function() {
				vdn.submit("form1", {
						"method": "nvo_ajax.submit_error",
						"params": ""
					}, function(data) {
						//ok
					},
					function(err) {
						mui.toast(err.Message + "(" + err.Code.toString() + ")");
					}
				);
			});
		</script>
	</body>

</html>
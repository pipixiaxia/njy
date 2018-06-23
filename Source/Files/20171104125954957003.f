<!VDNDOC "PageBase":"nvo_login","IniEvent":"PageIni","NotValidLogin":true>
<!DOCTYPE html>
<html class="ui-page-login">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>VDN WebApp</title>
		<link href="css/mui.min.css" rel="stylesheet" />
		<link href="css/style.css" rel="stylesheet" />
		<style>
			.top_content {
				width: 100%;
				height: 200px;
				background-color: #0064C8;
				text-align: center;
				vertical-align: middle;
				display: flex;
				justify-content: center;
				align-items: center;
				color: white;
				font-size: 25pt;
				font-weight: bold;
				line-height: 35px;
			}
			
			.icon_size {
				font-size: 50pt;
			}
			
			.area {
				margin: 20px auto 0px auto;
			}
			
			.mui-input-group {
				margin-top: 10px;
			}
			
			.mui-input-group:first-child {
				margin-top: 20px;
			}
			
			.mui-input-group label {
				width: 22%;
			}
			
			.mui-input-row label~input,
			.mui-input-row label~select,
			.mui-input-row label~textarea {
				width: 78%;
			}
			
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				top: 6px;
			}
			
			.mui-content-padded {
				margin-top: 5px;
			}
			
			.mui-btn {
				padding: 10px;
			}
			
			.link-area {
				display: block;
				margin-top: 25px;
				text-align: center;
			}
			
			.oauth-area {
				position: absolute;
				bottom: 20px;
				left: 0px;
				text-align: center;
				width: 100%;
				padding: 0px;
				margin: 0px;
			}
			
			.oauth-area .oauth-btn {
				display: inline-block;
				width: 50px;
				height: 50px;
				background-size: 30px 30px;
				background-position: center center;
				background-repeat: no-repeat;
				margin: 0px 20px;
				/*-webkit-filter: grayscale(100%); */
				border: solid 1px #ddd;
				border-radius: 25px;
			}
			
			.oauth-area .oauth-btn:active {
				border: solid 1px #aaa;
			}
			
			.oauth-area .oauth-btn.disabled {
				background-color: #ddd;
			}
		</style>

	</head>

	<body>
		<!--
        	<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">登录</h1>
		</header>
        -->
		<div class="mui-content">
			<div class="top_content">
				<div>
					<span class="icon_size mui-icon mui-icon-contact"></span>
					<div class="mui-content-padded">VDN WebAPP</div>
				</div>
			</div>
			<form id='login-form' class="mui-input-group" method="post">
				<div class="mui-input-row">
					<label>账号</label>
					<input name="account" id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号">
				</div>
				<div class="mui-input-row">
					<label>密码</label>
					<input name="password" id='password' showpassword="1" type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
				</div>
				<div class="mui-content-padded">
					<button name='login' id='login' class="mui-btn mui-btn-block mui-btn-primary" AutoPost=true ServerEvent="login">登录</button>
				</div>
				<div class="mui-content-padded oauth-area">

				</div>
			</form>
		</div>
	</body>
</html>
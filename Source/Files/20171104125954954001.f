<!VDNDOC "PageBase":"nvo_bill","IniEvent":"PageIni","NotClientCache":true>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>我的预约</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="js/jquery-labelauty.js"></script>
		<link rel="stylesheet" href="css/AppStyle.css">
		<style>
			h5 {
				margin: 5px 7px;
			}
		</style>
	</head>

	<body>
		<!--header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title"></h1>
		</header-->
		<form id='form1' method="post">
			<div id="d_content" class="content">
				<div class="d_list"><span>客户姓名</span>
					<div class="input"><input name="t_name" type="text" id="t_name" placeholder="请输入客户姓名" required="required" autofocus="autofocus" /></div>
				</div>
				<div class="d_list"><span>联系电话</span>
					<div class="input"><input name="t_tel" id="t_tel" placeholder="请输入联系电话" type="tel" required="required" /></div>
				</div>
				<div class="d_list"><span>性    别</span>
					<div class="input">&nbsp;<input id="ck_sex" type="checkbox" name="ck_sex" /><label for="ck_sex"> </label>
					</div>
				</div>
				<div class="d_list"><span>服务门店</span>
					<div class="input">
						<select name="d_store" id="d_store">

						</select>
					</div>
				</div>
				<div class="d_list"><span>服务员工</span>
					<div class="input">
						<select name="d_oper" id="d_oper">
						</select>
					</div>
				</div>
				<div class="d_list"><span>到店日期</span>
					<div class="input"><input name="t_date" value="2017-11-03" id="t_date" placeholder="请输入到店日期" type="date" /></div>
				</div>
				<div class="d_list"><span>到店时间</span>
					<div class="input">
						<select name="d_time" id="d_time">
							<option value="9:00">9:00</option>
							<option value="9:30">9:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
							<option value="19:30">19:30</option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option selected="selected" value="22:30">22:30</option>

						</select>
					</div>
				</div>
				<div class="d_list">
					<h1><img class="icon" alt="服务信息" src="images/Item.png" />服务项目</h1></div>
				<div name="d_items" class="d_list d_items">
				</div>
				<input name="h_items" id="h_items" type="hidden" />
				<div class="d_list"></div>
				<div id="dv_submit" class="d_button">
					<input type="submit" name="b_submit" value="确认预约" onclick="JavaScript:if(!AppointmentValid()) return false;" id="b_submit" /></div>
				<div id="dv_wait" class="wait_div"><img src="images/wait.gif" alt="" />正在提交，请稍后...</div>
			</div>

			<script src="js/mui.min.js"></script>
			<script src="js/vdn.js"></script>
			<script>
				mui.init();
				//服务项目列表
				$(function() {
					//each
					var obj_items = $('input[id^=ck_item_]');
					$.each(obj_items, function(index, item) {
						try {
							var obj_label = $(item).next("label");
							if(obj_label.length > 0) {
								$(item).attr("data-labelauty", obj_label[0].innerText);
								obj_label.hide();
							}
						} catch(e) {
							alert("Error:" + e.message);
						}
					});
					$('input[id^=ck_item_]').labelauty();
				});

				//验证操作 可以放到单独的js中
				function AppointmentValid() {
					//Name
					var ls_name = $.trim($("#t_name").val())
					if(ls_name.length == 0) {
						alert("请填写正确的姓名");
						$("#t_name").focus().select();
						return false;
					}
					var pattern = /^[\u4e00-\u9fa5a-z]+$/gi;
					if(!pattern.test(ls_name)) {
						alert("姓名包含非法字符！");
						$("#t_name").focus().select();
						return false;
					}
					//Tel
					var isMobile = /^(?:1\d\d|15\d)\d{5}(\d{3}|\*{3})$/;
					var isPhone = /^((0\d{2,3}))?(\d{7,8})(-(\d{3,}))?$/;
					var ls_tel = $("#t_tel").val();
					if(!isMobile.test(ls_tel) && !isPhone.test(ls_tel)) {
						alert("请填写正确的电话号码,例如：138########或423####");
						$("#t_tel").focus().select();
						return false;
					}
					//item
					//each
					var obj_items = $('input[id^=ck_item_]');
					var ls_list = "";
					$.each(obj_items, function(index, item) {
						try {
							if($(item).prop("checked")) {
								ls_list += $(item).val() + ",";
							}
						} catch(e) {
							alert("Error:" + e.message);
						}
					});
					if(ls_list.length == 0) {
						alert("请选择服务项目");
						return false;
					}
					$("#h_items").val(ls_list);
					return true;
				}
				(function($) {
					//门店连动员工列表
					mui("#form1").on('change', '#d_store', function() {
						vdn.get({
								"method": "nvo_bill.getoper_json",
								"params": this.value
							}, function(data) {
								$("#d_oper").empty();
								$.each(data.Result, function(index, item) {
									$("#d_oper").append("<option value='" + item + "'>" + item + "</option>");
								});
							},
							function(err) {
								alert(err.Message + "(" + err.Code.toString() + ")");
							}
						);
					});

				})(jQuery);

				$(document).ready(function() {
					$("form").submit(function(e) {
						$("#dv_submit").hide();
						$("#dv_wait").css("display", "block");
					});
				});
			</script>
		</form>
	</body>

</html>
<!VDNDOC "PageBase":"nvo_bill","IniEvent":"ListBill","NotClientCache":true>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>我的预约</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="css/app.css" />
	</head>

	<body>
		<!--header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title"></h1>
		</header-->

		<div class="mui-content">
			<ul class="mui-table-view mui-table-view-chevron" id="list">
				<!--动态加载列表-->
			</ul>
		</div>
	</body>
	<script src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script src="js/jquery.tmpl.js"></script>
	<script>
		mui.init({
			swipeBack: true //启用右滑关闭功能
		});
		//数据初始化
		mui.ready(function() {
			//这里等待服务器端嵌入列表数据
			var data = [ /*<!--INCLUDE:ListData;JS-->*/ ];
			//模板
			var str_del = "<div class='mui-slider-right mui-disabled'><a class='mui-btn mui-btn-red'>取消</a></div>";
			var fmt = "<li id='${id}' class='mui-table-view-cell mui-collapse'><a class='mui-navigate-right' href='#'>${date}&nbsp;${store}</a>";
			fmt += "<ul class='mui-table-view mui-table-view-chevron'><li class='mui-table-view-cell'>" + str_del + "<div class='mui-table mui-slider-handle ' id='${id}_content'></div></li></ul></li>";
			/* Compile the markup as a named template */
			$.template("tList", fmt);
			//Appent to List
			$.tmpl('tList', data).appendTo("#list");
			//msg
			mui.toast('展开明细，左滑可以取消预约</br>该页面主要演示了数据的动态加载</br>主要使用了嵌入数据块及API两种形式');

		});
		//解析明细数据
		function parseDetail(id, data) {
			//模板
			var fmt = "<h4 class='mui-ellipsis-2'>服务:${oper}</h4><p class='mui-h6 mui-ellipsis'>项目:${items}</p><p class='mui-h6 mui-ellipsis'>预留电话:${tel}</p>";
			/* Compile the markup as a named template */
			$.template("tDetail", fmt);
			//Appent to id_content
			$.tmpl('tDetail', data).appendTo("#" + id + "_content");
			//设置已经加载标志
			mui("#" + id)[0].tag = "loaded";
		}
		//点击列表加载明细
		mui(".mui-table-view").on('tap', '.mui-table-view-cell', function() {
			//获取id
			var id = this.getAttribute("id");
			if(mui("#" + id)[0].tag == "loaded") {
				return;
			}
			mui.ajax('/api', {
				data: {
					method: 'nvo_bill.getdetail_json',
					params: [id],
				},
				dataType: 'json', //服务器返回json格式数据
				type: 'post', //HTTP请求类型
				timeout: 10000, //超时时间设置为10秒；
				headers: {
					'Content-Type': 'application/json'
				},
				success: function(data) {
					if(data.Error == null) {
						parseDetail(id, data.Result);
					} else {
						//Error 系统返回错误信息
						alert(data.Error.Message + "(" + data.Error.Code.toString() + ")");
					}
				},
				error: function(xhr, type, errorThrown) {
					//异常处理；
					alert(type + ":" + errorThrown.toString());
				}
			});
		});
		var btnArray = ['确认', '取消'];
		//删除；
		(function($) {
			$('.mui-table-view').on('tap', '.mui-btn', function(event) {
				var elem = this;
				var li = elem.parentNode.parentNode.parentNode.parentNode;
				var id = li.getAttribute("id");
				mui.confirm('确认取消该预约？', '我的预约', btnArray, function(e) {
					if(e.index == 0) {
						mui.post("/api", {
							"method": "nvo_bill.DelDetail",
							"params": id
						}, function(data) {
							if(data.Error == null) {
								li.parentNode.removeChild(li);
							} else {
								//Error 系统返回错误信息
								mui.toast(data.Error.Message + "(" + data.Error.Code.toString() + ")");
							}
						}, "json");
						
					} else {
						setTimeout(function() {
							$.swipeoutClose(elem.parentNode.parentNode);
						}, 0);
					}
				});
			});
		})(mui);
	</script>

</html>
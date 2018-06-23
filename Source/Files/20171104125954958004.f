<!VDNDOC "NotValidLogin":false,"IniEvent":"PageIni">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>VDN WebApp</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="css/app.css" />
		<style>
			.mui-slider-indicator {
				bottom: 0;
			}
			.mui-slider {
				background-color: #f2f2f2;
			}Gallery
		</style>
	</head>

	<body>
		<div id="slider-1" class="mui-slider" >
			<div class="mui-slider-group mui-slider-loop">
				<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="images/two.jpg">
					</a>
				</div>
				<!-- 第一张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="images/one.jpg">
					</a>
				</div>
				<!-- 第二张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="images/two.jpg">
					</a>
				</div>
				<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="images/one.jpg">
					</a>
				</div>
			</div>
			<div class="mui-slider-indicator">
				<div class="mui-indicator mui-active"></div>
				<div class="mui-indicator"></div>
				<div class="mui-indicator"></div>
			</div>
		</div>
		<div class="mui-content">
			<div id="Gallery" class="mui-slider" style="margin-top:15px;">
				<div class="mui-slider-group">
					<div class="mui-slider-item">
						<ul class="mui-table-view mui-grid-view mui-grid-9">
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="bill.html">
									<span class="mui-icon mui-icon mui-icon-personadd"></span>
									<div class="mui-media-body">在线预约</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="list.html">
									<span class="mui-icon mui-icon mui-icon-person"><span id="span_count" class="mui-badge">5</span></span>
									<div class="mui-media-body">我的预约</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="ajax.html">
									<span class="mui-icon mui-icon mui-icon mui-icon-paperplane"></span>
									<div class="mui-media-body">Ajax</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="event.html">
									<span class="mui-icon mui-icon mui-icon-chatboxes"></span>
									<div class="mui-media-body">事件及属性</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="chart.html">
									<span class="mui-icon mui-icon mui-icon-list"></span>
									<div class="mui-media-body">图表</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="cookie.html">
									<span class="mui-icon mui-icon-info"></span>
									<div class="mui-media-body">Cookie</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="login.html">
									<span class="mui-icon mui-icon-info"></span>
									<div class="mui-media-body">注销</div>
								</a>
							</li>
						</ul>
					</div>
				<!--div class="mui-slider-indicator">
					<div class="mui-indicator mui-active"></div>
					<div class="mui-indicator"></div>
					<div class="mui-indicator"></div>
				</div-->
			</div>
		</div>
	</body>
	<script src="js/mui.min.js"></script>
	<script>
		mui.init();
		mui.ready(function() {
			var slider = document.getElementById('Gallery');
			var group = slider.querySelector('.mui-slider-group');
			var items = mui('.mui-slider-item', group);
			//克隆第一个节点
			var first = items[0].cloneNode(true);
			first.classList.add('mui-slider-item-duplicate');
			//克隆最后一个节点
			var last = items[items.length - 1].cloneNode(true);
			last.classList.add('mui-slider-item-duplicate');
			//处理是否循环逻辑，若支持循环，需支持两点：
			//1、在.mui-slider-group节点上增加.mui-slider-loop类
			//2、重复增加2个循环节点，图片顺序变为：N、1、2...N、1
			var sliderApi = mui(slider).slider();

			function toggleLoop(loop) {
					if (loop) {
						group.classList.add('mui-slider-loop');
						group.insertBefore(last, group.firstChild);
						group.appendChild(first);
						sliderApi.refresh();
						sliderApi.gotoItem(0);
					} else {
						group.classList.remove('mui-slider-loop');
						group.removeChild(first);
						group.removeChild(last);
						sliderApi.refresh();
						sliderApi.gotoItem(0);
					}
				}
			//获取预约数量
			mui.post("/api",{"method":"nvo_bill.GetListCount","params":[]},function(data){
				if(data.Error == null) {
						mui("#span_count")[0].innerHTML=data.Result;
					} else {
						//Error 系统返回错误信息
						mui.toast(data.Error.Message + "(" + data.Error.Code.toString() + ")");
					}
			},"json");
		});
	</script>

</html>
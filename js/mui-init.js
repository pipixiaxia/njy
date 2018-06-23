mui.init({
	swipeBack: false,
});
//主界面和侧滑菜单界面均支持区域滚动；
mui('#offCanvasSideScroll').scroll();
mui('#offCanvasContentScroll').scroll();
//实现ios平台的侧滑关闭页面；
if(mui.os.plus && mui.os.ios) {
	offCanvasWrapper[0].addEventListener('shown', function(e) { //菜单显示完成事件
		plus.webview.currentWebview().setStyle({
			'popGesture': 'none'
		});
	});
	offCanvasWrapper[0].addEventListener('hidden', function(e) { //菜单关闭完成事件
		plus.webview.currentWebview().setStyle({
			'popGesture': 'close'
		});
	});
}
/**
 * 所有js文件共享
 */

//将图片转为base64
function convertImgToBase64(url, callback, outputFormat) {
	var canvas = document.createElement('canvas'),
		　　ctx = canvas.getContext('2d'),
		　　img = new Image;
	img.onload = function() {　　
		canvas.height = img.height;　　
		canvas.width = img.width;　　
		ctx.drawImage(img, 0, 0);　　
		var dataURL = canvas.toDataURL(outputFormat || 'image/jpeg');　　
		callback.call(this, dataURL);
		canvas = null;
	};
	img.src = url;
}

//将日期y.m.d转为日期y年m月d日
function dateArrToDate(date) {
	var dateArr = date.split(".");
	var y = dateArr[0];
	var m = dateArr[1];
	var d = dateArr[2];
	return y + "年" + m + "月" + d + "日";
}

//获取yyyy.mm.dd日期
function getDotDate() {
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	m = m < 10 ? "0" + m : m;
	d = d < 10 ? "0" + d : d;
	return y + "." + m + "." + d;
}

//获取yyyy年mm月dd日 日期
function getNowDate() {
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	m = m < 10 ? "0" + m : m;
	d = d < 10 ? "0" + d : d;
	return y + "年" + m + "月" + d + "日";
}

function getHourMinute() {
	var date = new Date();
	var h = date.getHours();
	var m = date.getMinutes();
	h = h < 10 ? "0" + h : h;
	m = m < 10 ? "0" + m : m;
	return h + ":" + m;
}

//当获取不到样式的时候试试这个
function getRealStyle(obj, styleName) {
	var realStyle = null;
	if(obj.currentStyle) {
		realStyle = obj.currentStyle[styleName];
	} else if(window.getComputedStyle) {
		realStyle = window.getComputedStyle(obj, null)[styleName];
	}
	return realStyle;
}

//将2008/9/24 00:00:00转换为2008/09/24
function convertToDotDate(date) {
	var ymd = date.split(" ")[0];
	var ymdarr = ymd.split("/");
	for(var i = 0; i < ymdarr.length; i++) {
		ymdarr[i] = ymdarr[i] < 10 ? "0" + ymdarr[i] : ymdarr[i];
	}
	return ymdarr.join(".");
}

function getStep(f, d, k, l, h) {
	var j = d - f;
	if(l == 0 || j == 0) {
		k && k(d);
		return
	}
	l = l || 300;
	h = h || 30;
	var g = l / h;
	var c = j / g;
	var e = 0;
	var b = window.setInterval(function() {
		if(e < g - 1) {
			f += c;
			k && k(f, b);
			e++
		} else {
			k && k(d, b);
			window.clearInterval(b)
		}
	}, h)
};

//阻止滑动textarea时屏幕上下滑动
window.addEventListener('touchmove', function(e) {
	var target = e.target;
	if(target && target.tagName === 'TEXTAREA') {
		e.stopPropagation();
	}
}, true);

//显示地图并获取地名和经纬度
function getMap(id, callback) {
	var map = new BMap.Map(id);
	var point = new BMap.Point();
	map.centerAndZoom(point, 12);
	map.disableDoubleClickZoom()

	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r) {
		if(this.getStatus() == BMAP_STATUS_SUCCESS) {
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);

			//根据经纬度解析地址
			var myGeo = new BMap.Geocoder();
			myGeo.getLocation(new BMap.Point(r.point.lng, r.point.lat), function(result) {
				if(result) {
					callback && callback({
						"addr": result.address,
						"lng": r.point.lng,
						"lat": r.point.lat
					})
				}
			});
		} else {
			alert("获取位置失败");
		}
	});
}

//根据经纬度设置地图
function setMap(id, lng, lat) {
	var map = new BMap.Map(id);
	map.centerAndZoom(new BMap.Point(), 12);
	map.enableScrollWheelZoom(true);
	map.clearOverlays();
	var new_point = new BMap.Point(lng, lat);
	var marker = new BMap.Marker(new_point);
	map.addOverlay(marker);
	map.panTo(new_point);
}

//***************************图片处理******************************
//根据本地图片地址转为base64
function imgUrl2Base64(file, i, callback) {
	var bitmap = new plus.nativeObj.Bitmap();
	bitmap.load(file, function() {
		compressImg(bitmap.toBase64Data(), 600, function(imgData) {
			callback && callback(imgData);
		});
	}, function(err) {
		alert("bitmap加载图片失败" + err)
	})
}

//获取图片方向
function getPhotoOrientation(img) {
	var orient;
	EXIF.getData(img, function() {
		orient = EXIF.getTag(this, 'Orientation');
	});
	return orient;
}

//压缩旋转图片
function compressImg(imgData, maxHeight, onCompress) {
	if(!imgData) return;
	onCompress = onCompress || function() {};
	var canvas = document.createElement('canvas');
	var img = new Image();
	img.onload = function() {
		var width = img.width;
		var height = img.height;
		if(width > height) {
			if(width > 1920) {
				height = Math.round(height *= 1920 / width);
				width = 1920;
			}
		} else {
			if(height > 1920) {
				width = Math.round(width *= 1920 / height);
				height = 1920;
			}
		}
		var orient = getPhotoOrientation(img);
		var ctx = canvas.getContext("2d");
		//解决ios照片旋转
		if(orient == 6) {
			canvas.width = height;
			canvas.height = width;
			ctx.translate(height / 2, width / 2);
			ctx.rotate(90 * Math.PI / 180);
			ctx.drawImage(img, 0 - width / 2, 0 - height / 2, width, height);
		} else {
			canvas.width = width;
			canvas.height = height;
			ctx.drawImage(img, 0, 0, width, height);
		}
		onCompress(canvas.toDataURL("image/jpeg", 0.8));
	};
	img.src = imgData;
}
//***************************图片处理******************************

//******************************扫码*********************************
var saoma = {
	scan: null,
	start: function(cameraBoxId, saveToGallery, callback) { //扫码开始
		var filter;
		var styles = {
			frameColor: "#ccc",
			scanbarColor: "#ccc",
			background: "#000"
		};
		saoma.scan = new plus.barcode.Barcode(cameraBoxId, filter, styles);
		saoma.scan.onmarked = function(type, result, file) { //扫码成功
			if(saveToGallery) {
				//保存到相册
				plus.gallery.save(file, function() {
					mui.toast("保存到相册");
					saoma.scan.close();
				});
			}
			callback && callback(result);
		};
		saoma.scan.start({
			conserve: true,
			vibrate: true
		});
	},
	end: function() { //结束扫码
		saoma.scan.close();
	},
	fromGallery: function(callback) { //从相册中打开
		plus.gallery.pick(function(path) {
			plus.barcode.scan(path, function(type, code, file) {
				callback(code)
			});
		});
	},
	openLamp: function(flag) {
		saoma.scan.setFlash(flag);
	}
}
//******************************扫码*********************************

//**************两层数组去重****************
function getDirrerent2(data, n) { //data代表两层数组[[]], n代表里层数据的索引
	var arr = [];
	for(var i = 0; i < data.length; i++) {
		for(var j = 0; j < arr.length; j++) {
			if(data[i][n] == arr[j]) {
				break;
			}
		}
		if(arr.length == j) {
			arr[arr.length] = data[i][n];
		}
	}
	return arr;
}
//**************两层数组去重****************

//******************等待框**********************
function openWait() {
	plus.nativeUI.showWaiting('', {
		background: "#ccc"
	});
}

function closeWait() {
	plus.nativeUI.closeWaiting();
}
//******************等待框**********************

//***************使text输入框只能输入数字*******
function getinputNumber(dom) {
	var value = $(dom).val();
	if(/^(\d+)(\.)?(\d+)?$/g.test(value)) {
		$(dom).val(value);
	} else {
		$(dom).val(value.slice(0, value.length - 1))
	}
}
//***************使text输入框只能输入数字*******
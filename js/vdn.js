/*简化ajax操作,统一返回json格式，成功触发f_ok函数，错误则触发f_error函数*/
var vdn = {
	APIURL: "/api",
	URL: "", //每次都会被清空
	async: true //异步
};

(function(a, $) {
	//GET API
	a.get = function(data, f_ok, f_error) {
		return a.ajax("GET", 'application/x-www-form-urlencoded', data, f_ok, f_error);
	}
	//POST API
	a.post = function(data, f_ok, f_error) {
		return a.ajax("POST", 'application/json', JSON.stringify(data), f_ok, f_error);
	}
	//ajax提交窗体
	a.submit = function(formid, data, f_ok, f_error) {
		var str = $('#' + formid).serialize();
		str = "method=" + encodeURIComponent(data.method) + "&params=" + encodeURIComponent(data.params) + "&" + str;
		return a.ajax("POST", 'application/x-www-form-urlencoded', str, f_ok, f_error);
	}
	//对form的组件值进行初始化 JSON格式{"id":"value","id":"value"...}
	a.iniform = function(data) {
		$.each(data.Result, function(name, value) {
			var obj = $("#" + name);
			if(obj.length > 0) {
				obj.val(value);
				//触发选择框的change事件，以便联动数据
				if($("#" + name).prop("tagName") == "SELECT") {
					obj.trigger("change");
				}
			}
		});
	}
	a.ajax = function(Type, CType, Data, f_ok, f_error) {
		if(a.URL.length == 0) {
			a.URL = a.APIURL;
		}
		a.ajaxEx(a.URL, Type, CType, Data, f_ok, f_error, a.async);
		//clear
		a.URL = "";
	}
	a.ajaxEx = function(URL, Type, CType, Data, f_ok, f_error, Async) {
		try {
			var vAjax = $.ajax({
				url: URL,
				async: Async,
				type: Type,
				data: Data,
				dataType: 'json',
				contentType: CType,
				//timeout: 10000, //超时10秒
				timeout: 0, //永不超时
				success: function(data, status, xhr) {
					if(data.Error == null) {
						f_ok(data);
					} else {
						f_error(data.Error);
					}
				},
				error: function(xhr, error, exception) {
					//ajax 发生错误 
					f_error({
						Message: error + ":" + exception.toString(),
						Code: -9099
					});
				},
				complete: function(xhr, status) { //请求完成后最终执行参数
					//超时,status:success,error,timeout...
					if(status == 'timeout') { 
						vAjax.abort();　　　　　
						//触发错误
						f_error({
							Message: error + ":timeout",
							Code: -9098
						});
					}　　
				}
			});
		} catch(e) {
			//代码发生异常
			f_error({
				Message: e.name + ":" + e.message,
				Code: e.number
			});
		}
	}
}(vdn, jQuery))
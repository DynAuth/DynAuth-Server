var auth={
	DyAuthKey:0,
	urlBase:"../DyAuth/",//该处应该填DyAuth的服务器地址，不然会出错
	//被外部调用的函数
	work:function (domain , user_name) {
		if( user_name=="" || domain=="" ) return;
		auth.check(domain , user_name);
	},
	//弹出验证页面
	popCheckWindow:function(){
		var url = auth.urlBase+"DyAuthPop.php";
		var windowHeight = window.screen.height;
		var windowWidth = window.screen.width;
		var features = "location=no,fullscreen=no,channelmode=no,toolbar=no,width=400,height=400,top=windowHeight/2-200,left=windowWidth/2-200";
		window.open(url,'DyAuth verification',features);
	},
	//被外部调用的函数，用来获得DyAuth key
	getKey:function () {
		return auth.DyAuthKey;
	},
	//检查当前用户是否开通DyAuth验证，如果有就弹出窗口，并存下DyAuth key
	check:function (domain , user_name) {
		$.post(auth.urlBase+'checkUser.php', { domain: domain , user_name: user_name }, function(data, textStatus, xhr) {
			console.log(data);
			ret = eval("("+ data +")");
			if(!ret || ret["pass"]!=1) return;

			auth.DyAuthKey = ret["key"];
			auth.popCheckWindow();
		});
	}
}

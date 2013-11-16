var auth={
	work:function (user_name) {
		auth.check(getDomain(),user_name);
	},
	createIframe:function () {
		var old = document.getElementsByTagName('iframe');
		if(old[0]) old[0].parentNode.removeChild(old[0]);

		var div=document.createElement("div");
		var url = "DyAuthPop.php";
		var style = "frameborder:0;width:100%;height:300px;";
		var iframe="<iframe src=\""+url+"\" style=\""+style+"\"></iframe>";
		var root = document.getElementsByTagName('form')[0];
		div.innerHTML=iframe;
		root.appendChild(div);
	},
	check:function (domain , user_name) {
		if(user_name=="") return ;
		$.post('checkUser.php', { domain: domain , user_name: user_name }, function(data, textStatus, xhr) {
			if(data==1) auth.createIframe();
		});
	}
}
function getDomain(){
	return "amazon.com";//===========
}
$(document).ready(function(){
	$("#inputUsername").blur(function(){
		inputUsername=$("#inputUsername").val();
		auth.work(inputUsername);
	});
});
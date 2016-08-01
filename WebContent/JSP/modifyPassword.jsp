<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<style type="text/css">
.main{
	margin: auto;
	font-family: "微软雅黑";
	font-size: 16px;
	height: 480px; 
	background-color: #6699ff; 
}
.font{
	width:80px;
	height:35px;
	background-color:#66ccff;
	font-family: "微软雅黑";
	font-size: 15px;
}
.main li{
	list-style-type: none;
	line-height: 50px;
	text-align: center;
}
</style>
<script type="text/javascript">
function save(){
	var usedPassword=document.getElementById("usedPassword").value;
	var newPassword=document.getElementById("newPassword").value;
	var confirmPassword=document.getElementById("confirmPassword").value;
	if(usedPassword==""){
		alert("请输入旧密码！");
		return false;
	}else if(newPassword==""){
		alert("请输入新密码！");
		return false;
	}else if(confirmPassword==""){
		alert("请输入确认密码！");
		return false;
	}
	else{
		document.getElementById("form").submit();
		}
}

function cancel(){
	document.getElementById("userName").value="";
	document.getElementById("usedPassword").value="";
	document.getElementById("newPassword").value="";
	document.getElementById("confirmPassword").value="";
	document.getElementById("userName").focus();
}
</script>
</head>
<body>
	<div class="main">
		<form action="../ModifyPassword" name="form" method="post">
			<ul>
			<li>修改密码</li>
			<li>请输入用户名：<input type="text" name="userName"  id="userName" style="width:150px;height:25px;"></li>
			<li>请输入旧密码：<input type="password" name="usedPassword" id="usedPassword" style="width:150px;height:25px;"></li>
			<li>请输入新密码：<input type="password" name="newPassword" id="newPassword" style="width:150px;height:25px;"></li>
			<li>请确认新密码：<input type="password" name="confirmPassword" id="confirmPassword" style="width:150px;height:25px;"></li>
			<li><input type="submit" value="保存密码" class="font" onclick="save()">　　　　　　　
			<input type="button"value="取消" class="font" onclick="cancel()"></li>
			</ul>
		</form>
	</div>
</body>
</html>
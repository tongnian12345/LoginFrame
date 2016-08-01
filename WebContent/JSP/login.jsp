<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录界面</title>
<style>
body {
	background-color: #66ccff;
}

.main {
	width: 400px;
	height: 250px;
	background-color: #3399ff;
	margin: auto;
	font-family: "微软雅黑";
}

.text1 {
	width: 300px;
	height: 30px;
	margin-top: 50px;
	margin-left: 75px;
	font-size: 16px;
}

.text2 {
	width: 300px;
	height: 30px;
	margin-top: 20px;
	margin-left: 75px;
	font-size: 16px;
}
.font{
	width: 70px; 
	height: 30px;
	font-family: "微软雅黑";
	font-size: 15px;
;}
.text3 {
	width: 300px;
	height: 30px;
	margin-top: 40px;
	margin-left: 93px;
}
</style>
<script>
	
<%-- 非空验证 --%>
	function submitBtn() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if (username == "") {
			alert("用户名不能为空！！！");
			document.getElementById("username").focus();
			return false;
		}
		if (password == "") {
			alert("密码不能为空！！！");
			document.getElementById("password").focus();
			return false;
		}
		return true;
	}
	//重置账户密码
	function cancelBtn() {
		document.getElementById("username").value = "";
		document.getElementById("password").value = "";
		document.getElementById("username").focus();
	}

	var mouseX, mouseY;
	var objX, objY;
	var isDowm = false; //是否按下鼠标 
	function mouseDown(obj, e) {
		obj.style.cursor = "move";
		objX = main.style.left;
		objY = main.style.top;
		mouseX = e.clientX;
		mouseY = e.clientY;
		isDowm = true;
	}
	function mouseMove(e) {
		var div = document.getElementById("main");
		var x = e.clientX;
		var y = e.clientY;
		if (isDowm) {
			div.style.left = parseInt(objX) + parseInt(x) - parseInt(mouseX)
					+ "px";
			div.style.top = parseInt(objY) + parseInt(y) - parseInt(mouseY)
					+ "px";
		}
	}
	function mouseUp(e) {
		if (isDowm) {
			var x = e.clientX;
			var y = e.clientY;
			var div = document.getElementById("main");
			div.style.left = (parseInt(x) - parseInt(mouseX) + parseInt(objX))
					+ "px";
			div.style.top = (parseInt(y) - parseInt(mouseY) + parseInt(objY))
					+ "px";
			mouseX = x;
			rewmouseY = y;
			main.style.cursor = "default";
			isDowm = false;
		}
	}
</script>
</head>
<body>
	<%
		if (application.getAttribute("username") == null) {
			application.setAttribute("username", "admin");
			application.setAttribute("password", "admin");
		}
		session.invalidate();
	%>

	<div class="main" id="main"
		style="top: 150px; left: 460px; position: absolute;"
		onmousedown="mouseDown(this,event)" onmousemove="mouseMove(event)"
		onmouseup="mouseUp(event)">
		<form name="loginForm" action="CheckLogin" method="post" onsubmit="return submitBtn()">
			<table>
				<div class="text1">
					用户名：<input type="text" id="username" name="username" value=""
						style="width: 150px; height: 25px;">
				</div>
				<div class="text2">
					密　码：<input type="password" id="password" name="password" value=""
						style="width: 150px; height: 25px;">
				</div>
				<div class="text3">
					<input type="submit" value="登录"  class="font">　　　
					<input type="button" value="取消" onclick="cancelBtn()" class="font">
				</div>
			</table>
		</form>
	</div>
</body>
</html>
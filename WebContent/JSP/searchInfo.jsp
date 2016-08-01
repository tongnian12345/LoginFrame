<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息查询</title>
<style type="text/css">
.main{
	font-family: "微软雅黑";
	font-size: 18px;
	text-align: center;
	height: 480px; 
	padding-top:50px;
	background-color: #6699ff; 
}
.main1 {
	height: 50px;
	margin-top: 30px;
}
.main2 {
	height: 80px;
	margin-top: 20px;
	margin-left: 250px;
}
td{
	height:40px;
}
</style>
<script type="text/javascript">
		window.onload = function() {
		var url = window.location.search;
		if (url.indexOf("?") != -1) {
			var str = url.substr(1)
			strs = str.split("&");
			var name = strs[0].split("=");
			var age = strs[1].split("=");
			var classname = strs[2].split("=");

			var username1 = document.getElementById("username1");
			var age1 = document.getElementById("age1");
			var class1 = document.getElementById("class1");
			username1.innerHTML = name[1];
			age1.innerHTML = age[1];
			class1.innerHTML = classname[1];
		}
}	
		
	function found() {
		var userName = document.getElementById('username').value;
		if (userName == "") {
			alert("请输入学生姓名");
			return false;
		} else {
			document.getElementById("form").submit();
			return true;
		}
	}
</script>
</head>
<body>
	<div class="main">
			<h3>学生信息查询功能</h3>
				<form action="../Servlet" id="form" method="post">
					<div class="main1">
						姓名：<input type="text" id="username" name="username"> <input
							type="button" id="chaxun" value="查询"  onclick="found()">
					</div>
					<div class="main2">
						<table border="1" cellspacing="0" width="400px">
							<tr>
								<td>姓名</td>
								<td>年龄</td>
								<td>班级</td>
							</tr>
							<tr>
								<td id="username1"></td>
								<td id="age1"></td>
								<td id="class1"></td>
							</tr>
						</table>
					</div>
				</form>
	</div>
</body>
</html>
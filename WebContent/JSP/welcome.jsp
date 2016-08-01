<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<style type="text/css">
.main{
	margin-top:20px;
	font-family: "微软雅黑";
	font-size: 18px;
	height:480px;
	background-color: #6699ff; 
	padding-left: 100px;
}
</style>
</head>
<body>
<%!
	int total;
%>
<%
		if(application.getAttribute("total")==null){
			application.setAttribute("total", 0);
		}
		total=(Integer)application.getAttribute("total");
		total++;
	
		application.setAttribute("total", total);
%>
	<div class="main">
		<br>　　欢迎<font color="red" >admin</font>来到首页
		<br>服务器开启至今，该网站共被访问了<font size="12" color="red"><%=total %></font>次。
		<br>客户提交信息的方式：<%=request.getMethod() %>
		<br>使用的协议：<%=request.getProtocol() %>
		<br>获取发出请求字符串的客户端地址：<%=request.getRequestURL() %>
		<br>获取提交数据的客户端IP地址：<%=request.getRemoteAddr() %>
		<br>获取服务器端口号：<%=request.getServerPort() %>
		<br>获取服务器的名称：<%=request.getServerName() %>
		<br>获取客户端的主机名：<%=request.getRemoteHost() %>
		<br>获取客户端所请求的脚本文件的文件路径：<%=request.getServletPath() %>
		<br>获得Http协议定义的文件头信息Host的值：<%=request.getHeader("host") %>
		<br>获得Http协议定义的文件头信息User-Agent的值：<%=request.getHeader("user-agent") %>
		<br>获得请求文件的绝对路径：<%=request.getRealPath("LoginFrame.jsp") %>
		<br>真实路径：<%=request.getRealPath("/JSP/login.jsp") %>
	</div>
</body>
</html>
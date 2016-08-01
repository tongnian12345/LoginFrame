<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录失败界面</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
}
 #mainDiv{  
  width:548px;
  height:350px;
 
  position:relative;  /*相对定位*/
  background:#EEEEEE; /*背景样式*/
  border:1px solid #EEE000; /*层的边框样式*/

 }
 </style>
</head>
<body>
<%!
   			String showMsg="登录失败！";

			Date date=new Date();	//获取日期对象
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-HH-dd HH:mm:ss");	//设置日期时间格式
			String today=sdf.format(date);	//获取系统当前日期
%>
<div id="mainDiv" class="box" style="top:120px;left:400px;">
	<span ><%= showMsg %></span>
	<span><a href ='JSP/login.jsp'>返回登录</a></span><!-- 跳转会登录界面 -->
	<br>
	 当前时间是：<%=today%><%--输出系统时间 --%>
</div>
</body>
</html>
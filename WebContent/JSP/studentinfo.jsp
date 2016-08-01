<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	}
body{
	font-family:"微软雅黑";
	font-size:18px;
	padding-top:120px;
	padding-left:100px;
	padding-right: 50px;
}
 
 #myTable{
		width:100%;	
		text-align:center;
		border-right:1px solid #000000;
		border-bottom:1px solid #000000
	}
#myTable td,th{
		text-align:center;
		width:100px;
		height:22px;
		border-left:1px solid #000000;
		border-top:1px solid #000000
	}
#myTable th{
		background:#EEEEEE;
	}
a:link,a:visited{
	background-color:#BC8F8F;
	color:white;
	}
a:hover{
	color:#FFFF00;
	background-color:#0099ff;
	cursor: pointer;
	}
</style>
<script type="text/javascript">

		var lastId=-1;
		function showUpdate(num){
	 		if(lastId!=-1){
		 hiddenUpdate(lastId);
	 }
	 lastId=num;
	 //显示
	 hiddenShow("h",num,"");
	 //隐藏
	 hiddenShow("s",num,"none");
}

function hiddenUpdate(num){
	 //显示
	 hiddenShow("h",num,"none");
	 //隐藏
	 hiddenShow("s",num,"");
}

function hiddenShow(type,num,hs){
	 document.getElementById(type+"_id"+num).style.display = hs;
	 document.getElementById(type+"_name"+num).style.display = hs;
	 document.getElementById(type+"_age"+num).style.display = hs;
	 document.getElementById(type+"_classname"+num).style.display = hs;
	 document.getElementById(type+"_sex"+num).style.display = hs;
	 document.getElementById(type+"_nation"+num).style.display = hs;
	 document.getElementById(type+"_place"+num).style.display = hs;
	 document.getElementById(type+"_update"+num).style.display = hs;
}
function save(num){
	var name=document.getElementById("d1").value;
	if(name==""){
		alert("姓名不能为空");
		return false;
	}
	var age=document.getElementById("d2").value;
	var reg=/^[1-9]\d*$/;
	if(!reg.test(age)){
		alert("年龄只能为整数");
		return false;
	}
	if(confirm("您确认要保存此修改？")){
		document.getElementById("selValue").value=num;
		document.getElementById("types").value="save";
		document.getElementById("myForm").submit();
	}
	
}
function del(num){
	if(confirm("您确认要删除此条信息？")){
		document.getElementById("selValue").value=num;
		document.getElementById("types").value="del";
		document.getElementById("myForm").submit();
	}
	
}
</script>
</head>
<body>
<%
		ArrayList<studentBean>  student=(ArrayList<studentBean>)new dataServlet().getStudentdata();
 %>
 </br><h2 style="text-align:center;">学生信息管理</h2>
 <br>
  <form action="<%=request.getContextPath()%>/student" id="myForm" name="form" method="post"> 
 <table id="myTable" cellspacing=0>
  <tr>
  <th>学号 <input type="hidden" value="" name="stuId" id="selValue" /></th>
  <th>姓名 <input type="hidden" value="" name="types" id="types" ></th>
  <th>年龄</th>
  <th>班级</th>
  <th>性别</th>
  <th>民族</th>
  <th>出生地</th>
  <th>操作</th>
  </tr>
  <%
   		if(student==null){
  %>
  <tr>
   <td id="id"></td>
   <td id="name"></td>
   <td id="age"></td>
   <td id="classname"></td>
   <td id="sex"></td>
   <td id="nation"></td>
   <td id="place"></td>
   <td id="op"></td>
  </tr>
 <%}
   else{
	   for(int i=0;i<student.size();i++){
		   studentBean std=student.get(i);
	  
  %>
<tr>
 <td id="id">
 <div id="s_id<%=std.getID()%>"><%=std.getID() %></div>
 <div id="h_id<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="id<%=std.getID()%>" value="<%=std.getID()%>"/></div>
 </td>
<td id="name">
 <div id="s_name<%=std.getID()%>"><%=std.getName() %></div>
 <div id="h_name<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="name<%=std.getID()%>" value="<%=std.getName()%>" id="d1"/></div>
 </td>
 <td id="age">
 <div id="s_age<%=std.getID()%>"><%=std.getAge() %></div>
 <div id="h_age<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="age<%=std.getID()%>" id="d2" value="<%=std.getAge()%>"/></div>
 </td>
 <td id="classname">
 <div id="s_classname<%=std.getID()%>"><%=std.getClassname() %></div>
 <div id="h_classname<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="classname<%=std.getID()%>" value="<%=std.getClassname()%>"/></div>
 </td>
 <td id="sex">
 <div id="s_sex<%=std.getID()%>"><%=std.getSex() %></div>
 <div id="h_sex<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="sex<%=std.getID()%>" value="<%=std.getSex()%>"/></div>
 </td>
 <td id="nation">
 <div id="s_nation<%=std.getID()%>"><%=std.getNation() %></div>
 <div id="h_nation<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="nation<%=std.getID()%>" value="<%=std.getNation()%>"/></div>
 </td>
 <td id="place">
 <div id="s_place<%=std.getID()%>"><%=std.getPlace() %></div>
 <div id="h_place<%=std.getID() %>" style="display:none;"><input type="text" style="width:90%" name="place<%=std.getID()%>" value="<%=std.getPlace()%>"/></div>
 </td>
 <td id="op">
 <div id="s_update<%=std.getID()%>"><a><u onclick="showUpdate(<%=std.getID()%>)">修改</u></a>&nbsp;&nbsp;
				<a><u onclick="del(<%=std.getID()%>)">删除</u></a></div>
 <div  id="h_update<%=std.getID()%>" style="display:none;"><a><u onclick="save(<%=std.getID()%>)">保存</u></a>&nbsp;&nbsp;
				<a><u onclick="hiddenUpdate(<%=std.getID()%>)">取消</u></a></div>
 </td>
</tr>
<%
	}	
} %>
 </table>
 </form>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>  
    <form method="post" action="UserServlet?method=Seller">
    <h1 align="center">后台登录</h1>
<table align="center">
<tr>
<td colspan="2"><%if(request.getAttribute("N")!=null){%>Y:<%=request.getAttribute("N") %><%} %></td>
</tr>
<tr>
	<td class="bk">账&nbsp;&nbsp;号：</td>		
	<td><input type="text" class="t1" name="id" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
	<td class="bk">密&nbsp;&nbsp;码：</td>
	<td><input type="password" class="t1" name="password" /></td>
</tr>
<tr>
	<script src="login.js"></script>
	<td align="center" colspan="2"><input class="n" type="submit" value="登陆" onClick="dl();" /></td>
</tr>
</table>
</form>

  </body>
</html>

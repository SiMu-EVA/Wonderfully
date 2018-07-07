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
  	<link rel="stylesheet" type="text/css" href="css/menu.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/global.css" media="all">
  <body>  
  <div class="global" style="padding: 50px"><center><div  style="width: 400px;height: 400px;">
  	<form method="post" action="UserServlet?method=login">
    <h1 align="center">登录</h1>
	<table align="center">
	</tr>
	<tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td colspan="2"><%if(request.getAttribute("Y")!=null){%>Y:<%=request.getAttribute("Y") %><%} %></td>
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
	<td colspan="2"><%if(request.getAttribute("N")!=null){%>N:<%=request.getAttribute("N") %><%} %></td>
	</tr>
	</tr>
	<tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<script src="login.js"></script>
	<td align="center" colspan="2"><input class="n" type="submit" value="登陆〉〉" onClick="dl();" /></td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td align="center" colspan="2" style="color: #000">没有账号？<a class="white" href="User/register.jsp">注册</a></td>
	</tr>
	</table>
	
	</form></div>
	<a href="Seller/Slogin.jsp">后台登录</a></center>
  </div>
<div class="nav4"><nav><div id="nav4_ul" class="nav_4">
<ul class="box">
	<li><a href="index.jsp"><span>首页</span></a></li>
	<li><a href="javascript:;" class=""><span>分类</span></a>
		<dl>
			<dd><a href="User/clas.jsp?clas=TUSHU"><span>TUSHU</span></a></dd>
			<dd><a href="User/clas.jsp?clas=GEHU"><span>GEHU</span></a></dd>
			<dd><a href="User/clas.jsp?clas=JIAJU"><span>JIAJU</span></a></dd>
			<dd><a href="User/clas.jsp?clas=FUSHI"><span>FUSHI</span></a></dd>
			<dd><a href="User/clas.jsp?clas=MEISHI"><span>MEISHI</span></a></dd>
			<dd><a href="User/clas.jsp?clas=SHIPIN"><span>SHIPIN</span></a></dd>
		</dl>
	</li>
	<li><a href="javascript:;" class=""><span>个人</span></a>
		<dl>
			<dd><a href="User/users.jsp"><span>个人中心</span></a></dd>
			<dd><a href="User/car.jsp"><span>购物车</span></a></dd>
		</dl>
	</li>
</ul></div></nav></div>
<script src="css/nav4.js"></script>
<script type="text/javascript">nav4.bindClick(document.getElementById("nav4_ul").querySelectorAll("li>a"), document.getElementById("nav4_masklayer"));</script>

  </body>
</html>

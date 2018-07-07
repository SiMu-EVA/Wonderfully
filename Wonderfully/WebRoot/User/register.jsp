<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<link rel="stylesheet" type="text/css" href="css/menu.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/global.css" media="all">
  <body>
  <div class="global" style="padding: 50px"><center><div  style="width: 400px;height: 400px;">
  
  <form action="UserServlet?method=register" method="post" accept-charset="UTF-8">
    <center>
<h1>欢迎您的加入！</h1>
<table>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
	<td class="bk">用&nbsp;户&nbsp;名：</td>
	<td><input type="text" class="t1" name="name" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
	<td class="bk">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
	<td align="center"  class="bk">
		<input type="radio" name="sex" id="sex1" checked="checked" value="男">男</input>&nbsp;&nbsp;
		<input type="radio" name="sex" id="sex2" value="女">女</input>
	</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
	<td class="bk">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
	<td><input type="text" name="phone" class="t1"  /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
	<td class="bk">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
	<td><input type="email" name="email" class="t1" placeholder="xxx@qq.com" /></td>
</tr>
<tr>
	<td class="bk">地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	<td><input type="text" class="t1" name="address" /></td>
</tr>
<tr>
	<td class="bk">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
	<td><input type="password" class="t1" name="pwd1" /></td>
</tr>
<tr>
</tr>
<tr>
	<td class="bk">确认密码：</td>
	<td><input type="password" class="t1" name="pwd2" /></td>
</tr>
<tr>
</tr>
<tr align="center">
	<td><input type="submit" class="n" value="注册" onClick="one()" /></td>
    <td><input type="reset" class="n" value="清空" /></td>
</tr>
</table>
</center>	
</form>
  
  </div></center></div>
  
    <div class="nav4"><nav><div id="nav4_ul" class="nav_4">
<ul class="box">
	<li><a href="index.jsp"><span>首页</span></a></li>
	<li><a href="javascript:;" class=""><span>分类</span></a>
		<dl>
			<dd><a href=""><span>TUSHU</span></a></dd>
			<dd><a href=""><span>GEHU</span></a></dd>
			<dd><a href=""><span>JIAJU</span></a></dd>
			<dd><a href=""><span>FUSHI</span></a></dd>
			<dd><a href=""><span>MEISHI</span></a></dd>
			<dd><a href=""><span>WENCHUANG</span></a></dd>
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

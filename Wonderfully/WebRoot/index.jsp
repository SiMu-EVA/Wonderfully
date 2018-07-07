<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/menu.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/global.css" media="all">
  </head>
  <body>
  <div class="global">
  
  <center><div class="login" >
  	<%if(session.getAttribute("username")==null){
    	%>你好！游客,请<a href="User/login.jsp">登录</a>，没有账号？<a href="User/register.jsp">注册</a><%}%>
  </div></center>
  
      	<center>
      	<table style="width: 800px;padding: 15px;">
      	<tr>
      	<td><a href="User/product.jsp?Commodity_ID=1"><img style="width: 400px" alt="《白话史记》| 全方位解读”史家之绝唱，无韵之离骚” 经典图书" src="img/1.jpg"></a></td>
      	<td><a href="User/product.jsp?Commodity_ID=2"><img style="width: 400px" alt="平物苎麻手工袜 | 非遗工艺，手工织造，干爽，透气，抑菌，防脚臭" src="img/2.jpg"></a></td>
      	</tr>
      	<tr>
      	<td><a href="User/product.jsp?Commodity_ID=3"><img style="width: 400px" alt="多功能魔术衣架2个装，1秒收衣的折叠衣架" src="img/3.jpg"></a></td>
      	<td><a href="User/product.jsp?Commodity_ID=4"><img style="width: 400px" alt="Love钻石锁骨链 | 14道匠心工匠，大师手作。" src="img/4.jpg"></a></td>
      	</tr>
      	<tr>
      	<td><a href="User/product.jsp?Commodity_ID=5"><img style="width: 400px" alt="superga 小白鞋 | 小白鞋鼻祖，时尚圈人手一双" src="img/5.jpg"></a></td>
      	<td><a href="User/product.jsp?Commodity_ID=5"><img style="width: 400px" alt="Love钻石锁骨链 | 14道匠心工匠，大师手作。" src="img/2.jpg"></a></td>
      	</tr>
      	</table>
    	</center>
  
  </div>
    <br>

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

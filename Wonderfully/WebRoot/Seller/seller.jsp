<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'seller.jsp' starting page</title>
    
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
    <a href="User/out.jsp">退出登录</a><br>
    <center>
    <%if(session.getAttribute("root")==null){
    response.sendRedirect("Slogin.jsp");
    }else{
    	%>
    		<h1>欢迎您，<%=session.getAttribute("root") %></h1><br><br>
   			<a href="Seller/user.jsp">查看用户信息</a><br><br>
   			<a href="Seller/Commodity.jsp">查看商品信息</a><br><br>
    		<a href="Seller/AddCommodity.jsp">添加商品信息</a><br><br>
    	<%
     }%>
    </center>
  </body>
</html>

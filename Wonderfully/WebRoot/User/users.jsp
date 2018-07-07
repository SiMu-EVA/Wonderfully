<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'users.jsp' starting page</title>
    
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
  <div class="global">
  
  <center style="padding: 50px;"><h1>你好！<%if(session.getAttribute("username")==null){
    	%>游客,请<a href="User/login.jsp">登录</a>，没有账号？<a href="User/register.jsp">注册</a></h1><%}else{%>
    	<%=session.getAttribute("username") %>(<%=session.getAttribute("id") %>)</h1><a href="User/out.jsp">退出登录</a><hr/>
    	<%
    	Connection conn=null;
		Statement stm=null,stm1=null;
		ResultSet rs=null,rs1=null;
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			stm1=conn.createStatement();
			String sql="SELECT Name,Sex,Phone,Mail,Address FROM customer WHERE Customer_ID="+session.getAttribute("id");
			rs=stm.executeQuery(sql);
			rs.next();
			%>
    		<table style="width: 600px">
    			<tr>
    				<td>&nbsp;</td>
    			</tr>
    			<tr>
    				<td>ID：</td>
    				<td><%=session.getAttribute("id") %></td>
    				<td>昵称：</td>
    				<td><%=rs.getString(1) %></td>
    			</tr>
    			<tr>
    				<td>性别：</td>
    				<td><%=rs.getString(2) %></td>
    				<td>手机：</td>
    				<td><%=rs.getString(3) %></td>
    			</tr>
    			<tr>
    				<td>邮箱：</td>
    				<td><%=rs.getString(4) %></td>
    				<td>地址：</td>
    				<td><%=rs.getString(5) %></td>
    			</tr>
    			<tr>
    				<td>&nbsp;</td>
    			</tr>
    		</table>
    	<hr /><br>
    	 <h3>我的订单</h3><br>
    	 <hr />
  <table style="width: 600px">
    	<tr>
    		<td>&nbsp;</td>
    	</tr>
    	 <%
    	 	sql="SELECT Orders_ID,Commodity_ID,Number,Price,Price FROM orders WHERE Customer_ID="+session.getAttribute("id");
			rs=stm.executeQuery(sql);
			while(rs.next()){
				sql="SELECT Name FROM commodity WHERE Commodity_ID="+rs.getString(2);
				rs1=stm1.executeQuery(sql);
				rs1.next();
			%>
    			<tr>
    				<td>订单ID：</td>
    				<td><%=rs.getString(1) %></td>
    			</tr>
    			<tr>
    				<td>商品：</td>
    				<td><%=rs1.getString(1) %>
    				</td>
    			</tr>
    			<tr>
    				<td>数量：</td>
    				<td><%=rs.getString(3) %></td>
    			</tr>
    			<tr>
    				<td>价格：</td>
    				<td><%=rs.getString(4) %></td>
    			</tr>
    			<tr>
    				<td colspan="2"><hr></td>
    			</tr>
    			<%}%>
    	</table>
		<%}catch(Exception e){
			e.printStackTrace();
			%><h1>System Error</h1><%	
		}finally{
			if(rs1!=null)try{rs1.close();}catch(Exception e){}
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(stm1!=null)try{stm1.close();}catch(Exception e){}
			if(stm!=null)try{stm.close();}catch(Exception e){}
			if(conn!=null)try{conn.close();}catch(Exception e){}
		}
		}%>
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

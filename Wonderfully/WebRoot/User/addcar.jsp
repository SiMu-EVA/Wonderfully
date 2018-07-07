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
    
    <title>My JSP 'addcar.jsp' starting page</title>
    
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
	<%int Commodity_ID=Integer.parseInt(request.getParameter("Commodity_ID")); %>
	<%
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}else{
    		Connection conn=null;
		Statement stm=null;
		ResultSet rs=null;
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			%>
			<div class="global" style="padding: 50px">
			<center><table align="center" border="1" bordercolor="red">
			<tr>
				<td>商品ID</td>
				<td>商品名</td>
				<td>商品类别</td>
				<td>商品价格</td>
				<td>商品数量</td>
			</tr>
			<%
			rs=stm.executeQuery("SELECT * FROM commodity WHERE Commodity_ID="+Commodity_ID);
			rs.next();%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getInt(5) %></td>
				</tr>
				<tr>
					<%
						String sql="SELECT Number FROM car WHERE Customer_ID="+session.getAttribute("id")+" AND Commodity_ID="+Commodity_ID;
						rs=stm.executeQuery(sql);
						if(rs.next()==true){
							int number=1+rs.getInt(1);
							String update="UPDATE car SET Number="+number+" WHERE Customer_ID="+session.getAttribute("id")+" AND Commodity_ID="+Commodity_ID;
							int up=stm.executeUpdate(update);
							if(up==1){
								%><td colspan="3">添加成功！当前商品在购物车中的数量：<%=number %></td>
								<td colspan="2"><a href="User/car.jsp">马上购买</a></td><%
							}else{
								%><td colspan="5">添加失败！<a>返回商品页重新添加</a></td><%
							}
						}else{
							String inesrt="INSERT INTO car VALUES("+session.getAttribute("id")+","+Commodity_ID+",1)";
							int into=stm.executeUpdate(inesrt);
							if(into==1){
								%><td colspan="3">添加成功！当前商品在购物车中的数量：1</td>
								<td colspan="2"><a href="User/car.jsp">马上购买</a></td><%
							}else{
								%><td colspan="5">添加失败！<a>返回商品页重新添加</a></td><%
							}
						}%>
				</tr>
			</table></center></div>
		<%}catch(Exception e){
			e.printStackTrace();
			%><h1>System Error</h1><%	
		}finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
				if(stm!=null)try{stm.close();}catch(Exception e){}
				if(conn!=null)try{conn.close();}catch(Exception e){}
		}
		}
	 %>
	 
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

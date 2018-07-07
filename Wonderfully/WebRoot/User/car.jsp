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
    
    <title>My JSP 'car.jsp' starting page</title>
    
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
  <%
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}else{
    		Connection conn=null;
			Statement stm=null,stm1=null;
			ResultSet rs=null,rs1=null;
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			stm1=conn.createStatement();
			%>
			<div class="global" style="padding: 50px">
			<center style="padding: 50px;"><h1>购物车</h1><hr /></center>
			<center><form action="Buy?m=car" method="post"><table align="center">
			<tr align="center">
				<td>--选择购买的商品--</td>
				<td>--商品名--</td>
				<td>--商品价格--</td>
				<td>--购物车中数量--</td>
			</tr>
			<tr><td colspan="4"><hr /></td></tr>
			<%
				String user="SELECT Commodity_ID,Number FROM car WHERE Customer_ID="+session.getAttribute("id");
				System.out.println("--------------------"+user+"--------------------");
				rs=stm.executeQuery(user);
				while(rs.next()){
					%>
						<%
							int Commodity_ID=rs.getInt(1),number=rs.getInt(2);
							String select="SELECT Name,Price,Number FROM commodity WHERE Commodity_ID="+Commodity_ID;
							rs1=stm1.executeQuery(select);
							rs1.next();
						 %>
						 <tr align="center">
						<td><input type="checkbox" name="Commodity_id" value="<%=Commodity_ID%>" checked="checked"/></td>
						<td><%=rs1.getString(1) %></td>
						<td><%=rs1.getInt(2) %></td>
						<td><%=number %>
						<%if(rs1.getInt(3)<number){
							%><font color="red">本商品库存只剩：<%=rs1.getInt(3)%>，如果继续购买则只购买：<%=rs1.getInt(3)%>件</font><%
						} %>
						</td></tr>
						<tr><td colspan="4"><hr /></td></tr>
					<%}%>
			 <tr>
			 	<td colspan="4" align="center"><input type="submit" value="购买" /></td>
			 </tr>
			</table></form></center>
			</div>
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

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
    
    <title>My JSP 'product.jsp' starting page</title>
    
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
  	<%int Commodity_ID=Integer.parseInt(request.getParameter("Commodity_ID"));%><%
    	Connection conn=null;
		Statement stm=null;
		ResultSet rs=null;
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			String sql="SELECT * FROM commodity WHERE Commodity_ID="+Commodity_ID;
			rs=stm.executeQuery(sql);
			rs.next();
			%>
			<div class="global" style="padding: 30px">
			<center><div class="login" ><%if(session.getAttribute("username")==null){%>
			你好！游客,请<a href="User/login.jsp">登录</a>，没有账号？<a href="User/register.jsp">注册</a><%}%>
  			</div></center>
  			<center><form action="Buy?m=buy" method="post"><table align="center">
  			<tr>
				<td rowspan="4" style="width: 200px" align="center"><img style="width: 150px" alt="<%=rs.getString(2) %>" src="img/<%=rs.getInt(1) %>.jpg"></td>
				<td colspan="2"><%=rs.getString(2) %><input type="hidden" name="Commodity_id" value="<%=Commodity_ID%>"/></td>
			</tr>
			<tr>
				<td>商品类别</td>
				<td><%=rs.getString(3) %></td>
			</tr>
			<tr>
				<td>商品价格</td>
				<td><%=rs.getString(4) %></td>
			</tr>
			<tr>
				<td>商品库存</td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
			<td colspan="3"><hr /></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center" colspan="1"><input type="submit" value="购买"/></td>
				<td align="center" colspan="2"><a href="User/addcar.jsp?Commodity_ID=<%=Commodity_ID%>">加入购物车</a></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
			<td colspan="3"><hr /></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><img alt="<%=rs.getString(2) %>" src="img/11.jpg" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><img alt="<%=rs.getString(2) %>" src="img/12.jpg" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><img alt="<%=rs.getString(2) %>" src="img/13.jpg" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><img alt="<%=rs.getString(2) %>" src="img/14.jpg" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><img alt="<%=rs.getString(2) %>" src="img/15.jpg" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><img alt="<%=rs.getString(2) %>" src="img/16.jpg" /></td>
			</tr>
			</table></form></center></div>
		<%}catch(Exception e){
			e.printStackTrace();
			%><h1>System Error</h1><%	
		}finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
				if(stm!=null)try{stm.close();}catch(Exception e){}
				if(conn!=null)try{conn.close();}catch(Exception e){}
		}%>
		
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

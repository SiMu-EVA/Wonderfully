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
    
    <title>My JSP 'AddCommodity.jsp' starting page</title>
    
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
    <a href="User/out.jsp">退出登录</a>
    <%if(session.getAttribute("root")==null){
    response.sendRedirect("Slogin.jsp");
    }else{%>
    	<%
    	Connection conn=null;
		Statement stm=null;
		ResultSet rs=null;
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			String sql="SELECT COUNT(*) FROM commodity WHERE Commodity_ID";
			%><form action="AddCommodity" method="post"><center><table align="center" border="1" bordercolor="red">
			<tr>
				<td>商品ID</td>
				<td>商品名</td>
				<td>商品类别</td>
				<td>商品价格</td>
				<td>商品数量</td>
			</tr>
			<%rs=stm.executeQuery(sql);
			rs.next();
			int old_ID=rs.getInt(1);
			int new_ID=++old_ID;
			%>
				<tr>
					<td><%=new_ID %></td>
					<td><input type="text" name="name"/></td>
					<td><select name="class">
					<option value="TUSHU">TUSHU</option>
					<option value="GEHU">GEHU</option>
					<option value="JIAJU">JIAJU</option>
					<option value="FUSHI">FUSHI</option>
					<option value="MEISHI">MEISHI</option>
					<option value="WENCHUANG">WENCHUANG</option>
					<option value="SHIPIN">SHIPIN</option>
					<option value="CHASHI">CHASHI</option>
					</select></td>
					<td><input type="text" name="price"/></td>
					<td><input type="text" name="number"/></td>
				</tr>
				<tr>
					<td colspan="5" align="center"><input type="submit" value="添加"><br>
					<%if(request.getAttribute("Y")!=null){%>
						<%=request.getAttribute("Y") %>
					<%}if(request.getAttribute("N")!=null){%>
						<%=request.getAttribute("N") %>
					<%} %>
					</td>
				</tr>
			</table></center></form><a href="Seller/seller.jsp">返回</a>
		<%}catch(Exception e){
			e.printStackTrace();
			%><h1>System Error</h1><%	
		}finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
				if(stm!=null)try{stm.close();}catch(Exception e){}
				if(conn!=null)try{conn.close();}catch(Exception e){}
		}%>
    <%} %>
  </body>
</html>

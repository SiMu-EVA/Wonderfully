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
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><a href="User/out.jsp">退出登录</a>
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
			String sql="SELECT * FROM customer";
			%><center><table align="center" border="1" bordercolor="red">
			<tr>
				<td>用户ID</td>
				<td>用户名</td>
				<td>用户性别</td>
				<td>用户手机</td>
				<td>用户邮箱</td>
				<td>用户地址</td>
				<td>用户密码</td>
			</tr>
			<%
			rs=stm.executeQuery(sql);
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>					
				</tr>
				<%
			}%>
			</table></center><a href="Seller/seller.jsp">返回</a>
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

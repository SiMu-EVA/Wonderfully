package Servlet;

import java.io.IOException;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class AddCommodity
 */
@WebServlet("/AddCommodity")
public class AddCommodity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommodity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		HttpSession session=request.getSession();
		Connection conn=null;
		Statement stm=null;
		ResultSet rs=null;
		request.removeAttribute("Y");
		request.removeAttribute("N");
		
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			
			rs=stm.executeQuery("SELECT COUNT(*) FROM commodity WHERE Commodity_ID");//查询ID个数
			rs.next();
			int count=rs.getInt(1);
			int id=++count;
			String name=request.getParameter("name");
			String clas=request.getParameter("class");
			String price=request.getParameter("price");
			String number=request.getParameter("number");
			String sql="insert into commodity values("+id+",'"+name+"','"+clas+"',"+price+","+number+")";
			System.out.println(sql);
			int s=stm.executeUpdate(sql);
			if (s==1) {
				request.setAttribute("Y", "添加成功！");
				request.getRequestDispatcher("Seller/AddCommodity.jsp").forward(request, response);
			}else {
				request.setAttribute("N", "添加失败！");
				request.getRequestDispatcher("Seller/AddCommodity.jsp").forward(request, response);
			}	
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(stm!=null)try{stm.close();}catch(Exception e){}
			if(conn!=null)try{conn.close();}catch(Exception e){}
		}
		
	}

}

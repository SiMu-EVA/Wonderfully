package Servlet;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.sql.*;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserBean
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			
			if(method.equals("login")){
				String num=request.getParameter("id");
				if (num==""||num==null) {
					num="0";
				}
				int id=Integer.parseInt(num);
				String password=request.getParameter("password");
				System.out.println(" ‰»ÎID--------------"+id+"------------");
				String sql="SELECT Name,PASSWORD FROM customer WHERE Customer_ID="+id;
				System.out.println("sql--------------"+sql+"------------");
				rs=stm.executeQuery(sql);//≤È—Ø√‹¬Î
				if(rs.next()==false){
					request.setAttribute("N", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ(id≤ª¥Ê‘⁄)£°");
					request.getRequestDispatcher("User/login.jsp").forward(request, response);
				}else {
					if (rs.getString(2).equals(password)) {
						session.setAttribute("username",rs.getString(1));
						session.setAttribute("id",id);
						response.sendRedirect("index.jsp");
					} else {
						request.setAttribute("N", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ£°(√‹¬Î¥ÌŒÛ)");
						request.getRequestDispatcher("User/login.jsp").forward(request, response);
					}
				}
			}else if (method.equals("Seller")) {
				String username=request.getParameter("id");
				String password=request.getParameter("password");
				if (username.equals("root")) {
					if (password.equals("123")) {
						session.setAttribute("root","π‹¿Ì‘±");
						response.sendRedirect("Seller/seller.jsp");
					}else {
						request.setAttribute("N", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ£°(√‹¬Î¥ÌŒÛ)");
						request.getRequestDispatcher("Seller/Slogin.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("N", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ£°(’À∫≈¥ÌŒÛ)");
					request.getRequestDispatcher("Seller/Slogin.jsp").forward(request, response);
				}
			}else{
				rs=stm.executeQuery("SELECT COUNT(*) FROM customer WHERE Customer_ID");//≤È—ØID∏ˆ ˝
				rs.next();
				int count=rs.getInt(1);
				System.out.println("≤È—Øcount--------------"+count+"------------");
				int id=100001;
				id=id+count;
				System.out.println("id◊‘º”--------------"+id+"------------");
				String name=request.getParameter("name");
				String sex=request.getParameter("sex");
				String phone=request.getParameter("phone");
				String email=request.getParameter("email");
				String address=request.getParameter("address");
				String password=request.getParameter("pwd1");
				System.out.println("--------------user------------"+"\n"+id+"\n"+name+"\n"+sex+"\n"+phone+"\n"+email+"\n"+address+"\n"+password+"\n--------------user------------\n");
				String sql="insert into customer values("+id+",'"+name+"','"+sex+"','"+phone+"','"+email+"','"+address+"','"+password+"')";
				int s=stm.executeUpdate(sql);
				if (s==1) {
					request.setAttribute("Y", "◊¢≤·≥…π¶£°");
					request.getRequestDispatcher("User/login.jsp").forward(request, response);
				}else {
					request.setAttribute("N", "◊¢≤· ß∞‹£°");
					request.getRequestDispatcher("User/register.jsp").forward(request, response);
				}
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

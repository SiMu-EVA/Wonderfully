package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.sql.*;
import javax.naming.*;

/**
 * Servlet implementation class carbuy
 */
@WebServlet("/Buy")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buy() {
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
		HttpSession session=request.getSession();
		String m=request.getParameter("m");
		
		Connection conn=null;
		Statement stm=null,stm1=null;
		ResultSet rs=null,rs1=null;
		try{
			Context context=new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn=ds.getConnection();
			stm=conn.createStatement();
			stm1=conn.createStatement();
			
			float Price_all=0;
			if (m.equals("car")) {
				String[] id=request.getParameterValues("Commodity_id");
				System.out.println("id:--------------------"+id[0]+"--------------------");
				Date day=new Date();    
		    	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss"); 
		    	String time=df.format(day)+session.getAttribute("id");
		    	System.out.println("time:--------------------"+time+"--------------------");
				
				for (int i = 0; i < id.length; i++) {
					
					String select_car="SELECT Number FROM car WHERE Customer_ID="+session.getAttribute("id")+" AND Commodity_ID="+id[i];
					System.out.println(i+":--------------------"+select_car+"--------------------");
					rs=stm.executeQuery(select_car);
					
					rs.next();
					int car_number=rs.getInt(1);
					String select_commodity="SELECT Name,Price,Number FROM commodity WHERE Commodity_ID="+id[i];
					System.out.println(i+":--------------------"+select_commodity+"--------------------");
					rs=stm.executeQuery(select_commodity);
					
					rs.next();
					int inventory=rs.getInt(3);
					float Price=rs.getFloat(2);
					if (inventory>car_number) {
						Price=Price*car_number;
						inventory=inventory-car_number;
					}else {
						Price=Price*inventory;
						car_number=inventory;
						inventory=0;
					}
					Price_all=Price_all+Price;
					
					String delete="DELETE FROM car WHERE Customer_ID="+session.getAttribute("id")+" AND Commodity_ID="+id[i];
					int d=stm.executeUpdate(delete);
					if (d==1)System.out.println(i+":--------------------"+d+":删除成功"+"--------------------");
					else System.out.println(i+":--------------------"+d+":删除失败"+"--------------------");
					
					String update="UPDATE commodity SET Number="+inventory+" WHERE Commodity_ID="+id[i];
					int u=stm.executeUpdate(update);
					if (u==1)System.out.println(i+":--------------------"+u+":去存成功"+"--------------------");
					else System.out.println(i+":--------------------"+u+":去存失败"+"--------------------");
					
					String inesrt="INSERT INTO orders VALUES('"+time+"',"+session.getAttribute("id")+","+id[i]+","+car_number+",'"+time+"',"+Price+")";
					int s=stm.executeUpdate(inesrt);
					if (s==1)System.out.println(i+":--------------------"+s+":写单成功"+"--------------------");
					else System.out.println(i+":--------------------"+s+":写单失败"+"--------------------");
				}
				response.sendRedirect("User/pay.jsp");
			}else {
				String id=request.getParameter("Commodity_id");
				
				Date day=new Date();    
		    	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss"); 
		    	String time=df.format(day)+session.getAttribute("id");
		    	System.out.println("time:--------------------"+time+"--------------------");
				
				int car_number=1;
				String select_commodity="SELECT Name,Price,Number FROM commodity WHERE Commodity_ID="+id;
				System.out.println(":--------------------"+select_commodity+"--------------------");
				
				rs=stm.executeQuery(select_commodity);
				rs.next();
				int inventory=rs.getInt(3);
				float Price=rs.getFloat(2);
				if (inventory>car_number) {
					Price=Price*car_number;
					inventory=inventory-car_number;
				}else {
					Price=Price*inventory;
					car_number=inventory;
					inventory=0;
				}
				Price_all=Price_all+Price;
				
				String update="UPDATE commodity SET Number="+inventory+" WHERE Commodity_ID="+id;
				int u=stm.executeUpdate(update);
				if (u==1)System.out.println(":--------------------"+u+":去存成功"+"--------------------");
				else System.out.println(":--------------------"+u+":去存失败"+"--------------------");
				
				String inesrt="INSERT INTO orders VALUES('"+time+"',"+session.getAttribute("id")+","+id+","+car_number+",'"+time+"',"+Price+")";
				int s=stm.executeUpdate(inesrt);
				if (s==1)System.out.println(":--------------------"+s+":写单成功"+"--------------------");
				else System.out.println(":--------------------"+s+":写单失败"+"--------------------");
				response.sendRedirect("User/pay.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(rs1!=null)try{rs1.close();}catch(Exception e){}
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(stm1!=null)try{stm1.close();}catch(Exception e){}
			if(stm!=null)try{stm.close();}catch(Exception e){}
			if(conn!=null)try{conn.close();}catch(Exception e){}
		}
	}

}

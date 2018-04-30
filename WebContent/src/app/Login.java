package app;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   PrintWriter out = response.getWriter();
	   HttpSession session = (HttpSession)request.getSession();
       PreparedStatement ps;
       ResultSet rs = null;
       boolean flag = false;

       String name = request.getParameter("user"); 
	   String password = request.getParameter("password"); 
	   String sql = "SELECT first_name from users where user_id=? And password=?"; 
       
       Cookie cookie=new Cookie("auth", name);
       cookie.setMaxAge(60*60*24*356);
       
       try { 
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/distapp","root","");
 
    	   
    	   
    	   ps = conn.prepareStatement(sql); 
    	   ps.setString(1,name); 
    	   ps.setString(2,password); 
    	   rs = ps.executeQuery(); 
    	   
    	   if (rs.next()) { 
    		   	out.println(rs.getString("first_name")); 
    		   	flag = true; 
    		   	session.setAttribute("name", rs.getString("first_name")); 
    	   } else { 
    		    request.setAttribute("err", "user name or password error!"); 
    	   }
    	   
    	   	
    	   String session_name=(String)session.getAttribute("name");
           System.out.println("Session_name" + session_name);

    	   rs.close (); 
    	   ps.close (); 
    	   conn.close ();

       }catch(ClassNotFoundException e) {
			e.printStackTrace();
	   }catch(SQLException e) {
			e.printStackTrace();
	   }
       
       if(flag) {
    	   response.addCookie(cookie);
       	   RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login_succes.jsp");
       	   dispatcher.forward(request, response);
       }
       else {
    	   RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login_fail.jsp");
       	   dispatcher.forward(request, response);
       }
				
	}
	
}


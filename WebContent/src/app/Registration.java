package app;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		
		try{
		    String firstname = request.getParameter("firstname");
		    String lastname = request.getParameter("lastname");
		    String email = request.getParameter("email");
		    String name = request.getParameter("user");
		    String password = request.getParameter("password");
		    String phone = request.getParameter("phone");
		    String address = request.getParameter("address");
		    String country = request.getParameter("country");
		    String zipcode = request.getParameter("zipcode");
		    String bday = request.getParameter("bday");
		
			String sql = "insert into users(first_name,last_name,email,user_id,password,phone_no,address,country,zipcode,birth_date) values(?,?,?,?,?,?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/distapp","root","");
			
			//Statement st = conn.createStatement();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,firstname);
			ps.setString(2,lastname);
			ps.setString(3,email);
			ps.setString(4,name);
			ps.setString(5,password);
			ps.setString(6,phone);
			ps.setString(7,address);
			ps.setString(8,country);
			ps.setString(9,zipcode);
			ps.setString(10,bday);
			
			int insertResult = ps.executeUpdate();
			
	        //conn.commit(); 
			
			if(insertResult != 0) {
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/registration_succes.jsp");
		       	 dispatcher.forward(request, response);
			}
			else {
				out.println("Failed to insert the data.");
			}
			ps.close();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}         

}

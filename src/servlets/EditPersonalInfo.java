package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.RMISecurityManager;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import distributedapp.servermanager.interfaces.ServerManagerInterface;
import distributedapp.servermanager.interfaces.User;

/**
 * Servlet implementation class EditPersonalInfo
 */
@WebServlet("/EditPersonalInfo")
public class EditPersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPersonalInfo() {
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
@SuppressWarnings("deprecation")
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Object id = session.getAttribute("id");
		
		
	//	try{
		    String firstname = request.getParameter("firstname");
		    String lastname = request.getParameter("lastname");
		    String email = request.getParameter("email");
		    String phone = request.getParameter("phone");
		    String address = request.getParameter("address");
		    String country = request.getParameter("country");
		    String zipcode = request.getParameter("zipcode");
		    
		    System.out.println("Editez!");
/*		 
			String sql = "update users set first_name=?,last_name=?,email=?,phone_no=?,address=?,country=?,zipcode=? where user_id='" + id + "'";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/distapp","root","");
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,firstname);
			ps.setString(2,lastname);
			ps.setString(3,email);
			ps.setString(4,phone);
			ps.setString(5,address);
			ps.setString(6,country);
			ps.setString(7,zipcode);
			
			int insertResult = ps.executeUpdate();
	*/	
		System.setProperty("java.security.policy","C:\\CodeRepositoryJavaEE\\distributed_app\\src\\java.policy");
		String updateResponse = null;
		if(System.getSecurityManager() == null) {
			System.setSecurityManager(new RMISecurityManager());
		}
		
		try {
			
			Registry reg = LocateRegistry.getRegistry("192.168.100.11");
			ServerManagerInterface server = (ServerManagerInterface)reg.lookup("ServerManagerInterface");
			String message = "Do you see me ... :) ?";
			
			User u  = new User();
			u.setUsername((String)id);
			u.setAddress(address);
			u.setCountry(country);
			u.setEmail(email);
			u.setFirstName(firstname);
			u.setLastName(lastname);
			u.setPhone(phone);
			u.setZipcode(zipcode);
			server.sendMessage(message);
			updateResponse = server.updateUser(u);
			System.out.println("EditPersonalInfo: Datele s-au transmis");
			
		} catch(Exception e) {
			System.err.println("[Eroare]" + e.getMessage());
		}
			
			//if(insertResult != 0) {
			if(updateResponse.equals("Updated User")) {
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/VisualizeCustomerInfo");
		       	 dispatcher.forward(request, response);
			}
			else {
				out.println("Failed to update the data.");
			}
	/*		ps.close();
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
		}*/
	}         

}

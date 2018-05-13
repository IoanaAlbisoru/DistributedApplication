package servlets;

import java.io.*;
import java.rmi.RMISecurityManager;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import distributedapp.servermanager.interfaces.ServerManagerInterface;
import distributedapp.servermanager.interfaces.User;

/**
 * Servlet implementation class VisualizeCustomerInfo
 */
@WebServlet("/VisualizeCustomerInfo")
public class VisualizeCustomerInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizeCustomerInfo() {
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
		
		response.setContentType("text/html");
        HttpSession session = (HttpSession)request.getSession();
	    Object id = session.getAttribute("id");       
        
        try {
        //	Class.forName("com.mysql.jdbc.Driver").newInstance();
         //   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/distapp","root","");
            System.out.println("Visualize personal informations");
            System.out.println("ID-ul: " + id);
            ArrayList<String> al = null;
         //   String sql = "select * from users where user_id='" + id + "' ";
         //   Statement st = conn.createStatement();
         //   ResultSet rs = st.executeQuery(sql);
 /*
            while (rs.next()) {
                al = new ArrayList<String>();
 
                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));
                al.add(rs.getString(8));
                al.add(rs.getString(9));
                al.add(rs.getString(10));
                al.add(rs.getString(11));
                
 
                System.out.println("al :: " + al);
            }*/
            
            System.setProperty("java.security.policy","C:\\CodeRepositoryJavaEE\\distributed_app\\src\\java.policy");
			
			if(System.getSecurityManager() == null) {
				System.setSecurityManager(new RMISecurityManager());
			}
			
			try {
				
				Registry reg = LocateRegistry.getRegistry("192.168.100.11");
				ServerManagerInterface s = (ServerManagerInterface)reg.lookup("ServerManagerInterface");
				String message = "Do you see me ... :) ?";
				
				al = s.getUser((String)id);
				
				s.sendMessage(message);
				System.out.println("VisualizeCustomerInfo: Datele s-au transmis");
				
			} catch(Exception e) {
				System.err.println("[Eroare]" + e.getMessage());
			}
 
            request.setAttribute("al", al);
            session.setAttribute("list", al);
            RequestDispatcher view = request.getRequestDispatcher("/visualize_customer_info.jsp");
            view.forward(request, response);
         //   conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.RMISecurityManager;
import java.rmi.registry.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import distributedapp.servermanager.interfaces.ServerManagerInterface;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
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
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Object id = session.getAttribute("id");
		Object objCartBean = session.getAttribute("cart");
		CartBean cartBean = CartBean.class.cast(objCartBean);
		/*
		System.setProperty("java.security.policy","C:\\CodeRepositoryJavaEE\\distributed_app\\src\\java.policy");
		
		if(System.getSecurityManager() == null) {
			System.setSecurityManager(new RMISecurityManager());
		}
		
		try {
			
			Registry reg = (Registry) LocateRegistry.getRegistry("192.168.100.11");
			ServerManagerInterface s = (ServerManagerInterface)((java.rmi.registry.Registry) reg).lookup("ServerManagerInterface");
			String message = "Do you see me ... :) ?";
			
			s.sendMessage(message);
			String resp = s.sendCart((String)id,((CartBean)objCartBean).getCartItems(), ((CartBean)objCartBean).getOrderTotal());
			System.out.println("Order: Datele s-au transmis");
			
			if(resp.equals("Order Placed")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/order_successfully_placed.jsp");
		       	dispatcher.forward(request, response);
			}
			else {
				out.println("Failed to place the order.");
			}
			*/
		
		System.setProperty("java.security.policy","C:\\CodeRepositoryJavaEE\\distributed_app\\src\\java.policy");
		
		if(System.getSecurityManager() == null) {
			System.setSecurityManager(new RMISecurityManager());
		}
		
		try {
			
			Registry reg = LocateRegistry.getRegistry("192.168.100.11");
			ServerManagerInterface s = (ServerManagerInterface)reg.lookup("ServerManagerInterface");
			String message = "Do you see me ... :) ?";
			
			s.sendMessage(message);
			String resp = s.sendCart((String)id,cartBean.getCartItems(), cartBean.getOrderTotal());
			System.out.println("Order: Datele s-au transmis");
			
			if(resp.equals("Order Placed")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/order_successfully_placed.jsp");
		       	dispatcher.forward(request, response);
			}
			else {
				out.println("Failed to place the order.");
			}
			
		} catch(Exception e) {
			System.err.println("[Eroare]" + e.getMessage());
		}
	}

}

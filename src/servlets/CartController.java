package servlets;

import java.io.IOException;
import java.rmi.RMISecurityManager;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import distributedapp.servermanager.interfaces.CartItemBean;
import distributedapp.servermanager.interfaces.ServerManagerInterface;
import distributedapp.servermanager.interfaces.User;


/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		 
		  String strAction = request.getParameter("action");
		   
		   
		  if(strAction!=null && !strAction.equals("")) {
			  System.out.println("Action: " + strAction);
		   if(strAction.equals("add")) {
		    addToCart(request);
		   } else if (strAction.equals("Update")) {
		    updateCart(request);
		   } else if (strAction.equals("Delete")) {
		    deleteCart(request);
		   }
		  }
		  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/shopping_cart.jsp");
      	  dispatcher.forward(request, response);
		 }
		
		 protected void deleteCart(HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  String strItemIndex = request.getParameter("itemIndex");
		  CartBean cartBean = null;
		   
		  Object objCartBean = session.getAttribute("cart");
		 
		  if(objCartBean!=null) {
		   cartBean = (CartBean) objCartBean ;
		  } else {
		   cartBean = new CartBean();
		  }
		  cartBean.deleteCartItem(strItemIndex);
		 }
		  
		 protected void updateCart(HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  String strQuantity = request.getParameter("quantity");
		  String strItemIndex = request.getParameter("itemIndex");
		  
		  CartBean cartBean = null;
		   
		  Object objCartBean = session.getAttribute("cart");
		  if(objCartBean!=null) {
		   cartBean = (CartBean) objCartBean ;
		  } else {
		   cartBean = new CartBean();
		  }
		  cartBean.updateCartItem(strItemIndex, strQuantity);
		 }
		  
		 @SuppressWarnings("deprecation")
		protected void addToCart(HttpServletRequest request) {
			 HttpSession session = request.getSession();
			 String strTitle = request.getParameter("title");
			 String strDescription = request.getParameter("description");
			 String strPrice = request.getParameter("price");
			 String strQuantity = request.getParameter("quantity");	
			 CartBean cartBean = null;
		   
			 Object objCartBean = session.getAttribute("cart");
			 
			 //CHECK
			 Object name = session.getAttribute("name");
			 Object id = session.getAttribute("id");
			 System.out.println("Nume user e: " + name.toString());
			 System.out.println("User ID e: " + id.toString());
			 //
			 
		 
			 if(objCartBean!=null) {
				 cartBean = (CartBean) objCartBean ;
			 } else {
				 cartBean = new CartBean();
				 session.setAttribute("cart", cartBean);
			 }
		  
			 System.out.println("Title: " + strTitle);
			 System.out.println("Quantity: " + strQuantity);
			 System.out.println("Description: " + strTitle);
			 System.out.println("Price: " + strPrice);
			 cartBean.addCartItem(strTitle, strDescription, strPrice, strQuantity);
			 
			 //CHECK
			 System.out.println("Title from cart: ");
			 
			 for(CartItemBean c : cartBean.getCartItems()) {
			   System.out.print(c.getTitle()+ "-" + c.getQuantity() + "-" + c.getTotalCost() + "; ");
			 }
			 System.out.println("Total order cost in cart: " + cartBean.getOrderTotal());
			 //
			
			/* System.setProperty("java.security.policy","C:\\CodeRepositoryJavaEE\\distributed_app\\src\\java.policy");
				
				if(System.getSecurityManager() == null) {
					System.setSecurityManager(new RMISecurityManager());
				}
				
				try {
					
					Registry reg = LocateRegistry.getRegistry("192.168.100.11");
					ServerManagerInterface s = (ServerManagerInterface)reg.lookup("ServerManagerInterface");
					String message = "Do you see me ... :) ?";
					
					s.sendMessage(message);
					s.sendCart((String)id,cartBean.getCartItems(), cartBean.getOrderTotal());
					System.out.println("CartController: Datele s-au transmis");
					
				} catch(Exception e) {
					System.err.println("[Eroare]" + e.getMessage());
				}*/
		 }
		
		 
		 public String toString(Object o) {
			 return o.toString();
		 }
		 
}

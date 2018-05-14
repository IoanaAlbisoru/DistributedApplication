package app;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


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
		  
		 protected void addToCart(HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  String strTitle = request.getParameter("title");
		  String strDescription = request.getParameter("description");
		  String strPrice = request.getParameter("price");
		  String strQuantity = request.getParameter("quantity");
		  CartBean cartBean = null;
		   
		  Object objCartBean = session.getAttribute("cart");
		 
		  if(objCartBean!=null) {
		   cartBean = (CartBean) objCartBean ;
		  } else {
		   cartBean = new CartBean();
		   session.setAttribute("cart", cartBean);
		  }
		  System.out.println("Title: " + strTitle);
		  System.out.println("Quantity: " + strQuantity);
		  System.out.println("Description: " + strTitle);
		  System.out.println("Price: " + strQuantity);
		  cartBean.addCartItem(strTitle, strDescription, strPrice, strQuantity);
	 }

}

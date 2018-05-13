package servlets;

import java.util.*;

import distributedapp.servermanager.interfaces.CartItemBean;

public class CartBean {
	
	private ArrayList<CartItemBean> cartItems = new ArrayList<CartItemBean>();
	private double total ;
  
	public int getLineItemCount() {
		return cartItems.size();
	}
  
	public void deleteCartItem(String strItemIndex) {
		int index = 0;
		
		try {
			index = Integer.parseInt(strItemIndex);
			cartItems.remove(index - 1);
			calculateOrderTotal();
		} catch(NumberFormatException nfe) {
			System.out.println("Error while deleting cart item: "+nfe.getMessage());
			nfe.printStackTrace();
		}
	}
  
	public void updateCartItem(String strItemIndex, String strQuantity) {
		double dblTotalCost = 0.0;
		double dblUnitCost = 0.0;
		int iQuantity = 0;
		int iItemIndex = 0;
		CartItemBean cartItem = null;
		
		try {
			iItemIndex = Integer.parseInt(strItemIndex);
			iQuantity = Integer.parseInt(strQuantity);
			
			if(iQuantity > 0) {
				cartItem = (CartItemBean)cartItems.get(iItemIndex-1);
				dblUnitCost = cartItem.getUnitCost();
				dblTotalCost = dblUnitCost*iQuantity;
				cartItem.setQuantity(iQuantity);
				cartItem.setTotalCost(dblTotalCost);
				calculateOrderTotal();
			}
		} catch (NumberFormatException nfe) {
			System.out.println("Error while updating cart: "+nfe.getMessage());
			nfe.printStackTrace();
		}
	}
  
	public void addCartItem(String strTitle, String strDescription, String strUnitCost, String strQuantity) {
		double dblTotalCost = 0.0;
		double dblUnitCost = 0.0;
		int iQuantity = 0;
		CartItemBean cartItem = new CartItemBean();
		
		try {
			dblUnitCost = Double.parseDouble(strUnitCost);
			iQuantity = Integer.parseInt(strQuantity);
			
			if(iQuantity>0) {
				dblTotalCost = dblUnitCost*iQuantity;
				cartItem.setTitle(strTitle);
				cartItem.setModelDescription(strDescription);
				cartItem.setUnitCost(dblUnitCost);
				cartItem.setQuantity(iQuantity);
				cartItem.setTotalCost(dblTotalCost);
				cartItems.add(cartItem);
				calculateOrderTotal();
				System.out.println("Title from bean: " + strTitle);
			}
		} catch (NumberFormatException nfe) {
			System.out.println("Error while parsing from String to primitive types: "+nfe.getMessage());
			nfe.printStackTrace();
	}
 }
  
	public void addCartItem(CartItemBean cartItem) {
		cartItems.add(cartItem);
	}
  
	public CartItemBean getCartItem(int iItemIndex) {
		CartItemBean cartItem = null;
		
		if(cartItems.size() > iItemIndex) {
			cartItem = (CartItemBean) cartItems.get(iItemIndex);
		}
		return cartItem;
	}
  
	public ArrayList<CartItemBean> getCartItems() {
		return cartItems;
	}
	
	public void setCartItems(ArrayList<CartItemBean> cartItems) {
		this.cartItems = cartItems;
	}
	
	public double getOrderTotal() {
		return total;
	}
	
	public void setOrderTotal(double total) {
		this.total = total;
	}
  
	protected void calculateOrderTotal() {
		double dblTotal = 0;
		
		for(int counter = 0; counter < cartItems.size(); counter++) {
			CartItemBean cartItem = (CartItemBean)cartItems.get(counter);
			dblTotal+=cartItem.getTotalCost();
		}
		setOrderTotal(dblTotal);
	}
 
}

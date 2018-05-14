<html>

<head>

<title>Shopping cart</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


</head>

<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*"%>

<table width="993" height="330" >
  <tr>
    <td width="205" height="170"><a href="main.jsp"><img src="images/head.jpg" width="251" height="170" alt="Logo" /></a>
    <hr /></td>
    <td width="772"><table width="990" height="170">
      <tr>
        <td width="900" class="right">
        	<a href="main.jsp"> Home </a> | 
        	<% 
        	if(session.getAttribute("name")==null) {
			%>
            <a href="login.jsp">Login |</a> 
            <a href="register.jsp">Register |</a>
            <a href="notloggedin.jsp">Shopping cart</a>
            <%} 
            else {
			%>
            <a href="logout.jsp">Logout |</a>
            <a href="shopping_cart.jsp">Shopping cart</a>
            <%}%>
            
            
        </td>
      </tr>
      <tr>
        <td><form id="center" name="frm" method="post" action="Search">
          <input name="pid" type="text" id="pid" size="60" />
          <label>
            <input type="submit" name="submit" id="button_sea" value="Search" />
          </label>
        </form></td>
      </tr>
    </table>
    <hr /></td>
  </tr>
  <tr>
    <td><table>
      <tr>
        <td height="184"><table>
          <tr>
            <form name="see" action="SeeAll" method="post">
            	<td class="normal">PRODUCTS <input type="submit" name="seeall" id="button_sea" value="see all"/>	
            	 </td>
            </form> 
          </tr>
          <tr>
            <td> <!--  <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="BooksAudible" /><input type="image" src="images/books.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="ElectronicsComp" /><input type="image" src="images/elect.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="Clothes" /><input type="image" src="images/cloth.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="HomeGarden" /><input type="image" src="images/gard.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="HealthBeauty" /><input type="image" src="images/health.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="ToysBaby" /><input type="image" src="images/toys.PNG" /></form></td>
          </tr>
        </table></td>
      </tr> 
        
    </table></td>
    <td> <center>
    <table>
   	 <tr> 
	<td colspan="2" class="italics"> Shopping cart</td> 
	</tr> 
    <br/>
  <tr bgcolor="#CCCCCC">
    <td><strong>Model Description</strong></td>
    <td><strong>Quantity</strong></td>
    <td><strong>Unit Price</strong></td>
    <td><strong>Total</strong></td>
  </tr>
  <jsp:useBean id="cart" scope="session" class="servlets.CartBean" />
  <c:if test="${cart.lineItemCount==0}">
  <tr>
  <td colspan="4">- Cart is currently empty -<br/>
  </tr>
  </c:if>
  <c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">
  <form name="item" method="POST" action="CartController">
  <tr>
    <td><b><c:out value="${cartItem.title}"/></b><br/>
      
    <td><input type='hidden' name='itemIndex' value='<c:out value="${counter.count}"/>'><input type='text' width="20" name="quantity" value='<c:out value="${cartItem.quantity}"/>'size='2'> <input type="submit" name="action" value="Update"><br/>         
    <input type="submit" name="action" value="Delete"></td>
    <td><c:out value="${cartItem.unitCost}"/> $</td>
    <td><c:out value="${cartItem.totalCost}"/> $</td>
  </tr>
  </form>
  </c:forEach>
  <tr>
    <td colspan="2"> </td>
    <td> </td>
    <td>Subtotal: <c:out value="${cart.orderTotal}"/> $</td>
  </tr>
  
  <form method="post" action="VisualizeCustomerInfo">
  <tr>  
  		<td><input type="submit"  name="order_button" value="Order"></td>
  </tr>
  </form>
</table></center>
            <br/>
    </table>
    </td>
  </tr> 
</table>

<jsp:include page="footer.jsp"/>

</body>
</html>
<html>

<head>

<title>Searching results</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Log in</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />


</head>

<body>

<%@ page language="java" import="java.util.*"%>

<table width="993" height="330">
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
    <td>
    	<center><table >
    		
    		<p><strong>Already have an account ?</strong><br/><a href="login.jsp"><strong>Sign in</strong></a></p>
  <table width="1" > <form action="Registration" method="post">
  <tr> 
<td colspan="2" class="italics"> Register here</td> 
</tr> 
		    <tr><td>First name: </td><td><input type="text" name="firstname" required="required"></td></tr>
		    <tr><td>Last name: </td><td><input type="text" name="lastname" required="required"></td></tr>
		    <tr><td>E-mail: </td><td><input type="email" name="email" required="required"></td></tr>		    
            <tr><td>User ID: </td><td><input type="text" name="user" required="required"></td></tr>
            <tr><td>Password: </td><td><input type="password" name="password" required="required"></td></tr>
            <tr><td>Phone: </td><td><input type="text" name="phone" required="required"></td></tr>
            <tr><td>Address:</td><td><textarea name="address" required="required"></textarea></td></tr>
            <tr><td>Country: </td><td><input list="countries" name="country" required="required"><datalist id="countries">
  											<option value="Austria">
 											<option value="Belgium">
  											<option value="Bulgaria">
  											<option value="Croatia">
 											<option value="Cyprus">
 											<option value="Denmark">
 											<option value="Finland">
  											<option value="France">
  											<option value="Germany">
 											<option value="Greece">
 											<option value="Hungary">
 											<option value="Italy">
  											<option value="Romania">
  											<option value="Spain">
 											<option value="Sweden">
 											<option value="United Kingdom">
							</datalist></td></tr>
            <tr><td>Zipcode: </td><td><input type="text" name="zipcode"></td></tr>
            <tr><td>Date of birth: </td><td><input type="date" placeholder="yyyy-mm-dd" name="bday"></td></tr>
<tr> 
<td><br/><br/> <input type="submit" value="Create account"> </td> 
<td><br/><br/> <input type="reset" value="Clear"> </td> 
</tr> </form>
</table>
             
           </table> </center>
            <br/>
    </table></td>
  </tr> 
</table>

<jsp:include page="footer.jsp"/>

</body>
</html>

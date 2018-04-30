<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Create account</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
	
</head>

<body>

<center>
<form action="Registration" method="post">
  <table width="993" height="330" border="0">
  <tr>
    <td width="205" height="170"><img src="images/head.jpg" width="251" height="170" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="723" height="170" border="0">
      <tr>
        <td width="713" class="right">
        	<a href="main.jsp"> Home </a> | 
        <% if(session.getAttribute("uname")==null) {
			%>
            <a href="login.jsp">Login |</a> 
            <a href="register.jsp">Register |</a>
            <%} 
            else {
			%>
            <a href="logout.jsp">Logout |</a>
            <%}%>
            <a href="basket.jsp">Basket</a>
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <hr/>
   </td>
  </tr>
</table>
  <p>&nbsp;</p>
  <p><strong>Already have an account ?</strong><br/><a href="login.jsp"><strong>Sign in</strong></a></p>
  <table width="1" > 
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
</tr> 
</table>

  <p>&nbsp;</p>
  <p>&nbsp;</p> 
</form> 

</center>
</body>
</html>
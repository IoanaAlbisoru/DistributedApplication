<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Log in</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
	
</head>

<body>

<center>
<form action="Login" method="post">
  <table width="993" height="330" border="0">
  <tr>
    <td width="205" height="170"><img src="images/head.jpg" width="251" height="170" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="723" height="170" border="0">
      <tr>
        <td width="713" class="right">
        	<a href="main.jsp"> Home </a> | 
        	<% 
        	if(session.getAttribute("name")==null) {
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
  <table width="1" > 
  <tr> 
<td colspan="2" class="italics"> Log in </td> 
</tr> 
<tr> 
<td> Username: </td> 
<td> <input type="text" name="user" required="required"> </td> 
</tr> 
<tr> 
<td> Password: </td> 
<td> <input type="password" name="password" required="required"> </td> 
</tr> 
<tr> 
<td><br/><br/> <input type="submit" value="Log In"> </td> 
<td><br/><br/> <input type="reset" value="Clear"> </td> 
</tr> 
</table>

  <p>&nbsp;</p>
  <p>&nbsp;</p> 
</form> 
</center>
</body>
</html>

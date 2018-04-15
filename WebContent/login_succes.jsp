<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Log in</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
	
</head>

<body>

<center>

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
            <a href="register.jsp">Sign in |</a>
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

	<p id="center">Welcome <%=session.getAttribute("uname")%> !
		 <p>Click <a href="main.jsp">here</a> to go to the Home Page.</p> 
  	</p>
</center>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Log in</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
	
</head>

<body>

<%
		Cookie[] cks = request.getCookies();
		if (cks != null) {
			for (int i = 0; i < cks.length; i++) {
				String name = cks[i].getName();
				String value = cks[i].getValue();
				if (name.equals("auth")) {
					break; // exit the loop and continue the page
				}
				if (i == (cks.length - 1)) // if all cookie are not valid redirect to error page
				{
					response.sendRedirect("session_expired.jsp");
					return; // to stop further execution
				}
				i++;
			}
		} else {
			response.sendRedirect("session_expired.jsp");
			return; // to stop further execution
		}
	%>

<center>

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
            <a href="register.jsp">Register|</a>
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

	<p id="center">You have successfully registered !
		 <p><a href="login.jsp">Sign in</a></p> 
  	</p>
</center>
</body>
</html>
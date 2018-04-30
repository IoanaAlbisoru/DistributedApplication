<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />

</head>

<body>

<table width="993" height="330" border="0">
  <tr>
    <td width="205" height="170"><img src="images/head.jpg" width="251" height="170" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="723" height="170" border="0">
      <tr>
        <td width="713" class="right">
        	<a href="main.jsp"> Home </a> | 
        <% if(session.getAttribute("name")==null) {
			%>
            <a href="login.jsp">Login |</a> 
            <a href="register.jsp">Sign in |</a>
            <%} 
            else {
			%>
            <a href="logout.jsp">Logout|</a>
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
<center>
	<h5>
		<% 
  			  if(session.getAttribute("name")!=null) {
					session.invalidate();
					out.println("Successfully Logged out.");
 	    %>
	</h5><br><script type="text/javascript">
					function Redirect(){
   						 window.location="main.jsp";
        			}
		
					document.write("You will be redirected to main page in a few sec.");
					setTimeout('Redirect()', 5000);
			</script>
		<%
			  }
			  else{
		%>
					You're already Logged out. 
		<br><a href="login.jsp">Login</a>
		<%}%>
		</center>
	</body>
</html>

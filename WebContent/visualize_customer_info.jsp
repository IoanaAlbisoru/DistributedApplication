<html>

<head>

<title>Visualize Delivery Information</title>

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
    		
  <table > <form method="post">
  <tr> 
<td colspan="2" class="italics"> Delivery information</td> 
</tr> 
							<%
                if (request.getAttribute("al") != null) {
                    ArrayList al = (ArrayList)request.getAttribute("al");
                    System.out.println(al);
                    /*Iterator itr = al.iterator();
                    while (itr.hasNext()) {
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        System.out.println(count);
                        if(count % 2 != 0){*/
            %>
            
		    <tr><td>First name: </td><td><input type="hidden" name="firstname" value="<%=al.get(1) %>"><%=al.get(2) %></td></tr>
		    <tr><td>Last name: </td><td><input type="hidden" name="lastname" value="<%=al.get(2) %>"><%=al.get(3) %></td></tr>
		    <tr><td>E-mail: </td><td><input type="hidden" name="email" value="<%=al.get(3) %>"><%=al.get(4) %></td></tr>	
            <tr><td>Phone: </td><td><input type="hidden" name="phone" value="<%=al.get(6) %>"><%=al.get(6) %></td></tr>
            <tr><td>Address:</td><td><input type="hidden" name="address" value="<%=al.get(7) %>"><%=al.get(7) %></td></tr>
            <tr><td>Country: </td><td><input type="hidden" name="country" value="<%=al.get(8) %>"><%=al.get(8) %></td></tr>
            <tr><td>Zipcode: </td><td><input type="hidden" name="zipcode" value="<%=al.get(9) %>"><%=al.get(9) %></td></tr>
		<%} %>
<tr> 
<td><br/><br/> <button type="submit" formaction="ConfirmPersonalInfo" >Confirm delivery info</button> </td> 
<td><br/><br/> <button type="submit" formaction="edit_personal_info.jsp" >Edit</button></td> 
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

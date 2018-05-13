<html>

<head>

<title>Edit Delivery Information</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Log in</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />


</head>

<body>

<%@ page language="java" import="java.util.*"%>

<table width="993" height="330" border="2">
  <tr>
    <td width="205" height="170"><a href="main.jsp"><img src="images/head.jpg" width="251" height="170" alt="Logo" /></a>
    <hr /></td>
    <td width="772"><table width="990" height="170" border="2">
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
    <td><table border="10">
      <tr>
        <td height="184"><table border="2">
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
    	<center><table  border="1" >
    		
  <table border="1"> <form action="EditPersonalInfo" method="post">
  <tr> 
	<td colspan="2" class="italics"> Delivery information</td> 
	</tr> 
							<%
							
                if (session.getAttribute("list") != null) {
                    ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
                    System.out.println(list);
                    /*Iterator itr = al.iterator();
                    while (itr.hasNext()) {
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        System.out.println(count);
                        if(count % 2 != 0){*/
            %>
            
		    <tr><td>First name: </td><td><input type="text" name="firstname" value="<%=list.get(2) %>"></td></tr>
		    <tr><td>Last name: </td><td><input type="text" name="lastname" value="<%=list.get(3) %>"></td></tr>
		    <tr><td>E-mail: </td><td><input type="email" name="email" value="<%=list.get(4) %>"></td></tr>	
            <tr><td>Phone: </td><td><input type="text" name="phone" value="<%=list.get(6) %>"></td></tr>
            <tr><td>Address:</td><td><input type="text" name="address" value="<%=list.get(7) %>"></textarea></td></tr>
            <tr><td>Country: </td><td><input type="text" name="country" value="<%=list.get(8) %>"></td></tr>
            <tr><td>Zipcode: </td><td><input type="text" name="zipcode" value="<%=list.get(9) %>"></td></tr>
		<%} 
			else{
				System.out.println("Erpare!");
			}
	%>
<tr> 
<td><br/><br/> <input type="submit" value="Done"> </td> 
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

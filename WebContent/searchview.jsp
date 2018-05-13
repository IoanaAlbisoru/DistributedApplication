<html>

<head>

<title>Searching view</title>

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
            <input type="hidden" name="category" value="BooksAudible" /><input type="image" src="images/books.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="category" value="ElectronicsComp" /><input type="image" src="images/elect.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="category" value="Clothes" /><input type="image" src="images/cloth.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="category" value="HomeGarden" /><input type="image" src="images/gard.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="category" value="HealthBeauty" /><input type="image" src="images/health.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--  <form action="category.jsp">-->
            <input type="hidden" name="category" value="ToysBaby" /><input type="image" src="images/toys.PNG" /></form></td>
          </tr>
        </table></td>
      </tr> 
      <tr> 
      	<td height="800">&nbsp;</td>
      </tr>     
    </table></td>
    <td><table  border="10" >
    <tr class="normal" >
        		<td height="30" width="450">ALL PRODUCTS</td>
      
     
            <%
                int count = 0;
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList)request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        System.out.println(count);
                        if(count % 2 != 0){
            %>
      		</tr>
             <tr>
            <td height="261">
            <table width="450" height="200" border = "2" class="center1"> 
            	<% if(session.getAttribute("name")==null) {%>
           			<form id="normal" name="frm1" method="post" action="notloggedin.jsp">
            	<%} else {%>
            		<form id="normal" name="frm1" method="post" action="CartController">
            	<%}%>
         			
            <tr>
                <td rowspan="6"  >
					<input name="img" type="image" src="images/<%=pList.get(5)%>" width="160" height="200"> 
				</td>
			</tr>
			<tr>
				<td width="500" height="10" class="title"> 
					<input type="hidden" name="title" value="<%=pList.get(2)%>">
					<p><%=pList.get(2)%> </p>
				</td>
			</tr>
			<tr>
				<td height="50"> 
					<input type="hidden" name="description" value="<%=pList.get(3)%>">
					<p><%=pList.get(3)%> </p>
				</td>
			</tr>
			<tr>
				<td height="10" class="price"> 
					Quantity: <input width="10" type="text" name="quantity" value="1">
				</td>
			</tr>
			<tr>
				<td height="10" class="price"> 
					<input type="hidden" name="price" value="<%=pList.get(4)%>">
					<p><%=pList.get(4)%>$</p>
				</td>
			</tr>
			<tr>
				<td height="10"> 
					
					<input type="hidden" name="action" value="add">
          			<label>
            		<input type="submit" name="addtocart" id="button_sea" value="Add To Cart" />
          			</label>
        			
				</td>
			</tr>
		
			</td>
			 </tr>
			 </form>
	</table> 
			
            <%
            System.out.println("DA");
                        }
                        else{ %>
                        	 <td height="261">
            <table width="450" height="200" border = "2" class="center1"> 
            <% if(session.getAttribute("name")==null) {%>
           			<form id="normal" name="frm1" method="post" action="notloggedin.jsp">
            <%} else {%>
            		<form id="normal" name="frm1" method="post" action="CartController">
           	<%}%>
            <tr>
                <td rowspan="6">
					<input name="img2" type="image" src="images/<%=pList.get(5)%>" width="160" height="200"> 
				</td>
			</tr>
			<tr>
				<td width="500" height="10" class="title"> 
					<input type="hidden" name="title" value="<%=pList.get(2)%>">
					<p><%=pList.get(2)%> </p>
				</td>
			</tr>
			<tr>
				<td height="50"> 
					<input type="hidden" name="description" value="<%=pList.get(3)%>">
					<p><%=pList.get(3)%> </p>
				</td>
			</tr>
			<tr>
				<td height="10" class="price"> 
					Quantity: <input type="text" width="10" name="quantity" value="1">
				</td>
			</tr>
			<tr>
				<td height="10" class="price"> 
					<input type="hidden" name="price" value="<%=pList.get(4)%>">
					<p><%=pList.get(4)%>$</p>
				</td>
			</tr>
			<tr>
				<td height="10"> 
					
					<input type="hidden" name="action" value="add">
          			<label>
            		<input type="submit" name="addtocart" id="button_sea" value="Add To Cart" />
          			</label>
        			
				</td>
			</tr>
		
			</td>
			 </tr></form>
	</table></td> </tr>
                        	 
           <%              }
                    }
                }
                if (count == 0) {
            %>
            <table  border="2" align="left">
            <tr>
                <td><b>No Record Found..</b></td>
            </tr>
            </table>
            <%            }
            %>
            
             
           </table> 
            <br/>
    </table></td>
  </tr> 
</table>

<jsp:include page="footer.jsp"/>

</body>
</html>

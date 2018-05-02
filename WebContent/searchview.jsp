<html>

<head>

<title>Distributed Application</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />


</head>

<body>

<%@ page language="java" import="java.util.*"%>

<table width="993" height="330" border="2">
  <tr>
    <td width="205" height="170"><img src="images/head.jpg" width="251" height="170" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="930" height="170" border="2">
      <tr>
        <td width="900" class="right">
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
            <td class="normal">PRODUCTS 
            	<a href="SeeAll">see all</a> <br/>
            </td>
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
      <tr> 
      	<td height="540">&nbsp;</td>
      </tr>     
    </table></td>
    <td><table  border="10" >
    <tr class="normal" >
        		<td height="30" width="450">SEARCHING RESULTS</td>
      
     
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
         
            <tr>
                <td rowspan="5"  ><form action="product.jsp"> 
					<input name="img" type="image" src="images/<%=pList.get(5)%>" width="160" height="200"> 
					</form>
				</td>
			</tr>
			<tr>
				<td width="500" height="40" class="title"> 
					<p ><%=pList.get(2)%></p>
				</td>
			</tr>
			<tr>
				<td > 
					<p ><%=pList.get(3)%></p>
				</td>
			</tr>
			<tr>
				<td height="30" class="price"> 
					<p ><%=pList.get(4)%></p>
				</td>
			</tr>
			<tr>
				<td height="10"> 
					<form id="normal" name="frm1" method="post">
          			<label>
            		<input type="submit" name="buy" id="button_sea" value="Add to basket" />
          			</label>
        			</form>
				</td>
			</tr>
		
			</td>
			 </tr>
	</table> 
			
            <%
            System.out.println("DA");
                        }
                        else{ %>
                        	 <td height="261">
            <table width="450" height="200" border = "2" class="center1"> 
            <tr>
                <td rowspan="5"><form action="product.jsp">
					<input name="img2" type="image" src="images/<%=pList.get(5)%>" width="160" height="200"> 
					</form>
				</td>
			</tr>
			<tr>
				<td width="500" height="40" class="title"> 
					<p ><%=pList.get(2)%></p>
				</td>
			</tr>
			<tr>
				<td > 
					<p ><%=pList.get(3)%></p>
				</td>
			</tr>
			<tr>
				<td height="30" class="price"> 
					<p ><%=pList.get(4)%></p>
				</td>
			</tr>
			<tr>
				<td height="10"> 
					<form id="normal" name="frm1" method="post">
          			<label>
            		<input type="submit" name="buy" id="button_sea" value="Add to basket" />
          			</label>
        			</form>
				</td>
			</tr>
		
			</td>
			 </tr>
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

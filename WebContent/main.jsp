<html>

<head>

<title>Distributed Application</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />


</head>

<body>

<%@ page language="java" %>

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
        <td><form id="center" name="form1" method="post" action="search.jsp">
          <input name="search" type="text" id="search" size="60" />
          <label>
            <input type="submit" name="submit" id="button" value="Search" />
          </label>
        </form></td>
      </tr>
    </table>
    <hr /></td>
  </tr>
  <tr>
    <td><table width="251" height="482" border="0">
      <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal">PRODUCTS 
            	<a href="seeall.jsp">see all</a> <br/>
            </td>
          </tr>
          <tr>
            <td> <!--   <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="BooksAudible" /><input type="image" src="images/books.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--   <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="ElectronicsComp" /><input type="image" src="images/elect.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--   <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="Clothes" /><input type="image" src="images/cloth.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--   <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="HomeGarden" /><input type="image" src="images/gard.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--   <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="HealthBeauty" /><input type="image" src="images/health.PNG" /></form></td>
          </tr>
          <tr>
            <td><!--   <form action="category.jsp">-->
            <input type="hidden" name="type" value="prod_type" /><input type="hidden" name="category" value="ToysBaby" /><input type="image" src="images/toys.PNG" /></form></td>
          </tr>
        </table></td>
      </tr>
       <tr>
        <td height="201"><table width="243" height="180" border="0">
          <tr>
            <td width="233" class="normal">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      
    </table></td>
    <td><table width="725" height="684" border="0">
      <tr class="normal">
        <td height="30">BEST-SELLINGS</td>
      </tr>
      <tr>
        <td height="261"><table width="714" height="258" border="0">
          <tr>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value="S001"> 
<input name="buy" type="image" src="images/img1.jpg" width="114" height="165"> 
</form></td>
              </tr>
            </table>
              <p class="center1">Produs1</p>
              <p class="center1">Pret produs1</p>
            </td>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
              <tr>
                <td width="111"><form action="product.jsp"> 
<input type="hidden" name="product" value="S002">
<input name="buy" type="image" src="images/img2.jpg" width="100" height="165"> 
</form></td>
              </tr>
            </table></p>
              <p class="center1">Produs2</p>
              <p class="center1">Pret produs2</p>
            </td>
            <td width="224"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value="L001"> 
<input name="buy" type="image" src="images/img3.jpg" width="104" height="165"> 
</form></td>
       </tr>
            </table>
              <p class="center1">Produs3</p>
              <p class="center1">Pret produs3</p>
            </td>
          </tr>
        </table></td>
      </tr>
      <tr class="normal">
        <td height="31">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr class="normal">
        <td height="27">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr class="normal">
        <td height="27">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr> 
</table>

<jsp:include page="footer.jsp"/>

</body>
</html>

<%! String author_id;%>

<%@page import="book.*,java.sql.*"%>
<% 
	try
	{
		String a=session.getAttribute("email").toString();
	}
	catch(NullPointerException e)
	{
		response.sendRedirect("login.jsp");
	}
%>
<% author_id=request.getParameter("author_id");%>

<html>
	<title>Author</title>
	<body>
		<link rel="stylesheet" type="text/css" href="CSS/book_list.css">

		<table class="top" id="rcorners_table_top">
			<tr>
				<td style="width:10%;"> <a href="home.jsp"><img src="Images/logo.png" height="35" width="35"/></td>

				<form action="search.jsp" method="get">
					<td style="width:20%;"> <input class="right" type="text" name="search" id="rcorners_search" placeholder="Search Book"></td>
					<td style="width:50%;"> <input type="submit" value="Search" id="rcorners_button" style="background-color:#64FFDA"></td>
				</form>

				<td> <a href="profile.jsp">Profile</a></td>
				<td> <a href="logout.jsp">Logout</a></td>
			</tr>
		</table>

<!--The Top Panel Code ends here-->
		
		
			<%@ include file="JSP/include_author.jsp"%>
	</body>
</html>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
%>
	
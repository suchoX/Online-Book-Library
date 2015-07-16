<%@page import="java.sql.*,book.*"%>

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

<html>
	<title>Home</title>
	<body>
		<link rel="stylesheet" type="text/css" href="CSS/home.css">

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

	<%
		String temp=request.getParameter("msg");
		out.print("<h6>"+temp+"</h6>");%>
	</body>
</html>
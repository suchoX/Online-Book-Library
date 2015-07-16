<%! String book_name;%>

<%@page import="book.*"%>

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
			book_name=request.getParameter("search");
			book_info b=new book_info();
			String book_id=b.find(book_name);
			boolean matching=b.matching_check(book_name);
			b.close_connection();
			if(book_id==null && matching==false)
			{
				out.print("<h6>Book Not Found</h6>");
			}
			else if(book_id==null && matching==true)	//Match Found
			{
				response.sendRedirect("match.jsp?match="+book_name);
			}
			else if(book_id!=null)	//Book Found
			{
				response.sendRedirect("book_page.jsp?book_id="+book_id);
			}
		%>

	</body>
</html>



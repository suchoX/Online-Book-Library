<%@page import="java.sql.*,profile.*"%>

<%! String email,book_id;
%>

<% 
	try
	{
		email=session.getAttribute("email").toString();
	}
	catch(NullPointerException e)
	{
		response.sendRedirect("login.jsp");
	}
%>

<%
	book_id=request.getParameter("book_id");
	profile_info pro=new profile_info();
	pro.remove_wishlist(email,book_id);
	pro.close_connection();
	response.sendRedirect("../profile.jsp");
%>


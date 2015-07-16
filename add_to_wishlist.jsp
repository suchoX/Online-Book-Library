<%! String email,book_id;%>

<%@page import="profile.*"%>

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

	String book_id=request.getParameter("book_id");
	profile_info pro=new profile_info();
	boolean b=pro.add_to_wishlist(email,book_id);
	pro.close_connection();
	if(b==false)
		response.sendRedirect("error.jsp?msg=Book already in your Wishlist");
	else
		response.sendRedirect("book_page.jsp?book_id="+book_id);	
%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
%>




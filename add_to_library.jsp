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

	out.print("<p>"+email+"</p>");
	int x=pro.add_to_library(email,book_id);
	pro.close_connection();
	if(x==1)
		response.sendRedirect("error.jsp?msg=Book already in your Library");
	else if(x==2)
		response.sendRedirect("error.jsp?msg=No more books available");
	else
		response.sendRedirect("book_page.jsp?book_id="+book_id);	
%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
%>




<%@page import="java.sql.*,profile.*,book.*"%>

<%! String email;
	ResultSet rs;
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

<html>
	<link rel="stylesheet" type="text/css" href="../CSS/book_list.css">
	<%
		profile_info pro=new profile_info();
		book_info boo=new book_info();
		rs=pro.ret_wishlist_books(email);
		String temp_name;
		int i;

		ResultSet temp_rs;

		while(rs.next())
		{
			temp_rs=boo.ret_book(rs.getString("book_id"));
			temp_rs.next();

			out.print("<a href=\"book_page.jsp?book_id="+temp_rs.getString("book_id")+"\">");
			out.print("<table class=\"top\" id=\"rcorners_lists\">");
			out.print("<tr class=\"book_list\">");
			out.print("<td class=\"center\" > <img src=Images/Books/"+temp_rs.getString("image_src")+" id=\"rcorners_img\" /></td>");

			out.print("<td style=\"padding:15px;\"> <p style=\"text-align:center; font-size:2em;\">"+temp_rs.getString("book_name")+"<p>");
		
			temp_name=boo.author_name(temp_rs.getString("author_id"));
			out.print("<p>Author: "+temp_name+"<p>");
			out.print("<p>Genre: "+temp_rs.getString("cat_name")+"</p>");
			out.print("<p>Publisher: "+temp_rs.getString("publisher")+"<p>");

			temp_name=temp_rs.getString("summary");
			out.print("<p style=\"font-size:.7em;\">");
			for(i=0 ; i<220 ; i++)
				out.print(temp_name.charAt(i));
			out.print("...(Read More)");
			out.print("</p>");
			
			out.print("</br></br><p><a href=\"JSP/remove_wishlist.jsp?book_id="+rs.getString("book_id")+"\" >Remove From Wishlist</a></p></td>");
			out.print("</tr>");
			out.print("</table></br>");
			out.print("</a>");
		}
	%>
</html>
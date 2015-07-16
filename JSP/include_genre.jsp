<%
	int i;
	String temp;
	book_info b=new book_info();
	book_info temp_book=new book_info();
	String temp_name;
	ResultSet rs=b.cat_name_ret(cat_name);

	while(rs.next())
	{
		out.print("<a href=\"book_page.jsp?book_id="+rs.getString("book_id")+"\">");
		out.print("<table class=\"top\" id=\"rcorners_lists\">");
		out.print("<tr class=\"book_list\">");
		out.print("<td class=\"center\" style=\"width:140px; height:200px\"> <img src=Images/Books/"+rs.getString("image_src")+" id=\"rcorners_img\"/></td>");

		out.print("<td style=\"padding:15px;\"> <p style=\"text-align:center;\">"+rs.getString("book_name")+"<p>");

		temp_name=temp_book.author_name(rs.getString("author_id"));
		out.print("<p>Author: "+temp_name+"<p>");
		out.print("<p>Publisher: "+rs.getString("publisher")+"<p>");

		temp=rs.getString("summary");
		out.print("<p style=\"font-size:.7em;\">");
		for(i=0 ; i<220 ; i++)
			out.print(temp.charAt(i));
		out.print("...(Read More)");
		out.print("</p></td>");

		out.print("</tr>");
		out.print("</table></br>");
		out.print("</a>");
	}
	//b.close_connection();
%>


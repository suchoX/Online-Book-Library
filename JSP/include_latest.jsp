<%
	book_info b=new book_info();
	ResultSet rs=b.latest_additions();
	
	while(rs.next())
	{
		out.print("<td class=\"center\" style=\"width:20%\" >");
		out.print("<a href=\"book_page.jsp?book_id="+rs.getString(1)+"\" >");
		out.print("<img src=Images/Books/"+rs.getString("image_src")+" height=\"220px\" width=\"80%\" id=\"rcorners_img\" class=\"image\"/></td>");

	}
	b.close_connection();
%>
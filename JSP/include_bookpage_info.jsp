<%
	book_id=request.getParameter("book_id");
	book_info b=new book_info();
	b.book_data(book_id);

	book_name=b.book_name();
	author_id=b.author_id();
	author_name=b.author_name();
	cat_name=b.cat_name();
	publisher=b.publisher();
	summary=b.summary();
	image_src=b.image_src();
	no_books=b.no_books();
	b.close_connection();

	out.print("<p class=\"bookname\" id=\"rcorners_book_title\">"+book_name+"</p>");

	out.print("<div id=\"container\" style=\"width:100%;\">");
	out.print("<div id=\"left\" style=\"float:left; width:70%;\">"); 

	out.print("<table class=\"top\" id=\"rcorners_book_info\">");
	out.print("<tr>");

	out.print("<td style=\"width:280px; height:400px\" class=\"center\"> <img src=Images/Books/"+image_src+" id=\"rcorners_img\"/></td>");

	out.print("<td style=\"padding:15px\">");
	out.print("<a href=\"author.jsp?author_id="+author_id+"\" ><p>Author: "+author_name+"<p>");
	out.print("<a href=\"genre.jsp?cat_name="+cat_name+"\" ><p>Genre: "+cat_name+"<p></a>");
	//out.print("<p>Genre: "+cat_name+"<p>");
	out.print("<p>Publisher: "+publisher+"<p>");
	out.print("<p style=\"font-size:.7em \">"+summary+"<p></td></tr></table></div>");

	out.print("<div id=\"right\" style=\"float:right; width:30%;\">");
	out.print("<p class=\"center\" id=\"rcorners_right_div\">Number of Books Available:"+no_books+"<p>");


	out.print("</br>");
	out.print("<p class=\"circle\" id=\"rcorners_right_div_circle\"><a href=\"add_to_wishlist.jsp?book_id="+book_id+"\">+Wishlist</a><p>");
	out.print("<p class=\"circle\" id=\"rcorners_right_div_circle\"><a href=\"add_to_library.jsp?book_id="+book_id+"\">+Library</a><p></div></div>");

%>
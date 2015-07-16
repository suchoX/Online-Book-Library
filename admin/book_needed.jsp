<%@page import="java.sql.*,book.*"%>

<html>
	<title>Book Shortage</title>
	<body>
		<link rel="stylesheet" type="text/css" href="../CSS/book_list.css">

		<%
			PreparedStatement ps;
			ResultSet rs,temp_rs;
			Connection con;
			String sql,temp_name;
			int i;

			book_info boo=new book_info();

			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");

			sql="select * from books_needed";
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				temp_rs=boo.ret_book(rs.getString("book_id"));
				temp_rs.next();

				out.print("<table class=\"top\" id=\"rcorners_lists\" >");
				out.print("<tr>");
				out.print("<td class=\"center\" > <img src=../Images/Books/"+temp_rs.getString("image_src")+" id=\"rcorners_img\" style=\"height:50%;\"/></td>");

				out.print("<td style=\"padding:15px;\"> <p style=\"text-align:center; font-size:2em;\">"+temp_rs.getString("book_name")+"<p>");
				out.print("<p>Book ID: "+temp_rs.getString("book_id"));
		
				temp_name=boo.author_name(temp_rs.getString("author_id"));
				out.print("<p>Author: "+temp_name+"<p>");
				out.print("<p>Genre: "+temp_rs.getString("cat_name")+"</p>");
				out.print("<p>Publisher: "+temp_rs.getString("publisher")+"<p>");

				temp_name=temp_rs.getString("summary");
				out.print("<p style=\"font-size:.7em;\">");
				for(i=0 ; i<220 ; i++)
				out.print(temp_name.charAt(i));
				out.print("...(Read More)</p>");

				out.print("<p><form action=\"JSP/plusone.jsp\">");
				out.print("<input type=\"text\" name=\"num\" id=\"rcorners_search\">");
				out.print("<input type=\"hidden\" name=\"book_id\" value=\""+rs.getString("book_id")+"\">");
				out.print("<input type=\"submit\" class=\"sub\" value=\"Add\"><p>");

				out.print("</td></tr></table");
			}
			boo.close_connection();

		%>
	</body>
</html>

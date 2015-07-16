<%
	ResultSet rsl;
	profile_info pro=new profile_info();
	rsl=pro.ret_profile(email);
	rsl.next();

	out.print("<table class=\"top\" id=\"profile_info\">");
	out.print("<tr>");
	out.print("<td style=\"width:45%;\" class=\"center\"> <img src=Images/Profile/"+rsl.getString("dp_src")+" id=\"dp\"/></td>");

	out.print("<td style=\"width:55%;\">");
	out.print("<p >"+rsl.getString("name")+"<p>");
	out.print("<p >"+email+"<p>");
	out.print("<p >D.O.B: "+rsl.getString("dob")+"<p>");
	out.print("<p >Contact: "+rsl.getString("ph_no")+"<p></td></tr></table>");
	pro.close_connection();
	rsl.close();

	out.print("</br><div style=\"width:100%\">");			//Settings on left
	out.print("<div style=\"float:left; width:60%;\">");
	out.print("<table class=\"top\" id=\"settings\">");
	out.print("<tr>");
	out.print("<td><p>Settings</p></td></tr>");
	out.print("<tr>");
	out.print("<td style=\"font-size:.7em;\"> <a href=\"#\"><p>Change Profile Picture &#8634;</p></a></td></tr>");
	out.print("<tr>");
	out.print("<td style=\"font-size:.7em;\"> <a href=\"#\"><p>Change Password &#8634;</p></a></td></tr>");
	out.print("<tr>");
	out.print("<td style=\"font-size:.7em;\"> <a href=\"#\"><p><b>Delete Account</b></p></a></td></tr></table></div>");

	out.print("<div style=\"float:right; width:40%;\">");		//Menu on right
	out.print("<table class=\"top\" id=\"menu\">");
	out.print("<tr>");
	out.print("<td> <button class=\"library\">Library &rarr;</button></td></tr>");
	out.print("<tr>");
	out.print("<td> <button class=\"wishlist\">Wishlist &rarr;</button></td></tr>");
	out.print("<tr>");
	out.print("<td> <button class=\"history\">History &rarr;</a></td></tr></table></div></div>");
%>

<%
	email=request.getParameter("email");
	password=request.getParameter("password");
	if(email!=null)
	{
		Login_check log=new Login_check();
		int x=log.check(email,password);	//Checking for user data in Database
		if(x==0)
		{
			out.print("<td class=\"right\">Password</td>");
			out.print("<td style=\"color:red\"><input type=\"password\" name=\"password\" id=\"rcorners3\" placeholder=\"username doesn't Exist\" required></td>");
		}
		else if(x==1)
		{
			out.print("<td class=\"right\">Password</td>");
			out.print("<td style=\"color:red\"><input type=\"password\" name=\"password\" id=\"rcorners3\" placeholder=\"Wrong Password\" required></td>");
		}
		else
		{
			password=null;
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");
		}
	}
	else
	{
		out.print("<td class=\"right\">Password</td>");
		out.print("<td><input type=\"password\" name=\"password\" id=\"rcorners3\" required></td>");
	}
%>
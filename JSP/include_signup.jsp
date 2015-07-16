<%
	s_name=request.getParameter("name");
	s_email=request.getParameter("email");
	s_dob=request.getParameter("dob");
	s_phno=request.getParameter("contact_num");
	s_password=request.getParameter("password");
	s_conpassword=request.getParameter("confirm_password");

	if(s_name==null)	//First time the page is being shown, ie, "Sign Up" button hasn't been clicked even once
	{
		out.print("<tr> <td><input type=\"text\" name=\"name\" id=\"rcorners3_2\" placeholder=\"Name\" required></td> </tr>");
		out.print("<tr> <td><input type=\"email\" name=\"email\" id=\"rcorners3_2\" placeholder=\"E-Mail\" required></td> </tr>");
		out.print("<tr> <td><input placeholder=\"DOB\" class=\"textbox-n\" type=\"text\" onfocus=\"(this.type='date')\" name=\"dob\" id=\"rcorners3_2\" required></td> </tr>");
		out.print("<tr> <td><input type=\"tel\" name=\"contact_num\" id=\"rcorners3_2\" placeholder=\"Mobile Number\" required></td> </tr>");
		out.print("<tr> <td><input type=\"password\" name=\"password\" id=\"rcorners3_2\" placeholder=\"Password\" required></td> </tr>");
		out.print("<tr> <td><input type=\"password\" name=\"confirm_password\" id=\"rcorners3_2\" placeholder=\"Confirm Password\" required></td> </tr>");
		out.print("<tr> <td><input class=\"center\" type=\"submit\" value=\"Sign Up\" id=\"rcorners4\" style=\"height:30px; width:100px background-color:#64FFDA;\"></td> </tr>");
	}
	else
	{
		if(!s_password.equals(s_conpassword))	//Passwords doesn't match
		{
			out.print("<tr> <td><input type=\"text\" name=\"name\" id=\"rcorners3_2\" placeholder=\"Name\" required></td> </tr>");
			out.print("<tr> <td><input type=\"email\" name=\"email\" id=\"rcorners3_2\" placeholder=\"E-Mail\" required></td> </tr>");
			out.print("<tr> <td><input placeholder=\"DOB\" class=\"textbox-n\" type=\"text\" onfocus=\"(this.type='date')\" name=\"dob\" id=\"rcorners3_2\" required></td> </tr>");
			out.print("<tr> <td><input type=\"tel\" name=\"contact_num\" id=\"rcorners3_2\" placeholder=\"Mobile Number\" required></td> </tr>");
			out.print("<tr> <td><input type=\"password\" name=\"password\" id=\"rcorners3_2\" placeholder=\"Password\" required></td> </tr>");
			out.print("<tr> <td><input type=\"password\" name=\"confirm_password\" id=\"rcorners3_2\" placeholder=\"Password doesn't Match\" required></td> </tr>");	//
			out.print("<tr> <td><input class=\"center\" type=\"submit\" value=\"Sign Up\" id=\"rcorners4\" style=\"height:30px; width:100px background-color:#64FFDA;\"></td> </tr>");
		}
		else if(user_register.phno_correct(s_phno)==false)	//Phone Number is not proper
		{
			out.print("<tr> <td><input type=\"text\" name=\"name\" id=\"rcorners3_2\" placeholder=\"Name\" required></td> </tr>");
			out.print("<tr> <td><input type=\"email\" name=\"email\" id=\"rcorners3_2\" placeholder=\"E-Mail\" required></td> </tr>");
			out.print("<tr> <td><input placeholder=\"DOB\" class=\"textbox-n\" type=\"text\" onfocus=\"(this.type='date')\" name=\"dob\" id=\"rcorners3_2\" required></td> </tr>");
			out.print("<tr> <td><input type=\"tel\" name=\"contact_num\" id=\"rcorners3_2\" placeholder=\"Enter Proper Number\" required></td> </tr>");
			out.print("<tr> <td><input type=\"password\" name=\"password\" id=\"rcorners3_2\" placeholder=\"Password\" required></td> </tr>");
			out.print("<tr> <td><input type=\"password\" name=\"confirm_password\" id=\"rcorners3_2\" placeholder=\"Confirm Password\" required></td> </tr>");
			out.print("<tr> <td><input class=\"center\" type=\"submit\" value=\"Sign Up\" id=\"rcorners4\" style=\"height:30px; width:100px background-color:#64FFDA;\"></td> </tr>");
		}

		else
		{
			boolean x=user_register.register_check(s_email);
			if(x==true)	//Email already registered, number of rows updated is 0
			{
				out.print("<tr> <td><input type=\"text\" name=\"name\" id=\"rcorners3_2\" placeholder=\"Name\" required></td> </tr>");
				out.print("<tr> <td><input type=\"email\" name=\"email\" id=\"rcorners3_2\" placeholder=\"E-Mail already Registered\" required></td> </tr>");
				out.print("<tr> <td><input placeholder=\"DOB\" class=\"textbox-n\" type=\"text\" onfocus=\"(this.type='date')\" name=\"dob\" id=\"rcorners3_2\" required></td> </tr>");
				out.print("<tr> <td><input type=\"tel\" name=\"contact_num\" id=\"rcorners3_2\" placeholder=\"Mobile Number\" required></td> </tr>");
				out.print("<tr> <td><input type=\"password\" name=\"password\" id=\"rcorners3_2\" placeholder=\"Password\" required></td> </tr>");
				out.print("<tr> <td><input type=\"password\" name=\"confirm_password\" id=\"rcorners3_2\" placeholder=\"Confirm Password\" required></td> </tr>");
				out.print("<tr> <td><input class=\"center\" type=\"submit\" value=\"Sign Up\" id=\"rcorners4\" style=\"height:30px; width:100px background-color:#64FFDA;\"></td> </tr>");
			}
			else	//Successful user Sign up
			{
				password=null;
				user_register.register(s_name,s_email,s_dob,s_phno,s_password);
				session.setAttribute("email",email);
				response.sendRedirect("home.jsp");
			}
		}
	}
%>
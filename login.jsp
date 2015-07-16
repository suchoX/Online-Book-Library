<%!
	String email,password; 
	String s_name,s_email,s_dob,s_phno, s_password, s_conpassword;
%>

<%@page import="login.*,register.*,java.sql.*"%>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="CSS/login.css">

		<title>Bookworm-Login</title>

		<form action="login.jsp" method="post">
			<table class="top" id="rcorners1">
				<tr>
					<td style="width:90%;"><img src="Images/logo.png" height="50" width="50"/></td>
					<td class="right">Name</td>
					<td><input type="email" name="email" id="rcorners3" required></td>

					<%@ include file="JSP/include_login.jsp"%>

					<td><input type="submit" value="Log In" id="rcorners4" style="background-color:#64FFDA"></td>
				</tr>
			</table>
		</form>

		<h3 id="rcorners_welcome">Welcome to Bookworm</h3>

		<form action="login.jsp" method="post">
			<table class="signup" id="rcorners2">

				<%@ include file="JSP/include_signup.jsp"%>

			</table>
		</form>
	</head>
</html>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
%>


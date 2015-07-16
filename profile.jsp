<%@page import="java.sql.*,profile.*"%>

<%! String name,email,dob,ph_no,dp_src;
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
	<title>Profile</title>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		 <script>
            $(document).ready(function(){
                 $("button.library").click(function(){
                      $("#right").load("JSP/include_profile_library.jsp");
                 });
                 $("button.wishlist").click(function(){
                      $("#right").load("JSP/include_profile_wishlist.jsp");
                 });

            });
        </script>
	</head>	<body>
		<link rel="stylesheet" type="text/css" href="CSS/profile.css">

		<table class="top" id="table_top">
			<tr>
				<td style="width:10%;"> <a href="home.jsp"><img src="Images/logo.png" height="35" width="35"/></td>

				<form action="search.jsp" method="get">
					<td style="width:20%;"> <input class="right" type="text" name="search" id="search" placeholder="Search Book"></td>
					<td style="width:50%;"> <input type="submit" value="Search" id="button" style="background-color:#64FFDA"></td>
				</form>

				<td> <a href="profile.jsp">Profile</a></td>
				<td> <a href="logout.jsp">Logout</a></td>
			</tr>
		</table>
<!--The Top Panel Code ends here-->
		</br>
		<div id="container" style="width:100%">
			<div id="left" style="float:left; width:40%;">
				<%@ include file="JSP/include_profile_left.jsp"%>
			</div>
			<div id="right" style="float:right; width:60%;">
			</div>
		</div>
	</body>
</html>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
%>




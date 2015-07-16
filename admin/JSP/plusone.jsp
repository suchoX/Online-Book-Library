<%@page import="java.sql.*,book.*"%>

<%
	String n=request.getParameter("num");
	String book_id=request.getParameter("book_id");
	int num=Integer.parseInt(n);
	book_info boo=new book_info();
	boo.inc_no_books(book_id,num);
	boo.close_connection();

	PreparedStatement ps;
	Connection con;
	String sql;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");

	sql="delete from books_needed where book_id=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,book_id);
	ps.executeUpdate();
	response.sendRedirect("../book_needed.jsp");
%>


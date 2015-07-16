package admin;

import java.sql.*;

public class bookentry
{
	Connection con;
	public bookentry() throws SQLException, ClassNotFoundException
	{
	
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");
	}
	 public void insert(String book_id,String book_name,String author_id,String cat_name,String publisher,String summary,String img_src,String no_books)  throws SQLException,          ClassNotFoundException
	{
		String sql;


		sql="insert into books values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,book_id);
		ps.setString(2,book_name);
		ps.setString(3,author_id);
		ps.setString(4,cat_name);
		ps.setString(5,publisher);
		ps.setString(6,summary);
		ps.setString(7,img_src);
		ps.setString(8,no_books);
		ps.executeUpdate();

		ps.close();

	}
	 public void insertauthor(String author_id,String author_name)  throws SQLException, ClassNotFoundException
	{
		String sql;
		sql="insert into authors values(?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,author_id);
		ps.setString(2,author_name);
		ps.executeUpdate();
		ps.close();
	}
	public void disconnect()throws Exception
	{
		con.close();
	}
}
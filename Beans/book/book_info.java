package book;

import java.sql.*;

public class book_info
{
	String sql;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public book_info() throws SQLException, ClassNotFoundException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");
	}
	public String find(String book_name)  throws SQLException, ClassNotFoundException
	{
		book_name=book_name.toUpperCase();
		sql="select book_id from books where upper(book_name)=?";
		//sql="select dob from users where email=?";
		ps = con.prepareStatement(sql);
		ps.setString(1,book_name);
		rs=ps.executeQuery();

		if(rs.next()==false)		//No Book found in database
		{
			return null;
		}
		else
		{
			return (rs.getString("book_id"));
		}
	}

	public void book_data(String book_id) throws SQLException, ClassNotFoundException
	{
		sql="select * from books where book_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1,book_id);
		rs=ps.executeQuery();
		rs.next();
	}
	public String book_name() throws SQLException
	{
		return rs.getString("book_name");
	}
	public String author_id() throws SQLException
	{
		return rs.getString("author_id");
	}
	public String author_name() throws SQLException
	{
		String author_id=rs.getString("author_id");
		String sql="select author_name from authors where author_id=?";	//Connecting to Author table
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,author_id);
		ResultSet rs_temp=ps.executeQuery();
		rs_temp.next();
		String temp=rs_temp.getString("author_name");
		rs_temp.close();
		ps.close();
		return temp;

	}

	public String author_name(String author_id) throws SQLException
	{
		String sql="select author_name from authors where author_id=?";	//Connecting to Author table
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,author_id);
		ResultSet rs_temp=ps.executeQuery();
		rs_temp.next();
		String temp=rs_temp.getString("author_name");
		rs_temp.close();
		ps.close();
		return temp;

	}
	public String cat_name() throws SQLException
	{
		return rs.getString("cat_name");
	}
	public String publisher() throws SQLException
	{
		return rs.getString("publisher");
	}
	public String summary() throws SQLException
	{
		return rs.getString("summary");
	}
	public String image_src() throws SQLException
	{
		return rs.getString("image_src");
	}
	public int no_books() throws SQLException
	{
		return rs.getInt("no_books");
	}

	public void close_connection() throws SQLException
	{
		con.close();
	}

	public ResultSet latest_additions() throws SQLException
	{
		int num,i;
		sql="select count(*) from books";
		ps = con.prepareStatement(sql);
		rs=ps.executeQuery();
		rs.next();
		num=rs.getInt("count(*)");

		sql="select book_id,book_name,image_src from(select b.book_id,b.book_name,b.image_src, rownum r from books b)where r>? and r<?";
		ps = con.prepareStatement(sql);
		ps.setInt(1,num-5);
		ps.setInt(2,num+1);
		return ps.executeQuery();
	}

	public ResultSet cat_name_ret(String cat_name) throws SQLException
	{
		sql="select * from books where upper(cat_name)=?";
		cat_name=cat_name.toUpperCase();
		ps = con.prepareStatement(sql);
		ps.setString(1,cat_name);
		return ps.executeQuery();
	}

	public ResultSet author_name_ret(String author_id) throws SQLException
	{
		sql="select * from books where author_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1,author_id);
		return ps.executeQuery();
	}

	public boolean matching_check(String match) throws SQLException
	{
		sql="select book_id from books where upper(book_name) like ?";
		match=match.toUpperCase();
		match="%"+match+"%";
		ps=con.prepareStatement(sql);
		ps.setString(1,match);
		rs=ps.executeQuery();
		if(rs.next())
			return true;
		else
			return false;
	}

	public ResultSet matching_ret(String match) throws SQLException
	{
		sql="select * from books where upper(book_name) like ?";
		match=match.toUpperCase();
		match="%"+match+"%";
		ps=con.prepareStatement(sql);
		ps.setString(1,match);
		return ps.executeQuery();
	}

	public ResultSet ret_book(String book_id) throws SQLException
	{
		sql="select * from books where book_id=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,book_id);
		return ps.executeQuery();
	}

	public void inc_no_books(String book_id,int n) throws SQLException
	{
		sql="update books set no_books=no_books+? where book_id=?";
		ps=con.prepareStatement(sql);
		ps.setInt(1,n);
		ps.setString(2,book_id);
		ps.executeUpdate();
	}

}
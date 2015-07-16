package profile;

import java.sql.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class profile_info
{
	String sql;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public profile_info() throws SQLException, ClassNotFoundException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");
	}

	public ResultSet ret_profile(String email) throws SQLException
	{
		sql="select * from users where email=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,email);
		return ps.executeQuery();
	}

	public int add_to_library(String email, String book_id) throws SQLException
	{
		
		sql="select no_books from books where book_id=?";		//Checking number of books;
		ps=con.prepareStatement(sql);
		ps.setString(1,book_id);
		rs=ps.executeQuery();
		rs.next();
		if(rs.getInt("no_books")==0)
		{
			try{
				sql="insert into books_needed values(?)";
				ps=con.prepareStatement(sql);
				ps.setString(1,book_id);
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				int i;
			}
			return 2;
		}
		try
		{
			String issue_date,return_date;
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Calendar c = Calendar.getInstance();
			c.setTime(new Date()); // Now use today date.

			issue_date=sdf.format(c.getTime());

			c.add(Calendar.DATE, 15); // Adding 5 days
			return_date = sdf.format(c.getTime());

			sql="insert into issue_books values(?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,book_id);
			ps.setString(3,issue_date);
			ps.setString(4,return_date);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			return 1;
		}
		sql="update books set no_books=no_books-? where book_id=?";			//Decreasing Number of books
		ps=con.prepareStatement(sql);
		ps.setInt(1,1);
		ps.setString(2,book_id);
		ps.executeUpdate();
		return 3;
	}

	public boolean add_to_wishlist(String email, String book_id) throws SQLException
	{
		try
		{
			sql="insert into wishlist values(?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,book_id);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			return false;
		}
		return true;
	}
	public ResultSet ret_issued_books(String email) throws SQLException
	{
		sql="select * from issue_books where issue_id=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,email);
		return ps.executeQuery();
	}

	public ResultSet ret_wishlist_books(String email) throws SQLException
	{
		sql="select * from wishlist where issue_id=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,email);
		return ps.executeQuery();
	}

	public void ret_book(String email, String book_id) throws SQLException
	{
		sql="delete from issue_books where issue_id=? and book_id=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2,book_id);
		ps.executeUpdate();

		sql="update books set no_books=no_books+? where book_id=?";			//Decreasing Number of books
		ps=con.prepareStatement(sql);
		ps.setInt(1,1);
		ps.setString(2,book_id);
		ps.executeUpdate();
	}

	public void remove_wishlist(String email, String book_id) throws SQLException
	{
		sql="delete from wishlist where issue_id=? and book_id=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2,book_id);
		ps.executeUpdate();

	}

	public void close_connection() throws SQLException
	{
		ps.close();
		con.close();
	}
}
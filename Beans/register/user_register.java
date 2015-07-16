package register;

import java.sql.*;

public class user_register
{
	static public int register(String name,String email,String dob,String ph_no,String password)  throws SQLException, ClassNotFoundException
	{
		String sql;

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");

		sql="insert into users values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2,name);
		ps.setString(3,dob);
		ps.setString(4,ph_no);
		ps.setString(5,password);
		ps.setString(6,email);
		ps.setString(7,email);
		ps.setString(8,"default.jpg");

		int k=ps.executeUpdate();

		ps.close();
		con.close();

		return k;
	}

	static public boolean register_check(String email)  throws SQLException, ClassNotFoundException
	{
		String sql;

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");

		sql="select dob from users where upper(email)=?";
		PreparedStatement ps = con.prepareStatement(sql);
		email=email.toUpperCase();
		ps.setString(1,email);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			rs.close();
			ps.close();
			con.close();
			return true;
		}
		else
		{
			rs.close();
			ps.close();
			con.close();
			return false;
		}
	}

	static public boolean email_correct(String email)
	{
		int i, flag=0;
		for(i=0 ; i<email.length() ; i++)
		{
			if(email.charAt(i)=='@')
			{
				flag=1;
				break;
			}
		}

		if(flag==0)
			return false;
		else
			return true;
	}

	static public boolean phno_correct(String phno)
	{
		int i;
		for(i=0 ; i<phno.length() ; i++)
		{
			if(phno.charAt(i)<'0' || phno.charAt(i)>'9')
				return false;
		}
		return true;
	}
}
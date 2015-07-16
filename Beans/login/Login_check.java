package login;

import java.sql.*;

public class Login_check
{
	public int check(String username,String password) throws SQLException, ClassNotFoundException
	{
		String sql;

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","authentic");

		sql="select password from users where email=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,username);

		ResultSet rs=ps.executeQuery();
		if(rs.next()==false)		//No user found in database
		{
			rs.close();
			ps.close();
			con.close();
			return 0;
		}
		else
		{
			if(password.equals(rs.getString("Password")))	//User Password checks
			{
				rs.close();
				ps.close();
				con.close();
				return 2;
			}
			else
			{
				rs.close();
				ps.close();
				con.close();
				return 1;
			}
		}
	}
}
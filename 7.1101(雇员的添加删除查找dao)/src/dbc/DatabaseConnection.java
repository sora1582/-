package dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String DBURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String DBUSER = "system";
	private static final String DBPASSWORD = "123";
	private Connection conn;
	private static int count = 0;
	
	public  DatabaseConnection() {
		//���췽���н������ݿ�����
		System.out.println("******count = " + this.count++);
		try {
			Class.forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		//ȡ�����ݿ�����
		return this.conn;
	}
	
	public void close() {
		if(this.conn != null) {
			try {
				this.conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

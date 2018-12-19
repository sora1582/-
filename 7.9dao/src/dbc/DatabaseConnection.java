package dbc;
import java.sql.*;

public class DatabaseConnection {
	private static final String DBDRIVER = "org.git.mm.mysql.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
	private static final String DBUSER = "root";
	private static final String DBPASSWORD = "6666";
	private Connection conn = null;
	
	public DatabaseConnection() throws Exception{
		//在构造方法中进行数据库连接
		try {
			Class.forName(DBDRIVER);//加载驱动程序
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);//连接数据库
		}catch(Exception e) {
			throw e;
		}
	}
	
	public Connection getConnection() {		//取得数据库连接
		return this.conn;//取得数据库连接
	}
	
	public void close() throws Exception{	//数据库关闭操作
		if(this.conn != null) {	//避免NullPointerException
			try {
				this.conn.close();//数据库关闭
			}catch(Exception e) {//抛出异常  
				throw e;
			}
		}
	}
}

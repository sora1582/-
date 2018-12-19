package dbc;
import java.sql.*;

public class DatabaseConnection {
	private static final String DBDRIVER = "org.git.mm.mysql.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
	private static final String DBUSER = "root";
	private static final String DBPASSWORD = "6666";
	private Connection conn = null;
	
	public DatabaseConnection() throws Exception{
		//�ڹ��췽���н������ݿ�����
		try {
			Class.forName(DBDRIVER);//������������
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);//�������ݿ�
		}catch(Exception e) {
			throw e;
		}
	}
	
	public Connection getConnection() {		//ȡ�����ݿ�����
		return this.conn;//ȡ�����ݿ�����
	}
	
	public void close() throws Exception{	//���ݿ�رղ���
		if(this.conn != null) {	//����NullPointerException
			try {
				this.conn.close();//���ݿ�ر�
			}catch(Exception e) {//�׳��쳣  
				throw e;
			}
		}
	}
}
